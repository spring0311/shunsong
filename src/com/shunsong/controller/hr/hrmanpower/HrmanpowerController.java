package com.shunsong.controller.hr.hrmanpower;

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
import com.shunsong.service.hr.hrmanpower.HrmanpowerManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;

/** 
 * 说明：人事管理
 * 创建人：zhudafeng
 * 创建时间：2017-02-18
 */
@Controller
@RequestMapping(value="/hrmanpower")
public class HrmanpowerController extends BaseController {
	
	String menuUrl = "hrmanpower/list.do"; //菜单地址(权限用)
	@Resource(name="hrmanpowerService")
	private HrmanpowerManager hrmanpowerService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Hrmanpower");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("HRMANPOWER_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		hrmanpowerService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Hrmanpower");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		hrmanpowerService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Hrmanpower");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		hrmanpowerService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Hrmanpower");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = hrmanpowerService.list(page);	//列出Hrmanpower列表
		mv.setViewName("hr/hrmanpower/hrmanpower_list");
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
		mv.setViewName("hr/hrmanpower/hrmanpower_edit");
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
		pd = hrmanpowerService.findById(pd);	//根据ID读取
		mv.setViewName("hr/hrmanpower/hrmanpower_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Hrmanpower");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			hrmanpowerService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Hrmanpower到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("");	//1
		titles.add("工作日期");	//2
		titles.add("正常上班人数");	//3
		titles.add("正常上班时间");	//4
		titles.add("加班人数");	//5
		titles.add("加班时间");	//6
		titles.add("公司ID");	//7
		titles.add("录入员工所在部门ID");	//8
		titles.add("公司对应的集团公司ID");	//9
		titles.add("录入员工编号");	//10
		titles.add("录入时间");	//11
		titles.add("修改员工编号");	//12
		titles.add("修改时间");	//13
		titles.add("备注");	//14
		dataMap.put("titles", titles);
		List<PageData> varOList = hrmanpowerService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MANPOWER_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("WORK_DATE"));	//2
			vpd.put("var3", varOList.get(i).getString("WORKTIME_NUMBER"));	//3
			vpd.put("var4", varOList.get(i).getString("WORKTIME_TIME"));	//4
			vpd.put("var5", varOList.get(i).getString("OVERTIME_NUMBER"));	//5
			vpd.put("var6", varOList.get(i).getString("OVERTIME_TIME"));	//6
			vpd.put("var7", varOList.get(i).getString("COMPANY_ID"));	//7
			vpd.put("var8", varOList.get(i).getString("DEPARTMENT_ID"));	//8
			vpd.put("var9", varOList.get(i).getString("GROUP_ID"));	//9
			vpd.put("var10", varOList.get(i).getString("CREATE_USER"));	//10
			vpd.put("var11", varOList.get(i).getString("CREATE_DATE"));	//11
			vpd.put("var12", varOList.get(i).getString("MODIFY_USER"));	//12
			vpd.put("var13", varOList.get(i).getString("MODIFY_DATE"));	//13
			vpd.put("var14", varOList.get(i).getString("REMARK"));	//14
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
