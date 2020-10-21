package com.shunsong.util.ftp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;
import com.shunsong.util.FileUtil;
import com.shunsong.util.database.ConfigDB;

/**
 * 上传文件
 * 创建人：ZHUDAFENG
 * 创建时间：2017年12月23日
 * @version
 */
public class SFTPUtils {

	static Session sshSession = null;
	
	public static void main(String[] args)  {
		try{
			//ChannelSftp ftp = getConnectIP("47.99.61.77", "22", "root", "kiss79ME09");
			//upload("pic", "D:\\jianlun.sql");
			//download("/www/server/apache-tomcat-8.5.32/webapps/pic/", "jianlun.sql", "D:\\jianlun-123.sql", ftp);
		}catch(Exception e){
			
		}
		
 
	}
	
	/**
	 * 获取ChannelSftp gst:2017-9-12
	 * 
	 * @param host
	 *            主机
	 * @param sOnlineSftpPort
	 *            端口
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 */
	public static ChannelSftp getConnectIP(String host,String sOnlineSftpPort,String username,String password) {
		int port = 0;		
		
		if (!("".equals(sOnlineSftpPort)) && null != sOnlineSftpPort) {
			port = Integer.parseInt(sOnlineSftpPort);
		}
		ChannelSftp sftp = null;
		try {
			JSch jsch = new JSch();
			jsch.getSession(username, host, port);
			sshSession = jsch.getSession(username, host, port);
			sshSession.setPassword(password);
			Properties sshConfig = new Properties();
			sshConfig.put("StrictHostKeyChecking", "no");
			sshSession.setConfig(sshConfig);
			sshSession.connect();
			Channel channel = sshSession.openChannel("sftp");
			channel.connect();
			sftp = (ChannelSftp) channel;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sftp;
	}
	
	public static void makeDir(String strMDir,String strSDir,ChannelSftp sftp) {
				
		try {
			String directorys[] = strSDir.split("/");
			if(directorys.length > 1){
				for(int i=0;i<directorys.length;i++){
					try {    
						sftp.cd(strMDir + directorys[i]);  
			        } catch (SftpException e) {  
			        	sftp.mkdir(strMDir + directorys[i]);  
			        }  
					strMDir = strMDir + directorys[i] + "/";
				}
			}else{
				sftp.mkdir(strMDir + directorys[0]); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 上传 gst:2017-9-12
	 * 
	 * @param directory
	 *            sftp 服务器目录
	 * @param uploadFile
	 *            上传文件路径
	 * @param sftp
	 */
	public static void upload(String directory, String uploadFile, String fileName) throws SftpException {
		
		GetFtpConfig configFtp = GetFtpConfig.getInstance();
		String host = configFtp.getHost();
		String strDirectory = configFtp.getUploadDir() + directory + "/";
		
		if("localhost".equals(host)){	
			try{
				FileUtil.copyFile(uploadFile, strDirectory, fileName);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			ChannelSftp sftp = getConnectIP(host,configFtp.getSFTPPort(),configFtp.getUserName(),configFtp.getPassWord());
			
			try {    
				sftp.cd(strDirectory);  
	        } catch (SftpException e) {  
	        	makeDir(configFtp.getUploadDir(),directory,sftp);        	 
	        	sftp.cd(strDirectory);  
	        }  
			
			try {
				File file = new File(uploadFile);
				sftp.put(new FileInputStream(file), file.getName());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (sftp.isConnected()) {
					sshSession.disconnect();
					sftp.disconnect();
				}
	 
			}
		}
				
		
	}
	
	/**
	 * 下载 gst:2017-9-12
	 * 
	 * @param directory
	 *            sftp服务器目录
	 * @param downloadFile
	 *            目录下的文件名称
	 * @param saveFile
	 *            本地保存文件路径
	 * @param sftp
	 */
	public static void download(String directory, String downloadFile, String toFilePath, String realFilName) {
		GetFtpConfig configFtp = GetFtpConfig.getInstance();
				
		ChannelSftp sftp = getConnectIP(configFtp.getHost(),configFtp.getSFTPPort(),configFtp.getUserName(),configFtp.getPassWord());
		String host = configFtp.getHost();		
		String strDirectory = configFtp.getUploadDir() + directory + "/";
		if("localhost".equals(host)){
			try {
				FileUtil.copyFile(strDirectory+downloadFile, toFilePath, realFilName);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else{
			try {				
				File file = new File(toFilePath+realFilName);
				if (file.exists()){  
	                file.delete();  
	            }  
				file.createNewFile();
				sftp.cd(strDirectory);
				sftp.get(downloadFile, new FileOutputStream(file));
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (sftp.isConnected()) {
					sshSession.disconnect();
					sftp.disconnect();
				}
	 
			}
		}
		
	}
 
	/**
	 * 删除 :2017-9-12
	 * 
	 * @param directory
	 * @param deleteFile
	 * @param sftp
	 */
	public static void delete(String directory, String deleteFile) {
		GetFtpConfig configFtp = GetFtpConfig.getInstance();
		
		ChannelSftp sftp = getConnectIP(configFtp.getHost(),configFtp.getSFTPPort(),configFtp.getUserName(),configFtp.getPassWord());
						
		String strDirectory = configFtp.getUploadDir() + directory + "/";
		
		try {
			sftp.cd(strDirectory);
			sftp.rm(deleteFile);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sftp.isConnected()) {
				sshSession.disconnect();
				sftp.disconnect();
			}
 
		}
	}

			
}
