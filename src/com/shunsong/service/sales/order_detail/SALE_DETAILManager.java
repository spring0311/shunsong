package com.shunsong.service.sales.order_detail;

import java.util.List;

import com.shunsong.entity.Page;
import com.shunsong.util.PageData;

/** 
 * 说明： 销售模块接口
 * 创建人：zhudafeng
 * 创建时间：2018-07-15
 * @version
 */
public interface SALE_DETAILManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;	
	
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	public void editDetailFromHeadInfo(PageData pd) throws Exception;
	
	public PageData getOrderSumNum(PageData pd)throws Exception;
	
	public PageData delSaleDetail(PageData pd) throws Exception;
	
	public void commitByOrderID(PageData pd) throws Exception;
	
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

	public PageData findByDemandMainId(PageData param) throws Exception;
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	public List<PageData> listOrderDetailByMainID(PageData pd)throws Exception;
	
	public void editPurchaseStatus(PageData pd)throws Exception;

	public int count(PageData param) throws Exception;

	
}

