package com.shunsong.service.baseinfo.barcodelist.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.baseinfo.barcodelist.BarcodelistManager;
import com.shunsong.service.system.billno.BillnoManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.Jurisdiction;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明： 基础管理模块
 * 创建人：zhudafeng
 * 创建时间：2017-05-28
 * @version
 */
@Service("barcodelistService")
public class BarcodelistService implements BarcodelistManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="billnoService")
	private BillnoManager billnoService;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("BarcodelistMapper.save", pd);
	}
	
	/**生成条码
	 * @param pd
	 * @throws Exception
	 */
	public void genBarcode(PageData pd)throws Exception{
		
		int	barcodeNum = StringUtil.stringToInteger(pd.getString("BARCODE_NUM"));
		
		for (int i=0;i < barcodeNum;i++){
			String strBarcode = billnoService.getBillNo("BarcodeNo");
			pd.put("BARCODELIST_ID", StringUtil.get32UUID());	//主键
			pd.put("BARCODE_CODE", strBarcode);	//条码
			pd.put("STATUS", "10");	//条码
			pd.put("CREATE_USER", Jurisdiction.getUsername());
			pd.put("CREATE_DATE", DateUtil.getTime());
			pd.put("COMPANY_ID", Jurisdiction.getCompanyID());
			pd.put("DEPARTMENT_ID", Jurisdiction.getDeptID());
			pd.put("GROUP_ID", Jurisdiction.getGroupID());
			this.save(pd);
		}
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("BarcodelistMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("BarcodelistMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BarcodelistMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BarcodelistMapper.listAll", pd);
	}
	
	/**列表(全部未打印的)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> getNoPrint(PageData pd)throws Exception{
		
		List<PageData> listPrint = (List<PageData>)dao.findForList("BarcodelistMapper.listNoPrint", pd);
		if(listPrint!=null && listPrint.size()>0){
			for(int i=0;i<listPrint.size();i++){
				PageData pdTemp = (PageData)listPrint.get(i);
				pdTemp.put("STATUS", "20");	
				pdTemp.put("MODIFY_USER", Jurisdiction.getUsername());
				pdTemp.put("MODIFY_DATE", DateUtil.getTime());
				dao.update("BarcodelistMapper.updatePrintFlg", pdTemp);
			}			
		}
		
		return listPrint;
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BarcodelistMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BarcodelistMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

