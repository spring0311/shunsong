package com.shunsong.service.sales.order_detail.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.sales.order_detail.SALE_DETAILManager;
import com.shunsong.util.DaoUtil;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明： 销售模块
 * 创建人：zhudafeng
 * 创建时间：2018-07-15
 * @version
 */
@Service("sale_detailService")
public class SALE_DETAILService implements SALE_DETAILManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	 * @Resource(name="woutstockdetailService")
	 * private WoutstockdetailManager woutstockdetailService;
	 * 
	 * @Resource(name="product_demandService")
	 * private Product_demandManager product_demandService;
	 */
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		DaoUtil.putCreateInfo(pd);
		dao.save("SALE_DETAILMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("SALE_DETAILMapper.delete", pd);	
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		DaoUtil.putUpdateInfo(pd);
		dao.update("SALE_DETAILMapper.edit", pd);
		
		//判断是否需要修改出库信息
		//this.woutstockdetailService.editIntfFromSalesOrder(pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editDetailFromHeadInfo(PageData pd)throws Exception{
		//更新订单明细项信息
		String strTaxRate = pd.getString("TAX_RATE");
		String strPriceTaxFlg = pd.getString("PRICE_TAX_FLG");
		String strOldTaxRate = pd.getString("OLD_TAX_RATE");
		String strOldPriceTaxFlg = pd.getString("OLD_PRICE_TAX_FLG");
		
		List<PageData> listDetail = this.listAll(pd);
		if(listDetail != null && listDetail.size() > 0){
			for(PageData pdTemp :listDetail){
				int intNum = pdTemp.getInt("MATERIAL_NUM");
				BigDecimal bdNumPrice = new BigDecimal(pdTemp.getString("MATERIAL_NUM_PRICE"));
				BigDecimal bdWeightPrice = new BigDecimal(pdTemp.getString("MATERIAL_WEIGHT_PRICE"));				
				BigDecimal bdTaxRate = new BigDecimal(strTaxRate);
				BigDecimal bdOldTaxRate = new BigDecimal(strOldTaxRate);
				BigDecimal bdMTotalAmt = new BigDecimal(pdTemp.getString("MATERIAL_TOTAL_AMT"));
				BigDecimal bdExdTaxAmt = BigDecimal.ZERO;
				BigDecimal bdTaxAmt = BigDecimal.ZERO;	
				
				BigDecimal bigZ = new BigDecimal("-1");
				if(bdTaxRate.compareTo(bigZ) == 0){
					bdTaxRate = BigDecimal.ZERO;
				}
				if(bdOldTaxRate.compareTo(bigZ) == 0){
					bdOldTaxRate = BigDecimal.ZERO;
				}
				
				if(!strOldPriceTaxFlg.equals(strPriceTaxFlg)){
					if("10".equals(strPriceTaxFlg)){
						//含税单价：说明之前是不含税单价，先将价格转变成含税单价
						bdNumPrice = bdNumPrice.multiply(bdOldTaxRate.add(new BigDecimal("1")));
						bdWeightPrice = bdWeightPrice.multiply(bdOldTaxRate.add(new BigDecimal("1")));
						
						bdMTotalAmt = bdNumPrice.multiply(new BigDecimal(StringUtil.IntegerToString(intNum))).setScale(2,BigDecimal.ROUND_HALF_UP);
						bdExdTaxAmt = bdMTotalAmt.divide(bdTaxRate.add(new BigDecimal("1")), 2, BigDecimal.ROUND_HALF_UP);
						bdTaxAmt = bdMTotalAmt.subtract(bdExdTaxAmt);
						
					}else{
						//不含税单价：说明之前是含税单价，先将价格转变成不含税单价
						bdNumPrice = bdNumPrice.divide(bdOldTaxRate.add(new BigDecimal("1")), 6, BigDecimal.ROUND_HALF_UP);
						bdWeightPrice = bdWeightPrice.divide(bdOldTaxRate.add(new BigDecimal("1")), 6, BigDecimal.ROUND_HALF_UP);
						
						bdExdTaxAmt = bdNumPrice.multiply(new BigDecimal(StringUtil.IntegerToString(intNum))).setScale(2,BigDecimal.ROUND_HALF_UP);
						bdMTotalAmt = bdExdTaxAmt.multiply(bdTaxRate.add(new BigDecimal("1"))).setScale(2,BigDecimal.ROUND_HALF_UP);
						bdTaxAmt = bdMTotalAmt.subtract(bdExdTaxAmt);
					}
					
					pdTemp.put("MATERIAL_NUM_PRICE", bdNumPrice);
					pdTemp.put("MATERIAL_WEIGHT_PRICE", bdWeightPrice);
				}else{
					bdExdTaxAmt = bdMTotalAmt.divide(bdTaxRate.add(new BigDecimal("1")), 2, BigDecimal.ROUND_HALF_UP);
					bdTaxAmt = bdMTotalAmt.subtract(bdExdTaxAmt);
				}
				
				BigDecimal bdMakeTotalAmt = new BigDecimal(pdTemp.getString("MAKE_TOTAL_AMT"));
				BigDecimal bdDiscountAmt = new BigDecimal(pdTemp.getString("DISCOUNT_AMT"));
				pdTemp.put("MATERIAL_TAX_RATE", strTaxRate);
				pdTemp.put("MATERIAL_TAX_AMT", bdTaxAmt);				
				pdTemp.put("MATERIAL_EXD_TAX_AMT", bdExdTaxAmt);
				pdTemp.put("MATERIAL_TOTAL_AMT", bdMTotalAmt);
				pdTemp.put("TOTAL_AMT", bdMTotalAmt.add(bdMakeTotalAmt).subtract(bdDiscountAmt));
				
				this.edit(pdTemp);
			
			}
		}
	}
	
	@Override
	public PageData delSaleDetail(PageData pd) throws Exception {
		
		//删除出库申请
		PageData pdParam = new PageData();
		pdParam.put("FROM_ID", pd.get("ORDER_DETAIL_ID"));
		/*
		 * List<PageData> listIntf =
		 * this.woutstockdetailService.listOutStockIntfWithSales(pdParam);
		 * if(listIntf != null && listIntf.size() > 0){
		 * //删除出库申请的单
		 * for(PageData pdIntf : listIntf){
		 * String strStatus = pdIntf.getString("OUTSTOCK_STATUS");
		 * if("10".equals(strStatus)){
		 * this.woutstockdetailService.deleteOutStockIntf(pdIntf);
		 * }else{
		 * throw new Exception("销售订单【"+pd.getString("ORDER_DETAIL_ID")+"】已经出库，不能删除！");
		 * }
		 * }
		 * }
		 */
		
		//删除订单子项 ORDER_ID
		PageData pdDetail = this.findById(pd);
		if(pdDetail != null){
			String strDetailStatus = pdDetail.getString("DETAIL_STATUS");
			if("10".equals(strDetailStatus) || "30".equals(strDetailStatus)){
				this.delete(pdDetail);
			}else{
				throw new Exception("销售订单【"+pd.getString("ORDER_DETAIL_ID")+"】已经出库，不能删除！");
			}
		}		
		
		return pdDetail;
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void editPurchaseStatus(PageData pd)throws Exception{
		dao.update("SALE_DETAILMapper.editPurchaseStatus", pd);
	}
	
	/**提交
	 * @param pd
	 * @throws Exception
	 * 2018年10月9日11:35:10
	 */
	@Override
	public void commitByOrderID(PageData pd) throws Exception{
	
		//修改子项的状态
		pd.put("DETAIL_STATUS", "30");	
		dao.update("SALE_DETAILMapper.commitByOrderID", pd);
		
	}
	
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SALE_DETAILMapper.datalistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData getOrderSumNum(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SALE_DETAILMapper.getOrderSumNum", pd);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SALE_DETAILMapper.listAll", pd);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listOrderDetailByMainID(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SALE_DETAILMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SALE_DETAILMapper.findById", pd);
	}
	
	@Override
	public PageData findByDemandMainId(PageData pd) throws Exception {
		return (PageData)dao.findForObject("SALE_DETAILMapper.findByDemandMainId", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SALE_DETAILMapper.deleteAll", ArrayDATA_IDS);
	}
	
	@Override
	public int count(PageData param) throws Exception {
		return (int)dao.findForObject("SALE_DETAILMapper.count", param);
	}
}

