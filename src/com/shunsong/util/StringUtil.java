package com.shunsong.util;
/**
 * 字符串相关方法
 *
 */
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.StringTokenizer;

public class StringUtil {

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
	    int i = 0;
	    String TempStr = valStr;
	    String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
	    valStr = valStr + ",";
	    while (valStr.indexOf(',') > 0)
	    {
	        returnStr[i] = valStr.substring(0, valStr.indexOf(','));
	        valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());
	        
	        i++;
	    }
	    return returnStr;
	}
	
	/**得到32位的uuid
	 * @return
	 */
	public static String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	public static String getUTF8StringByEncoding(String str) {
		String encode = StringUtil.getEncoding(str);
		
		if(encode.equals("UTF-8")){
			return str;
		}else if(encode.equals("GB2312")){
			return str;
		}else{
			try {
				return new String(str.getBytes(encode),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// 
				e.printStackTrace();
				return str;
			}
		}
	}
	
	public static String gb2312ToUtf8(String str) {  
		  
        String urlEncode = "" ;  
        try {
            urlEncode = URLEncoder.encode(str, "UTF-8" );
        } catch (UnsupportedEncodingException e) { 
            e.printStackTrace();   
        }   
        return urlEncode;
  
    }  
	
	/**获取字符串编码
	 * @param str
	 * @return
	 */
	public static String getEncoding(String str) {
		 String encode = "ISO-8859-1";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s1 = encode;      
	              return s1;      
	           }      
	       } catch (Exception exception1) {      
	       }
	      
	        encode = "GB2312";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s = encode;      
	              return s;      
	           }      
	       } catch (Exception exception) {      
	       }      
	             
	       encode = "UTF-8";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s2 = encode;      
	              return s2;      
	           }      
	       } catch (Exception exception2) {      
	       }      
	       encode = "GBK";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s3 = encode;      
	              return s3;      
	           }      
	       } catch (Exception exception3) {      
	       }      
	      return "";      
	   } 
	
	public static String trimParam(String str) {
		if (str != null) {
			return str.trim();
		} else {
			return null;
		}
	}

	public static String trimStr(String str) {
		if (str == null) {
			return "";
		} else {
			return str.trim();
		}
	}

	/**
	 * 判断参数是否为空
	 * 
	 * @param param
	 * @return
	 */
	public static boolean isNotNullParam(String param) {
		if (param != null && !"".equals(param.trim())) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 格式化BigDecimal数据 ，对b进行四舍五入
	 * 
	 * @param b
	 * @param decimalLength
	 * @param isOg
	 * @param returnVal
	 *            当格式化数据发生错误时返回的数据
	 * @return
	 */
	public static String formatBigDecimalNo(BigDecimal b, int decimalLength,
			boolean isOg, String returnVal) {
		// 首先使用BigDecimal方法实现四舍五入，然后使用DecimalFormat实现格式化
		BigDecimal newB = b;
		if (null != b) {
			BigDecimal one = new BigDecimal("1");
			newB = b.divide(one, decimalLength, BigDecimal.ROUND_HALF_UP);
		}
		String ptn = getFormatNumPattern(decimalLength, isOg);
		return formatBigDecimalToString(newB, ptn, returnVal);
	}

	/**
	 * 获得格式化数据的匹配模式
	 * 
	 * @param decimalLength
	 *            小数位数
	 * @param isOlogyAccount
	 *            是否已逗号分割显示
	 * @return
	 */
	private static String getFormatNumPattern(int decimalLength,
			boolean isOlogyAccount) {
		StringBuffer bf = new StringBuffer();
		for (int i = 1; i <= 15; i++) {
			if (i == 15) {
				bf.append("0");
			} else {
				bf.append("#");
			}
			if (isOlogyAccount) {
				if (i % 3 == 0 && i != 15) {
					bf.append(",");
				}
			}
		}
		if (decimalLength > 0) {
			bf.append(".");
		}
		while (decimalLength > 0) {
			bf.append("0");
			decimalLength--;
		}
		return bf.toString();
	}

	/**
	 * 按照指定的格式，对BigDecimal数据进行格式化，如果传入的输入为非法数据或者其他原因引起的异常<br>
	 * returnVal 为在异常发生时所返回的值.
	 * 
	 * @param b
	 * @param pattern
	 * @param returnVal
	 * @return
	 */
	private static String formatBigDecimalToString(BigDecimal b,
			String pattern, String returnVal) {
		String ret = "";
		try {
			java.text.DecimalFormat df = new java.text.DecimalFormat(pattern);
			ret = df.format(b);
		} catch (Exception e) {
			return returnVal;
		}
		return ret;
	}

	public static double round(double v, int scale) {
		BigDecimal b = new BigDecimal(Double.toString(v));
		BigDecimal one = new BigDecimal("1");
		return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	public static String conversionSqlWhereOfIn(String str[]) {
		String s = "'" + str[0] + "'";
		for (int i = 1; i < str.length; i++) {
			s += ",'" + str[i] + "'";
		}
		return "in(" + s + ")";

	}

	public static String conversionSql(String str[]) {
		String s = "'" + str[0] + "'";
		for (int i = 1; i < str.length; i++) {
			s += ",'" + str[i] + "'";
		}
		return s;

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static String[] parseParams(String str, String sign) {
		List parameterList = new ArrayList();
		StringTokenizer st = new StringTokenizer(str, sign);
		while (st.hasMoreTokens()) {
			String value = st.nextToken().trim();
			if (value != null && value.length() > 0) {
				parameterList.add(value);
			}
		}
		return (String[]) parameterList
				.toArray(new String[parameterList.size()]);
	}

	public static String noNullString(Object obj) {
		if (obj == null)
			return "";
		else
			return obj.toString();
	}

	public static String objectFromDoubleToStringAcc2(Object obj) {
		String ret = "0";
		if (obj != null) {
			ret = obj.toString();
		}
		Double d = new Double(ret);
		BigDecimal b = new BigDecimal(d.doubleValue());
		return formatBigDecimalToString(b, "#.##");
	}

	public static String doubleToStringAcc2(double d) {
		Double d1 = new Double(d);
		BigDecimal b = new BigDecimal(d1.doubleValue());
		return formatBigDecimalToString(b, "#.##");
	}
	
	public static String doubleToString(double d, String format) {
		Double d1 = new Double(d);
		BigDecimal b = new BigDecimal(d1.doubleValue());
		return formatBigDecimalToString(b, format);
	}

	public static String objectFromDoubleToStringAcc6(Object obj) {
		String ret = "0";
		if (obj != null) {
			ret = obj.toString();
		}
		Double d = new Double(ret);
		BigDecimal b = new BigDecimal(d.doubleValue());
		return formatBigDecimalToString(b, "#.######");
	}

	private static String formatBigDecimalToString(BigDecimal b, String pattern) {
		String ret = "";
		java.text.DecimalFormat df = new java.text.DecimalFormat(pattern);
		ret = df.format(b);
		return ret;
	}

	public static String noNullString(Double d) {
		if (d == null) {
			d = new Double(0);
		}
		BigDecimal b = new BigDecimal(d.doubleValue());
		return formatBigDecimalToString(b, "#.##");
	}

	public static Double doubleToDoubleAcc2(Double d) {

		if (d == null) {
			d = new Double(0);
		}
		BigDecimal b = new BigDecimal(d.doubleValue());
		return new Double(formatBigDecimalToString(b, "#.##"));

	}

	public static Double doubleToDoubleAcc6(Double d) {

		if (d == null) {
			d = new Double(0);
		}
		BigDecimal b = new BigDecimal(d.doubleValue());
		return new Double(formatBigDecimalToString(b, "#.######"));

	}

	public static String noNullStringSix(Double d) {
		if (d == null) {
			d = new Double(0);
		}
		BigDecimal b = new BigDecimal(d.doubleValue());
		return formatBigDecimalToString(b, "#.######");
	}

	public static Double stringToDouble(String s, String format) {

		if ("".equals(trimStr(s))) {
			return new Double(0);
		} else {
			BigDecimal b = new BigDecimal(trimStr(s));
			return new Double(formatBigDecimalToString(b, format));
		}

	}

	public static Double stringToDoubleAcc2(String s) {

		if ("".equals(trimStr(s))) {
			return new Double(0);
		} else {
			BigDecimal b = new BigDecimal(trimStr(s));
			return new Double(formatBigDecimalToString(b, "#.##"));
		}

	}

	public static Long stringToLong(String s) {

		if ("".equals(trimStr(s))) {
			return new Long(0);
		} else {
			return new Long(trimStr(s));
		}

	}
	
	public static  int stringToInteger(String s) {

		if ("".equals(trimStr(s))) {
			return 0;
		} else {
			return Integer.parseInt(trimStr(s));
		}

	}
	
	public static String IntegerToString(int s) {
		return String.valueOf(s);		
	}
	
	public static String LongToString(long s) {
		return String.valueOf(s);		
	}

	@SuppressWarnings("rawtypes")
	public static String mapToStringKeys(Map map) {

		StringBuffer sb = new StringBuffer();
		Iterator its = map.entrySet().iterator();
		while (its.hasNext()) {
			Entry s = (Entry) its.next();
			sb.append("'" + s.getKey().toString() + "',");
		}

		return sb.substring(0, sb.length() - 1);
	}

	@SuppressWarnings("rawtypes")
	public static String mapToStringValues(Map map) {

		StringBuffer sb = new StringBuffer();
		Iterator its = map.entrySet().iterator();
		while (its.hasNext()) {
			Entry s = (Entry) its.next();
			sb.append("'" + s.getValue().toString() + "',");
		}

		return sb.substring(0, sb.length() - 1);
	}

	/**
	 * 
	 * @notes:将传入的字符串转成GBK编码形式
	 * @param tmp
	 * @return
	 * @String
	 * @author zoeyzhou
	 * @create time 2007-7-11
	 */
	public static String getString(String tmp) {
		if (tmp == null)
			return " ";
		String ret = " ";
		try {
			ret = new String(tmp.getBytes("GBK"));
		} catch (Exception e) {
			ret = tmp;
		}
		return ret;
	}
	
	/**
	 * 
	 * @notes:在字符前面自动补数
	 * @param tmp
	 * @return
	 * @String
	 * @author zoeyzhou
	 * @create time 2007-7-11
	 */
	public static String autoGenericCode(int tmp,int len) {

		String str_m = String.valueOf(tmp); 
		if(len > 0){
			String str = StringUtil.autoZeroString(len);
			str_m=str.substring(0, len-str_m.length())+str_m;
		}else{
			String str ="000";
			str_m=str.substring(0, len-str_m.length())+str_m;
		}
		return str_m;
	}
	/**
	 * 
	 * @notes:在字符前面自动补数
	 * @param tmp
	 * @return
	 * @String
	 * @author zoeyzhou
	 * @create time 2007-7-11
	 */
	public static String autoZeroString(int len) {

		String str_m = ""; 
		for(int i=0;i<len;i++){
			str_m = str_m + "0";
		}		
		return str_m;
	}
	
	public static void main(String[] args) {
		/*String format = "%" + "0" + "4" + "d";
		System.out.println(format);
		System.out.println(String.format("%04S", "1"));*/
		
		
		System.out.println("YW0123".substring(2));
	}
	
}
