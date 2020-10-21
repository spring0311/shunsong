package com.shunsong.service.baseinfo.attachment.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.service.baseinfo.attachment.AttachmentManager;
import com.shunsong.util.PageData;
import com.shunsong.util.ftp.GetFtpConfig;


/** 
 * 说明： 基础管理模块
 * 创建人：zhudafeng
 * 创建时间：2017-05-28
 * @version
 */
@Service("attachmentService")
public class AttachmentService implements AttachmentManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("AttachmentMapper.save", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AttachmentMapper.findById", pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd) throws Exception{
		GetFtpConfig configFtp = GetFtpConfig.getInstance();		
		pd.put("BROWER_URL", configFtp.getBrowerUrl());
		return (List<PageData>)dao.findForList("AttachmentMapper.listAll", pd);
	}
}
