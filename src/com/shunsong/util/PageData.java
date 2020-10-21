package com.shunsong.util;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
/** 
 * 说明：参数封装Map
 * 创建人：FH Q313596790
 * 修改时间：2014年9月20日
 * @version
 */
public class PageData extends HashMap implements Map{
	
	private static final long serialVersionUID = 1L;
	
	Map map = null;
	HttpServletRequest request;
	public PageData(HttpServletRequest request){
		this.request = request;
		Map properties = request.getParameterMap();
		Map returnMap = new HashMap(); 
		Iterator entries = properties.entrySet().iterator(); 
		Map.Entry entry; 
		String name = "";  
		String value = "";  
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next(); 
			name = (String) entry.getKey(); 
			Object valueObj = entry.getValue(); 
			if(null == valueObj){ 
				value = ""; 
			}else if(valueObj instanceof String[]){ 
				String[] values = (String[])valueObj;
				for(int i=0;i<values.length;i++){ 
					 value = values[i] + ",";
				}
				value = value.substring(0, value.length()-1); 
			}else{
				value = valueObj.toString(); 
			}
			returnMap.put(name, value); 
		}
		map = returnMap;
	}
	
	public PageData() {
		map = new HashMap();
	}
	
	@Override
	public Object get(Object key) {
		Object obj = null;
		obj = map.get(key);
		if(obj != null){
			if(obj instanceof Object[]) {
				Object[] arr = (Object[])map.get(key);
				obj = request == null ? arr:(request.getParameter((String)key) == null ? arr:arr[0]);
			} 
		}
		
		return obj;
	}
	
	public String getString(Object key) {
		if(null == get(key)){
			return null;
		}
		return get(key).toString();
	}
	
	public int getInt(Object key) {
		Object ob = get(key);
		if(null == ob){
			return 0;
		}
		try{
			int intValue = Integer.parseInt(ob.toString());
			return intValue;
		}catch(Exception e){
			return 0;
		}
	}
	
	public String getIntString(Object key) {
		Object ob = get(key);
		if(null == ob){
			return null;
		}
		try{
			int intValue = Integer.parseInt(ob.toString());
			return StringUtil.IntegerToString(intValue);
		}catch(Exception e){
			return "";
		}
		
	}
	
	public String getDateTimeString(Object key) {
		Object obj = get(key);
		if(null == obj){
			return null;
		}
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return fmt.format(obj);
	}
	
	public String getTimeString(Object key) {
		Object obj = get(key);
		if(null == obj){
			return null;
		}
		DateFormat fmt = new SimpleDateFormat("HH:mm:ss");
		
		return fmt.format(obj);
	}
	
	public String getDateString(Object key) {
		Object obj = get(key);
		if(null == obj){
			return null;
		}
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		
		return fmt.format(obj);
	}
	
	public String getDecimalString(Object key) {
		Object obj = get(key);
		if(null == obj){
			return "0";
		}
		
		if( obj instanceof BigDecimal ){
			BigDecimal bd = (BigDecimal)obj;
			return bd.toString();
		}else
		{
			return "0";
		}
		
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Object put(Object key, Object value) {
		return map.put(key, value);
	}
	
	@Override
	public Object remove(Object key) {
		return map.remove(key);
	}

	public void clear() {
		map.clear();
	}

	public boolean containsKey(Object key) {
		// 
		return map.containsKey(key);
	}

	public boolean containsValue(Object value) {
		// 
		return map.containsValue(value);
	}

	public Set entrySet() {
		// 
		return map.entrySet();
	}

	public boolean isEmpty() {
		// 
		return map.isEmpty();
	}

	public Set keySet() {
		// 
		return map.keySet();
	}

	@SuppressWarnings("unchecked")
	public void putAll(Map t) {
		// 
		map.putAll(t);
	}

	public int size() {
		// 
		return map.size();
	}

	public Collection values() {
		// 
		return map.values();
	}
	
}
