package com.shunsong.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.shunsong.entity.system.Menu;
import com.shunsong.entity.system.User;

/**
 * 权限处理
 * @author:fh qq 313596790[青苔]
 * 修改日期：2015/11/19
*/
public class Jurisdiction {

	/**
	 * 访问权限及初始化按钮权限(控制按钮的显示 增删改查)
	 * @param menuUrl  菜单路径
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean hasJurisdiction(String menuUrl){
		//判断是否拥有当前点击菜单的权限（内部过滤,防止通过url进入跳过菜单权限）
		/**
		 * 根据点击的菜单的xxx.do去菜单中的URL去匹配，当匹配到了此菜单，判断是否有此菜单的权限，没有的话跳转到404页面
		 * 根据按钮权限，授权按钮(当前点的菜单和角色中各按钮的权限匹对)
		 */
		String USERNAME = getUsername();	//获取当前登录者loginname
		Session session = getSession();
		List<Menu> menuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_allmenuList); //获取菜单列表
		if(null == menuList){
			menuList = new ArrayList<>();
		}
		return readMenu(menuList,menuUrl,session,USERNAME);
	}
	
	/**校验菜单权限并初始按钮权限用于页面按钮显示与否(递归处理)
	 * @param menuList:传入的总菜单(设置菜单时，.do前面的不要重复)
	 * @param menuUrl:访问地址
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean readMenu(List<Menu> menuList,String menuUrl,Session session,String USERNAME){
		for(int i=0;i<menuList.size();i++){
			if(menuList.get(i)
					.getMENU_URL()
					.split(".do")[0]
							.equals(menuUrl.split(".do")[0])){ //访问地址与菜单地址循环匹配，如何匹配到就进一步验证，如果没匹配到就不处理(可能是接口链接或其它链接)
				if(!menuList.get(i).isHasMenu()){				//判断有无此菜单权限
					return false;
				}else{											//按钮判断
					Map<String, String> map = (Map<String, String>)session.getAttribute(USERNAME + Const.SESSION_QX);//按钮权限(增删改查)
					map.remove("add");
					map.remove("del");
					map.remove("edit");
					map.remove("cha");
					String MENU_ID =  menuList.get(i).getMENU_ID();
					Boolean isAdmin = "admin".equals(USERNAME);
					map.put("add", (RightsHelper.testRights(map.get("adds"), MENU_ID)) || isAdmin?"1":"0");
					map.put("del", RightsHelper.testRights(map.get("dels"), MENU_ID) || isAdmin?"1":"0");
					map.put("edit", RightsHelper.testRights(map.get("edits"), MENU_ID) || isAdmin?"1":"0");
					map.put("cha", RightsHelper.testRights(map.get("chas"), MENU_ID) || isAdmin?"1":"0");
					session.removeAttribute(USERNAME + Const.SESSION_QX);
					session.setAttribute(USERNAME + Const.SESSION_QX, map);	//重新分配按钮权限
					return true;
				}
			}else{
				readMenu(menuList.get(i).getSubMenu(),menuUrl,session,USERNAME);//继续排查其子菜单
			}
		}
		return true;
	}
	
	/**
	 * 按钮权限(方法中校验)
	 * @param menuUrl  菜单路径
	 * @param type  类型(add、del、edit、cha)
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean buttonJurisdiction(String menuUrl, String type){
		//判断是否拥有当前点击菜单的权限（内部过滤,防止通过url进入跳过菜单权限）
		/**
		 * 根据点击的菜单的xxx.do去菜单中的URL去匹配，当匹配到了此菜单，判断是否有此菜单的权限，没有的话跳转到404页面
		 * 根据按钮权限，授权按钮(当前点的菜单和角色中各按钮的权限匹对)
		 */
		String USERNAME = getUsername();	//获取当前登录者loginname
		Session session = getSession();
		List<Menu> menuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_allmenuList); //获取菜单列表
		readMenuButton(menuList,menuUrl,session,USERNAME,type);
		return true;
	}
	
	/**校验按钮权限(递归处理)
	 * @param menuList:传入的总菜单(设置菜单时，.do前面的不要重复)
	 * @param menuUrl:访问地址
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean readMenuButton(List<Menu> menuList,String menuUrl,Session session,String USERNAME, String type){
		for(int i=0;i<menuList.size();i++){
			if(menuList.get(i).getMENU_URL().split(".do")[0].equals(menuUrl.split(".do")[0])){ //访问地址与菜单地址循环匹配，如何匹配到就进一步验证，如果没匹配到就不处理(可能是接口链接或其它链接)
				if(!menuList.get(i).isHasMenu()){				//判断有无此菜单权限
					return false;
				}else{											//按钮判断
					Map<String, String> map = (Map<String, String>)session.getAttribute(USERNAME + Const.SESSION_QX);//按钮权限(增删改查)
					String MENU_ID =  menuList.get(i).getMENU_ID();
					Boolean isAdmin = "admin".equals(USERNAME);
					if("add".equals(type)){
						return ((RightsHelper.testRights(map.get("adds"), MENU_ID)) || isAdmin);
					}else if("del".equals(type)){
						return ((RightsHelper.testRights(map.get("dels"), MENU_ID)) || isAdmin);
					}else if("edit".equals(type)){
						return ((RightsHelper.testRights(map.get("edits"), MENU_ID)) || isAdmin);
					}else if("cha".equals(type)){
						return ((RightsHelper.testRights(map.get("chas"), MENU_ID)) || isAdmin);
					}
				}
			}else{
				readMenuButton(menuList.get(i).getSubMenu(),menuUrl,session,USERNAME,type);//继续排查其子菜单
			}
		}
		return true;
	}
	
	/**获取当前登录的用户名
	 * @return
	 */
	public static String getUsername(){
		String strUserName = "admin";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_USERNAME);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录用户的数据权限
	 * @return
	 */
	public static String getUserDataQX(){
		String strUserName = "ALL";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_USERDATA_QX);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录的用户ID
	 * @return
	 */
	public static String getUserId(){
		String strUserID = "1";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_USERID);
			if(ob != null){
				strUserID = ob.toString();
			}
		}
		return strUserID;
	}
	
	/**获取当前登录的用户ID
	 * @return
	 */
	public static String getUserFullName(){
		String strUserName = "系统管理员";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_USERFULLNAME);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录的机台ID
	 * @return
	 */
	public static String getMachineID(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_MACHINE_ID);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录的机台名称
	 * @return
	 */
	public static String getMachineName(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_MACHINE_NAME);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录的工序ID
	 * @return
	 */
	public static String getCraftNo(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_CRAFT_NO);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录的工序CODE
	 * @return
	 */
	public static String getCraftCode(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_CRAFT_CODE);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录的工序名称
	 * @return
	 */
	public static String getCraftName(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_CRAFT_NAME);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前机台的生产模式
	 * @return
	 */
	public static String getMakeMode(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_MAKE_MODE);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前机台的子工序的模式类型（上线工序、下线工序）
	 * @return
	 */
	public static String getModeType(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_MODE_TYPE);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	
	/**获取当前登录的机台编号
	 * @return
	 */
	public static String getMachineCode(){
		String strUserName = "";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_MACHINE_CODE);
			if(ob != null){
				strUserName = ob.toString();
			}
		}
		return strUserName;
	}
	

	/**获取当前登录的班次
	 * @return
	 */
	public static String getShiftId(){
		return getSession().getAttribute(Const.SESSION_SHIFTID).toString();
	}
	
	/**获取当前登录的班次
	 * @return
	 */
	public static String getShiftName(){
		return getSession().getAttribute(Const.SESSION_SHIFTNAME).toString();
	}
	
	/**获取当前登录的班次
	 * @return
	 */
	public static User getUSER(){
		
		return (User)getSession().getAttribute(Const.SESSION_USER);
	}
	
	/**获取当前登录的用户所在集团的代码
	 * @return
	 */
	public static String getGroupID(){
		return "a6c6695217ba4a4dbfe9f7e9d2c06730";
	}
	
	/**获取当前登录的用户所在公司的代码
	 * @return
	 */
	public static String getCompanyID(){
		return "a6c6695217ba4a4dbfe9f7e9d2c06730";
	}
	
	/**获取当前登录的用户所在部门的代码
	 * @return
	 */
	public static String getDeptID(){
		String strDeptID = "d41af567914a409893d011aa53eda797";
		Session ss = getSession();
		if(ss != null){
			Object ob = ss.getAttribute(Const.SESSION_DEPARTMENTID);
			if(ob != null){
				strDeptID = ob.toString();
			}
		}
		return strDeptID;	
		
	}
	
	/**获取当前登录的用户所在部门的名称
	 * @return
	 */
	public static String getDeptName(){
		String strDeptID = getSession().getAttribute(Const.SESSION_DEPARTMENTNAME).toString();
		if(StringUtil.isNotNullParam(strDeptID)){
			return strDeptID;
		}else{
			return "(无)未获取到部门名称";
		}
		
	}
	
	/**获取当前按钮权限(增删改查)
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> getHC(){
		return (Map<String, String>)getSession().getAttribute(getUsername() + Const.SESSION_QX);
	}
	
	/**shiro管理的session
	 * @return
	 */
	public static Session getSession(){
		try{
			Subject currentUser = SecurityUtils.getSubject();  
			if(currentUser != null){
				return currentUser.getSession();
			}else{
				return null;
			}
		}catch(UnavailableSecurityManagerException e){
			return null;
		}
		
	}
}
