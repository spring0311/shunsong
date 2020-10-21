package com.shunsong.service.system.user.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.entity.system.User;
import com.shunsong.service.baseinfo.attachment.AttachmentManager;
import com.shunsong.service.system.deptuser.DeptuserManager;
import com.shunsong.service.system.menu.MenuManager;
import com.shunsong.service.system.user.UserManager;
import com.shunsong.service.system.userresume.UserResumeManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;
import com.shunsong.util.UuidUtil;


/** 系统用户
 * @author fh313596790qq(青苔)
 * 修改时间：2015.11.2
 */
@Service("userService")
public class UserService implements UserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="deptuserService")
	private DeptuserManager deptuserService;
	
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;
	
	@Resource(name="userresumeService")
	private UserResumeManager userresumeService;
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		PageData pdUser = (PageData)dao.findForObject("UserMapper.getUserInfo", pd);
		if(null == pdUser){
			return null;
		}
		//获取用户的部门信息
		pdUser = this.getUserDept(pdUser);		
		
		return pdUser;
	}
	
	/**更新登录时间
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("UserMapper.updateLastLogin", pd);
	}
	
	/**通过用户ID获取用户信息和角色信息
	 * @param USER_ID
	 * @return
	 * @throws Exception
	 */
	@Override
	public User getUserAndRoleById(String USER_ID) throws Exception {
		
		User usr = (User) dao.findForObject("UserMapper.getUserAndRoleById", USER_ID);
		
		usr = this.getUserDept(usr);
		
		return usr;
	}
	
	/**通过USERNAEME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByUsername(PageData pd)throws Exception{
		
		PageData pdUser = (PageData)dao.findForObject("UserMapper.findByUsername", pd);
		
		return pdUser;
	}
	
	@Override
	public PageData findWithDeptByUsername(PageData pd)throws Exception{
		
		PageData pdUser = (PageData)dao.findForObject("UserMapper.findByUsername", pd);
		
		pdUser = this.getUserDept(pdUser);
		
		return pdUser;
	}
	
	/**列出某角色下的所有用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllUserByRoldId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.listAllUserByRoldId", pd);
		
	}
	
	/**列出某角色下的所有用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryUserInfoMatchCraft(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.queryUserMatchCraft", pd);
		
	}
	
	/**保存用户IP
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveIP(PageData pd)throws Exception{
		dao.update("UserMapper.saveIP", pd);
	}
	
	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listUsers(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.userlistPage", page);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listUserDepts(PageData pd)throws Exception{
		
		return (List<PageData>)deptuserService.getUserDept(pd);
		
	}
	
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByUE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUE", pd);
	}
	
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findByUN(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserMapper.findByUN", pd);
	}
	
	private PageData getUserDept(PageData pd) throws Exception{
		//获取用户的部门信息
		List<PageData> listDept = (List<PageData>)deptuserService.getUserDept(pd);
		if(listDept != null && listDept.size()>0){
			PageData pdTemp = listDept.get(0);
			pd.put("DEPARTMENT_NAME", pdTemp.getString("DEPARTMENT_NAME"));
			pd.put("DEPARTMENT_ID", pdTemp.getString("DEPARTMENT_ID"));
			pd.put("DEPT_FUNC", pdTemp.getString("DEPT_FUNC"));
		}else{
			pd.put("DEPARTMENT_NAME", "");
			pd.put("DEPARTMENT_ID", "");
			pd.put("DEPT_FUNC", "");
		}
		
		return pd;
	}
	
	private User getUserDept(User usr) throws Exception{
		
		PageData pdTemp = new PageData();
		pdTemp.put("USER_ID", usr.getUSER_ID());
		
		pdTemp = this.getUserDept(pdTemp);
		
		usr.setDEPARTMENT_ID(pdTemp.getString("DEPARTMENT_ID"));
		usr.setDEPARTMENT_NAME(pdTemp.getString("DEPARTMENT_NAME"));
		
		return usr;
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		PageData pdUser = (PageData)dao.findForObject("UserMapper.findById", pd);
		
		pdUser = this.getUserDept(pdUser);
		
		return pdUser;
	}
	
	/**得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveU(PageData pd)throws Exception{
		//保存人员对应的公司信息
		PageData pdDeptUser = new PageData();
		pdDeptUser.put("DEPTUSER_ID", this.get32UUID());
		pdDeptUser.put("USER_ID", pd.getString("USER_ID"));
		pdDeptUser.put("DEPARTMENT_ID", pd.getString("DEPARTMENT_ID"));
				
		pdDeptUser.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pdDeptUser.put("GROUP_ID", Jurisdiction.getGroupID());
		
		deptuserService.updateByUser(pdDeptUser);
		
		//保存人员信息
		dao.save("UserMapper.saveU", pd);
		//如果入职时间不为空，新增入职履历
		if(StringUtil.isNotNullParam(pd.getString("RESUME_DATE_IN"))){
			PageData pdUserResume = new PageData();
			pdUserResume.put("ID", this.get32UUID());
			pdUserResume.put("USER_ID", pdDeptUser.getString("USER_ID"));
			pdUserResume.put("USER_NAME", pd.getString("NAME"));
			pdUserResume.put("USER_CODE",pd.getString("NUMBER"));
			pdUserResume.put("RESUME_DATE",pd.getString("RESUME_DATE_IN"));
			pdUserResume.put("TYPE", "10");
			pdUserResume.put("DEPARTMENT_ID",pdDeptUser.getString("DEPARTMENT_ID") );
			pdUserResume.put("GROUP_ID",pdDeptUser.getString("GROUP_ID") );
			pdUserResume.put("COMPANY_ID", pdDeptUser.getString("COMPANY_ID"));
			pdUserResume.put("CREATE_DATE", pdDeptUser.getString("CREATE_DATE"));
			pdUserResume.put("CREATE_USER", pdDeptUser.getString("CREATE_USER"));
			userresumeService.save(pdUserResume);
		}
	}
	 
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editU(PageData pd)throws Exception{
		
		//保存人员对应的公司信息
		PageData pdDeptUser = new PageData();
		pdDeptUser.put("DEPTUSER_ID", this.get32UUID());
		pdDeptUser.put("USER_ID", pd.getString("USER_ID"));
		pdDeptUser.put("DEPARTMENT_ID", pd.getString("DEPARTMENT_ID"));
		
		
		pdDeptUser.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pdDeptUser.put("GROUP_ID", Jurisdiction.getGroupID());
		
		deptuserService.updateByUser(pdDeptUser);
		
		//保存人员信息
		dao.update("UserMapper.editU", pd);
	}
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteU(PageData pd)throws Exception{
		dao.delete("UserMapper.deleteU", pd);
	}
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserMapper.deleteAllU", USER_IDS);
	}
	
	/**用户列表(全部)
	 * @param USER_IDS
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.listAllUser", pd);
	}
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData getUserCount(String value)throws Exception{
		return (PageData)dao.findForObject("UserMapper.getUserCount", value);
	}
	
	@Override
	public PageData findByUSERNAME(PageData pd) throws Exception {
		return (PageData)dao.findForObject("UserMapper.findByUsername", pd);
	}
	
	@Override
	public PageData getUserStaffUrl(PageData pd) throws Exception {
		pd.put("FILE_TYLE", "image");
		List<PageData> listAll = attachmentService.listAll(pd);
		if(CollectionUtils.isEmpty(listAll)){
			return null;
		}
		return listAll.get(0);
	}
	
	@Override
	public void editStatus(PageData pd) throws Exception {
		dao.update("UserMapper.editStatus", pd);
	}
	
	@Override
	public List<PageData> listUserByProcessId(Page page) throws Exception {
		return (List<PageData>) dao.findForList("UserMapper.listUserByProcessId", page);
	}
	
	
}
