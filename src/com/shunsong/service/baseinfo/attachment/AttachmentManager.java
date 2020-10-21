package com.shunsong.service.baseinfo.attachment;

import java.util.List;

import com.shunsong.util.PageData;

public interface AttachmentManager {

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	public List<PageData> listAll(PageData pd) throws Exception;
	
	public PageData findById(PageData pd)throws Exception;
}
