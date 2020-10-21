package com.shunsong.util;

public class PdUtil {
	public static void AddCommonData(PageData pd){
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
	}
	
	public static void ModifyCommonData(PageData pd){
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("UPDATE_USER", Jurisdiction.getUsername());
		pd.put("UPDATE_DATE", DateUtil.getTime());
		/*
		 * pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		 * pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		 * pd.put("GROUP_ID", Jurisdiction.getGroupID());
		 */
	}
	
	public static void AddDateData(PageData pd){
		pd.put("CREATE_DATE", DateUtil.getTime());		
	}
	
	public static void ModifyDateData(PageData pd){
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("UPDATE_DATE", DateUtil.getTime());		
	}
	
	/**获取当前的集团ID
	 *@return
	 */
	public static String GetGroupID(){
		return Jurisdiction.getGroupID();
	}
	
	/**获取登录用户名
	 *@return
	 */
	public static String GetUserName(){
		return Jurisdiction.getUsername();
	}
	
	/**获取当前的公司ID
	 *@return
	 */
	public static String GetCompanyID(){
		return Jurisdiction.getCompanyID();
	}
	
	/**获取当前用户的部门ID
	 *@return
	 */
	public static String GetDeptID(){
		return Jurisdiction.getDeptID();
	}
	
	/**获取登录用户的姓名
	 *@return
	 */
	public static String GetUserFullName(){
		return Jurisdiction.getUserFullName();
	}
	
	/**获取登录用户的姓名
	 *@return
	 */
	public static String GetUserID(){
		return Jurisdiction.getUserId();
	}

}
