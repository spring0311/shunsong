package com.shunsong.service.purchase.orderapply.impl;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.purchase.orderapply.OrderApplyManager;
import com.shunsong.service.purchase.orderapplydetail.OrderApplyDetailManager;
import com.shunsong.util.PageData;
import com.shunsong.util.PdUtil;
import com.shunsong.util.StringUtil;

/** 
 * 说明： purchases_order_apply 采购申请单主表
 * 创建人：zhudafeng
 * 创建时间：2019-10-14
 * @version
 */
@Service("orderapplyService")
public class OrderApplyService implements OrderApplyManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="orderapplydetailService")
	private OrderApplyDetailManager orderapplydetailService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		PdUtil.AddCommonData(pd);
		dao.save("OrderApplyMapper.save", pd);
	}
	
	@Override
	public PageData saveMain(PageData pd) throws Exception{
		String mdata = pd.getString("data");
		JSONObject mJson = JSONObject.fromObject(mdata);
		PageData pdM = new PageData();
		pdM.putAll(mJson);
		if(StringUtil.isNotNullParam(pdM.getString("PORDER_APPLY_ID"))){
			this.edit(pdM);
		}else{
			pdM.put("STATUS", "10");
			this.save(pdM);
		}
		return pdM;
	}
	
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		PdUtil.ModifyCommonData(pd);
		dao.update("OrderApplyMapper.edit", pd);
	}
	
	@Override
	public PageData editCommit(PageData pd) throws Exception{
		String mdata = pd.getString("data");
		JSONObject mJson = JSONObject.fromObject(mdata);
		PageData pdM = new PageData();
		pdM.putAll(mJson);
		pdM.put("STATUS", "30");
		this.edit(pdM);
		PageData pdEdtiDetail = new PageData();
		pdEdtiDetail.put("DETAIL_STATUS","30");
		pdEdtiDetail.put("PORDER_APPLY_ID",pdM.getString("PORDER_APPLY_ID"));
		this.orderapplydetailService.editStatusByPorderApplyId(pdEdtiDetail);
		return pdM;
	}
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrderApplyMapper.datalistPage", page);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listDetail(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrderApplyMapper.detaildatalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrderApplyMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrderApplyMapper.findById", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("OrderApplyMapper.delete", pd);
	}
	
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrderApplyMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

