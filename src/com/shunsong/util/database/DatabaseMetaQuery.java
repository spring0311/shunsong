package com.shunsong.util.database;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseMetaQuery {

	public static List<TableMetadata> getTableMetas(String strTableName)
			throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		System.out.println("begin connect database....");
		ConfigDB config = ConfigDB.getInstance();
		Class.forName(config.getDatabaseDriver()).newInstance();

		Connection conn = DriverManager.getConnection(config.getDatabaseURL(),
				config.getDatabaseProperty());

		DatabaseMetaData dm = conn.getMetaData();

		String[] types = new String[1];
		types[0] = "TABLE";

		List<TableMetadata> tables = new ArrayList<TableMetadata>();
		System.out.println("begin parse database....");
		/*ResultSet rs = dm.getTables(null, config.getProperty("schema"),
				config.getProperty("tables"), types);*/
		ResultSet rs = dm.getTables(null, config.getProperty("schema"),
				strTableName, types);
		
		while (rs.next()) {

			String tbName = rs.getString("TABLE_NAME");
			String tbDesc = rs.getString("REMARKS");
			TableMetadata tmd = new TableMetadata(tbName,tbDesc);

			System.out.println("parsing table " + tbName);
			String pk = "$";
			ResultSet rsPK = dm.getPrimaryKeys(null, null, tbName);
			while (rsPK.next()) {

				pk = pk + rsPK.getString("COLUMN_NAME") + "$";
			}
			System.out.println("table " + tbName + "primary key:" + pk);

			ResultSet rsCol = dm.getColumns(null, null, tbName, null);
			while (rsCol.next()) {
				tmd.addCol(
						rsCol.getString("COLUMN_NAME"),
						rsCol.getString("TYPE_NAME"),
						rsCol.getString("DECIMAL_DIGITS"),
						rsCol.getString("REMARKS"),
						rsCol.getString("COLUMN_SIZE"),
						pk.indexOf("$" + rsCol.getString("COLUMN_NAME") + "$") >= 0);

			}

			tables.add(tmd);
			System.out.println(tmd.toString());
		}
		conn.close();
		System.out.println("end parse database....");
		return tables;
	}

}
