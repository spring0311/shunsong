package com.shunsong.service.system.deptuser.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.system.deptuser.DeptuserManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;

/** 
 * 说明： 系统管理模块
 * 创建人：zhudafeng
 * 创建时间：2017-12-19
 * @version
 */
@Service("deptuserService")
public class DeptuserService implements DeptuserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("DeptuserMapper.save", pd);
	}
	
	@Override
	public void updateByUser(PageData pd)throws Exception{
		
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		
		/*pd.put("UPDATE_USER", Jurisdiction.getUsername());
		pd.put("UPDATE_DATE", DateUtil.getTime());*/
		
		dao.delete("DeptuserMapper.deleteByUserId", pd);
		
		this.save(pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> getUserDept(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DeptuserMapper.listUserDept", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("DeptuserMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("DeptuserMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DeptuserMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DeptuserMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DeptuserMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DeptuserMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

