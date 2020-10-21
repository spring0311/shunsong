package com.shunsong.util;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/** 
 * 说明：日期处理
 * 创建人：FH Q313596790
 * 修改时间：2015年11月24日
 * @version
 */
public class DateUtil {
	
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
	private final static SimpleDateFormat sdfMonth = new SimpleDateFormat("MM");
	private final static SimpleDateFormat sdfYearMonth = new SimpleDateFormat("yyyy-MM");
	private final static SimpleDateFormat sdfDayInt = new SimpleDateFormat("dd");
	private final static SimpleDateFormat sdfHour = new SimpleDateFormat("HH");
	private final static SimpleDateFormat sdfMin = new SimpleDateFormat("mm");
	private final static SimpleDateFormat sdfSecond = new SimpleDateFormat("ss");
	private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");
	private final static SimpleDateFormat sdfYYMMDD = new SimpleDateFormat("yyMMdd");
	private final static SimpleDateFormat sdfYYMM = new SimpleDateFormat("yyMM");
	private final static SimpleDateFormat sdfYY = new SimpleDateFormat("yy");
	private final static SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private final static SimpleDateFormat sdfYYMMDDHHMMSS = new SimpleDateFormat("yyyyMMddHHmmss");
	private final static SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

	/**
	 * 获取YYYY格式
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYY-MM-DD格式
	 * @return
	 */
	public static String getDay(String strDateTime) {
		try {
			Date dtTime = sdfDateTime.parse(strDateTime);
			return sdfDay.format(dtTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	
	
	
	
	/**
	 * 获取YYYYMMDD格式
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * @return
	 */
	public static String getYYMMDD(){
		return sdfYYMMDD.format(new Date());
	}

	/**
	 * 获取YYYYMMDD格式
	 * @return
	 */
	public static String getYYMM(){
		return sdfYYMM.format(new Date());
	}
	
	/**
	 * 获取YYYY-MM格式
	 * @return
	 */
	public static String getYYYYMM(String date){
		try {
			Date dtTime = sdfDay.parse(date);
			return sdfYearMonth.format(dtTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 获取YYYY-MM格式
	 * @return
	 */
	public static String getYYYY(String date){
		try {
			Date dtTime = sdfDay.parse(date);
			return sdfYear.format(dtTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 获取DD格式
	 * @return
	 */
	public static String getDD(String strDate) {
		try {
			Date dtTime = sdfDay.parse(strDate);
			return sdfDayInt.format(dtTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	

	/**
	 * 获取YYYYMMDD格式
	 * @return
	 */
	public static String getYY(){
		return sdfYY.format(new Date());
	}
	
	
	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * @return
	 */
	public static String getTime() {
		return sdfDateTime.format(new Date());
	}
	
	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * @return
	 */
	public static int getNowTimeIntFormat() {
		int t = (int) (System.currentTimeMillis()/1000);
		return t;
	}
	
	/**
	 * 获取HH:mm:ss格式
	 * @return
	 */
	public static String getHHMMSS(String strDateTime) {
		try {
			Date dtTime = sdfDateTime.parse(strDateTime);
			return sdfTime.format(dtTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * 获取YYMMDDHHMMSS格式
	 * @return
	 */
	public static String getYYMMDDHHMMSS() {
		return sdfYYMMDDHHMMSS.format(new Date());
	}
	
	/**
	* @Title: compareDateTime
	* @Description: 
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author fh
	 */
	public static boolean compareDateTime(String s, String e) {
		if(fomatDateTime(s)==null||fomatDateTime(e)==null){
			return false;
		}
		return fomatDateTime(s).getTime() >=fomatDateTime(e).getTime();
	}
	
	/**
	* @Title: isEqualDateTime
	* @Description: 
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author fh
	 */
	public static boolean isEqualDateTime(String s, String e) {
		if(fomatDateTime(s)==null||fomatDateTime(e)==null){
			return false;
		}
		return fomatDateTime(s).getTime() == fomatDateTime(e).getTime();
	}
	
	/**
	* @Title: isEqualDateTime
	* @Description: 
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author fh
	 */
	public static boolean isEqualDate(String s, String e) {
		if(DateUtil.isRightDateTimeStr(s)){
			s = DateUtil.getDateFromDateTime(s);
		}
		if(DateUtil.isRightDateTimeStr(e)){
			e = DateUtil.getDateFromDateTime(e);
		}		
		
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() == fomatDate(e).getTime();
	}
	
	/**
	* @Title: compareDateTime
	* @Description: 
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author fh
	 */
	public static boolean compareTime(String s, String e) {
		if(fomatTime(s)==null||fomatTime(e)==null){
			return false;
		}
		long sLong = fomatTime(s).getTime();
		long eLong = fomatTime(e).getTime();
		
		boolean blReturn = false;
		if (sLong >=eLong){
			blReturn = true;
		}
		return blReturn;
	}
	
	/**
	* @Title: compareDate
	* @Description: 
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author fh
	 */
	public static boolean compareDate(String s, String e) {
		if(DateUtil.isRightDateTimeStr(s)){
			s = DateUtil.getDateFromDateTime(s);
		}
		if(DateUtil.isRightDateTimeStr(e)){
			e = DateUtil.getDateFromDateTime(e);
		}
		
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() >=fomatDate(e).getTime();
	}

	/**
	 * 格式化日期
	 * @return
	 */
	public static Date fomatDate(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 格式化日期
	 * @return
	 */
	public static String fomatDate(Date date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 格式化日期
	 * @return
	 */
	public static Date fomatTime(String date) {
		DateFormat fmt = new SimpleDateFormat("HH:mm:ss");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 格式化日期
	 * @return
	 */
	public static String fomatTime(Date date) {
		DateFormat fmt = new SimpleDateFormat("HH:mm:ss");
		try {
			return fmt.format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 格式化日期
	 * @return
	 */
	public static Date fomatDateTime(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 格式化日期
	 * @return
	 */
	public static String fomatDateTime(Date date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return fmt.format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 获取日期前的日期时间，按照分钟计算,传入小时的参数
	 * @return
	 */
	public static String getBeforeDateTime(String date,double dtHour) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateNow = fmt.parse(date);
			
	    	int daysInt = Integer.parseInt(StringUtil.LongToString(Math.round(dtHour * 60)));
	    	
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.MINUTE, (-1) * daysInt);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
     * 得到n天之前的日期时间格式,按date计算
     * @param days
     * @return
     */
    public static String getBeforeDayDate(String nowDate,int days) {
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date dateNow = fmt.parse(nowDate);
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.DATE,   (-1) * days);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
	
	/**
	 * 获取日期前的日期时间，按照分钟计算,传入分钟的参数
	 * @return
	 */
	public static String getBeforeDateTimeWithMin(String date,int dtMin) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateNow = fmt.parse(date);
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.MINUTE, (-1) * dtMin);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 校验日期是否合法
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	
	/**
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			//long aa=0;
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	 
	/**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date beginDate = null;
        java.util.Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
    
    /**
     * <li>功能描述：时间相减得到分钟的差
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static int getDaySubWithMin(String beginDateStr,String endDateStr){
    	    	 
    	long from = 0;
    	long to = 0;
		try {
			from = sdfDateTime.parse(beginDateStr).getTime();
			to = sdfDateTime.parse(endDateStr).getTime(); 
		} catch (ParseException e) {
			// 
			e.printStackTrace();
		}  
    	 
    	int minutes = (int) ((to - from)/(1000 * 60));  
    	      
        return minutes;
    }
    
    /**
     * <li>功能描述：时间相减得到分钟的差
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static double getDaySubWithHour(String beginDateStr,String endDateStr){
    	    	 
    	long from = 0;
    	long to = 0;
		try {
			from = sdfDateTime.parse(beginDateStr).getTime();
			to = sdfDateTime.parse(endDateStr).getTime(); 
		} catch (ParseException e) {
			// 
			e.printStackTrace();
		}  
    	 
    	int minutes = (int) ((to - from)/(1000 * 60));  
    	
    	double dbHour = new BigDecimal((float)minutes/60).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue(); 
    	      
        return dbHour;
    }
    
    /**
     * 得到n天之后的日期yyyy-MM-dd，以当期日期为起点
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    
    
    /**
     * 得到n天之后的日期时间格式,按date计算
     * @param days
     * @return
     */
    public static String getAfterDayDate(String nowDate,int days) {
    	if(DateUtil.isRightDateTimeStr(nowDate)){
    		nowDate = DateUtil.getDateFromDateTime(nowDate);
		}
		
		
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date dateNow = fmt.parse(nowDate);
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.DATE,  days);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 得到n天之后的日期时间格式yyyy-MM-dd HH:mm:ss，按照分钟min计算
     * @param days
     * @return
     */
    public static String getAfterDayDateTime(String date,int min) {
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateNow = fmt.parse(date);
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.MINUTE,  min);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 得到n天之后的日期时间格式yyyy-MM-dd HH:mm:ss，按照分钟hour计算
     * @param days
     * @return
     */
    public static String getAfterDayDateTime(String date,double dbHours) {
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateNow = fmt.parse(date);
			
			int daysInt = Integer.parseInt(StringUtil.LongToString(Math.round(dbHours * 60)));
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.MINUTE,  daysInt);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 得到n月之后的日期时间格式,按date计算
     * @param months
     * @param nowMonth：yyyy-mm
     * @return
     */
    public static String getAfterMonth(String nowMonth,int months) {
    	String nowDate = nowMonth + "-01";
    	if(DateUtil.isRightDateTimeStr(nowDate)){
    		nowDate = DateUtil.getDateFromDateTime(nowDate);
		}
		
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM");
		try {
			Date dateNow = fmt.parse(nowDate);
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.MONTH,  months);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 得到n天之后的日期时间格式yyyy-MM-dd HH:mm:ss，按照分钟hour计算
     * @param days
     * @return
     */
    public static String getDateFromDateTime(String datetime) {
    	if(!DateUtil.isRightDateTimeStr(datetime)){
    		return datetime;
    	}
    	
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			
			Date dateNow = fmt.parse(datetime);
			
			    	
	    	return sdfDay.format(dateNow);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 判断是否是对应的格式的日期字符串
     * @param dateStr
     * @param datePattern
     * @return
     */
    public static boolean isRightDateStr(String dateStr){
        DateFormat dateFormat  = new SimpleDateFormat("yyyy-MM-dd");
        try {
            //采用严格的解析方式，防止类似 “2017-05-35” 类型的字符串通过
            dateFormat.setLenient(false);
            dateFormat.parse(dateStr);
            Date date = (Date)dateFormat.parse(dateStr);
            //重复比对一下，防止类似 “2017-5-15” 类型的字符串通过
            String newDateStr = dateFormat.format(date);
            if(dateStr.equals(newDateStr)){
                return true;
            }else {
                return false;
            }
        } catch (ParseException e) {
            return false;
        }
    }
    
    /**
     * 判断是否是对应的格式的日期字符串
     * @param dateStr
     * @param datePattern
     * @return
     */
    public static boolean isRightDateTimeStr(String dateStr){
        DateFormat dateFormat  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //采用严格的解析方式，防止类似 “2017-05-35” 类型的字符串通过
            dateFormat.setLenient(false);
            dateFormat.parse(dateStr);
            Date date = (Date)dateFormat.parse(dateStr);
            //重复比对一下，防止类似 “2017-5-15” 类型的字符串通过
            String newDateStr = dateFormat.format(date);
            if(dateStr.equals(newDateStr)){
                return true;
            }else {
                return false;
            }
        } catch (ParseException e) {
            return false;
        }
    }
    
    /**
     * 得到n天之后的日期时间格式yyyy-MM-dd HH:mm:ss，按照分钟hour计算
     * @param days
     * @return
     */
    public static String getTimeFromDateTime(String datetime) {
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateNow = fmt.parse(datetime);
			
			    	
	    	return sdfTime.format(dateNow);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    
    /**
     * 得到n天之后的日期时间格式yyyy-MM-dd HH:mm:ss，按照分钟min计算
     * @param days
     * @return
     */
    public static String getAfterDayDateTimeWithDays(String date,int days) {
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dateNow = fmt.parse(date);
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.add(Calendar.DATE,  days);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 得到n天之后的日期时间格式yyyy-MM-dd HH:mm:ss，按照分钟min计算,按当前日期计算
     * @param days
     * @return
     */
    public static String getAfterDayDateTime(int min) {
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			
			Calendar canlendar = Calendar.getInstance();
	    	
	    	canlendar.add(Calendar.MINUTE,  min);
	    	
	    	Date date1 = canlendar.getTime();
	    	
	    	return fmt.format(date1);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 得到日期的星期几，星期一，1...星期日，7
     * @param days
     * @return
     */
    public static String getWeek(String date) {
    	
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
				Date dateNow = fmt.parse(date);
			
		     Calendar canlendar = Calendar.getInstance();  
		     canlendar.setTime(dateNow);
			  //一周第一天是否为星期天  
			  boolean isFirstSunday = (canlendar.getFirstDayOfWeek() == Calendar.SUNDAY);  
			  //获取周几  
			  int weekDay = canlendar.get(Calendar.DAY_OF_WEEK);  
			  //若一周第一天为星期天，则-1  
			  if(isFirstSunday){  
			      weekDay = weekDay - 1;  
			      if(weekDay == 0){  
			          weekDay = 7;  
			      }  
			  }  
			  return StringUtil.IntegerToString(weekDay);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
    /**
     * 得到日期的星期几，星期一，1...星期日，7
     * @param days
     * @return
     */
    public static String getWeekFromDate(String date) {
    	
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
				Date dateNow = fmt.parse(date);
			
		     Calendar canlendar = Calendar.getInstance();  
		     canlendar.setTime(dateNow);
			  //一周第一天是否为星期天  
			  boolean isFirstSunday = (canlendar.getFirstDayOfWeek() == Calendar.SUNDAY);  
			  //获取周几  
			  int weekDay = canlendar.get(Calendar.DAY_OF_WEEK);  
			  //若一周第一天为星期天，则-1  
			  if(isFirstSunday){  
			      weekDay = weekDay - 1;  
			      if(weekDay == 0){  
			          weekDay = 7;  
			      }  
			  }  
			  return StringUtil.IntegerToString(weekDay);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
    }
    
     /**
     * 得到n天之后的日期时间格式
     * @param days
     * @return
     */
    public static String getAfterDayDateTime(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    /**
     * 得到n天之后的日期时间格式
     * @param days，延后多少天
     * @param strBeginTime,起始时间
     * @return
     */
    public static String getAfterDayDateTime(String days,String strBeginTime) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = sdfd.format(date);
        
        dateStr = dateStr + " " + strBeginTime;
        
        return dateStr;
    }
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        return dateStr;
    }
    
    public static void main(String[] args) {
    	
    	int t = DateUtil.getNowTimeIntFormat();
		
    	
    		System.out.println(t);
    	
    	
    	
    }
    
    /** 
     * 获得指定日期的后一天 
     * @param specifiedDay 
     * @return 
     */ 
     public static String getSpecifiedDayAfter(String specifiedDay){ 
	     Calendar c = Calendar.getInstance(); 
	     Date date=null; 
	     try { 
	    	 date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay); 
	     } catch (ParseException e) { 
	    	 e.printStackTrace(); 
	     } 
	     c.setTime(date); 
	     int day=c.get(Calendar.DATE); 
	     c.set(Calendar.DATE,day+1); 
	
	     String dayAfter=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()); 
	     return dayAfter; 
     } 
     
     /*
     * 取本周7天的第一天（周一的日期）
     */
     public static String getNowWeekBegin() {
	     int mondayPlus;
	     Calendar cd = Calendar.getInstance();
	     // 获得今天是一周的第几天，星期日是第一天，星期二是第二天......
	     int dayOfWeek = cd.get(Calendar.DAY_OF_WEEK) - 1; // 因为按中国礼拜一作为第一天所以这里减1
	     if (dayOfWeek == 1) {
	     mondayPlus = 0;
	     } else {
	     mondayPlus = 1 - dayOfWeek;
	     }
	     GregorianCalendar currentDate = new GregorianCalendar();
	     currentDate.add(GregorianCalendar.DATE, mondayPlus);
	     Date monday = currentDate.getTime();
	     String preMonday = sdfDay.format(monday);
	     return preMonday ;
     }
     
     // 本月的第一天
    public static String getNowMonthBegin() {
    	 
    	Calendar calendar  =   new  GregorianCalendar();
    	calendar.set( Calendar.DATE,  1 );
    	return sdfDay.format(calendar.getTime());
	}

	// 本月的第一天
	public static String getNowMonthEnd() {
		Calendar calendar  =   new  GregorianCalendar();
    	calendar.set( Calendar.DATE,  1 );
  	    calendar.roll(Calendar.DATE,  - 1 );
  	    // 本月的最后一天
  	    return sdfDay.format(calendar.getTime());
	}
	
	// 本月的第一天
	public static String getMonthEnd(String strMonth) {
		/*Calendar calendar  =   new  GregorianCalendar();
    	calendar.set( Calendar.DATE,  1 );
  	    calendar.roll(Calendar.DATE,  - 1 );
  	    // 本月的最后一天
  	    return sdfDay.format(calendar.getTime());
  	    */
  			
  	  	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
  	  	String nowDate = strMonth + "-01";
		try {
			Date dateNow = fmt.parse(nowDate);
			
	    	Calendar canlendar = Calendar.getInstance();
	    	canlendar.setTime(dateNow);
	    	canlendar.roll(Calendar.DATE,  - 1 );
	    	// 本月的最后一天
	    	return sdfDay.format(canlendar.getTime());
			
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
		 
}
