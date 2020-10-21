package com.shunsong.service.app.menu_list.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.util.PageData;
import com.shunsong.util.PdUtil;
import com.shunsong.service.app.menu_list.Menu_listManager;

/** 
 * 说明： APP管理
 * 创建人：zhudafeng
 * 创建时间：2020-02-06
 * @version
 */
@Service("menu_listService")
public class Menu_listService implements Menu_listManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		PdUtil.AddCommonData(pd);
		dao.save("Menu_listMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("Menu_listMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		PdUtil.ModifyCommonData(pd);
		dao.update("Menu_listMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Menu_listMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Menu_listMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Menu_listMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Menu_listMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

