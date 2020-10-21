package com.shunsong.util;

/**
 * 项目名称：
 * @author:fh qq313596790[青苔]
 * 修改日期：2015/11/2
*/
public class ConstProduction {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";//验证码

	/**工单正在加工
	 */
	public static final String WORK_STATUS_10 = "10"; //工单正在加工
	/**工单已派工状态
	 */
	public static final String WORK_STATUS_20 = "20"; //工单已派工状态
	/**工单初始状态
	 */
	public static final String WORK_STATUS_30 = "30"; //工单初始状态
	/**工单已完成状态
	 */
	public static final String WORK_STATUS_40 = "40"; //工单已完成状态
	/**工单手工关闭状态
	 */
	public static final String WORK_STATUS_50 = "50"; //工单手工关闭状态
	
	/**订单提交状态
	 */
	public static final String DEMAND_STATUS_30 = "30"; //订单提交状态
	/**订单结束状态
	 */
	public static final String DEMAND_STATUS_80 = "80"; //订单结束状态
	/**订单手工关闭状态
	 */
	public static final String DEMAND_STATUS_90 = "90"; //订单手工关闭状态

	public static final String DEMAND_DEPUTE_FLAG_10 = "10";//外协
	public static final String DEMAND_DEPUTE_FLAG_20 = "20";//厂内加工
	
	public static final String WINSTOCK_FROM_TYPE_PRODUCTION = "PRODUCTION";//生产
	public static final String WINSTOCK_FROM_TYPE_REJECT = "REJECT";//报废
	public static final String WINSTOCK_FROM_TYPE_MOULDINFO = "MOULDINFO";//模具档案
	
	/**模具配件
	 */
	public static final String MATERIAL_TYPE_10 = "10"; //模具配件
	/**原材料
	 */
	public static final String MATERIAL_TYPE_20 = "20"; //材料
	/**模具
	 */
	public static final String MATERIAL_TYPE_30 = "30"; //模具
	/**辅料
	 */
	public static final String MATERIAL_TYPE_40 = "40"; //辅料
	/**产品
	 */
	public static final String MATERIAL_TYPE_50 = "50"; //产品
	/**半成品
	 */
	public static final String MATERIAL_TYPE_60 = "60"; //半成品
	
	/**原料捆包
	 */
	public static final String SERIAL_TYPE_MATERIAL = "10"; //原料捆包
	/**产品捆包
	 */
	public static final String SERIAL_TYPE_PRODUCT = "20"; //产品捆包
	/**半成品捆包
	 */
	public static final String SERIAL_TYPE_SEMI_PRODUCT = "30"; //半成品捆包
	/**单个产品
	 */
	public static final String SERIAL_TYPE_SINGLE_PRODUCT = "40"; //单个产品
	
	/**正品捆包
	 */
	public static final String SERIAL_QC_OK = "10"; //正品捆包
	/**NG品捆包
	 */
	public static final String SERIAL_QC_NG = "20"; //NG品捆包
	/**封闭捆包
	 */
	public static final String SERIAL_QC_CLOSED = "30"; //封闭捆包
	
	/**并包标志：单个捆包
	 */
	public static final String SERIAL_MERGE_SINGLE = "10"; //单个捆包
	/**并包标志：并包的子捆包
	 */
	public static final String SERIAL_MERGE_DETAIL = "20"; //并包捆包
	/**并包标志：并包的主捆包
	 */
	public static final String SERIAL_MERGE_MAIN = "30"; //并包的主捆包
	
	/**捆包履历类型:初始生成
	 */
	public static final String SERIAL_LIFE_TYPE_INIT = "10"; //捆包履历类型:初始生成
	/**捆包履历类型:采购入库
	 */
	public static final String SERIAL_LIFE_TYPE_POIN = "20"; //采购入库
	/**捆包履历类型:生产领用
	 */
	public static final String SERIAL_LIFE_TYPE_FEED = "30"; //捆包履历类型:生产领用
	/**捆包履历类型:生产领用消耗完
	 */
	public static final String SERIAL_LIFE_TYPE_FEED_OUT = "32"; //捆包履历类型:生产领用消耗完
	/**捆包履历类型:生产中
	 */
	public static final String SERIAL_LIFE_TYPE_MAKING = "40"; //捆包履历类型:生产中
	/**捆包履历类型:工序生产完成
	 */
	public static final String SERIAL_LIFE_TYPE_MAKEND = "50"; //捆包履历类型:生产完成
	/**捆包履历类型:流水线下线
	 */
	public static final String SERIAL_LIFE_TYPE_ASSEMBLY_OFFLINE = "51"; //捆包履历类型:流水线下线
	/**捆包履历类型:生产入库
	 */
	public static final String SERIAL_LIFE_TYPE_MAKEIN = "60"; //捆包履历类型:生产入库
	/**捆包履历类型:销售出库
	 */
	public static final String SERIAL_LIFE_TYPE_SALEOUT = "70"; //捆包履历类型:销售出库
	/**捆包履历类型:并包
	 */
	public static final String SERIAL_LIFE_TYPE_PACKING = "80"; //捆包履历类型:并包
	/**捆包履历类型:拆包
	 */
	public static final String SERIAL_LIFE_TYPE_UNPACKING = "90"; //捆包履历类型:拆包
	/**捆包履历类型:作废
	 */
	public static final String SERIAL_LIFE_TYPE_INVALID = "99"; //捆包履历类型:作废
	
	/**原料管理部门
	 */
	public static final String DEPT_FUNC_MATERIAL = "MATERIALDEPT"; 
	/**包装管理部门
	 */
	public static final String DEPT_FUNC_PACKAGE = "PACKAGEDEPT"; 
	/**制造部门
	 */
	public static final String DEPT_FUNC_MAKE = "MAKEDEPT"; 
	/**成品仓储部门
	 */
	public static final String DEPT_FUNC_PRODUCT = "PRODUCTDEPT"; 
	/**通用（所有）部门
	 */
	public static final String DEPT_FUNC_GENERAL = "GENERALDEPT"; 
	
	/**原料入库
	 */
	public static final String APP_TASK_MATERIAL_INPUT = "MATERIAL_INPUT"; 
	/**包装实绩
	 */
	public static final String APP_TASK_PACKAGE_ACTUAL = "PACKAGE_ACTUAL"; 
	/**生产实绩
	 */
	public static final String APP_TASK_MAKE_ACTUAL = "MAKE_ACTUAL"; 
	/**成品入库
	 */
	public static final String APP_TASK_PRODUCT_INPUT = "PRODUCT_INPUT"; 
	/**库存盘点
	 */
	public static final String APP_TASK_CHECK_STOCK = "CHECK_STOCK"; 
	
	/**原料投料加工
	 */
	public static final String MAKE_MODE_MATERIAL_FEED = "MAKEMODE10"; 
	/**半成品一对一加工
	 */
	public static final String MAKE_MODE_BLANK_ONEBYONE = "MAKEMODE20"; 
	/**半成品集批加工
	 */
	public static final String MAKE_MODE_BLANK_BATCH = "MAKEMODE30"; 
	/**成品一对多挑选
	 */
	public static final String MAKE_MODE_PRODUCT_SELECT_ONE_TO_MORE = "MAKEMODE40";
	/**流水线加工
	 */
	public static final String MAKE_MODE_ASSEMBLY = "MAKEMODE50";
	/**流水线-下线
	 */
	public static final String ASSEMBLY_SON_OFFLINE = "ASSEMBLYSONTYPE30";
	/**流水线-中间工序
	 */
	public static final String ASSEMBLY_SON_MIDDLE = "ASSEMBLYSONTYPE20";
	/**流水线-上线
	 */
	public static final String ASSEMBLY_SON_ONLINE = "ASSEMBLYSONTYPE10";
}
