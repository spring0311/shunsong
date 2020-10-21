package com.shunsong.service.system.billno;

import java.util.List;

import com.shunsong.entity.Page;
import com.shunsong.util.PageData;

/** 
 * 说明： 系统模块接口
 * 创建人：zhudafeng
 * 创建时间：2017-04-30
 * @version
 */
public interface BillnoManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**生成最新编号
	 * @param pd
	 * @throws Exception
	 */
	public String getBillNo(String billNoType)throws Exception;
	
	public PageData findFunctionValue(PageData pd) throws Exception;
	
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

	String getBillNo(String billNoType, String getTypeName, String strPreFix)
			throws Exception;
	
}

