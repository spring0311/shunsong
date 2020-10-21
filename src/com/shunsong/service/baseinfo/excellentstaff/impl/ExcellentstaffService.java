package com.shunsong.service.baseinfo.excellentstaff.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.attachment.AttachmentManager;
import com.shunsong.service.baseinfo.excellentstaff.ExcellentstaffManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.PageData;

/** 
 * 说明：每月优秀员工
 * 创建时间：2019-03-27
 * @version
 */
@Service("excellentstaffService")
public class ExcellentstaffService implements ExcellentstaffManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService; 
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("ExcellentstaffMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("ExcellentstaffMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("ExcellentstaffMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ExcellentstaffMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExcellentstaffMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ExcellentstaffMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ExcellentstaffMapper.deleteAll", ArrayDATA_IDS);
	}
	
	@Override
	public List<PageData> getListMonthExcellentPictureUrl(PageData pd,HttpServletRequest request)
			throws Exception {
		//获取上个月优秀员工ID列表
		/*Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		pd.put("month", month);
		String monthStr = null;
		if(month == 0){
			month = 12;
			year--;
		}
		if(month < 10){
			monthStr = "0"+month;
		}*/
		PageData maxDate = findRecentDate();
		if(maxDate != null){
			pd.put("YEAR", maxDate.getString("MAX_YEAR"));
			pd.put("MONTH", maxDate.getString("MAX_MONTH"));
			pd.put("month", Integer.parseInt(maxDate.getString("MAX_MONTH")));
		}
		
		List<PageData> listExcellentStaff = this.listAll(pd);
		//根据USER_ID获取URL
		PageData pdAttachment = new PageData();
		List<PageData> returnList = new ArrayList<>();
		for(PageData user:listExcellentStaff){
			PageData e = new PageData();
			e.put("USER_NAME", user.get("USER_NAME"));
			String userId =user.getString("USER_ID");
			pdAttachment.put("BILL_ID",userId );
			pdAttachment.put("FILE_TYPE", "image");
			List<PageData> listAttachment = attachmentService.listAll(pdAttachment);
			if(!CollectionUtils.isEmpty(listAttachment)){
				
				pdAttachment = listAttachment.get(0);
				StringBuffer url = new StringBuffer();
				
				url.append(request.getScheme());
				url.append("://");
				url.append(request.getServerName());
				url.append(":");
				url.append(request.getServerPort());
				url.append("/attachment/");
				if(null != pdAttachment){
					url.append(pdAttachment.getString("BILL_ID"));
					url.append("/");
					url.append(pdAttachment.getString("FILE_SYSTEM_NAME"));
				}
				e.put("url", url.toString());
			}
			returnList.add(e);
		}
		return returnList;
	}
	
	@Override
	public PageData findRecentDate() throws Exception {
		return (PageData)dao.findForObject("ExcellentstaffMapper.findRecentDate", null);
	}
}

