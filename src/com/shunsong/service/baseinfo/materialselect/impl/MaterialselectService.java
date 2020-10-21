package com.shunsong.service.baseinfo.materialselect.impl;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.materialselect.MaterialselectManager;

import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;
import com.shunsong.util.UuidUtil;

/** 
 * 说明： 基础信息管理
 * 创建人：zhudafeng
 * 创建时间：2017-04-28
 * @version
 */
@Service("materialselectService")
public class MaterialselectService implements MaterialselectManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("MaterialselectMapper.save", pd);
	}
	
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	
	
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MaterialselectMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MaterialselectMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MaterialselectMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MaterialselectMapper.findById", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData getMaterialSelectNum(PageData pd)throws Exception{
		
		return (PageData)dao.findForObject("MaterialselectMapper.listMaterialCount", pd);
	}
	
	@Override
	public PageData getAllSelectNum(PageData pd)throws Exception{
		
		return (PageData)dao.findForObject("MaterialselectMapper.listCount", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		for(int i = 0;i < ArrayDATA_IDS.length; i++){
			PageData pd = new PageData();
			pd.put("MATERIALSELECT_ID", ArrayDATA_IDS[i]);			
		
		}
		//dao.delete("MaterialselectMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

