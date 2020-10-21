package com.shunsong.controller.baseinfo.attachment;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.channels.FileChannel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shunsong.controller.base.BaseController;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.attachment.AttachmentManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.Const;
import com.shunsong.util.DateUtil;
import com.shunsong.util.FileDownload;
import com.shunsong.util.FileUpload;
import com.shunsong.util.FileUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.PathUtil;
import com.shunsong.util.ResponseUtil;
import com.shunsong.util.StringUtil;
import com.shunsong.util.UuidUtil;
import com.shunsong.util.ftp.SFTPUtils;

/** 
 * 说明：基础管理模块
 * 创建人：zhudafeng
 * 创建时间：2017-05-28
 */
@Controller
@RequestMapping(value="/attachment")
public class AttachmentController  extends BaseController{

	String menuUrl = "attachment/goUpload.do"; //菜单地址(权限用)
	
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goUpload")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Barcodelist");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String strBillID = pd.getString("BILL_ID");
		if(!StringUtil.isNotNullParam(strBillID)){
			throw new Exception("请先保存业务单据！");
		}
				
		mv.setViewName("baseinfo/attachment/file_upload");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/getAttachmentInfo")
	@ResponseBody
	public Object getAttachmentInfo()throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		PageData pdParam = new PageData();
		pd = this.getPageData();
				
		//pd.put("BILL_ID");
		pd.put("FILE_TYPE", "image");
		List<PageData>  picList = attachmentService.listAll(pd);
		
		pdParam.put("BILL_ID", pd.get("BILL_ID"));
		pdParam.put("FILE_NO_IMAGE", "Y");
		List<PageData>  fileList = attachmentService.listAll(pdParam);
		
		JSONArray jsonArrayPic = JSONArray.fromObject(picList);
		JSONArray jsonArrayFile = JSONArray.fromObject(fileList);
		
		map.put("listImage", jsonArrayPic);
		map.put("listFile", jsonArrayFile);
		
		return AppUtil.returnObject(pd, map);
	}	
	
	/**下载模版（订单）
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downLoadAttachment")
	public void downLoadAttachment(HttpServletResponse response)throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData  pdFile = attachmentService.findById(pd);
		if(pdFile != null){
			String directory = pdFile.getString("FILE_PATH");
			String saveFilePath =  PathUtil.getClasspath() + Const.TEMPLETFILEPATH;
			String saveFileName =  pdFile.getString("FILE_ORIGINAL_NAME");
			String downloadFile = pdFile.getString("FILE_SYSTEM_NAME");
			
			SFTPUtils.download(directory, downloadFile, saveFilePath, saveFileName);
			
			FileDownload.fileDownload(response, saveFilePath + saveFileName, pdFile.getString("FILE_ORIGINAL_NAME"));
		}		
		
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/fileUpload")
	public void fileUpload(
			@RequestParam(value="file",required=false) MultipartFile file,HttpServletResponse response) throws Exception{
		
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try{
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
				String strUpLoadFileName = UuidUtil.get32UUID();			
				
				String strFileName = file.getOriginalFilename();
				String strExtName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				String strFileType = file.getContentType().substring(0,file.getContentType().indexOf("/"));
				long longFileSize = file.getSize();			
				String fileName =  FileUpload.fileUp(file, filePath, strUpLoadFileName);
				
				String strDir="";
				String strTradeID = pd.getString("TRADEUNIT_ID");
				if(StringUtil.isNotNullParam(strTradeID)){
					strDir = strTradeID + '/' + pd.getString("BILL_ID");
				}else{
					strDir = pd.getString("BILL_ID");
				}
				String tomcatPath = System.getProperty("catalina.home");
				strDir = tomcatPath + "/webapps/attachment/" + strDir;
				SFTPUtils.upload(strDir, filePath + fileName, fileName);
				
				FileUtil.delFile(filePath + fileName);
				
				pd.put("ATTACHMENT_ID", UuidUtil.get32UUID());
				pd.put("FILE_ORIGINAL_NAME", strFileName);
				pd.put("FILE_SYSTEM_NAME", fileName);
				pd.put("FILE_EXT_NAME", strExtName);
				pd.put("FILE_SIZE", longFileSize);
				pd.put("FILE_TYPE", strFileType);
				pd.put("FILE_PATH", strDir);
				
				pd.put("CREATE_USER", Jurisdiction.getUsername());		
				pd.put("CREATE_DATE", DateUtil.getTime());
				pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
				pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
				pd.put("GROUP_ID", Jurisdiction.getGroupID());
				
				this.attachmentService.save(pd);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	
		ResponseUtil.write(response, "OK");
	}
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	
}
