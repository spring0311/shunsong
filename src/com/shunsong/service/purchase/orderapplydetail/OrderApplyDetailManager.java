package com.shunsong.service.purchase.orderapplydetail;

import java.util.List;

import com.shunsong.entity.Page;
import com.shunsong.util.PageData;

/** 
 * 说明： purchases_order_apply_detail 采购申请单明细表接口
 * 创建人：zhudafeng
 * 创建时间：2019-10-14
 * @version
 */
public interface OrderApplyDetailManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;

	public PageData saveDetail(PageData pd) throws Exception;
	
	public PageData saveDetails(PageData pd) throws Exception;
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

	public PageData delDetail(PageData pd) throws Exception;

	PageData editDetail(PageData pd) throws Exception;

	public void editStatusByPorderApplyId(PageData pdM) throws Exception;

	public void editCommitDetial(PageData pd) throws Exception;

	
}

