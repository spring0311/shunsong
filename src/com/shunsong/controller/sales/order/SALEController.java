package com.shunsong.controller.sales.order;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
import com.shunsong.service.baseinfo.tradeunit.TradeunitManager;
import com.shunsong.service.sales.order.SALEManager;
import com.shunsong.service.sales.order_detail.SALE_DETAILManager;
import com.shunsong.service.system.dictionaries.DictionariesManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.ConstProduction;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;
import com.shunsong.util.ResponseUtil;
import com.shunsong.util.StringUtil;
import com.shunsong.util.excel.OrderExportExcelView;

/** 
 * 说明：销售模块
 * 创建人：zhudafeng
 * 创建时间：2018-07-15
 */
@Controller
@RequestMapping(value="/sales")
public class SALEController extends BaseController {
	
	String menuUrl = "sales/listOrder.do"; //菜单地址(权限用)
	@Resource(name="saleService")
	private SALEManager saleService;
	
	@Resource(name="sale_detailService")
	private SALE_DETAILManager sale_detailService;
	
	@Resource(name="dictionariesService")
	private DictionariesManager dictionariesService;
	
	@Resource(name="tradeunitService")
	private TradeunitManager tradeunitService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ORDER");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORDER_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		saleService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**保存销售订单
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveOrder")
	@ResponseBody
	public Object saveOrder() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"保存ORDER");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		
		PageData pdRtn = saleService.saveOrder(pd);
		
		map.put("msg", "success");
		map.put("ORDER_ID", pdRtn.get("ORDER_ID"));
		map.put("ORDER_NO", pdRtn.get("ORDER_NO"));
		
				
		return AppUtil.returnObject(pd, map);
	}
	
	@RequestMapping(value="/commit")
	@ResponseBody
	public Object commit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"提交Order");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		PageData pdRtn = new PageData();
		
		
		String strOrderID = pd.getString("ORDER_ID");		
				
		pd.put("ORDER_ID", strOrderID);	//主键		
		pd.put("UPDATE_USER", Jurisdiction.getUsername());
		pd.put("UPDATE_DATE", DateUtil.getTime());
		pd.put("COMMIT_DATE", DateUtil.getDay());
				
		this.saleService.commit(pd);
		
		pdRtn.put("msg","success");
		map.put("list", pdRtn);		
		
		return AppUtil.returnObject(pd, map);
		
	}
	/**列表
	 * @param page
	 * @throws Exception_zhongrui
	 */
	@RequestMapping(value="/list_sale_order_data")
	public String list_sale_order_data(Page page,HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Demand");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Object ob = pd.get("keywords");
		if(ob!=null){
			String keywords = StringUtil.getUTF8StringByEncoding(pd.getString("keywords"));				//关键词检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
		}
		
		String strDataQx = Jurisdiction.getUserDataQX();
		strDataQx = strDataQx.substring(0, 2);
		if("OW".equals(strDataQx)) {
			pd.put("SALES_MAN", Jurisdiction.getUserFullName());
		}
		
		int intPage = StringUtil.stringToInteger(pd.getString("page"));
		int intRows = StringUtil.stringToInteger(pd.getString("rows"));
		pd.put("pageIndex", (intPage - 1) * intRows);
		pd.put("pageSize", intRows);
		StringBuffer sbOrderBy = new StringBuffer(); 
		
		sbOrderBy.append(" c.CREATE_DATE desc,d.TRADEUNIT_NAME,a.ORDER_TYPE_NO,a.LINE_ORDER,a.ORDER_SPEC ");
		pd.put("OrderByClause", sbOrderBy.toString());
		
		List<PageData>	varList = this.saleService.listSaleOrderData(pd);	//列出demand列表		
		PageData pdAllCount = this.saleService.listSaleOrderDataAllCount(pd);
		
		int total = pdAllCount.getInt("allCount");
		JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(varList);
        int pages = (total + intRows - 1) / intRows;
        result.put("rows", jsonArray);
        result.put("total", pages);
        result.put("records", total);
        
        ResponseUtil.write(response, result);
        
        return null;
		
	}
	
	/**列表
	 * @param page
	 * @throws Exception_zhongrui
	 */
	@RequestMapping(value="/list_sale_order_statistics_data")
	public String list_sale_order_statistics_data(Page page,HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Demand");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Object ob = pd.get("keywords");
		if(ob!=null){
			String keywords = StringUtil.getUTF8StringByEncoding(pd.getString("keywords"));				//关键词检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
		}
		
		int intPage = StringUtil.stringToInteger(pd.getString("page"));
		int intRows = StringUtil.stringToInteger(pd.getString("rows"));
		pd.put("pageIndex", (intPage - 1) * intRows);
		pd.put("pageSize", intRows);
		StringBuffer sbOrderBy = new StringBuffer(); 
		
		sbOrderBy.append(" a.SALES_ORDER_DATE desc,d.TRADEUNIT_NAME,a.TYPE_NO,a.MATERIAL_SPEC ");
		pd.put("OrderByClause", sbOrderBy.toString());
		
		List<PageData>	varList = this.saleService.listSaleOrderStatistics(pd);	//列出demand列表		
		PageData pdAllCount = this.saleService.listSaleOrderStatisticsAllCount(pd);
		
		int total = pdAllCount.getInt("allCount");
		JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(varList);
        int pages = (total + intRows - 1) / intRows;
        result.put("rows", jsonArray);
        result.put("total", pages);
        result.put("records", total);
        
        ResponseUtil.write(response, result);
        
        return null;
		
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除ORDER");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		saleService.delete(pd);
		out.write("success");
		out.close();
	}
	
	@RequestMapping(value="/deleteDetail")
	@ResponseBody
	public Object deleteDetail() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取Tradeunit");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		
		this.saleService.deleteDetail(pd);	
		map.put("msg", "success");
		
		return AppUtil.returnObject(pd, map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ORDER");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		saleService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listOrder")
	public ModelAndView listOrder(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ORDER");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("lastLoginStart", DateUtil.getBeforeDayDate(DateUtil.getDay(), 30));
		mv.setViewName("sales/order/sales_order_list");
		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/showHisOrder")
	public ModelAndView showHisOrder(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ORDER");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		mv.setViewName("sales/order/sales_order_list_history");
		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listOrderExecute")
	public ModelAndView listOrderExecute(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ORDER");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("COMPLETE_STATUS", "Y");
		page.setPd(pd);
		List<PageData>	varList = saleService.listOrderExecute(page);	//列出ORDER列表
		mv.setViewName("sales/order/sales_order_show_execute");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddOrder")
	public ModelAndView goAddOrder()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//
		PageData pdParam = new PageData();
		pdParam.put("BIANMA", "PRICETYPE");
		List<PageData>	priceTypeList = dictionariesService.findSubDictByBianma(pdParam);
		
		pd.put("ORDER_DATE", DateUtil.getDay());
			
		mv.setViewName("sales/order/sales_order_edit_jieda");
		
		mv.addObject("priceTypeList", priceTypeList);
		
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditOrder")
	public ModelAndView goEditOrder()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData pdParam = new PageData();
		pdParam.put("BIANMA", "PRICETYPE");
		List<PageData>	priceTypeList = dictionariesService.findSubDictByBianma(pdParam);
				
		List<PageData> varList = this.saleService.listSaleOrderData(pd);
		if(varList != null && varList.size() > 0){
			pd = (PageData)varList.get(0);
		}
				
		mv.setViewName("sales/order/sales_order_edit_jieda");
		mv.addObject("msg", "saveOrder");
		mv.addObject("priceTypeList", priceTypeList);
		mv.addObject("pd", pd);
		return mv;
	}	
	

	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goOrderselect")
	public ModelAndView goOrderselect()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("OrderByClause", "c.order_no desc ,B.MATERIAL_CODE, B.MATERIAL_NAME");
		List<PageData> varList = this.saleService.listSaleOrderData(pd);
				
		mv.setViewName("sales/order/sales_order_list_select");
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		return mv;
	}	
	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ORDER");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			saleService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	@RequestMapping(value="/deleteSaleDetail")
	@ResponseBody
	public Object deleteSaleDetail() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除生产订单");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		String demandIdStr = pd.getString("ORDER_DETAIL_IDS");
		pd.remove("ORDER_DETAIL_IDS");
		String[] demandIds = demandIdStr.split(",");
		for(int i=0;i<demandIds.length;i++){
			pd.put("ORDER_DETAIL_ID", demandIds[i]);
			if(StringUtil.isNotNullParam(pd.getString("ORDER_DETAIL_ID"))){
				this.saleService.delSale(pd);
			}
		}
		map.put("msg", "success");
		return AppUtil.returnObject(pd, map);
	}
	
	
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excelOrder")
	public ModelAndView excelOrder() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出ORDER到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		
		pd.put("OrderByClause", " c.CREATE_DATE desc,d.TRADEUNIT_NAME,a.ORDER_TYPE_NO,a.LINE_ORDER,a.ORDER_SPEC ");
		
		List<PageData> varList = saleService.listSaleOrderData(pd);
		dataMap.put("TemplateFile", "");
		
		if(varList != null && varList.size() > 0){
			//获取客户的参数配置
			PageData pdParam = (PageData)varList.get(0);
			pdParam.put("TRADEUNIT_ID", pdParam.get("CUSTOMER_ID"));
			PageData pdTrade = this.tradeunitService.findById(pdParam);
			if(pdTrade!=null){
				String strParamSet = pdTrade.getString("PARAM_SET");	
				if(StringUtil.isNotNullParam(strParamSet)){
					JSONObject result = JSONObject.fromObject(strParamSet);
					Object ob = result.get("Template");
					if(ob != null){
						dataMap.put("TemplateFile", ob.toString());
					}					
				}			
			}
		}
	    
		dataMap.put("varList", varList);
		OrderExportExcelView erv = new OrderExportExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	/**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Demand到excel");
		
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("合同编号");	//1
		titles.add("客户名称");
		titles.add("销售订单号");
		titles.add("销售订单日期");
		titles.add("模具编号");
		titles.add("模具名称");
		titles.add("加工类型");
		titles.add("交货期");//7
		titles.add("备注");//8
		
		dataMap.put("titles", titles);//设置行标题
	/*	dataMap.put("IntCol", "8,9,10");//设置整数行号
		dataMap.put("DoubleCol", "17,19");//设置含2位小数行号
*/		
		pd.put("OrderByClause", " c.order_no,b.material_code ");
		
		String strTradeUnit = StringUtil.getUTF8StringByEncoding(pd.getString("TRADEUNIT_NAME_LIKE"));
		
		pd.put("TRADEUNIT_NAME_LIKE", strTradeUnit);
		
		List<PageData>	varList = this.saleService.listDataToExcel(pd);
		for(PageData p:varList){
			String makeType = p.getString("var7");
			if("10".equals(makeType)){
				p.put("var7", "旧模异常维修");
			}
			if("20".equals(makeType)){
				p.put("var7", "新模装配");
			}
			if("30".equals(makeType)){
				p.put("var7", "旧模保养");
			}
		}
				
		dataMap.put("varList", varList);//设置文件中的数据列表，别名以var开始
		dataMap.put("filename", "客户订单列表");//设置文件中文名称
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
