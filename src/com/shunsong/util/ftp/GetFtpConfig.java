package com.shunsong.util.ftp;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 * 读取.properties配置文件的内容至Map中。
 * 
 * 
 */
public class GetFtpConfig {
	private static GetFtpConfig instance;
	private Map<String, String> properties;

	private GetFtpConfig() {
		properties = read("ftp");
	}

	public static GetFtpConfig getInstance() {
		if (instance == null) {
			instance = new GetFtpConfig();
		}
		return instance;
	}

	/**
	 * 读取.properties配置文件的内容至Map中
	 * 
	 * @param propertiesFile
	 * @return
	 */
	private static Map<String, String> read(String propertiesFile) {
		ResourceBundle rb = ResourceBundle.getBundle(propertiesFile);
		Map<String, String> map = new HashMap<String, String>();
		Enumeration<String> enu = rb.getKeys();
		while (enu.hasMoreElements()) {
			String key = enu.nextElement();
			String value = rb.getString(key);
			map.put(key, value);
		}
		return map;
	}

	public String getProperty(String pName) {
		return properties.get(pName);
	}

	public String getHost() {
		return getProperty("sftphost");
	}

	public String getSFTPPort() {
		return getProperty("sftpPort");
	}
	
	public String getUserName() {
		return getProperty("sftpuserName");
	}
	
	public String getPassWord() {
		return getProperty("sftppassWord");
	}
	
	public String getUploadDir() {
		return getProperty("sftpuploadDir");
	}
	
	public String getBrowerUrl() {
		return getProperty("sftpbrowerUrl");
	}
	

	public Properties getDatabaseProperty() {
		Properties databaseProperties = new Properties();
		databaseProperties.put("user", getProperty("sftpuser"));
		databaseProperties.put("password", getProperty("sftppwd"));
		databaseProperties.put("remarksReporting",
				getProperty("remarksReporting"));
		return databaseProperties;
	}

}
