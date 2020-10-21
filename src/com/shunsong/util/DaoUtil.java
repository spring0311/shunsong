package com.shunsong.util;

public class DaoUtil {
	
	public static void putCreateInfo(PageData pd){
		pd.put("UPDATE_USER", Jurisdiction.getUsername());
		pd.put("UPDATE_DATE", DateUtil.getTime());
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
	}
	
	public static void putUpdateInfo(PageData pd){
		pd.put("UPDATE_USER", Jurisdiction.getUsername());
		pd.put("UPDATE_DATE", DateUtil.getTime());
	}
}
