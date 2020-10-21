package com.shunsong.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.shunsong.util.Const;
/**
 * 
* 类名称：WebAppContextListener.java
* 类描述： 
* 作者：FH 
* 联系方式：
* @version 1.0
 */
public class WebAppContextListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent event) {
		// 
	}

	public void contextInitialized(ServletContextEvent event) {
		// 
		Const.WEB_APP_CONTEXT = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		//System.out.println("========获取Spring WebApplicationContext");
	}

}