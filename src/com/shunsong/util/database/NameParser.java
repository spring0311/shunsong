package com.shunsong.util.database;

public class NameParser {

	public static String getDomainName(String tableName) {
		StringBuilder stringBuilder = new StringBuilder();

		int index = tableName.indexOf('_');
		int index1 = 0;

		while (index >= 0) {
			String className;
			className = tableName.substring(index1, index);
			stringBuilder.append(capitalize(className, true));

			index1 = index + 1;
			index = tableName.indexOf('_', index1);
		}
		stringBuilder.append(capitalize(tableName.substring(index1),
				true));
		return stringBuilder.toString();
	}

	public static String capitalize(String value, boolean firstUpper) {
		StringBuilder stringBuilder = new StringBuilder(value.length());
		for (int i = 0; i < value.length(); i++) {
			char c = value.charAt(i);
			if (c != '_') {
				if (i == 0 && firstUpper) {
					stringBuilder.append(Character.toUpperCase(c));

				} else {
					stringBuilder.append(Character.toLowerCase(c));
				}
			} else {
				i++;
				c = value.charAt(i);
				stringBuilder.append(Character.toUpperCase(c));
			}
		}
		return stringBuilder.toString();
	}

	public static void main(String[] args) {
		System.out.println(getDomainName("c_bsss_cadfd"));
	}
}
