package com.shunsong.util;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Scanner;

/** 
 * 说明：IP处理
 * 创建人：FH Q313596790
 * 修改时间：2014年9月20日
 * @version
 */
public class PublicUtil {
	
	public static void main(String[] args) {
		try{
			
			/*boolean bl = checkRegisterNo("");
			if(bl){
				System.out.println("ok");
			}else{
				System.out.println("error");
			}*/
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public static String getPorjectPath(){
		String nowpath = "";
		nowpath=System.getProperty("user.dir")+"/";
		
		return nowpath;
	}

	
	
	/**
	 * 获取本机访问地址
	 * @return
	 */
	public static String getIp(){
		String ip = "";
		try {
			InetAddress inet = InetAddress.getLocalHost();
			ip = inet.getHostAddress();
			//System.out.println("本机的ip=" + ip);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		return ip;
	}
	
	
}