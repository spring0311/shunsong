package com.shunsong.controller.system.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shunsong.controller.base.BaseController;
import com.shunsong.entity.system.Menu;
import com.shunsong.entity.system.Role;
import com.shunsong.entity.system.User;
import com.shunsong.service.baseinfo.excellentstaff.ExcellentstaffManager;
import com.shunsong.service.system.appuser.AppuserManager;
import com.shunsong.service.system.buttonrights.ButtonrightsManager;
import com.shunsong.service.system.fhbutton.FhbuttonManager;
import com.shunsong.service.system.menu.MenuManager;
import com.shunsong.service.system.role.RoleManager;
import com.shunsong.service.system.user.UserManager;
import com.shunsong.service.system.userresume.UserResumeManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.Const;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.PublicUtil;
import com.shunsong.util.RightsHelper;
import com.shunsong.util.StringUtil;
import com.shunsong.util.Tools;
/**
 * 总入口
 * @author fh QQ 3 1 3 5 9 6 7 9 0[青苔]
 * 修改日期：2015/11/2
 */
@Controller
public class LoginController extends BaseController {

	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="buttonrightsService")
	private ButtonrightsManager buttonrightsService;
	@Resource(name="fhbuttonService")
	private FhbuttonManager fhbuttonService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name="excellentstaffService")
	private ExcellentstaffManager excellentstaffService;
	@Resource(name="userresumeService")
	private UserResumeManager userresumeService;
	
	/**访问登录页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME)); //读取系统名称
		String loginType = pd.getString("loginType");
		if("actual".equals(loginType)){
			mv.setViewName("system/index/loginA");//生产实绩
			this.addExcellentStaff(mv, pd);
		}
		else if("qc".equals(loginType)){
			mv.setViewName("system/index/loginQC");//质检
			this.addExcellentStaff(mv, pd);
		}
		else{
			mv.setViewName("system/index/login");//普通登录
		}
		mv.addObject("pd",pd);
		return mv;
	}
	
	
	
	
	
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_register")
	@ResponseBody
	public Object login_register() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").replaceAll("qq313596790fh", "").replaceAll("QQ978336446fh", "").split(",fh,");
		/*if(null != KEYDATA && KEYDATA.length == 2){
			
			
			String USERNAME = KEYDATA[0];	//登录过来的用户名
			String PASSWORD  = KEYDATA[1];	//登录过来的密码
			
			USERNAME
			
				
				if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){		//判断登录验证码
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
					pd.put("PASSWORD", passwd);
					pd = userService.getUserByNameAndPwd(pd);	//根据用户名和密码去读取用户信息
					if(pd != null){
						pd.put("LAST_LOGIN",DateUtil.getTime().toString());
						userService.updateLastLogin(pd);
						
						Subject subject = SecurityUtils.getSubject(); 
					    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
					    try { 
					        subject.login(token); 
					    } catch (AuthenticationException e) { 
					    	errInfo = "身份验证失败！";
					    }
					}else{
						errInfo = "usererror"; 				//用户名或密码有误
						logBefore(logger, USERNAME+"登录系统密码或用户名错误");
					}
				
				if(Tools.isEmpty(errInfo)){
					errInfo = "success";					//验证成功
					logBefore(logger, USERNAME+"登录系统");
				}
			}
		}else{
			errInfo = "error";	//缺少参数
		}*/
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_login")
	@ResponseBody
	public Object login()throws Exception{
		logOutFunc();
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String url = "main/index";
		String KEYDATA[] = pd.getString("KEYDATA").replaceAll("qq313596790fh", "").replaceAll("QQ978336446fh", "").split(",fh,");
		if(null != KEYDATA && KEYDATA.length == 3){
			Session session = Jurisdiction.getSession();
			/*String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
			String code = KEYDATA[2];*/
			/*if(null == code || "".equals(code)){//判断效验码
				errInfo = "nullcode"; 			//效验码为空
			}else{*/
				String USERNAME = KEYDATA[0];	//登录过来的用户名
				String PASSWORD  = KEYDATA[1];	//登录过来的密码
				pd.put("USERNAME", USERNAME);
				/*if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){*/		//判断登录验证码
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
					pd.put("PASSWORD", passwd);
					pd = userService.getUserByNameAndPwd(pd);	//根据用户名和密码去读取用户信息
					if(pd != null ){
						if(!this.checkUserLoginPermission(pd)){
							errInfo = "statuserror"; 				//已离职不能登录
							logBefore(logger, USERNAME+"已离职，不能登录");
							map.put("result", errInfo);
							map.put("url", url);
							return AppUtil.returnObject(new PageData(), map);
						}
						pd.put("LAST_LOGIN",DateUtil.getTime().toString());
						userService.updateLastLogin(pd);
						User user = new User();
						user.setUSER_ID(pd.getString("USER_ID"));
						user.setUSERNAME(pd.getString("USERNAME"));
						user.setPASSWORD(pd.getString("PASSWORD"));
						user.setNAME(pd.getString("NAME"));
						user.setRIGHTS(pd.getString("RIGHTS"));
						user.setDEPARTMENT_ID(pd.getString("DEPARTMENT_ID"));
						user.setDEPARTMENT_NAME(pd.getString("DEPARTMENT_NAME"));
						user.setROLE_ID(pd.getString("ROLE_ID"));
						user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
						user.setIP(pd.getString("IP"));
						user.setSTATUS(pd.getString("STATUS"));
						session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
						session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject(); 
						UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
						try { 
							subject.login(token); 
						} catch (AuthenticationException e) { 
							errInfo = "身份验证失败！";
						}
						
						PageData paramR = new PageData();
						paramR.put("OBJECT_ID", pd.getString("ROLE_ID"));
						paramR.put("FUNCTION_TYPE", "LOGIN_TYPE");
						PageData pdFunc = roleService.findFunctionByRoleId(paramR);
						
						if(pdFunc != null){
							String strFunc = pdFunc.getString("FUNCTION_VALUE");
							if(StringUtil.isNotNullParam(strFunc)){
								if("20".equals(strFunc)){
									//修改登录地址
									url = "mainop/index";
								}
							}
						}
							
							
					}else{
						errInfo = "usererror"; 				//用户名或密码有误
						logBefore(logger, USERNAME+"登录系统密码或用户名错误");
					}
				/*}else{
					errInfo = "codeerror";				 	//验证码输入有误
				}*/
				if(Tools.isEmpty(errInfo)){
					errInfo = "success";
					//验证成功
					logBefore(logger, USERNAME+"登录系统");
				}
			/*}*/
		}else{
			errInfo = "error";	//缺少参数
		}
		map.put("result", errInfo);
		map.put("url", url);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mainop/selectMahchine_MD")
	@ResponseBody
	public Object selectMahchine_MD()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		String errInfo = "";
		ModelAndView mv = this.getModelAndView();
		String strMachineId = pd.getString("MACHINE_ID");
		String strMachineCode = pd.getString("MACHINE_CODE");
		String strMachineName = pd.getString("MACHINE_NAME");
		String strModeType = pd.getString("MODE_TYPE");
		String strMakeMode = pd.getString("MAKE_MODE");
		String strCarftNo = pd.getString("CRAFT_NO");
		String strCarfCode = pd.getString("CRAFT_CODE");
		String strCarftName = pd.getString("CRAFT_NAME");
		if(StringUtil.isNotNullParam(strMachineId)){
			Session session = Jurisdiction.getSession();
			pd.put("MACHINE_ID", strMachineId);
			pd.put("OrderbyClause", "a.status,a.WORK_DATE ASC");
			
			session.setAttribute(Const.SESSION_MACHINE_ID, strMachineId);
			session.setAttribute(Const.SESSION_MACHINE_CODE, strMachineCode);
			session.setAttribute(Const.SESSION_MACHINE_NAME, strMachineName);
			session.setAttribute(Const.SESSION_MAKE_MODE, strMakeMode);//
			session.setAttribute(Const.SESSION_MODE_TYPE, strModeType);//判断打开生产实际的首页 OnLine，OffLine，CNC
			session.setAttribute(Const.SESSION_CRAFT_NO, strCarftNo);
			session.setAttribute(Const.SESSION_CRAFT_CODE, strCarfCode);
			session.setAttribute(Const.SESSION_CRAFT_NAME, strCarftName);
			
			errInfo = "success";
		}else{
			errInfo = "error";	//缺少参数
		}
		
		map.put("result", errInfo);		
		return AppUtil.returnObject(new PageData(), map);
		
		/*mv.setViewName("production/product_actual/product_actual_start_MD");//普通登录
		mv.addObject("pd",pd);
		return mv;*/
	}
	
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mainop/select_shift")
	@ResponseBody
	public Object select_shift()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		
		String strShiftID = pd.getString("KEYDATA");
		String strShiftName = "";
		if(StringUtil.isNotNullParam(strShiftID)){
			Session session = Jurisdiction.getSession();
			pd.put("SHIFT_ID", strShiftID);
			List<PageData> shiftList = null;
			if(shiftList != null && shiftList.size() > 0){
				PageData shiftPd = (PageData)shiftList.get(0);
				strShiftName = shiftPd.getString("text");
			}
			
			session.setAttribute(Const.SESSION_SHIFTNAME, strShiftName);
			session.setAttribute(Const.SESSION_SHIFTID, strShiftID);
			
			errInfo = "success";
		}else{
			errInfo = "error";	//缺少参数
		}
		map.put("result", errInfo);		
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	
	
	/**访问系统首页
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/main/{changeMenu}")
	@SuppressWarnings("unchecked")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
					session.setAttribute(Const.SESSION_USERROL, user);				//存入session	
				}else{
					user = userr;
				}
				String USERNAME = user.getUSERNAME();
				Role role = user.getRole();											//获取用户角色
				String roleRights = role!=null ? role.getRIGHTS() : "";				//角色权限(菜单权限)
				session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				session.setAttribute(Const.SESSION_USER_ROLEID, user.getROLE_ID());				//放入用户角色ID到session
				session.setAttribute(Const.SESSION_USERID, user.getUSER_ID());				//放入用户ID到session
				session.setAttribute(Const.SESSION_USERFULLNAME, user.getNAME());				//放入用户ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTID, user.getDEPARTMENT_ID());				//放入部门ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTNAME, user.getDEPARTMENT_NAME());				//放入部门名到session
				
				//设置登录用户的数据访问权限
				PageData paramR = new PageData();			
			    paramR.put("OBJECT_ID", role.getROLE_ID());
			    paramR.put("FUNCTION_TYPE", "USERDATA_QX");			    
				PageData pdFunc = roleService.findFunctionByRoleId(paramR);
				if(pdFunc != null){
			    	String strFunc = pdFunc.getString("FUNCTION_VALUE");
			    	session.setAttribute(Const.SESSION_USERDATA_QX, strFunc);
			    }else {
			    	session.setAttribute(Const.SESSION_USERDATA_QX, "ALL");
			    }	
				
				List<Menu> allmenuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_allmenuList)){	
					allmenuList = menuService.listAllMenuQx("0");					//获取所有菜单
					if(Tools.notEmpty(roleRights) ){
						allmenuList = this.readMenu(allmenuList, roleRights,role.getROLE_ID());		//根据角色权限获取本权限的菜单列表
					}
					session.setAttribute(USERNAME + Const.SESSION_allmenuList, allmenuList);//菜单权限放入session中
				}else{
					allmenuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_allmenuList);
				}
				//切换菜单处理=====start
				List<Menu> menuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_menuList) || ("yes".equals(changeMenu))){
					List<Menu> menuList1 = new ArrayList<Menu>();
					List<Menu> menuList2 = new ArrayList<Menu>();
					//拆分菜单
					for(int i=0;i<allmenuList.size();i++){
						Menu menu = allmenuList.get(i);
						if("1".equals(menu.getMENU_TYPE())){
							menuList1.add(menu);
						}else{
							menuList2.add(menu);
						}
					}
					session.removeAttribute(USERNAME + Const.SESSION_menuList);
					if("2".equals(session.getAttribute("changeMenu"))){
						session.setAttribute(USERNAME + Const.SESSION_menuList, menuList1);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "1");
						menuList = menuList1;
					}else{
						session.setAttribute(USERNAME + Const.SESSION_menuList, menuList2);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "2");
						menuList = menuList2;
					}
				}else{
					menuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_menuList);
				}
				//切换菜单处理=====end
				if(null == session.getAttribute(USERNAME + Const.SESSION_QX)){
					session.setAttribute(USERNAME + Const.SESSION_QX, this.getUQX(USERNAME));	//按钮权限放到session中
				}
				this.getRemortIP(USERNAME);	//更新登录IP
				mv.setViewName("system/index/main");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("system/index/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME)); //读取系统名称
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**访问系统首页，现场操作
	 * @param 
	 * @return
	 */
	private ModelAndView login_index_op(String strLogInUrl,String strLogOutUrl,String strTabPageUrl){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
					session.setAttribute(Const.SESSION_USERROL, user);				//存入session	
				}else{
					user = userr;
				}
				String USERNAME = user.getUSERNAME();
				Role role = user.getRole();											//获取用户角色
				String roleRights = role!=null ? role.getRIGHTS() : "";				//角色权限(菜单权限)
				session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				session.setAttribute(Const.SESSION_USERID, user.getUSER_ID());				//放入用户ID到session
				session.setAttribute(Const.SESSION_USERFULLNAME, user.getNAME());				//放入用户ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTID, user.getDEPARTMENT_ID());				//放入部门ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTNAME, user.getDEPARTMENT_NAME());				//放入部门名到session
				
				Object ob = session.getAttribute(Const.SESSION_MACHINE_NAME);
				if(ob != null) {
					pd.put("MACHINENAME", ob.toString());
				}
				
				this.getRemortIP(USERNAME);	//更新登录IP
				
				mv.setViewName("system/index/main_op");
				mv.addObject("user", user);
				mv.addObject("tabPageUrl", strTabPageUrl);
			}else {
				mv.setViewName(strLogInUrl);//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName(strLogInUrl);
			logger.error(e.getMessage(), e);
		}
		
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME)); //读取系统名称
		mv.addObject("logoutUrl",strLogOutUrl);
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**访问系统首页，现场操作
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/mainop/indexqc")
	@SuppressWarnings("unchecked")
	public ModelAndView mainop_indexqc(){
		
		return login_index_op("system/index/loginQC","logoutQC","actualcheck/actual_qcList.do");
	
	}
	
	/**访问系统首页，现场操作
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/mainop/indexactual")
	@SuppressWarnings("unchecked")
	public ModelAndView mainop_indexactual(){
		
		return login_index_op("system/index/loginA","logoutA","actual/goActualTab.do");
	
	}
	
	/**访问系统首页，现场操作
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/mainop/indexactualMD")
	@SuppressWarnings("unchecked")
	public ModelAndView mainop_indexactualMD(){
		return login_index_op("system/index/login","logout","product_actual/goActualTab.do");	
	}
	
	/**访问系统首页，现场操作
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/mainop/index")
	@SuppressWarnings("unchecked")
	public ModelAndView mainop_index(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
					session.setAttribute(Const.SESSION_USERROL, user);				//存入session	
				}else{
					user = userr;
				}
				String USERNAME = user.getUSERNAME();
				Role role = user.getRole();											//获取用户角色
				String roleRights = role!=null ? role.getRIGHTS() : "";				//角色权限(菜单权限)
				session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				session.setAttribute(Const.SESSION_USERID, user.getUSER_ID());				//放入用户ID到session
				session.setAttribute(Const.SESSION_USERFULLNAME, user.getNAME());				//放入用户ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTID, user.getDEPARTMENT_ID());				//放入部门ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTNAME, user.getDEPARTMENT_NAME());				//放入部门名到session
				
				this.getRemortIP(USERNAME);	//更新登录IP
//				mv.setViewName("system/index/choiceShift");
				mv.setViewName("system/index/loginChoiceMachine");
				mv.addObject("user", user);
				//读取班次数据
				PageData paramUserMachine = new PageData();
				paramUserMachine.put("MatchUser", user.getUSER_ID());
				paramUserMachine.put("LoginSelect", "YES");
				List<PageData> varList = null;
				mv.addObject("varList", varList);
			}else {
				mv.setViewName("system/index/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME)); //读取系统名称
		
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**访问系统首页，现场操作
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/main/indexqc")
	@SuppressWarnings("unchecked")
	public ModelAndView main_indexQc(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
					session.setAttribute(Const.SESSION_USERROL, user);				//存入session	
				}else{
					user = userr;
				}
				String USERNAME = user.getUSERNAME();
				PageData paramFunctionValue = new PageData();
			    paramFunctionValue.put("FUNCTION_TYPE", "QC_CLASS_LEADER_ID");
			    Role qcRole = null;//获取检验班组长角色权限
				String roleRights = qcRole!=null ? qcRole.getRIGHTS() : "";				//角色权限(菜单权限)
				session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				session.setAttribute(Const.SESSION_USERID, user.getUSER_ID());				//放入用户ID到session
				session.setAttribute(Const.SESSION_USERFULLNAME, user.getNAME());				//放入用户ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTID, user.getDEPARTMENT_ID());				//放入部门ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTNAME, user.getDEPARTMENT_NAME());				//放入部门名到session
				List<Menu> allmenuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_allmenuList)){	
					/*
					PageData paramR = new PageData();
					String strFunc = "";
				    paramR.put("OBJECT_ID", role.getROLE_ID());
				    paramR.put("FUNCTION_TYPE", "MENU_PARENTID");
				    PageData pdFunc = roleService.findFunctionByRoleId(paramR);
				    if(pdFunc != null){
				    	strFunc = pdFunc.getString("FUNCTION_VALUE");				    	
				    }				    
					allmenuList = menuService.listAllMenuQx(strFunc);					//获取所有菜单
					*/
					allmenuList = menuService.listAllMenuQx("0");
					if(Tools.notEmpty(roleRights) ){
						allmenuList = this.readMenu(allmenuList, roleRights,qcRole.getROLE_ID());		//根据角色权限获取本权限的菜单列表
					}
					session.setAttribute(USERNAME + Const.SESSION_allmenuList, allmenuList);//菜单权限放入session中
				}else{
					allmenuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_allmenuList);
				}
				List<Menu> menuList = new ArrayList<Menu>();				
				//切换菜单处理=====start				
				if(null == session.getAttribute(USERNAME + Const.SESSION_menuList)){
					menuList = allmenuList;
					session.setAttribute(USERNAME + Const.SESSION_menuList, menuList);
					session.removeAttribute("changeMenu");
					session.setAttribute("changeMenu", "1");					
				}else{
					menuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_menuList);
				}
				//切换菜单处理=====end
				if(null == session.getAttribute(USERNAME + Const.SESSION_QX)){
					session.setAttribute(USERNAME + Const.SESSION_QX, this.getUQX(USERNAME));	//按钮权限放到session中
				}
				this.getRemortIP(USERNAME);	//更新登录IP
				mv.setViewName("system/index/main");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("system/index/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME)); //读取系统名称
			
		
		//读取班次数据
		List<PageData> varList = null;
		try {
			varList = null;
		} catch (Exception e) {
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}	
		
		mv.addObject("varList", varList);
		
		mv.addObject("pd",pd);
		return mv;
	}
	
	
	/**访问系统首页，现场操作
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/mainop/worklist")
	@SuppressWarnings("unchecked")
	public ModelAndView mainop_worklist(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			
			pd.put("SHIFTID", session.getAttribute(Const.SESSION_SHIFTID)); //
			pd.put("SHIFTNAME", session.getAttribute(Const.SESSION_SHIFTNAME)); //
			
			
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
					session.setAttribute(Const.SESSION_USERROL, user);				//存入session	
				}else{
					user = userr;
				}
				String USERNAME = user.getUSERNAME();
				Role role = user.getRole();											//获取用户角色
				String roleRights = role!=null ? role.getRIGHTS() : "";				//角色权限(菜单权限)
				session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				session.setAttribute(Const.SESSION_USERID, user.getUSER_ID());				//放入用户ID到session
				session.setAttribute(Const.SESSION_USERFULLNAME, user.getNAME());				//放入用户ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTID, user.getDEPARTMENT_ID());				//放入部门ID到session
				session.setAttribute(Const.SESSION_DEPARTMENTNAME, user.getDEPARTMENT_NAME());				//放入部门名到session
				List<Menu> allmenuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_allmenuList)){	
					
					PageData paramR = new PageData();
					String strFunc = "";
				    paramR.put("OBJECT_ID", role.getROLE_ID());
				    paramR.put("FUNCTION_TYPE", "MENU_PARENTID");
				    PageData pdFunc = roleService.findFunctionByRoleId(paramR);
				    if(pdFunc != null){
				    	strFunc = pdFunc.getString("FUNCTION_VALUE");				    	
				    }				    
					allmenuList = menuService.listAllMenuQx(strFunc);					//获取所有菜单
					if(Tools.notEmpty(roleRights) ){
						allmenuList = this.readMenu(allmenuList, roleRights,role.getROLE_ID());		//根据角色权限获取本权限的菜单列表
					}
					session.setAttribute(USERNAME + Const.SESSION_allmenuList, allmenuList);//菜单权限放入session中
				}else{
					allmenuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_allmenuList);
				}
				List<Menu> menuList = new ArrayList<Menu>();				
				//切换菜单处理=====start				
				if(null == session.getAttribute(USERNAME + Const.SESSION_menuList)){
					menuList = allmenuList;
					session.setAttribute(USERNAME + Const.SESSION_menuList, menuList);
					session.removeAttribute("changeMenu");
					session.setAttribute("changeMenu", "1");					
				}else{
					menuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_menuList);
				}
				//切换菜单处理=====end
				if(null == session.getAttribute(USERNAME + Const.SESSION_QX)){
					session.setAttribute(USERNAME + Const.SESSION_QX, this.getUQX(USERNAME));	//按钮权限放到session中
				}
				this.getRemortIP(USERNAME);	//更新登录IP
				mv.setViewName("system/index/main_op");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("system/index/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME)); //读取系统名称
			
		
		//读取班次数据
		List<PageData> varList = null;
		try {
			varList = null;
		} catch (Exception e) {
			mv.setViewName("system/index/login");
			logger.error(e.getMessage(), e);
		}	
		
		mv.addObject("varList", varList);
		
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**根据角色权限获取本权限的菜单列表(递归处理)
	 * @param menuList：传入的总菜单
	 * @param roleRights：加密的权限字符串
	 * @return
	 */
	public List<Menu> readMenu(List<Menu> menuList,String roleRights,String roleId){
		for(int i=0;i<menuList.size();i++){
			boolean isHasMenu = false;
			if(roleId.equals("1")){
				isHasMenu = true;
			}else{
				isHasMenu = RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID());
			}
			
			menuList.get(i).setHasMenu(isHasMenu);
			if(menuList.get(i).isHasMenu()){		//判断是否有此菜单权限
				this.readMenu(menuList.get(i).getSubMenu(), roleRights,roleId);//是：继续排查其子菜单
			}else{
				menuList.remove(i);
				i--;
			}
		}
		return menuList;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/index/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/login_default")
	public ModelAndView defaultPage() throws Exception{
		/*ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd.put("userCount", Integer.parseInt(userService.getUserCount("").get("userCount").toString())-1);				//系统用户数
		pd.put("appUserCount", Integer.parseInt(appuserService.getAppUserCount("").get("appUserCount").toString()));	//会员数
		mv.addObject("pd",pd);
		mv.setViewName("system/index/default");
		return mv;*/
		
		ModelAndView mv = null;
		PageData pd = new PageData();
		String url = "";
		
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME)); //读取系统名称
		
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);	
		if (user != null) {
			User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
			if(null == userr){
				user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
				session.setAttribute(Const.SESSION_USERROL, user);				//存入session	
			}else{
				user = userr;
			}
			
			Role role = user.getRole();
			PageData paramR = new PageData();
			paramR.put("OBJECT_ID", role.getROLE_ID());
			paramR.put("FUNCTION_TYPE", "LOGIN_DEFAULT_PAGE");
			PageData pdFunc = roleService.findFunctionByRoleId(paramR);
		    if(pdFunc != null){
		    	url = pdFunc.getString("FUNCTION_VALUE");	    	
		    }
		     
		    if(StringUtil.isNotNullParam(url)){
		    	String strUrl = "redirect:" + url;
		    	mv = new ModelAndView(strUrl);
		    }else{		
		    	mv = this.getModelAndView();
				pd.put("userCount", Integer.parseInt(userService.getUserCount("").get("userCount").toString())-1);				//系统用户数
				pd.put("appUserCount", Integer.parseInt(appuserService.getAppUserCount("").get("appUserCount").toString()));	//会员数
				mv.addObject("pd",pd);
				mv.setViewName("system/index/default");				
		    }
			 
		}else{
			mv = this.getModelAndView();
			mv.setViewName("system/index/login");//session失效后跳转登录页面			
			mv.addObject("pd",pd);
		}	
	
		return mv;
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		String USERNAME = Jurisdiction.getUsername();	//当前登录的用户名
		logBefore(logger, USERNAME+"退出系统");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		Session session = Jurisdiction.getSession();	//以下清除session缓存
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(USERNAME + Const.SESSION_allmenuList);
		session.removeAttribute(USERNAME + Const.SESSION_menuList);
		session.removeAttribute(USERNAME + Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute(Const.SESSION_USERROL);
		session.removeAttribute("changeMenu");
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject(); 
		subject.logout();
		pd = this.getPageData();
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME));
		mv.setViewName("system/index/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**获取用户权限
	 * @param session
	 * @return
	 */
	public Map<String, String> getUQX(String USERNAME){
		PageData pd = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		try {
			pd.put(Const.SESSION_USERNAME, USERNAME);
			pd.put("ROLE_ID", userService.findByUsername(pd).get("ROLE_ID").toString());//获取角色ID
			pd = roleService.findObjectById(pd);										//获取角色信息														
			map.put("adds", pd.getString("ADD_QX"));	//增
			map.put("dels", pd.getString("DEL_QX"));	//删
			map.put("edits", pd.getString("EDIT_QX"));	//改
			map.put("chas", pd.getString("CHA_QX"));	//查
			List<PageData> buttonQXnamelist = new ArrayList<PageData>();
			if("admin".equals(USERNAME)){
				buttonQXnamelist = fhbuttonService.listAll(pd);					//admin用户拥有所有按钮权限
			}else{
				buttonQXnamelist = buttonrightsService.listAllBrAndQxname(pd);	//此角色拥有的按钮权限标识列表
			}
			for(int i=0;i<buttonQXnamelist.size();i++){
				map.put(buttonQXnamelist.get(i).getString("QX_NAME"),"1");		//按钮权限
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}	
		return map;
	}
	
	/** 更新登录用户的IP
	 * @param USERNAME
	 * @throws Exception
	 */
	public void getRemortIP(String USERNAME) throws Exception {  
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("USERNAME", USERNAME);
		pd.put("IP", ip);
		userService.saveIP(pd);
	}  
	
	@RequestMapping(value="/goLoginA")
	public ModelAndView goLoginA(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/index/loginA");
		return mv;
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logoutA")
	public ModelAndView logoutA() {
		logOutFunc();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<PageData> list = excellentstaffService.getListMonthExcellentPictureUrl(pd,this.getRequest());
			mv.addObject("listPicture",JSONArray.fromObject(list));
		}catch(Exception e){
			
		}
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME));
		mv.setViewName("system/index/loginA");
		try {
			this.addExcellentStaff(mv, pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("pd",pd);
		return mv;
	}
	
	
	@RequestMapping(value="/loginA")
	@ResponseBody
	public Object loginA() throws Exception{
		logOutFunc();
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME));
		String url = "mainop/indexactual";
		String errInfo = "";
		String USERNAME = pd.getString("USERNAME");
		pd = userService.findByUSERNAME(pd);	//根据用户名读取用户信息
		if(pd != null){
			if(!this.checkUserLoginPermission(pd)){
				errInfo = "statuserror"; 				//已离职不能登录
				logBefore(logger, USERNAME+"已离职，不能登录");
				Map<Object,Object> map = new HashMap<Object,Object>();
				map.put("result", errInfo);
				map.put("url", url);
				return AppUtil.returnObject(new PageData(), map);
			}
			Session session = Jurisdiction.getSession();	
			Subject subject = SecurityUtils.getSubject(); 
			pd.put("LAST_LOGIN",DateUtil.getTime().toString());
			userService.updateLastLogin(pd);
			User user = new User();
			user.setUSER_ID(pd.getString("USER_ID"));
			user.setUSERNAME(pd.getString("USERNAME"));
			user.setPASSWORD(pd.getString("PASSWORD"));
			user.setNAME(pd.getString("NAME"));
			user.setRIGHTS(pd.getString("RIGHTS"));
			user.setDEPARTMENT_ID(pd.getString("DEPARTMENT_ID"));
			user.setDEPARTMENT_NAME(pd.getString("DEPARTMENT_NAME"));
			user.setROLE_ID(pd.getString("ROLE_ID"));
			user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
			user.setIP(pd.getString("IP"));
			user.setSTATUS(pd.getString("STATUS"));
			session.setAttribute(Const.SESSION_USER, user);
			user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
			Role role = user.getRole();											//获取用户角色
			String roleRights = role!=null ? role.getRIGHTS() : "";				//角色权限(菜单权限)
			session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
			session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
			session.setAttribute(Const.SESSION_USERID, user.getUSER_ID());				//放入用户ID到session
			session.setAttribute(Const.SESSION_USERFULLNAME, user.getNAME());				//放入用户ID到session
			session.setAttribute(Const.SESSION_DEPARTMENTID, user.getDEPARTMENT_ID());				//放入部门ID到session
			session.setAttribute(Const.SESSION_DEPARTMENTNAME, user.getDEPARTMENT_NAME());				//放入部门名到session
			session.setAttribute(Const.SESSION_USERROL, user);
			this.getRemortIP(USERNAME);	//更新登录IP
			//shiro加入身份验证
			String PASSWORD = pd.getString("PASSWORD");
			subject = SecurityUtils.getSubject(); 
			UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
			try { 
		        subject.login(token); 
		    } catch (AuthenticationException e) { 
		    	errInfo = "身份验证失败！";
		    }
		}else{ 
			errInfo = "usererror"; 				//用户名或密码有误
			logBefore(logger, USERNAME+"用户不存在");
		}
		if(Tools.isEmpty(errInfo)){
			errInfo = "success";
			//验证成功
			logBefore(logger, USERNAME+"登录系统");
		}
		Map map = new HashMap();
		map.put("url", url);
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@RequestMapping(value="/loginQC")
	@ResponseBody
	public Object loginQC() throws Exception{
		logOutFunc();
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME));
		//String url = "actual/actual_qcList.do";
		String url = "mainop/indexqc";
		String errInfo = "";
		String USERNAME = pd.getString("USERNAME");
		pd = userService.findByUSERNAME(pd);	//根据用户名读取用户信息
		if(pd != null){
			if(!this.checkUserLoginPermission(pd)){
				errInfo = "statuserror"; 				//已离职不能登录
				logBefore(logger, USERNAME+"已离职，不能登录");
				Map<Object,Object> map = new HashMap<Object,Object>();
				map.put("result", errInfo);
				map.put("url", url);
				return AppUtil.returnObject(new PageData(), map);
			}
			Session session = Jurisdiction.getSession();	
			Subject subject = SecurityUtils.getSubject(); 
			pd.put("LAST_LOGIN",DateUtil.getTime().toString());
			userService.updateLastLogin(pd);
			User user = new User();
			user.setUSER_ID(pd.getString("USER_ID"));
			user.setUSERNAME(pd.getString("USERNAME"));
			user.setPASSWORD(pd.getString("PASSWORD"));
			user.setNAME(pd.getString("NAME"));
			user.setRIGHTS(pd.getString("RIGHTS"));
			user.setDEPARTMENT_ID(pd.getString("DEPARTMENT_ID"));
			user.setDEPARTMENT_NAME(pd.getString("DEPARTMENT_NAME"));
			user.setROLE_ID(pd.getString("ROLE_ID"));
			user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
			user.setIP(pd.getString("IP"));
			user.setSTATUS(pd.getString("STATUS"));
			session.setAttribute(Const.SESSION_USER, user);
			user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
			Role role = user.getRole();											//获取用户角色
			String roleRights = role!=null ? role.getRIGHTS() : "";				//角色权限(菜单权限)
			session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
			session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
			session.setAttribute(Const.SESSION_USERID, user.getUSER_ID());				//放入用户ID到session
			session.setAttribute(Const.SESSION_USERFULLNAME, user.getNAME());				//放入用户ID到session
			session.setAttribute(Const.SESSION_DEPARTMENTID, user.getDEPARTMENT_ID());				//放入部门ID到session
			session.setAttribute(Const.SESSION_DEPARTMENTNAME, user.getDEPARTMENT_NAME());				//放入部门名到session
			session.setAttribute(Const.SESSION_USERROL, user);
			this.getRemortIP(USERNAME);	//更新登录IP
			//shiro加入身份验证
			String PASSWORD = pd.getString("PASSWORD");
			subject = SecurityUtils.getSubject(); 
			UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
			try { 
		        subject.login(token); 
		    } catch (AuthenticationException e) { 
		    	errInfo = "身份验证失败！";
		    }
		}else{
			errInfo = "usererror"; 				//用户名或密码有误
			logBefore(logger, USERNAME+"用户不存在");
		}
		if(Tools.isEmpty(errInfo)){
			errInfo = "success";
			//验证成功
			logBefore(logger, USERNAME+"登录系统");
		}
		Map map = new HashMap();		
		map.put("url", url);
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logoutQC")
	public ModelAndView logoutQC(){
		logOutFunc();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> list = excellentstaffService.getListMonthExcellentPictureUrl(pd,this.getRequest());
			mv.addObject("listPicture",JSONArray.fromObject(list));
		}catch(Exception e){
			
		}
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		pd.put("COMNAME", Tools.readTxtFile(Const.COMNAME));
		mv.setViewName("system/index/loginQC");
		try {
			this.addExcellentStaff(mv, pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("pd",pd);
		return mv;
	}
	
	private void logOutFunc(){
		try{
			Future future1 = Executors.newCachedThreadPool().submit(new Thread() {				 
	            @Override
	            public void run() {
	                System.out.println("logOut1==============");
		            }
		 
	        });
			while(true){
				if(future1.isDone()){
					break;
				}
			}
				
			if(null != Jurisdiction.getSession().getAttribute(Const.SESSION_USERNAME)){
				String USERNAME = Jurisdiction.getUsername();	//当前登录的用户名
				logBefore(logger, USERNAME+"退出系统");
				Session session = Jurisdiction.getSession();	//以下清除session缓存
				session.removeAttribute(Const.SESSION_USER);
				session.removeAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS);
				session.removeAttribute(USERNAME + Const.SESSION_allmenuList);
				session.removeAttribute(USERNAME + Const.SESSION_menuList);
				session.removeAttribute(USERNAME + Const.SESSION_QX);
				session.removeAttribute(Const.SESSION_userpds);
				session.removeAttribute(Const.SESSION_USERNAME);
				session.removeAttribute(Const.SESSION_USERROL);
				session.removeAttribute("changeMenu");
				//shiro销毁登录
				Subject subject = SecurityUtils.getSubject(); 
				subject.logout();
			}
		}catch(NullPointerException e){
			
		}catch(Exception e){
			
		}
	}
	
	private void addExcellentStaff(ModelAndView mv ,PageData pd) throws Exception {
		List<PageData> list = excellentstaffService.getListMonthExcellentPictureUrl(pd,this.getRequest());
		mv.addObject("listPicture",JSONArray.fromObject(list));
	}
	
	private boolean checkUserLoginPermission(PageData pd) throws Exception{
		if("1".equals(pd.getString("STATUS"))){
			//判断离职日期
			PageData paramUserresume = new PageData();
			paramUserresume.put("USER_ID", pd.getString("USER_ID"));
			paramUserresume.put("TYPE","20");
			paramUserresume.put("resumedateLeft", DateUtil.getDay());
			paramUserresume.put("OrderByClause", "RESUME_DATE DESC");
			paramUserresume.put("limit", 1);
			List<PageData> listUserresume = userresumeService.listAll(paramUserresume);
			if(listUserresume.size() != 0){
				return false;
			}
		}
		return true;
	}
}
