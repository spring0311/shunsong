package com.shunsong.service.system.userresume.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.system.user.UserManager;
import com.shunsong.service.system.userresume.UserResumeManager;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明： 员工履历
 * 创建人：zhudafeng
 * 创建时间：2019-03-29
 * @version
 */
@Service("userresumeService")
public class UserResumeService implements UserResumeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="userService")
	private UserManager userService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("UserResumeMapper.save", pd);
		if(StringUtil.isNotNullParam(pd.getString("TYPE"))&& "20".equals(pd.getString("TYPE"))){
			PageData pdUser = new PageData();
			pdUser.put("STATUS", 1);
			pdUser.put("USER_ID", pd.getString("USER_ID"));
			pdUser.put("USER_CODE", pd.getString("NUMBER"));
			pdUser.put("USER_NAME", pd.getString("NAME"));
			userService.editStatus(pdUser);
		}
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("UserResumeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("UserResumeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("UserResumeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("UserResumeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserResumeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("UserResumeMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

