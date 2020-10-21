package com.shunsong.controller.sales.order_detail;

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

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shunsong.controller.base.BaseController;
import com.shunsong.entity.Page;
import com.shunsong.service.sales.order_detail.SALE_DETAILManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明：销售模块
 * 创建人：zhudafeng
 * 创建时间：2018-07-15
 */
@Controller
@RequestMapping(value="/sales_detail")
public class SALE_DETAILController extends BaseController {
	
	String menuUrl = "sales_detail/list.do"; //菜单地址(权限用)
	@Resource(name="sale_detailService")
	private SALE_DETAILManager sale_detailService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ORDER_DETAIL");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORDER_DETAIL_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		sale_detailService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除ORDER_DETAIL");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		sale_detailService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ORDER_DETAIL");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		sale_detailService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ORDER_DETAIL");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = sale_detailService.list(page);	//列出ORDER_DETAIL列表
		mv.setViewName("sales/order_detail/sales_order_detail_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listSelect")
	public ModelAndView listSelect(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = sale_detailService.list(page);	//列出ORDER_DETAIL列表
		mv.setViewName("sales/order_detail/sales_order_detail_list_select");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	@RequestMapping(value="/listAllDetail")
	@ResponseBody
	public Object listAllDetail() throws Exception{
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtil.isNotNullParam(pd.getString("ORDER_DETAIL_IDS"))){
			String data = pd.getString("ORDER_DETAIL_IDS");
			ArrayList<String> listOrderDetailIds = (ArrayList<String>) JSONArray.toCollection(JSONArray.fromObject(data.split(",")));
			pd.put("ORDER_DETAIL_IDS",listOrderDetailIds);
		}
		pd.put("OrderByClause", " a.ORDER_TYPE_NO,a.LINE_ORDER,a.ORDER_SPEC ");
		
		List<PageData> varList = this.sale_detailService.listAll(pd);	
		if(varList != null && varList.size() > 0){
			map.put("msg", "success");
			map.put("list", varList);
		}else{
			map.put("msg", "no");
		}
			
		
		return AppUtil.returnObject(pd, map);
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
		mv.setViewName("sales/order_detail/sales_order_detail_edit");
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
		pd = sale_detailService.findById(pd);	//根据ID读取
		mv.setViewName("sales/order_detail/sales_order_detail_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ORDER_DETAIL");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			sale_detailService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出ORDER_DETAIL到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("");	//1
		titles.add("");	//2
		titles.add("物料编号");	//3
		titles.add("物料数量");	//4
		titles.add("物料重量");	//5
		titles.add("物料单价");	//6
		titles.add("计价方式:10,按数量计价;20,按重量计价");	//7
		titles.add("税率");	//8
		titles.add("税额");	//9
		titles.add("不含税总金额");	//10
		titles.add("含税总金额");	//11
		titles.add("包装方式");	//12
		titles.add("公司ID");	//13
		titles.add("录入员工所在部门ID");	//14
		titles.add("公司对应的集团公司ID");	//15
		titles.add("录入员工编号");	//16
		titles.add("录入时间");	//17
		titles.add("修改员工编号");	//18
		titles.add("修改时间");	//19
		titles.add("备注");	//20
		titles.add("订单状态；10，新增；30，已提交；40，已配工艺；50，已计划；60，已经派工；70，加工中；75，已暂停；80，已完成加工");	//21
		titles.add("扩展字段1");	//22
		titles.add("扩展字段2");	//23
		titles.add("扩展字段3");	//24
		titles.add("扩展字段4");	//25
		titles.add("扩展字段5");	//26
		dataMap.put("titles", titles);
		List<PageData> varOList = sale_detailService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ORDER_DETAIL_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("ORDER_ID"));	//2
			vpd.put("var3", varOList.get(i).getString("MATERIAL_ID"));	//3
			vpd.put("var4", varOList.get(i).get("MATERIAL_NUM").toString());	//4
			vpd.put("var5", varOList.get(i).getString("MATERIAL_WEIGHT"));	//5
			vpd.put("var6", varOList.get(i).getString("MATERIAL_PRICE"));	//6
			vpd.put("var7", varOList.get(i).getString("PRICE_TYPE"));	//7
			vpd.put("var8", varOList.get(i).getString("TAX_RATE"));	//8
			vpd.put("var9", varOList.get(i).getString("TAX_AMT"));	//9
			vpd.put("var10", varOList.get(i).getString("EXCLUDING_TAX_AMT"));	//10
			vpd.put("var11", varOList.get(i).getString("TOTAL_AMT"));	//11
			vpd.put("var12", varOList.get(i).getString("PACK_TYPE"));	//12
			vpd.put("var13", varOList.get(i).getString("COMPANY_ID"));	//13
			vpd.put("var14", varOList.get(i).getString("DEPARTMENT_ID"));	//14
			vpd.put("var15", varOList.get(i).getString("GROUP_ID"));	//15
			vpd.put("var16", varOList.get(i).getString("CREATE_USER"));	//16
			vpd.put("var17", varOList.get(i).getString("CREATE_DATE"));	//17
			vpd.put("var18", varOList.get(i).getString("UPDATE_USER"));	//18
			vpd.put("var19", varOList.get(i).getString("UPDATE_DATE"));	//19
			vpd.put("var20", varOList.get(i).getString("REMARK"));	//20
			vpd.put("var21", varOList.get(i).getString("DETAIL_STATUS"));	//21
			vpd.put("var22", varOList.get(i).getString("EXT1"));	//22
			vpd.put("var23", varOList.get(i).getString("EXT2"));	//23
			vpd.put("var24", varOList.get(i).getString("EXT3"));	//24
			vpd.put("var25", varOList.get(i).getString("EXT4"));	//25
			vpd.put("var26", varOList.get(i).getString("EXT5"));	//26
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
