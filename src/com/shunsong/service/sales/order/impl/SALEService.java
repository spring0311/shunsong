package com.shunsong.service.sales.order.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.material.MaterialManager;
import com.shunsong.service.baseinfo.tradeunit.TradeunitManager;
import com.shunsong.service.sales.order.SALEManager;
import com.shunsong.service.sales.order_detail.SALE_DETAILManager;
import com.shunsong.service.system.billno.BillnoManager;
import com.shunsong.util.ConstProduction;
import com.shunsong.util.DaoUtil;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;
import com.shunsong.util.UuidUtil;

/** 
 * 说明： 销售模块
 * 创建人：zhudafeng
 * 创建时间：2018-07-15
 * @version
 */
@Service("saleService")
public class SALEService implements SALEManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="materialService")
	private MaterialManager materialService;
	
	@Resource(name="sale_detailService")
	private SALE_DETAILManager sale_detailService;
	
	@Resource(name="billnoService")
	private BillnoManager billnoService;
	
	@Resource(name="tradeunitService")
	private TradeunitManager tradeunitService;
	
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("SALEMapper.save", pd);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData saveOrder(PageData pd)throws Exception{
		PageData pdRtn = new PageData();
		PageData pdParam = new PageData();
		
		//获取订单主信息
		String orderHead = pd.getString("orderHead");
		
		JSONObject	jsonHead = JSONObject.fromObject(orderHead);
		String strFlg = "ADD";
		
		String strOrderID = jsonHead.getString("orderID");
		String strTaxRate = jsonHead.getString("taxRate");
		String strPriceTaxFlg = jsonHead.getString("priceTaxFlg");
		
		PageData pdOrderHead = null;
		
		if(StringUtil.isNotNullParam(strOrderID)){
			//查询并修改订单			
			pdParam.put("ORDER_ID", strOrderID);
			pdOrderHead = this.findById(pdParam);
			if(pdOrderHead != null){
				String strOldTaxRate = pdOrderHead.getString("TAX_RATE");
				String strOldPriceTaxFlg = pdOrderHead.getString("PRICE_TAX_FLG");
				
				if(!strOldTaxRate.equals(strTaxRate) || !strOldPriceTaxFlg.equals(strPriceTaxFlg)){
					//更新订单明细项信息
					pdOrderHead.put("TAX_RATE", strTaxRate);
					pdOrderHead.put("PRICE_TAX_FLG", strPriceTaxFlg);
					pdOrderHead.put("OLD_TAX_RATE", strOldTaxRate);
					pdOrderHead.put("OLD_PRICE_TAX_FLG", strOldPriceTaxFlg);
					this.sale_detailService.editDetailFromHeadInfo(pdOrderHead);					
				}
				strFlg = "EDIT";			
				
			}else{
				strFlg = "ADD";
			}
			
		}
		
		if("ADD".equals(strFlg)){
			//新增订单
			pdOrderHead = new PageData();
			strOrderID = UuidUtil.get32UUID();			
			pdOrderHead.put("ORDER_ID", strOrderID);				
			pdOrderHead.put("STATUS", "10");//新增
			
			pdOrderHead.put("CREATE_USER", Jurisdiction.getUsername());
			pdOrderHead.put("CREATE_DATE", DateUtil.getTime());
			pdOrderHead.put("COMPANY_ID", Jurisdiction.getCompanyID());
			pdOrderHead.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
			pdOrderHead.put("GROUP_ID", Jurisdiction.getGroupID());			
			
		}
		
		String strOrderNo = jsonHead.getString("orderNo");
		String strCustomerID = jsonHead.getString("customerID");
		String strOrderDate = jsonHead.getString("orderDate");
		
		if(!StringUtil.isNotNullParam(strOrderNo)){
			String strPreFix = "JDM";
			strOrderNo = this.billnoService.getBillNo("SalesOrder", strPreFix, strPreFix);
		}
		
		
		pdOrderHead.put("ORDER_NO", strOrderNo);
		pdOrderHead.put("ORDER_DATE", strOrderDate);
		pdOrderHead.put("CUSTOMER_ID", strCustomerID);
		pdOrderHead.put("CUSTOMER_LINKMAN_ID", jsonHead.getString("customerLinkManID"));
		pdOrderHead.put("CUSTOMER_ORDER_NO", jsonHead.getString("customerOrderNo"));			
		pdOrderHead.put("DELIVERY_DATE", jsonHead.getString("deliveryDate"));			
		pdOrderHead.put("REMARK", jsonHead.getString("remark"));
					
		pdOrderHead.put("PRICE_TYPE", jsonHead.getString("priceType"));
		pdOrderHead.put("PRICE_TAX_FLG", strPriceTaxFlg);
		pdOrderHead.put("TAX_RATE", strTaxRate);
		
		
		//获取明细信息并循环
		String orderDetail = pd.getString("orderDetail");	
		JSONObject orderDetailJson = JSONObject.fromObject(orderDetail);
		String strDetailFlg = "ADD";
		String strOrderDetailID = orderDetailJson.getString("orderDetailID");
		if(StringUtil.isNotNullParam(strOrderDetailID)){
			strDetailFlg = "EDIT";
		}else{
			//为空，新增明细项
			strOrderDetailID = UuidUtil.get32UUID();
			strDetailFlg = "ADD";
		}
		
		PageData pdOrderDetail = new PageData();
		
		pdOrderDetail.put("ORDER_DETAIL_ID", strOrderDetailID);
		pdOrderDetail.put("ORDER_ID", strOrderID);
		
		pdOrderDetail.put("ORDER_TYPE_NO", orderDetailJson.getString("orderTypeNo"));		
		pdOrderDetail.put("ORDER_SPEC", orderDetailJson.getString("orderSpec"));
		
		String strMaterialID = "";
		
		pdOrderDetail.put("MATERIAL_ID", strMaterialID);
		pdOrderDetail.put("MATERIAL_NUM", orderDetailJson.getString("materialNum"));	
		pdOrderDetail.put("MATERIAL_NUM_PRICE", orderDetailJson.getString("materialNumPrice"));
		pdOrderDetail.put("MATERIAL_TAX_RATE", strTaxRate);		
		pdOrderDetail.put("MAKE_TYPE", orderDetailJson.getString("makeType"));
			
				
		String strMaterialTotalAmt = orderDetailJson.getString("totalAmt");
		pdOrderDetail.put("MATERIAL_TOTAL_AMT", strMaterialTotalAmt);
		
		pdOrderDetail.put("TOTAL_AMT", orderDetailJson.getString("totalAmt"));
		pdOrderDetail.put("CUSTOMER_DRAWING_NO", orderDetailJson.getString("customerDrawingNo"));
		pdOrderDetail.put("REMARK_DETAIL", orderDetailJson.getString("remarkDetail"));
		pdOrderDetail.put("EXT1", orderDetailJson.getString("ext1"));
		
		if("-1".equals(strTaxRate)){
			pdOrderDetail.put("MATERIAL_TAX_AMT", 0);
			pdOrderDetail.put("MATERIAL_EXD_TAX_AMT", orderDetailJson.getString("totalAmt"));
		}else{
			BigDecimal bdMTotalAmt = new BigDecimal(strMaterialTotalAmt);
			BigDecimal bdTaxRate = new BigDecimal(strTaxRate);
			
			BigDecimal bdExdTaxAmt = bdMTotalAmt.divide(bdTaxRate.add(new BigDecimal("1")), 2, BigDecimal.ROUND_HALF_UP);
			BigDecimal bdTaxAmt = bdMTotalAmt.subtract(bdExdTaxAmt);
			
			pdOrderDetail.put("MATERIAL_TAX_AMT", bdTaxAmt);
			pdOrderDetail.put("MATERIAL_EXD_TAX_AMT", bdExdTaxAmt);
		}
		
		//保存明细信息
		if("EDIT".equals(strDetailFlg)){
			this.sale_detailService.edit(pdOrderDetail);
			
			
		}else{
			pdOrderDetail.put("DETAIL_STATUS","10");
			this.sale_detailService.save(pdOrderDetail);
		}
		
		
		//给主项的汇总数据赋值
		PageData pdSum = this.sale_detailService.getOrderSumNum(pdOrderHead);
		if(pdSum != null){
			pdOrderHead.put("TOTAL_NUM", pdSum.get("MATERIAL_NUM"));
			//pdOrderHead.put("TOTAL_WEIGHT", pdSum.get("MATERIAL_WEIGHT"));
			pdOrderHead.put("MATERIAL_TAX_AMT", pdSum.get("MATERIAL_TAX_AMT"));
			pdOrderHead.put("MATERIAL_EXD_TAX_AMT", pdSum.get("MATERIAL_EXD_TAX_AMT"));
			pdOrderHead.put("MATERIAL_TOTAL_AMT", pdSum.get("MATERIAL_TOTAL_AMT"));
			//pdOrderHead.put("MAKE_TOTAL_AMT", pdSum.get("MAKE_TOTAL_AMT"));
			//pdOrderHead.put("DISCOUNT_AMT", pdSum.get("DISCOUNT_AMT"));
			pdOrderHead.put("TOTAL_AMT", pdSum.get("TOTAL_AMT"));
		}
		
		//保存主信息
		if("EDIT".equals(strFlg)){
			this.edit(pdOrderHead);
		}else{
			this.save(pdOrderHead);
		}
		
		pdRtn.put("ORDER_ID",strOrderID);
		pdRtn.put("ORDER_NO",strOrderNo);
		pdRtn.put("ORDER_DETAIL_ID", strOrderDetailID);
		
		return pdRtn;
			
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("SALEMapper.delete", pd);
	}
	
	
	@Override
	public void deleteDetail(PageData pd)throws Exception{
		
		PageData pdDetail = this.sale_detailService.findById(pd);
		
		this.sale_detailService.delete(pd);
		
		//给主项的汇总数据赋值
		PageData pdOrderHead = new PageData();
		pdOrderHead.put("ORDER_ID", pdDetail.get("ORDER_ID"));
		PageData pdSum = this.sale_detailService.getOrderSumNum(pdOrderHead);
		if(pdSum != null){
			pdOrderHead.put("TOTAL_NUM", pdSum.get("MATERIAL_NUM"));
			//pdOrderHead.put("TOTAL_WEIGHT", pdSum.get("MATERIAL_WEIGHT"));
			pdOrderHead.put("MATERIAL_TAX_AMT", pdSum.get("MATERIAL_TAX_AMT"));
			pdOrderHead.put("MATERIAL_EXD_TAX_AMT", pdSum.get("MATERIAL_EXD_TAX_AMT"));
			pdOrderHead.put("MATERIAL_TOTAL_AMT", pdSum.get("MATERIAL_TOTAL_AMT"));
			//pdOrderHead.put("MAKE_TOTAL_AMT", pdSum.get("MAKE_TOTAL_AMT"));
			//pdOrderHead.put("DISCOUNT_AMT", pdSum.get("DISCOUNT_AMT"));
			pdOrderHead.put("TOTAL_AMT", pdSum.get("TOTAL_AMT"));
			
			this.edit(pdOrderHead);
		}
		
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		DaoUtil.putUpdateInfo(pd);
		dao.update("SALEMapper.edit", pd);
	}
	
	
	@Override
	public void delSale(PageData pd) throws Exception {
		
		//删除子项和出库申请
		PageData pdDetail = this.sale_detailService.delSaleDetail(pd);
		
		
		//删除订单主项 ORDER_ID
		PageData pdParam = new PageData();
		pdParam.put("ORDER_ID", pdDetail.get("ORDER_ID"));
		List<PageData> listDetail = this.sale_detailService.listAll(pdParam);
		if(listDetail != null && listDetail.size() > 0){
			
		}else{
			this.delete(pdDetail);
		}
		
		
	}
	
	/**提交
	 * @param pd
	 * @throws Exception
	 * 2018年10月9日11:35:10
	 */
	@Override
	public void commit(PageData pd) throws Exception{
		DaoUtil.putUpdateInfo(pd);
		
		//插入生产主表和装配工单
		List<PageData> listOrderDetail = this.listSaleOrderData(pd);
		if(listOrderDetail != null && listOrderDetail.size() > 0) {
			for(int i=0;i<listOrderDetail.size();i++) {
				PageData pdOrder = listOrderDetail.get(i);
				//插入生产主表
				
				//插入装配工单
				PageData assemblyParam = new PageData();
				
				//订单的加工类型转成装配工单的装配类型
				String strMakeType = pdOrder.getString("MAKE_TYPE");
				switch(strMakeType) 
				{
					case "30":
						//旧模保养
						assemblyParam.put("TASK_TYPE", "20");//保养
						break;
					case "20":
						//新增装配
						assemblyParam.put("TASK_TYPE", "10");//装配类型
						break;
					case "10":
						//旧模异常维修
						assemblyParam.put("TASK_TYPE", "30");//旧模异常维修
						break;				
				}
				
			}
		}
		
		//修改子项的提交状态
		this.sale_detailService.commitByOrderID(pd);	
		
		pd.put("STATUS", "30");
		dao.update("SALEMapper.commit", pd);
		
		
		
		
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editPurchaseBackStatus(PageData pd)throws Exception{
		dao.update("SALE_DETAILMapper.editPurchaseStatus", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SALEMapper.datalistPage", page);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listOrderExecute(Page page) throws Exception{
		return (List<PageData>)dao.findForList("SALEMapper.OrderExecutedatalistPage", page);
	}
	
	
	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listSaleOrderData(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("SALEMapper.listSaleOrderData", pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public PageData listSaleOrderDataAllCount(PageData pd) throws Exception{		
		return (PageData)dao.findForObject("SALEMapper.listSaleOrderDataAllCount", pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listSaleOrderStatistics(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("SALEMapper.listSaleOrderStatistics", pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public PageData listSaleOrderStatisticsAllCount(PageData pd) throws Exception{		
		return (PageData)dao.findForObject("SALEMapper.listSaleOrderStatisticsAllCount", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listSaleOrderForPurchase(Page page) throws Exception{
		return (List<PageData>)dao.findForList("SALE_DETAILMapper.forPurchasedatalistPage", page);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listSaleOrderWithDetail(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("SALE_DETAILMapper.listSaleOrderWithDetail", pd);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SALEMapper.listAll", pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listDataToExcel(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("SALEMapper.listDataToExcel", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SALEMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SALEMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

