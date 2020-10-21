package com.shunsong.service.baseinfo.material.impl;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.material.MaterialManager;

import com.shunsong.util.ConstProduction;
import com.shunsong.util.PageData;
import com.shunsong.util.PdUtil;
import com.shunsong.util.StringUtil;

/** 
 * 说明： 基础数据模块
 * 创建人：zhudafeng
 * 创建时间：2017-03-04
 * @version
 */
@Service("materialService")
public class MaterialService implements MaterialManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		PdUtil.AddCommonData(pd);
		dao.save("MaterialMapper.save", pd);
		//如果是模具，往BOM表插入数据
		/*
		if(ConstProduction.MATERIAL_TYPE_30.equals(pd.getString("TYPE"))){
			PageData pdSaveMakeBom = new PageData();
			pdSaveMakeBom.put("MAKE_BOM_ID", StringUtil.get32UUID());
			pdSaveMakeBom.put("VISION_CODE", 1);
			pdSaveMakeBom.put("PRODUCTION_ID", pd.getString("MATERIAL_ID"));
			pdSaveMakeBom.put("PRODUCTION_CODE", pd.getString("FILE_NO"));
			pdSaveMakeBom.put("PRODUCTION_NAME", pd.getString("MATERIAL_NAME"));
			PageData paramFunctionValue = new PageData();
			String type = pd.getString("TYPE_NO");
			String functionType = null ;
			if("chongya".equals(type)){
				functionType =  "CRAFT_CHONGYA";
			}else{
				functionType =  "CRAFT_QIEDUAN";
			}
			paramFunctionValue.put("FUNCTION_TYPE",functionType);
			List<PageData> listFunctionValue = workService.findFunctionValue(paramFunctionValue);
			if(CollectionUtils.isEmpty(listFunctionValue)){
				throw new RuntimeException("没维护模具类型的functionValue");
			}
			String functionValue = listFunctionValue.get(0).getString("FUNCTION_VALUE");
			JSONObject jsonObj = JSONObject.fromObject(functionValue);
			pdSaveMakeBom.put("PROCESS_ID", jsonObj.getString("PROCESS_ID"));//functionValue取JSON
			pdSaveMakeBom.put("PROCESS_CODE", jsonObj.getString("PROCESS_CODE"));//functionValue取JSON
			pdSaveMakeBom.put("PROCESS_NAME", jsonObj.getString("PROCESS_NAME"));//functionValue取JSON
			pdSaveMakeBom.put("REMARK", pd.getString("REMARK"));
			makebomService.save(pdSaveMakeBom);
		}
		*/
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveClass(PageData pd)throws Exception{
		PdUtil.AddCommonData(pd);
		dao.save("MaterialMapper.saveClass", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("MaterialMapper.delete", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteClass(PageData pd)throws Exception{
		dao.delete("MaterialMapper.deleteClass", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("MaterialMapper.edit", pd);
	}
	
	@Override
	public void editClass(PageData pd)throws Exception{
		dao.update("MaterialMapper.editClass", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MaterialMapper.datalistPage", page);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listMaterialClass(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MaterialMapper.MaterialClassdatalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listMaterialClassAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MaterialMapper.lisMaterialClasstAll", pd);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MaterialMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MaterialMapper.findById", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findMaterialClassById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MaterialMapper.findMaterialClassById", pd);
	}
	
	
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MaterialMapper.deleteAll", ArrayDATA_IDS);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> listMonthSumItem(PageData pd) throws Exception {
		return (List<String>)dao.findForList("MaterialMapper.listMonthSumItem", pd);
	}
}

