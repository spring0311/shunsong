package com.shunsong.controller.system.userresume;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shunsong.controller.base.BaseController;
import com.shunsong.entity.Page;
import com.shunsong.service.system.user.UserManager;
import com.shunsong.service.system.userresume.UserResumeManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明：员工履历
 * 创建人：zhudafeng
 * 创建时间：2019-03-29
 */
@Controller
@RequestMapping(value="/userresume")
public class UserResumeController extends BaseController {
	
	String menuUrl = "userresume/list.do"; //菜单地址(权限用)
	@Resource(name="userresumeService")
	private UserResumeManager userresumeService;
	
	@Resource(name="userService")
	private UserManager userService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增UserResume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		userresumeService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除UserResume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		userresumeService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改UserResume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		userresumeService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表UserResume");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = userresumeService.list(page);	//列出UserResume列表
		mv.setViewName("system/userresume/userresume_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listPerson")
	public ModelAndView listPerson(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表UserResume");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = userresumeService.list(page);	//列出UserResume列表
		mv.setViewName("system/userresume/userresume_list_person");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData pdUser = null;
		if(StringUtil.isNotNullParam(pd.getString("USER_ID"))){
			pdUser = userService.findById(pd);
		}
		if(null != pdUser){
			pd.put("USER_ID", pdUser.getString("USER_ID"));
			pd.put("USER_CODE", pdUser.getString("NUMBER"));
			pd.put("USER_NAME", pdUser.getString("NAME"));
		}
		mv.setViewName("system/userresume/userresume_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = userresumeService.findById(pd);	//根据ID读取
		mv.setViewName("system/userresume/userresume_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除UserResume");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			userresumeService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出UserResume到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("");	//1
		titles.add("用户ID");	//2
		titles.add("用户编号");	//3
		titles.add("姓名");	//4
		titles.add("类型：10，入职，20离职");	//5
		titles.add("日期");	//6
		titles.add("说明");	//7
		titles.add("");	//8
		titles.add("");	//9
		titles.add("");	//10
		titles.add("");	//11
		titles.add("");	//12
		titles.add("");	//13
		titles.add("");	//14
		titles.add("");	//15
		titles.add("");	//16
		titles.add("");	//17
		titles.add("");	//18
		titles.add("");	//19
		titles.add("");	//20
		dataMap.put("titles", titles);
		List<PageData> varOList = userresumeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ID"));	//1
			vpd.put("var2", varOList.get(i).getString("USER_ID"));	//2
			vpd.put("var3", varOList.get(i).getString("USER_CODE"));	//3
			vpd.put("var4", varOList.get(i).getString("USER_NAME"));	//4
			vpd.put("var5", varOList.get(i).getString("TYPE"));	//5
			vpd.put("var6", varOList.get(i).getString("RESUME_DATE"));	//6
			vpd.put("var7", varOList.get(i).getString("INFO"));	//7
			vpd.put("var8", varOList.get(i).getString("CREATE_DATE"));	//8
			vpd.put("var9", varOList.get(i).getString("CREATE_USER"));	//9
			vpd.put("var10", varOList.get(i).getString("UPDATE_DATE"));	//10
			vpd.put("var11", varOList.get(i).getString("UPDATE_USER"));	//11
			vpd.put("var12", varOList.get(i).getString("REMARK"));	//12
			vpd.put("var13", varOList.get(i).getString("EXT1"));	//13
			vpd.put("var14", varOList.get(i).getString("EXT2"));	//14
			vpd.put("var15", varOList.get(i).getString("EXT3"));	//15
			vpd.put("var16", varOList.get(i).getString("EXT4"));	//16
			vpd.put("var17", varOList.get(i).getString("EXT5"));	//17
			vpd.put("var18", varOList.get(i).getString("COMPANY_ID"));	//18
			vpd.put("var19", varOList.get(i).getString("GROUP_ID"));	//19
			vpd.put("var20", varOList.get(i).getString("DEPARTMENT_ID"));	//20
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
