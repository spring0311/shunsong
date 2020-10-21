package com.shunsong.controller.baseinfo.tradeunit;

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
import com.shunsong.service.baseinfo.tradeunit.TradeunitManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;

/** 
 * 说明：基础数据模块
 * 创建人：zhudafeng
 * 创建时间：2017-03-04
 */
@Controller
@RequestMapping(value="/tradeunit")
public class TradeunitController extends BaseController {
	
	String menuUrl = "tradeunit/list.do"; //菜单地址(权限用)
	@Resource(name="tradeunitService")
	private TradeunitManager tradeunitService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Tradeunit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TRADEUNIT_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		tradeunitService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Tradeunit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		tradeunitService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Tradeunit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		tradeunitService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Tradeunit");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = tradeunitService.list(page);	//列出Tradeunit列表
		mv.setViewName("baseinfo/tradeunit/tradeunit_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/customerselect")
	public ModelAndView customerselect(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Tradeunit");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("customerflg", "1,3");
		page.setPd(pd);
		List<PageData>	varList = tradeunitService.list(page);	//列出Tradeunit列表
		mv.setViewName("baseinfo/tradeunit/customer_select");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/getTradeUnitInfo")
	@ResponseBody
	public Object getTradeUnitInfo() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取Tradeunit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		if("customer".equals(pd.getString("flag"))){
			pd.put("customerflg","Y");
		}else if("provider".equals(pd.getString("flag"))){
			pd.put("providerflg","Y");
		}
		List<PageData> list = tradeunitService.listAll(pd);
		if(list!=null && list.size() > 0){
			map.put("count", list.size());
			if(list.size() == 1 ){
				PageData pdTemp = (PageData)list.get(0);
				map.put("TRADEUNIT_ID", pdTemp.get("TRADEUNIT_ID"));
				map.put("TRADEUNIT_NAME", pdTemp.get("TRADEUNIT_NAME"));
			}
		}else{
			map.put("count", 0);
		}
			
		map.put("msg", "success");
		return AppUtil.returnObject(pd, map);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/providerselect")
	public ModelAndView providerselect(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Tradeunit");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("providerflg", "2,3");
		page.setPd(pd);
		List<PageData>	varList = tradeunitService.list(page);	//列出Tradeunit列表
		mv.setViewName("baseinfo/tradeunit/customer_select");
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
		mv.setViewName("baseinfo/tradeunit/tradeunit_edit");
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
		pd = tradeunitService.findById(pd);	//根据ID读取
		mv.setViewName("baseinfo/tradeunit/tradeunit_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Tradeunit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			tradeunitService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Tradeunit到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("");	//1
		titles.add("客商编号");	//2
		titles.add("客商名称");	//3
		titles.add("客商简称");	//4
		titles.add("税号");	//5
		titles.add("客商属性（1：客户:2：供应商:3：客户和供应商）");	//6
		titles.add("注册地址");	//7
		titles.add("公司ID");	//8
		titles.add("录入员工所在部门ID");	//9
		titles.add("公司对应的集团公司ID");	//10
		titles.add("录入员工编号");	//11
		titles.add("录入时间");	//12
		titles.add("修改员工编号");	//13
		titles.add("修改时间");	//14
		titles.add("备注");	//15
		dataMap.put("titles", titles);
		List<PageData> varOList = tradeunitService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TRADEUNIT_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("TRADEUNIT_CODE"));	//2
			vpd.put("var3", varOList.get(i).getString("TRADEUNIT_NAME"));	//3
			vpd.put("var4", varOList.get(i).getString("TRADEUNIT_ALT"));	//4
			vpd.put("var5", varOList.get(i).getString("TAX_NO"));	//5
			vpd.put("var6", varOList.get(i).getString("TRADEUNIT_TYPE"));	//6
			vpd.put("var7", varOList.get(i).getString("REGISTER_ADDRESS"));	//7
			vpd.put("var8", varOList.get(i).getString("COMPANY_ID"));	//8
			vpd.put("var9", varOList.get(i).getString("DEPARTMENT_ID"));	//9
			vpd.put("var10", varOList.get(i).getString("GROUP_ID"));	//10
			vpd.put("var11", varOList.get(i).getString("CREATE_USER"));	//11
			vpd.put("var12", varOList.get(i).getString("CREATE_DATE"));	//12
			vpd.put("var13", varOList.get(i).getString("MODIFY_USER"));	//13
			vpd.put("var14", varOList.get(i).getString("MODIFY_DATE"));	//14
			vpd.put("var15", varOList.get(i).getString("REMARK"));	//15
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
