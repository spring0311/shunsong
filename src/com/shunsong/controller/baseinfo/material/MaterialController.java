package com.shunsong.controller.baseinfo.material;

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
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shunsong.controller.base.BaseController;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.material.MaterialManager;
import com.shunsong.util.AppUtil;
import com.shunsong.util.ConstProduction;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.ObjectExcelView;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明：基础数据模块
 * 创建人：zhudafeng
 * 创建时间：2017-03-04
 */
@Controller
@RequestMapping(value="/material")
public class MaterialController extends BaseController {
	
	String menuUrl = "material/list.do"; //菜单地址(权限用)
	String menuUrlwugang = "material/wuganglist.do"; //菜单地址(权限用)
	@Resource(name="materialService")
	private MaterialManager materialService;

	
	/**保存
	 * @param
	 * @throws Exception    /material/save
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MATERIAL_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		
		/*String strType = pd.getString("TYPE");
		if(ConstProduction.MATERIAL_TYPE_20.equals(strType)){			
			pd.put("MATERIAL_SPEC", pd.getString("THICKNESS_NUM")+"*"+pd.getString("WIDTH_NUM")+"*"+pd.getString("LENGTH_NUM"));
		}*/
				
		materialService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**保存
	 * @param
	 * @throws Exception    /material/save
	 */
	@RequestMapping(value="/saveClass")
	public ModelAndView saveClass() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MATERIAL_CLASS_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		
				
		materialService.saveClass(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception    /material/save
	 */
	@RequestMapping(value="/saveWugang")
	public ModelAndView saveWugang() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrlwugang, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//拼接规格
		pd.put("MATERIAL_SPEC", pd.getString("THICKNESS_NUM")+"*"+pd.getString("WIDTH_NUM")+"*"+pd.getString("LENGTH_NUM"));
		pd.put("MATERIAL_SPEC_REAL", pd.getString("THICKNESS_NUM_REAL")+"*"+pd.getString("WIDTH_NUM_REAL")+"*"+pd.getString("LENGTH_NUM_REAL"));
		
		//计算理论重量和实际重量
		double thicknum = StringUtil.stringToDoubleAcc2(pd.getString("THICKNESS_NUM"));
		double widthnum = StringUtil.stringToDoubleAcc2(pd.getString("WIDTH_NUM"));
		double lengthnum = StringUtil.stringToDoubleAcc2(pd.getString("LENGTH_NUM"));
		double denitynum = StringUtil.stringToDoubleAcc2(pd.getString("DENSITY_NUM"));
		
		pd.put("WEIGHT_LOGIC",StringUtil.doubleToDoubleAcc2(thicknum*widthnum*lengthnum*denitynum/1000000));
		
		thicknum = StringUtil.stringToDoubleAcc2(pd.getString("THICKNESS_NUM_REAL"));
		widthnum = StringUtil.stringToDoubleAcc2(pd.getString("WIDTH_NUM_REAL"));
		lengthnum = StringUtil.stringToDoubleAcc2(pd.getString("LENGTH_NUM_REAL"));
				
		pd.put("WEIGHT_REAL",StringUtil.doubleToDoubleAcc2(thicknum*widthnum*lengthnum*denitynum/1000000));
		
		pd.put("STATUS", "1");//在用状态
		
		pd.put("MATERIAL_ID", this.get32UUID());	//主键
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		materialService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		materialService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteClass")
	public void deleteClass(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除MaterialClass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		materialService.deleteClass(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		
		/*String strType = pd.getString("TYPE");
		if(ConstProduction.MATERIAL_TYPE_20.equals(strType)){			
			pd.put("MATERIAL_SPEC", pd.getString("THICKNESS_NUM")+"*"+pd.getString("WIDTH_NUM")+"*"+pd.getString("LENGTH_NUM"));
			pd.put("MATERIAL_SPEC_REAL", pd.getString("THICKNESS_NUM_REAL")+"*"+pd.getString("WIDTH_NUM_REAL")+"*"+pd.getString("LENGTH_NUM_REAL"));
		}*/
		
		materialService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editClass")
	public ModelAndView editClass() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
				
		materialService.editClass(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editWugang")
	public ModelAndView editWugang() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrlwugang, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//拼接规格
		pd.put("MATERIAL_SPEC", pd.getString("THICKNESS_NUM")+"*"+pd.getString("WIDTH_NUM")+"*"+pd.getString("LENGTH_NUM"));
		pd.put("MATERIAL_SPEC_REAL", pd.getString("THICKNESS_NUM_REAL")+"*"+pd.getString("WIDTH_NUM_REAL")+"*"+pd.getString("LENGTH_NUM_REAL"));
				
		//计算理论重量和实际重量
		double thicknum = StringUtil.stringToDoubleAcc2(pd.getString("THICKNESS_NUM"));
		double widthnum = StringUtil.stringToDoubleAcc2(pd.getString("WIDTH_NUM"));
		double lengthnum = StringUtil.stringToDoubleAcc2(pd.getString("LENGTH_NUM"));
		double denitynum = StringUtil.stringToDoubleAcc2(pd.getString("DENSITY_NUM"));
		
		pd.put("WEIGHT_LOGIC",StringUtil.doubleToDoubleAcc2(thicknum*widthnum*lengthnum*denitynum/1000000));
		
		thicknum = StringUtil.stringToDoubleAcc2(pd.getString("THICKNESS_NUM_REAL"));
		widthnum = StringUtil.stringToDoubleAcc2(pd.getString("WIDTH_NUM_REAL"));
		lengthnum = StringUtil.stringToDoubleAcc2(pd.getString("LENGTH_NUM_REAL"));
				
		pd.put("WEIGHT_REAL",StringUtil.doubleToDoubleAcc2(thicknum*widthnum*lengthnum*denitynum/1000000));
		
		pd.put("STATUS", "1");//在用状态
		
		pd.put("MODIFY_USER", Jurisdiction.getUsername());
		pd.put("MODIFY_DATE", DateUtil.getTime());
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		materialService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_20);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listParts")
	public ModelAndView listParts(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_10);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_parts");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listPartsClass")
	public ModelAndView listPartsClass(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_10);
		page.setPd(pd);
		List<PageData>	varList = materialService.listMaterialClass(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_parts_class");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listProductClass")
	public ModelAndView listProductClass(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_50);
		page.setPd(pd);
		List<PageData>	varList = materialService.listMaterialClass(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_product_class");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listMouldClass")
	public ModelAndView listMouldClass(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_30);
		page.setPd(pd);
		List<PageData>	varList = materialService.listMaterialClass(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_mould_class");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listMould")
	public ModelAndView listMould(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_30);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		
		Object ob = pd.get("PageFromType");
		if(ob != null) {
			String strFromType = ob.toString();
			if(StringUtil.isNotNullParam(strFromType)) {
				mv.addObject("PageFromType", strFromType);
			}else {
				mv.addObject("PageFromType", "ListMould");
			}
		}else {
			mv.addObject("PageFromType", "ListMould");
		}
						
		mv.setViewName("baseinfo/material/material_list_mould");
		mv.addObject("varList", varList);
		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listProduct")
	public ModelAndView listProduct(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_50);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		
		Object ob = pd.get("PageFromType");
		if(ob != null) {
			String strFromType = ob.toString();
			if(StringUtil.isNotNullParam(strFromType)) {
				mv.addObject("PageFromType", strFromType);
			}else {
				mv.addObject("PageFromType", "ListProduct");
			}
		}else {
			mv.addObject("PageFromType", "ListProduct");
		}
						
		mv.setViewName("baseinfo/material/material_list_product");
		mv.addObject("varList", varList);
		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listProductMD")
	public ModelAndView listProductMD(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_50);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		
		Object ob = pd.get("PageFromType");
		if(ob != null) {
			String strFromType = ob.toString();
			if(StringUtil.isNotNullParam(strFromType)) {
				mv.addObject("PageFromType", strFromType);
			}else {
				mv.addObject("PageFromType", "ListProduct");
			}
		}else {
			mv.addObject("PageFromType", "ListProduct");
		}
						
		mv.setViewName("baseinfo/material/material_list_product_md");
		mv.addObject("varList", varList);
		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listMouldSelect")
	public ModelAndView listMouldSelect(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_30);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_mould_select");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/wuganglist")
	public ModelAndView wuganglist(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Material");
		//if(!Jurisdiction.buttonJurisdiction(menuUrlwugang, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_wugang_list");
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
		mv.setViewName("baseinfo/material/material_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddParts")
	public ModelAndView goAddParts()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("baseinfo/material/material_edit_parts");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddPartsClass")
	public ModelAndView goAddPartsClass()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("baseinfo/material/material_edit_parts_class");
		mv.addObject("msg", "saveClass");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去新增模具分类页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddMouldClass")
	public ModelAndView goAddMouldClass()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("baseinfo/material/material_edit_mould_class");
		mv.addObject("msg", "saveClass");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去新增模具分类页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddProductClass")
	public ModelAndView goAddProductClass()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("baseinfo/material/material_edit_product_class");
		mv.addObject("msg", "saveClass");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddMould")
	public ModelAndView goAddMould()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("baseinfo/material/material_edit_mould");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddProduct")
	public ModelAndView goAddProduct()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("baseinfo/material/material_edit_product");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddMouldProduction")
	public ModelAndView goAddMouldProduction()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd= this.getPageData();
		mv.setViewName("baseinfo/material/material_edit_mould_production");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddWugang")
	public ModelAndView goAddWugang()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("baseinfo/material/material_wugang_edit");
		mv.addObject("msg", "saveWugang");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditWugang")
	public ModelAndView goEditWugang()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = materialService.findById(pd);	//根据ID读取
		mv.setViewName("baseinfo/material/material_wugang_edit");
		mv.addObject("msg", "editWugang");
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
		PageData pd = this.getPageData();
		
		pd = materialService.findById(pd);	//根据ID读取
		String type = pd.getString("TYPE");
		if(ConstProduction.MATERIAL_TYPE_10.equals(type)){
			mv.setViewName("baseinfo/material/material_edit_parts");
		}else if(ConstProduction.MATERIAL_TYPE_20.equals(type)){
			mv.setViewName("baseinfo/material/material_edit");
		}else if(ConstProduction.MATERIAL_TYPE_50.equals(type)){
			mv.setViewName("baseinfo/material/material_edit_product");
		}else{
			mv.setViewName("baseinfo/material/material_edit_mould");
		}
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddMouldPart")
	public ModelAndView goAddMouldPart()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		
		
		
		mv.setViewName("baseinfo/material/material_add_mould_part");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditPartsClass")
	public ModelAndView goEditPartsClass()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd = materialService.findMaterialClassById(pd);	//根据ID读取
		
		mv.setViewName("baseinfo/material/material_edit_parts_class");
		
		mv.addObject("msg", "editClass");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditMouldClass")
	public ModelAndView goEditMouldClass()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		
		pd = materialService.findMaterialClassById(pd);	//根据ID读取
		
		mv.setViewName("baseinfo/material/material_edit_mould_class");
		
		mv.addObject("msg", "editClass");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditProductClass")
	public ModelAndView goEditProductClass()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		
		pd = materialService.findMaterialClassById(pd);	//根据ID读取
		
		mv.setViewName("baseinfo/material/material_edit_product_class");
		
		mv.addObject("msg", "editClass");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Material");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			materialService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Material到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("");	//1
		titles.add("物料编号");	//2
		titles.add("物料名称");	//3
		titles.add("物料描述");	//4
		titles.add("物料规格");	//5
		titles.add("文件编号");	//6
		titles.add("物料图号");	//7
		titles.add("主单位");	//8
		titles.add("辅助单位");	//9
		titles.add("单位转换比例");	//10
		titles.add("公司ID");	//11
		titles.add("录入员工所在部门ID");	//12
		titles.add("公司对应的集团公司ID");	//13
		titles.add("录入员工编号");	//14
		titles.add("录入时间");	//15
		titles.add("修改员工编号");	//16
		titles.add("修改时间");	//17
		titles.add("备注");	//18
		dataMap.put("titles", titles);
		List<PageData> varOList = materialService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MATERIAL_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("MATERIAL_CODE"));	//2
			vpd.put("var3", varOList.get(i).getString("MATERIAL_NAME"));	//3
			vpd.put("var4", varOList.get(i).getString("MATERIAL_DESC"));	//4
			vpd.put("var5", varOList.get(i).getString("MATERIAL_SPEC"));	//5
			vpd.put("var6", varOList.get(i).getString("FILE_NO"));	//6
			vpd.put("var7", varOList.get(i).getString("FIGURE_NO"));	//7
			vpd.put("var8", varOList.get(i).getString("PRIMARY_UNIT"));	//8
			vpd.put("var9", varOList.get(i).getString("SECOND_UNIT"));	//9
			vpd.put("var10", varOList.get(i).getString("CHANGE_RATE"));	//10
			vpd.put("var11", varOList.get(i).getString("COMPANY_ID"));	//11
			vpd.put("var12", varOList.get(i).getString("DEPARTMENT_ID"));	//12
			vpd.put("var13", varOList.get(i).getString("GROUP_ID"));	//13
			vpd.put("var14", varOList.get(i).getString("CREATE_USER"));	//14
			vpd.put("var15", varOList.get(i).getString("CREATE_DATE"));	//15
			vpd.put("var16", varOList.get(i).getString("MODIFY_USER"));	//16
			vpd.put("var17", varOList.get(i).getString("MODIFY_DATE"));	//17
			vpd.put("var18", varOList.get(i).getString("REMARK"));	//18
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
	
	@RequestMapping(value="/getPartsDropDownList")
	@ResponseBody
	public Object getPartsDropDownList(Page page) throws Exception{
		PageData pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_10);
		pd.put("DROPDOWN_FLAG", "Y");
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);//列出配件列表
		return varList;
	}
	
	@RequestMapping(value="/getMouldId")
	@ResponseBody
	public Object getMouldId(Page page) throws Exception{
		PageData pd = this.getPageData();
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_30);
		page.setPd(pd);
		Map<String,Object> map = new HashMap<>();
		List<PageData> varList = materialService.listAll(pd);
		if(!CollectionUtils.isEmpty(varList)){
			if(varList.size()==1){
				map.put("msg", "success");
				map.put("data", varList.get(0));
			}else{
				map.put("msg", "false");
				map.put("info", "10");
			}
		}
		else{
			map.put("msg", "false");
			map.put("info", "0");
		}
		return map;
	}
	
	
	/**
	 * 选择模具分类列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goMouldSelect")
	public ModelAndView goMouldSelect(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_30);
		page.setPd(pd);
		List<PageData>	varList = materialService.listMaterialClass(page);//列出配件列表
		mv.setViewName("baseinfo/material/material_mould_class_select");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 选择模具分类列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goPartSelect")
	public ModelAndView goPartSelect(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		PageData pdParam = new PageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pdParam.put("keywords", keywords.trim());
		}
		pdParam.put("TYPE", ConstProduction.MATERIAL_TYPE_10);
		page.setPd(pdParam);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_parts_select");
		mv.addObject("varList", varList);
		mv.addObject("pd", pdParam);
		return mv;
	}
	
	@RequestMapping(value="/goMaterialInfo")
	@ResponseBody
	public Object goMaterialInfo() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取MaterialInfo");
		
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		//keywords
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_20);
		
		List<PageData> list = this.materialService.listAll(pd);
		if(list != null && list.size() > 0){
			map.put("count", list.size());
			if(list.size() == 1 ){
				PageData pdTemp = (PageData)list.get(0);
				map.put("MATERIAL_ID", pdTemp.get("MATERIAL_ID"));
				map.put("MATERIAL_CODE", pdTemp.get("MATERIAL_CODE"));
				map.put("MATERIAL_NAME", pdTemp.get("MATERIAL_NAME"));
				map.put("MATERIAL_SPEC", pdTemp.get("MATERIAL_SPEC"));
			}
		}else{
			map.put("count", 0);
		}
			
		map.put("msg", "success");
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 选择模具分类列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goMaterialSelect")
	public ModelAndView goMaterialSelect(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		PageData pdParam = new PageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pdParam.put("keywords", keywords.trim());
		}
		pdParam.put("TYPE", ConstProduction.MATERIAL_TYPE_20);
		page.setPd(pdParam);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_material_select");
		mv.addObject("varList", varList);
		mv.addObject("pd", pdParam);
		return mv;
	}
	
	/**
	 * 选择模具分类列表jqgrid
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goPartSelect_batch")
	public ModelAndView goPartSelect_batch(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_10);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_parts_select_batch");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	/**
	 * 选择模具产品列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/goMouldProductionSelect")
	public ModelAndView goMouldProductionSelect(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("TYPE", ConstProduction.MATERIAL_TYPE_50);
		page.setPd(pd);
		List<PageData>	varList = materialService.list(page);	//列出Material列表
		mv.setViewName("baseinfo/material/material_list_mould_production_select");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
}
