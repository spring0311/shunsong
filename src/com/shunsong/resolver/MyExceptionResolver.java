package com.shunsong.resolver;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
/**
 * 
* 类名称：MyExceptionResolver.java
* 类描述： 
* @author FH
* 作者单位： 
* 联系方式：QQ313596790
* @version 1.0
 */
@Controller
public class MyExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		// 
		System.out.println("==============异常开始=============");
		ex.printStackTrace();
		System.out.println("==============异常结束=============");
		
		// 判断是否 Ajax 请求 
        if ((request.getHeader("accept").indexOf("application/json") > -1 ||
          (request.getHeader("X-Requested-With") != null && 
          request.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))){

           try {
               response.setContentType("text/html;charset=UTF-8");
               response.setCharacterEncoding("UTF-8");
               PrintWriter writer = response.getWriter();
               writer.write(ex.getMessage().replaceAll("\n", "<br/>"));
               writer.flush();
               writer.close();
           } catch (Exception e) {
        	   e.printStackTrace();
           }
           return null;
       }else{
    	    ModelAndView mv = new ModelAndView("error");
	   		mv.addObject("exception", ex.toString().replaceAll("\n", "<br/>"));
	   		return mv;
       }
		
		
	}

}
