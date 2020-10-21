package com.shunsong.service.purchase.orderapplydetail.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.purchase.orderapply.OrderApplyManager;
import com.shunsong.service.purchase.orderapplydetail.OrderApplyDetailManager;
import com.shunsong.service.system.billno.BillnoManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.PageData;
import com.shunsong.util.PdUtil;
import com.shunsong.util.StringUtil;

/** 
 * 说明： purchases_order_apply_detail 采购申请单明细表
 * 创建人：zhudafeng
 * 创建时间：2019-10-14
 * @version
 */
@Service("orderapplydetailService")
public class OrderApplyDetailService implements OrderApplyDetailManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="orderapplyService")
	private OrderApplyManager orderapplyService;
	
	@Resource(name = "billnoService")
	private BillnoManager billnoService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		PdUtil.AddCommonData(pd);
		dao.save("OrderApplyDetailMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("OrderApplyDetailMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		PdUtil.ModifyCommonData(pd);
		dao.update("OrderApplyDetailMapper.edit", pd);
	}
	
	@Override
	public PageData editDetail(PageData pd) throws Exception {
		this.canculateTotalAmt(pd);
		this.edit(pd);
		String applyId = pd.getString("PORDER_APPLY_ID");
		String mdata = pd.getString("mData");
		JSONObject mJson = JSONObject.fromObject(mdata);
		PageData pdM = new PageData();
		pdM.putAll(mJson);
		this.sumApplyNumAndAmt(pdM, applyId);
		return this.orderapplyService.findById(pd);
	}
	
	@Override
	public void editStatusByPorderApplyId(PageData pd) throws Exception {
		dao.update("OrderApplyDetailMapper.editStatusByPorderApplyId", pd);
	}
	
	@Override
	public void editCommitDetial(PageData pd) throws Exception {
		String data = pd.getString("data");
		JSONArray jsonArr = JSONArray.fromObject(data);
		List<String> list = (List<String>) JSONArray.toCollection(jsonArr);
		pd.put("array", list);
		pd.put("DETAIL_STATUS","30");
		PdUtil.ModifyCommonData(pd);
		dao.update("OrderApplyDetailMapper.editStatusByApplyDetailList", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrderApplyDetailMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrderApplyDetailMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrderApplyDetailMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrderApplyDetailMapper.deleteAll", ArrayDATA_IDS);
	}
	

	
	@Override
	public PageData saveDetail(PageData pd) throws Exception {
		String applyId = pd.getString("PORDER_APPLY_ID");
		//处理主项数据
		String mdata = pd.getString("mData");
		JSONObject mJson = JSONObject.fromObject(mdata);
		PageData pdM = new PageData();
		pdM.putAll(mJson);
		this.saveMdata(pdM,pd, applyId);
		pd.put("PORDER_APPLY_DETAIL_ID", StringUtil.get32UUID());
		pd.put("DETAIL_STATUS", "10");//初始状态
		//计算明细金额
		this.canculateTotalAmt(pd);
		this.save(pd);
		
		//汇总请购单主信息的数量和金额
		this.sumApplyNumAndAmt(pdM,pd.getString("PORDER_APPLY_ID"));
		return pdM;
	}
	
	@Override
	public PageData saveDetails(PageData pd) throws Exception {
		//处理主项数据
		String mdata = pd.getString("mData");
		JSONObject mJson = JSONObject.fromObject(mdata);
		PageData pdM = new PageData();
		pdM.putAll(mJson);
		this.saveMdata(pdM,pd, pdM.getString("PORDER_APPLY_ID"));
		String strDetail = pd.getString("detailData");
		JSONArray jsonArr = JSONArray.fromObject(strDetail);
		PageData pdDetail = new PageData();
		for(int i=0;i<jsonArr.size();i++){
			JSONObject jsonObj = jsonArr.getJSONObject(i);
			pdDetail.clear();
			pdDetail.put("PORDER_APPLY_ID", pdM.getString("PORDER_APPLY_ID"));
			pdDetail.put("DETAIL_STATUS", "10");//初始状态
			pdDetail.putAll(jsonObj);
			pdDetail.put("PORDER_APPLY_DETAIL_ID", StringUtil.get32UUID());
			this.save(pdDetail);
		}
		return pdM;
	}
	
	private void canculateTotalAmt(PageData pd) {
		String materialNum = pd.getString("MATERIAL_NUM");
		String materialPrice = pd.getString("MATERIAL_PRICE");
		BigDecimal bMaterialNum = new BigDecimal(materialNum);
		BigDecimal bMaterialPrice = new BigDecimal(materialPrice);
		BigDecimal bTotalAmt = bMaterialNum.multiply(bMaterialPrice);
		pd.put("TOTAL_AMT", bTotalAmt);
	}

	private void sumApplyNumAndAmt(PageData pd,String applyId) throws Exception {
		PageData param = new PageData();
		param.put("PORDER_APPLY_ID", applyId);
		PageData pdSum =(PageData)dao.findForObject("OrderApplyDetailMapper.sumApplyNumAndAmt", param);
		if(null != pdSum){
			pd.put("TOTAL_NUM",pdSum.getString("SUM_MATERIAL_NUM"));
			pd.put("TOTAL_AMT", pdSum.getString("SUM_TOTAL_AMT"));
			this.orderapplyService.edit(pd);
		}
	}

	private void saveMdata(PageData pdM,PageData pd, String applyId) throws Exception{
		
		
		String applyDate = pdM.getString("PORDER_APPLY_DATE");
		if(!StringUtil.isNotNullParam(applyDate)){
			pdM.put("PORDER_APPLY_DATE",DateUtil.getDay());
		}
		if(!StringUtil.isNotNullParam(pdM.getString("TOTAL_AMT"))){
			pdM.put("TOTAL_AMT",0);
		}
		if(!StringUtil.isNotNullParam(pdM.getString("TOTAL_NUM"))){
			pdM.put("TOTAL_NUM",0);
		}
		if(StringUtil.isNotNullParam(applyId)){
			this.orderapplyService.edit(pdM);
		}
		//没有主项ID，先新增主项
		else{
			applyId = StringUtil.get32UUID();
			String applyNo = billnoService.getBillNo("PorderApplyNo");
			pdM.put("PORDER_APPLY_NO", applyNo);
			pdM.put("PORDER_APPLY_ID", applyId);
			pdM.put("STATUS", "10");
			this.orderapplyService.save(pdM);
			
			pd.put("PORDER_APPLY_ID", applyId);
		}
	}
	
	@Override
	public PageData delDetail(PageData pd) throws Exception {
		//删除子项
		this.delete(pd);
		//重新计算汇总主项数据
		String applyId = pd.getString("PORDER_APPLY_ID");
		this.sumApplyNumAndAmt(pd, applyId);
		return this.orderapplyService.findById(pd);
	}
}

