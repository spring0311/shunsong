package com.shunsong.controller.base;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.shunsong.entity.Page;
import com.shunsong.util.Logger;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;
import com.shunsong.util.UuidUtil;

/**
 * @author FH Q313596790
 * 修改时间：2015、12、11
 */
public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	
	/** new PageData对象
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/**得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	public PageData getDateQuery(PageData pd){
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		
		String strLoginStart = pd.getString("lastLoginStart");
		if(!StringUtil.isNotNullParam(strLoginStart)){
			Calendar   ca=Calendar.getInstance();
			ca.set(GregorianCalendar.DAY_OF_MONTH, 1);
			Date dateBegin=ca.getTime();
			pd.put("lastLoginStart", formater.format(dateBegin));
		}
		
		String strLoginEnd = pd.getString("lastLoginEnd");
		if(!StringUtil.isNotNullParam(strLoginEnd)){
			Calendar   ca=Calendar.getInstance();
			ca.set( Calendar.DATE, 1 );
            ca.roll(Calendar.DATE, - 1 );
			Date dateEnd=ca.getTime();
			pd.put("lastLoginEnd", formater.format(dateEnd));
		}
		
		return pd;
	}
	
	/**得到分页列表的信息
	 * @return
	 */
	public Page getPage(){
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
	
}
