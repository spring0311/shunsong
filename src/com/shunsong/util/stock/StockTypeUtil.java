package com.shunsong.util.stock;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.util.JSONPObject;

import com.shunsong.util.Const;
import com.shunsong.util.Logger;
import com.shunsong.util.MapDistance;
import com.shunsong.util.PageData;

/** 接口参数校验
 * @author:	fh qq313596790[青苔]
 * 修改日期：2015/11/2
 */
public class StockTypeUtil  {
	
	protected static Logger logger = Logger.getLogger(StockTypeUtil.class);
	
	/**根据入库类型获取库存类型
	 * @param method
	 * @param pd
	 * @return
	 */
	public static String getStockhandTypeByInstockType(String strInstockType){
		String strStockhandType = "";
		if("CYSCRK".equals(strInstockType)){
			//冲压件
			strStockhandType = "CP";
		}else if("YLCGRK".equals(strInstockType)){
			//原料
			strStockhandType = "YL";
		}else if("CYTLRK".equals(strInstockType)){
			//原料，冲压退料
			strStockhandType = "YL";
		}else if("CNCSCRK".equals(strInstockType)){
			//CNC件
			strStockhandType = "CP";
		}else if("CPSCRK".equals(strInstockType)){
			//成品件，组装入库
			strStockhandType = "CP";
		}else{
			//其他产品
			strStockhandType = "CP";
		}
		return strStockhandType;
	}
	
	/**根据入库类型获取库存类型
	 * @param method
	 * @param pd
	 * @return
	 */
	public static String getStockhandTypeByOutstockType(String strOutstockType){
		String strStockhandType = "";
		if("YJLLCK".equals(strOutstockType)){
			//CNC件，阳极领料出库
			strStockhandType = "CP";
		}else if("CNCLLCK".equals(strOutstockType)){
			//CNC领料，冲压件
			strStockhandType = "CP";
		}else if("CYLLCK".equals(strOutstockType)){
			//原料，冲压领料
			strStockhandType = "YL";
		}else if("CPXSCK".equals(strOutstockType)){
			//成品销售出库，成品
			strStockhandType = "CP";
		}else{
			//其他产品
			strStockhandType = "OTHER";
		}
		return strStockhandType;
	}
	
	
}
