package com.shunsong.controller.purchase.orderapplydetail;

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
import com.shunsong.service.purchase.orderapplydetail.OrderApplyDetailManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;
import com.shunsong.util.ResponseUtil;
import com.shunsong.util.StringUtil;

/** 
 * 说明：purchases_order_apply_detail 采购申请单明细表
 * 创建人：zhudafeng
 * 创建时间：2019-10-14
 */
@Controller
@RequestMapping(value="/orderapplydetail")
public class OrderApplyDetailController extends BaseController {
	
	String menuUrl = "orderapplydetail/list.do"; //菜单地址(权限用)
	@Resource(name="orderapplydetailService")
	private OrderApplyDetailManager orderapplydetailService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增OrderApplyDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PORDER_APPLY_DETAIL_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		orderapplydetailService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveDetail")
	@ResponseBody
	public Object saveDetail() throws Exception{
		PageData pd = this.getPageData();
		String applyDetailId = pd.getString("PORDER_APPLY_DETAIL_ID");
		PageData pdReturn = null;
		if(StringUtil.isNotNullParam(applyDetailId)){
			pdReturn = this.orderapplydetailService.editDetail(pd);
		}else{
			
			pdReturn = this.orderapplydetailService.saveDetail(pd);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		map.put("main", pdReturn);
		map.put("applyId",pdReturn.getString("PORDER_APPLY_ID"));
		return map;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveDetails")
	@ResponseBody
	public Object saveDetails() throws Exception{
		PageData pd = this.getPageData();
		PageData pdReturn = this.orderapplydetailService.saveDetails(pd);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		map.put("main", pdReturn);
		map.put("applyId",pdReturn.getString("PORDER_APPLY_ID"));
		return map;
	}
	
	/**删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/delDetail")
	@ResponseBody
	public Object delDetail() throws Exception{
		PageData pd = this.getPageData();
		PageData pdReturn = orderapplydetailService.delDetail(pd);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		map.put("main", pdReturn);
		map.put("applyId",pdReturn.getString("PORDER_APPLY_ID"));
		return map;
	}
	
	
	/**删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/findById")
	@ResponseBody
	public Object findById() throws Exception{
		PageData pd = this.getPageData();
		PageData pdReturn = orderapplydetailService.findById(pd);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		map.put("detail", pdReturn);
		map.put("applyId",pdReturn.getString("PORDER_APPLY_ID"));
		return map;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除OrderApplyDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderapplydetailService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改OrderApplyDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		orderapplydetailService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editCommitDetial")
	@ResponseBody
	public Object editCommitDetial() throws Exception{
		PageData pd = this.getPageData();
		orderapplydetailService.editCommitDetial(pd);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
//		map.put("main", pdReturn);
//		map.put("applyId",pdReturn.getString("PORDER_APPLY_ID"));
		return map;
	}
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表OrderApplyDetail");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = orderapplydetailService.list(page);	//列出OrderApplyDetail列表
		mv.setViewName("purchase/orderapplydetail/orderapplydetail_list");
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
		mv.setViewName("purchase/orderapplydetail/orderapplydetail_edit");
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
		pd = orderapplydetailService.findById(pd);	//根据ID读取
		mv.setViewName("purchase/orderapplydetail/orderapplydetail_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除OrderApplyDetail");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			orderapplydetailService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出OrderApplyDetail到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("");	//1
		titles.add("");	//2
		titles.add("采购订单序号");	//3
		titles.add("供应商ID");	//4
		titles.add("供应商名称");	//5
		titles.add("物料编号");	//6
		titles.add("物料名称");	//7
		titles.add("物料规格");	//8
		titles.add("物料数量");	//9
		titles.add("物料重量");	//10
		titles.add("物料单价");	//11
		titles.add("单位");	//12
		titles.add("总金额");	//13
		titles.add("包装方式");	//14
		titles.add("交货日期");	//15
		titles.add("来源单据ID");	//16
		titles.add("来源单据号");	//17
		titles.add("公司ID");	//18
		titles.add("录入员工所在部门ID");	//19
		titles.add("公司对应的集团公司ID");	//20
		titles.add("录入员工编号");	//21
		titles.add("录入时间");	//22
		titles.add("修改员工编号");	//23
		titles.add("修改时间");	//24
		titles.add("备注");	//25
		titles.add("订单状态；10，新增；20，已提交；80，已完成");	//26
		titles.add("扩展字段1");	//27
		titles.add("扩展字段2");	//28
		titles.add("扩展字段3");	//29
		titles.add("扩展字段4");	//30
		titles.add("扩展字段5");	//31
		dataMap.put("titles", titles);
		List<PageData> varOList = orderapplydetailService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PORDER_APPLY_DETAIL_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("PORDER_APPLY_ID"));	//2
			vpd.put("var3", varOList.get(i).getString("PORDER_APPLY_DETAIL_NO"));	//3
			vpd.put("var4", varOList.get(i).getString("PROVIDER_ID"));	//4
			vpd.put("var5", varOList.get(i).getString("PROVIDER_NAME"));	//5
			vpd.put("var6", varOList.get(i).getString("MATERIAL_ID"));	//6
			vpd.put("var7", varOList.get(i).getString("MATERIAL_NAME"));	//7
			vpd.put("var8", varOList.get(i).getString("MATERIAL_SPEC"));	//8
			vpd.put("var9", varOList.get(i).get("MATERIAL_NUM").toString());	//9
			vpd.put("var10", varOList.get(i).getString("MATERIAL_WEIGHT"));	//10
			vpd.put("var11", varOList.get(i).getString("MATERIAL_PRICE"));	//11
			vpd.put("var12", varOList.get(i).getString("MATERIAL_UNIT"));	//12
			vpd.put("var13", varOList.get(i).getString("TOTAL_AMT"));	//13
			vpd.put("var14", varOList.get(i).getString("PACK_TYPE"));	//14
			vpd.put("var15", varOList.get(i).getString("DELIVERY_DATE"));	//15
			vpd.put("var16", varOList.get(i).getString("FROM_ID"));	//16
			vpd.put("var17", varOList.get(i).getString("FROM_NO"));	//17
			vpd.put("var18", varOList.get(i).getString("COMPANY_ID"));	//18
			vpd.put("var19", varOList.get(i).getString("DEPARTMENT_ID"));	//19
			vpd.put("var20", varOList.get(i).getString("GROUP_ID"));	//20
			vpd.put("var21", varOList.get(i).getString("CREATE_USER"));	//21
			vpd.put("var22", varOList.get(i).getString("CREATE_DATE"));	//22
			vpd.put("var23", varOList.get(i).getString("UPDATE_USER"));	//23
			vpd.put("var24", varOList.get(i).getString("UPDATE_DATE"));	//24
			vpd.put("var25", varOList.get(i).getString("REMARK"));	//25
			vpd.put("var26", varOList.get(i).getString("DETAIL_STATUS"));	//26
			vpd.put("var27", varOList.get(i).getString("EXT1"));	//27
			vpd.put("var28", varOList.get(i).getString("EXT2"));	//28
			vpd.put("var29", varOList.get(i).getString("EXT3"));	//29
			vpd.put("var30", varOList.get(i).getString("EXT4"));	//30
			vpd.put("var31", varOList.get(i).getString("EXT5"));	//31
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
	
	/**列表
	 * @param page
	 * @throws Exception_zhongrui
	 */
	@RequestMapping(value="/list_data_json")
	public String list_data_json(Page page,HttpServletResponse response) throws Exception{
		PageData pd = this.getPageData();
		page.setShowCount(pd.getInt("rows"));
		page.setCurrentPage(pd.getInt("page"));
		page.setPd(pd);
		List<PageData>	varList = this.orderapplydetailService.list(page);
		
		int total = page.getTotalResult();
		JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(varList);
        result.put("rows", jsonArray);
        result.put("total", page.getTotalPage());
        result.put("records", total);
        
        ResponseUtil.write(response, result);
        return null;
	}
	
}
