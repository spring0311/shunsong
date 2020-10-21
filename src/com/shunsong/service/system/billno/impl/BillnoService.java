package com.shunsong.service.system.billno.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shunsong.dao.DaoSupport;
import com.shunsong.entity.Page;
import com.shunsong.service.system.billno.BillnoManager;
import com.shunsong.util.DateUtil;
import com.shunsong.util.PageData;
import com.shunsong.util.StringUtil;

/** 
 * 说明： 系统模块
 * 创建人：zhudafeng
 * 创建时间：2017-04-30
 * @version
 */
@Service("billnoService")
public class BillnoService implements BillnoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("BillnoMapper.save", pd);
	}
	
	/**生成最新编号（生成统一的编号）
	 * @param pd
	 * @throws Exception
	 */
	public String getBillNo(String billNoType)throws Exception{
		billNoType =StringUtil.trimStr(billNoType);
		PageData pd = new PageData();
		pd.put("billNoType", billNoType);
		String strBillNo="";
		//获取当前的编号
		PageData billPd = (PageData)dao.findForObject("BillnoMapper.findByBillType", pd);
		if(null != billPd){
			Object strNowNo = billPd.get("BILLNO_NOWNO");
			System.out.println("strNowNo:"+strNowNo);
			int intNowNo = Integer.parseInt(strNowNo.toString());
			intNowNo = intNowNo + 1;
			
			//超过8位从1开始
			int intLen = billPd.getInt("BILLNO_LEN");
			String strZ = StringUtil.autoZeroString(intLen);
			int intMax = StringUtil.stringToInteger("1" + strZ);
			if(intNowNo >= intMax){
				intNowNo = 1;
			}
			
			String strYMDFlg = billPd.getString("BILLNO_YMDFLG");
			String strYMD = "";
			if(!StringUtil.isNotNullParam(strYMDFlg)){
				strYMDFlg = "";
			}
			if("30".equals(strYMDFlg)){
				strYMD = DateUtil.getYYMMDD();
			}else if("20".equals(strYMDFlg)){
				strYMD = DateUtil.getYYMM();
			}else if("10".equals(strYMDFlg)){
				strYMD = DateUtil.getYY();
			}
						
			//更新现有的编号
			billPd.put("BILLNO_NOWNO", StringUtil.IntegerToString(intNowNo));
			this.edit(billPd);
			
			String prefixBill = StringUtil.trimStr(billPd.getString("BILLNO_PREFIX"));
			String strNo = StringUtil.autoGenericCode(intNowNo,intLen);
			strBillNo = prefixBill + strYMD + strNo;
		}
		
		return strBillNo;
	}
	
	
	/**生成最新编号(根据前缀新增各自的编号)
	 * @param pd
	 * 	billNoType：主表的类型
	 *  getTypeName：子项的类型
	 *  strPreFix：编号的前缀（一般getTypeName=strPreFix）
	 * @throws Exception
	 */
	@Override
	public String getBillNo(String billNoType,String getTypeName,String strPreFix)throws Exception{
		PageData pd = new PageData();
		strPreFix =StringUtil.trimStr(strPreFix);
		getTypeName =StringUtil.trimStr(getTypeName);
		billNoType =StringUtil.trimStr(billNoType);
		pd.put("billNoType", billNoType);		
		String strBillNo="";
		PageData billPdMain = (PageData)dao.findForObject("BillnoMapper.findByBillType", pd);
		if(null != billPdMain){
			String strYMDFlg = billPdMain.getString("BILLNO_YMDFLG");
			String strYMD = "";
			if(!StringUtil.isNotNullParam(strYMDFlg)){
				strYMDFlg = "";
			}
			if("30".equals(strYMDFlg)){
				strYMD = DateUtil.getYYMMDD();
			}else if("20".equals(strYMDFlg)){
				strYMD = DateUtil.getYYMM();
			}else if("10".equals(strYMDFlg)){
				strYMD = DateUtil.getYY();
			}
			
			String strPrefixYMDFlg = billPdMain.getString("PREFIX_YMDFLG");
			if("10".equals(strPrefixYMDFlg)) {
				getTypeName = getTypeName + strYMD;
			}
			pd.put("getTypeName", getTypeName);
			//获取当前的编号
			PageData billPd = (PageData)dao.findForObject("BillnoMapper.findByBillTypeAndTypeName", pd);
			if(null == billPd){
				//新增子项信息
				if(StringUtil.isNotNullParam(strPreFix)){
					pd.put("billPreFix", strPreFix);
				}else{
					pd.put("billPreFix", billPdMain.get("BILLNO_PREFIX"));
				}
				dao.save("BillnoMapper.saveBillDetail", pd);
				
				billPd = (PageData)dao.findForObject("BillnoMapper.findByBillTypeAndTypeName", pd);
			}

			if(null != billPd) {
				Object strNowNo = billPd.get("BILLNO_NOWNO");
				
				System.out.println("strNowNo:"+strNowNo);
				int intNowNo = Integer.parseInt(strNowNo.toString());
				intNowNo = intNowNo + 1;
				
				//超过8位从1开始
				int intLen = billPd.getInt("BILLNO_LEN");
				String strZ = StringUtil.autoZeroString(intLen);
				int intMax = StringUtil.stringToInteger("1" + strZ);
				if(intNowNo >= intMax){
					intNowNo = 1;
				}
				//更新现有的编号
				billPd.put("BILLNO_NOWNO", StringUtil.IntegerToString(intNowNo));
				dao.update("BillnoMapper.editBillDetail", billPd);
				
				String prefixBill = StringUtil.trimStr(billPd.getString("BILLNO_PREFIX"));
				String strNo = StringUtil.autoGenericCode(intNowNo,intLen);
				strBillNo = prefixBill + strYMD + strNo;
				
				return strBillNo;
			}else {
				return "";
			}
		}else{
			return "";
		}
		
	}
	
	/**通过id查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findFunctionValue(PageData pd) throws Exception {
		List<PageData> list = (List<PageData>)dao.findForList("BillnoMapper.findFunctionValue", pd);
		if(list != null && list.size() > 0){
			PageData pdTemp = (PageData)list.get(0);
			return pdTemp;
		}else{
			return null;
		}
		
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("BillnoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void edit(PageData pd)throws Exception{
		dao.update("BillnoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BillnoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BillnoMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BillnoMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BillnoMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

