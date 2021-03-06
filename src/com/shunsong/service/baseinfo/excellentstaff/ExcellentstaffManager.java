package com.shunsong.service.baseinfo.excellentstaff;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.shunsong.entity.Page;
import com.shunsong.util.PageData;

/** 
 * 说明： 每月优秀员工
 * @version
 */
public interface ExcellentstaffManager{

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

	public List<PageData> getListMonthExcellentPictureUrl(PageData pd,HttpServletRequest request) throws Exception;

	PageData findRecentDate() throws Exception;
	
	
	
}

