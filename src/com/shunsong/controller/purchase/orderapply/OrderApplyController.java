package com.shunsong.controller.purchase.orderapply;

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
import com.shunsong.service.purchase.orderapply.OrderApplyManager;
import com.shunsong.service.system.department.DepartmentManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.ResponseUtil;
import com.shunsong.util.StringUtil;

/** 
 * 说明：purchases_order_apply 采购申请单主表
 * 创建人：zhudafeng
 * 创建时间：2019-10-14
 */
@Controller
@RequestMapping(value="/orderapply")
public class OrderApplyController extends BaseController {
	
	String menuUrl = "orderapply/list.do"; //菜单地址(权限用)
	@Resource(name="orderapplyService")
	private OrderApplyManager orderapplyService;

	@Resource(name="departmentService")
	private DepartmentManager departmentService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增OrderApply");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PORDER_APPLY_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		orderapplyService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除OrderApply");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderapplyService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改OrderApply");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		orderapplyService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表OrderApply");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = orderapplyService.list(page);	//列出OrderApply列表
		mv.setViewName("purchase/orderapply/orderapply_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list_jqgrid")
	public ModelAndView list_jqgrid(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("purchase/orderapply/orderapply_list_jqgrid");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
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
		String statuses = pd.getString("STATUSES");
		if(StringUtil.isNotNullParam(statuses)){
			String[] statusesx = statuses.split(",");
			List<String> listStatus = new ArrayList<String>();
			for(int i=0;i<statusesx.length;i++){
				listStatus.add(statusesx[i]);
			}
			pd.put("STATUSES", listStatus);
		}
		page.setPd(pd);
		List<PageData>	varList = this.orderapplyService.listDetail(page);
		
		int total = page.getTotalResult();
		JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(varList);
        result.put("rows", jsonArray);
        result.put("total", page.getTotalPage());
        result.put("records", total);
        
        ResponseUtil.write(response, result);
        
        return null;
		
	}
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("deptType","dept");
		List<PageData> deptList = departmentService.listAllDeptInfo(pd);//列出所有系统用户角色
		mv.setViewName("purchase/orderapply/orderapply_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("deptList", deptList);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd = orderapplyService.findById(pd);	//根据ID读取
		pd.put("deptType","dept");
		List<PageData> deptList = departmentService.listAllDeptInfo(pd);//列出所有系统用户角色
		mv.setViewName("purchase/orderapply/orderapply_add");
		mv.addObject("deptList", deptList);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveMain")
	@ResponseBody
	public Object saveMain() throws Exception{
		PageData pd = this.getPageData();
		PageData pdReturn = this.orderapplyService.saveMain(pd);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		map.put("main", pdReturn);
		map.put("applyId",pdReturn.getString("PORDER_APPLY_ID"));
		return map;
	}
	
	/**提交
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editCommit")
	@ResponseBody
	public Object editCommit() throws Exception{
		PageData pd = this.getPageData();
		PageData pdReturn = this.orderapplyService.editCommit(pd);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		map.put("main", pdReturn);
		map.put("applyId",pdReturn.getString("PORDER_APPLY_ID"));
		return map;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
