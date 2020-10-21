package com.shunsong.controller.baseinfo.materialselect;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shunsong.controller.base.BaseController;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.material.MaterialManager;
import com.shunsong.service.baseinfo.materialselect.MaterialselectManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;

/** 
 * 说明：基础信息管理
 * 创建人：zhudafeng
 * 创建时间：2017-04-28
 */
@Controller
@RequestMapping(value="/materialselect")
public class MaterialselectController extends BaseController {
	
	String menuUrl = "materialselect/list.do"; //菜单地址(权限用)
	@Resource(name="materialselectService")
	private MaterialselectManager materialselectService;
	
	@Resource(name="materialService")
	private MaterialManager materialService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Materialselect");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MATERIALSELECT_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		materialselectService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	 /**插入购物车
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/insertList")
	@ResponseBody
	public Object insertList() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"插入入库单列表Winstockmain");
		
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		//List<PageData> pdList = new ArrayList<PageData>();
				
		//pdList.add(pd);
		map.put("list", pd);
		
		return AppUtil.returnObject(pd, map);
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Materialselect");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Materialselect");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		materialselectService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goShowList")
	public ModelAndView goShowList(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Materialselect");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		page.setPd(pd);
		List<PageData>	varList = materialselectService.list(page);	//列出Materialselect列表
		mv.setViewName("baseinfo/materialselect/materialselect_list");
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
		mv.setViewName("baseinfo/materialselect/materialselect_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**插入入库车
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goMaterialInput")
	public ModelAndView goMaterialInput()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String selectType = pd.getString("SELECT_TYPE");
		pd = materialService.findById(pd);	//根据ID读取
		pd.put("SELECT_TYPE", selectType);
		mv.setViewName("baseinfo/materialselect/materialselect_input");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**插入出库车
	 * @param
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/goMaterialOutput")
	@ResponseBody
	public Object goMaterialOutput()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", pd);
		
		return AppUtil.returnObject(pd, map);
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
		pd = materialselectService.findById(pd);	//根据ID读取
		mv.setViewName("baseinfo/materialselect/materialselect_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	@RequestMapping(value="/getMaterialClassList")
	@ResponseBody
	public Object getMaterialClassList()throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData>	materialClassList = this.materialService.listMaterialClassAll(pd);
		
		JSONArray jsonArray = JSONArray.fromObject(materialClassList);
		
		map.put("materialClassList", jsonArray);
		
		return AppUtil.returnObject(pd, map);
	}	
	
	/**json列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list_material_data_json")
	@ResponseBody
	public Object list_material_data_json() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"MouldBomDetail json列表");
		PageData pd = this.getPageData();
		Page page = new Page();
		page.setShowCount(pd.getInt("showCount"));
		page.setCurrentPage(pd.getInt("currentPage"));
		page.setPd(pd);
		String pageFunc = pd.getString("pageFunc");
		List<PageData>	listDetail = materialService.list(page);	//列出MouldBomDetail列表
		Map map = new HashMap();
		map.put("msg", "success");
		map.put("listMaterial", listDetail);		
		map.put("pageAjaxStr", page.getPageAjaxStr(pageFunc));
		map.put("currentPageNum", page.getCurrentPage());
		map.put("showPageCount", page.getShowCount());
		return map;
	}
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Materialselect");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			materialselectService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Materialselect到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("物料选择ID");	//1
		titles.add("选择类型（出入库类型）");	//2
		titles.add("选择的状态");	//3
		titles.add("主单位数量");	//4
		titles.add("主单位");	//5
		titles.add("辅单位数量");	//6
		titles.add("辅单位");	//7
		titles.add("物料质量等级");	//8
		titles.add("物料ID");	//9
		titles.add("物料条码");	//10
		titles.add("物料批次号");	//11
		titles.add("公司ID");	//12
		titles.add("录入员工所在部门ID");	//13
		titles.add("公司对应的集团公司ID");	//14
		titles.add("录入员工编号");	//15
		titles.add("录入时间");	//16
		dataMap.put("titles", titles);
		List<PageData> varOList = materialselectService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MATERIALSELECT_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("SELECT_TYPE"));	//2
			vpd.put("var3", varOList.get(i).getString("SELECT_STATUS"));	//3
			vpd.put("var4", varOList.get(i).getString("PRIMARY_QTY"));	//4
			vpd.put("var5", varOList.get(i).getString("PRIMARY_UNIT"));	//5
			vpd.put("var6", varOList.get(i).getString("SECOND_QTY"));	//6
			vpd.put("var7", varOList.get(i).getString("SECOND_UNIT"));	//7
			vpd.put("var8", varOList.get(i).getString("QUALITY_LEVEL"));	//8
			vpd.put("var9", varOList.get(i).getString("MATERIAL_ID"));	//9
			vpd.put("var10", varOList.get(i).getString("MATERIAL_BARCODE"));	//10
			vpd.put("var11", varOList.get(i).getString("MATERIAL_LOTCODE"));	//11
			vpd.put("var12", varOList.get(i).getString("COMPANY_ID"));	//12
			vpd.put("var13", varOList.get(i).getString("DEPARTMENT_ID"));	//13
			vpd.put("var14", varOList.get(i).getString("GROUP_ID"));	//14
			vpd.put("var15", varOList.get(i).getString("CREATE_USER"));	//15
			vpd.put("var16", varOList.get(i).getString("CREATE_DATE"));	//16
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
