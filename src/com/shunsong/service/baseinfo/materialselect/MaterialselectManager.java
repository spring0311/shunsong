package com.shunsong.service.baseinfo.materialselect;

import java.util.List;

import com.shunsong.entity.Page;
import com.shunsong.util.PageData;

/** 
 * 说明： 基础信息管理接口
 * 创建人：zhudafeng
 * 创建时间：2017-04-28
 * @version
 */
public interface MaterialselectManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	public PageData getMaterialSelectNum(PageData pd)throws Exception;
	
	public PageData getAllSelectNum(PageData pd)throws Exception;
	
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

