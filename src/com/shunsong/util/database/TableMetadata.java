package com.shunsong.util.database;

import java.util.ArrayList;
import java.util.List;

public class TableMetadata {
	private static final String TYPE_FLOAT = "java.math.BigDecimal";
	private static final String TYPE_INTEGER = "Integer";
	private static final String TYPE_LONG = "Long";
	private static final String TYPE_STRING = "String";

	private List<ColomnMetadata> cols = new ArrayList<ColomnMetadata>();

	private String tableDesc;
	private String tableName;
	private String domainClassName;
	private String domainPackageName;
	private String servicePackageName;
	private String serviceClassName;
	private String mapperInterfacePackageName;
	private String mapperInterfaceClassName;
	private String controllerPackageName;
	private String controllerClassName;
	private String voPackageName;
	private String voClassName;

	public TableMetadata(String tableName, String tableDesc) {

		this.tableName = tableName;
		this.tableDesc = tableDesc;
		this.domainClassName = NameParser.getDomainName(tableName);
		this.domainPackageName = ConfigDB.getInstance().getProperty(
				"projectPackage")
				+ ".entity";

		this.serviceClassName = this.domainClassName + "Service";
		this.servicePackageName = ConfigDB.getInstance().getProperty(
				"projectPackage")
				+ ".service";

		this.mapperInterfaceClassName = this.domainClassName + "Mapper";
		this.mapperInterfacePackageName = ConfigDB.getInstance().getProperty(
				"projectPackage")
				+ ".persistence";

		this.controllerClassName = this.domainClassName + "Controller";
		this.controllerPackageName = ConfigDB.getInstance().getProperty(
				"projectPackage")
				+ ".controller";
		
		this.voClassName = this.domainClassName + "VO";
		this.voPackageName = ConfigDB.getInstance().getProperty(
				"projectPackage")
				+ ".vo";
	}

	public void addCol(String colName, String colType, String pec, String desc,
			String length, boolean isPK) {
		ColomnMetadata col = new ColomnMetadata();

		col.setColName(colName);
		if (desc == null)
			desc = "";
		col.setColDesc(desc.trim());
		col.setLength(length);

		String ct = parseDataType(colType, pec);
		col.setColType(ct);
		col.setColDBType(colType);
		col.setPkFlag(isPK);
		cols.add(col);
	}

	private String parseDataType(String colType, String digits) {
		String ct;

		if ("VARCHAR".equals(colType)) {
			ct = TYPE_STRING;
		} else if ("NUMBER".equals(colType) || "DECIMAL".equals(colType)) {
			if ("0".equals(digits)) {
				ct = TYPE_INTEGER;
			} else {
				ct = TYPE_FLOAT;
			}
		} else if ("BIGINT".equals(colType)) {
			ct = TYPE_LONG;
		} else if ("INT".equals(colType) || "INTEGER".equals(colType) || "SMALLINT".equals(colType)) {
			ct = TYPE_INTEGER;
		} else if ("DATETIME".equals(colType) || "DATE".equals(colType) || "TIMESTAMP".equals(colType)) {
			ct = "java.util.Date";
		} else if ("BLOB".equals(colType)) {
			ct = "Object";

		} else {
			ct = "String";
		}
		return ct;
	}

	public String toString() {
		return "Dabase Table Name:" + this.tableName + "\n Table Columns:"
				+ this.cols.toString();

	}

	public List<ColomnMetadata> getCols() {
		return cols;
	}

	public String getTableDesc() {
		return tableDesc;
	}

	public String getTableName() {
		return tableName;
	}

	public String getDomainClassName() {
		return domainClassName;
	}

	public String getDomainPackageName() {
		return domainPackageName;
	}

	public String getServicePackageName() {
		return servicePackageName;
	}

	public String getServiceClassName() {
		return serviceClassName;
	}

	public String getMapperInterfacePackageName() {
		return mapperInterfacePackageName;
	}

	public String getMapperInterfaceClassName() {
		return mapperInterfaceClassName;
	}

	public String getControllerPackageName() {
		return controllerPackageName;
	}

	public String getControllerClassName() {
		return controllerClassName;
	}

	public String getVoPackageName() {
		return voPackageName;
	}

	public void setVoPackageName(String voPackageName) {
		this.voPackageName = voPackageName;
	}

	public String getVoClassName() {
		return voClassName;
	}

	public void setVoClassName(String voClassName) {
		this.voClassName = voClassName;
	}
	
	

}
