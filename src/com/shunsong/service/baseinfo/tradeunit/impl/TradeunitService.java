package com.shunsong.service.baseinfo.tradeunit.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.tradeunit.TradeunitManager;
import com.shunsong.service.system.billno.BillnoManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明： 基础数据模块
 * 创建人：zhudafeng
 * 创建时间：2017-03-04
 * @version
 */
@Service("tradeunitService")
public class TradeunitService implements TradeunitManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name = "billnoService")
	private BillnoManager billnoService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("TradeunitMapper.save", pd);
	}
	
	/**新增，通过简称新增
	 * @param pd("TRADEUNIT_TYPE","TRADEUNIT_ALT")
	 * @throws Exception
	 */
	@Override
	public String saveWithAlt(PageData pd) throws Exception{
		
		String strTradeUnitId = StringUtil.get32UUID();
		
		pd.put("TRADEUNIT_ID", strTradeUnitId);
		pd.put("TRADEUNIT_CODE", billnoService.getBillNo("TradeunitCode"));
		pd.put("TRADEUNIT_NAME", pd.getString("TRADEUNIT_ALT"));
		pd.put("STATUS", "1");		
		pd.put("REMARK", pd.getString("TRADEUNIT_REMARK"));
		
		pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
		pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
		pd.put("GROUP_ID", Jurisdiction.getGroupID());
		pd.put("CREATE_USER", Jurisdiction.getUsername());
		pd.put("CREATE_DATE", DateUtil.getTime());
						
		dao.save("TradeunitMapper.save", pd);
		
		return strTradeUnitId;
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("TradeunitMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("TradeunitMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TradeunitMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TradeunitMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TradeunitMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TradeunitMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

