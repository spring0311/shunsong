<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="orderapplydetail/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PORDER_APPLY_DETAIL_ID" id="PORDER_APPLY_DETAIL_ID" value="${pd.PORDER_APPLY_DETAIL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">:</td>
								<td><input type="text" name="PORDER_APPLY_DETAIL_ID" id="PORDER_APPLY_DETAIL_ID" value="${pd.PORDER_APPLY_DETAIL_ID}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">:</td>
								<td><input type="text" name="PORDER_APPLY_ID" id="PORDER_APPLY_ID" value="${pd.PORDER_APPLY_ID}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">采购订单序号:</td>
								<td><input type="text" name="PORDER_APPLY_DETAIL_NO" id="PORDER_APPLY_DETAIL_NO" value="${pd.PORDER_APPLY_DETAIL_NO}" maxlength="" placeholder="这里输入采购订单序号" title="采购订单序号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商ID:</td>
								<td><input type="text" name="PROVIDER_ID" id="PROVIDER_ID" value="${pd.PROVIDER_ID}" maxlength="" placeholder="这里输入供应商ID" title="供应商ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供应商名称:</td>
								<td><input type="text" name="PROVIDER_NAME" id="PROVIDER_NAME" value="${pd.PROVIDER_NAME}" maxlength="" placeholder="这里输入供应商名称" title="供应商名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料编号:</td>
								<td><input type="text" name="MATERIAL_ID" id="MATERIAL_ID" value="${pd.MATERIAL_ID}" maxlength="" placeholder="这里输入物料编号" title="物料编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料名称:</td>
								<td><input type="text" name="MATERIAL_NAME" id="MATERIAL_NAME" value="${pd.MATERIAL_NAME}" maxlength="" placeholder="这里输入物料名称" title="物料名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料规格:</td>
								<td><input type="text" name="MATERIAL_SPEC" id="MATERIAL_SPEC" value="${pd.MATERIAL_SPEC}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料数量:</td>
								<td><input type="number" name="MATERIAL_NUM" id="MATERIAL_NUM" value="${pd.MATERIAL_NUM}" maxlength="32" placeholder="这里输入物料数量" title="物料数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料重量:</td>
								<td><input type="text" name="MATERIAL_WEIGHT" id="MATERIAL_WEIGHT" value="${pd.MATERIAL_WEIGHT}" maxlength="" placeholder="这里输入物料重量" title="物料重量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料单价:</td>
								<td><input type="text" name="MATERIAL_PRICE" id="MATERIAL_PRICE" value="${pd.MATERIAL_PRICE}" maxlength="" placeholder="这里输入物料单价" title="物料单价" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">单位:</td>
								<td><input type="text" name="MATERIAL_UNIT" id="MATERIAL_UNIT" value="${pd.MATERIAL_UNIT}" maxlength="" placeholder="这里输入单位" title="单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">总金额:</td>
								<td><input type="text" name="TOTAL_AMT" id="TOTAL_AMT" value="${pd.TOTAL_AMT}" maxlength="" placeholder="这里输入总金额" title="总金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">包装方式:</td>
								<td><input type="text" name="PACK_TYPE" id="PACK_TYPE" value="${pd.PACK_TYPE}" maxlength="" placeholder="这里输入包装方式" title="包装方式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">交货日期:</td>
								<td><input type="text" name="DELIVERY_DATE" id="DELIVERY_DATE" value="${pd.DELIVERY_DATE}" maxlength="" placeholder="这里输入交货日期" title="交货日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源单据ID:</td>
								<td><input type="text" name="FROM_ID" id="FROM_ID" value="${pd.FROM_ID}" maxlength="" placeholder="这里输入来源单据ID" title="来源单据ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源单据号:</td>
								<td><input type="text" name="FROM_NO" id="FROM_NO" value="${pd.FROM_NO}" maxlength="" placeholder="这里输入来源单据号" title="来源单据号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司ID:</td>
								<td><input type="text" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="" placeholder="这里输入公司ID" title="公司ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">录入员工所在部门ID:</td>
								<td><input type="text" name="DEPARTMENT_ID" id="DEPARTMENT_ID" value="${pd.DEPARTMENT_ID}" maxlength="" placeholder="这里输入录入员工所在部门ID" title="录入员工所在部门ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公司对应的集团公司ID:</td>
								<td><input type="text" name="GROUP_ID" id="GROUP_ID" value="${pd.GROUP_ID}" maxlength="" placeholder="这里输入公司对应的集团公司ID" title="公司对应的集团公司ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">录入员工编号:</td>
								<td><input type="text" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}" maxlength="" placeholder="这里输入录入员工编号" title="录入员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">录入时间:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="" placeholder="这里输入录入时间" title="录入时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改员工编号:</td>
								<td><input type="text" name="UPDATE_USER" id="UPDATE_USER" value="${pd.UPDATE_USER}" maxlength="" placeholder="这里输入修改员工编号" title="修改员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input type="text" name="UPDATE_DATE" id="UPDATE_DATE" value="${pd.UPDATE_DATE}" maxlength="" placeholder="这里输入修改时间" title="修改时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">订单状态；10，新增；20，已提交；80，已完成:</td>
								<td><input type="text" name="DETAIL_STATUS" id="DETAIL_STATUS" value="${pd.DETAIL_STATUS}" maxlength="" placeholder="这里输入订单状态；10，新增；20，已提交；80，已完成" title="订单状态；10，新增；20，已提交；80，已完成" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">扩展字段1:</td>
								<td><input type="text" name="EXT1" id="EXT1" value="${pd.EXT1}" maxlength="" placeholder="这里输入扩展字段1" title="扩展字段1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">扩展字段2:</td>
								<td><input type="text" name="EXT2" id="EXT2" value="${pd.EXT2}" maxlength="" placeholder="这里输入扩展字段2" title="扩展字段2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">扩展字段3:</td>
								<td><input type="text" name="EXT3" id="EXT3" value="${pd.EXT3}" maxlength="" placeholder="这里输入扩展字段3" title="扩展字段3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">扩展字段4:</td>
								<td><input type="text" name="EXT4" id="EXT4" value="${pd.EXT4}" maxlength="" placeholder="这里输入扩展字段4" title="扩展字段4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">扩展字段5:</td>
								<td><input type="text" name="EXT5" id="EXT5" value="${pd.EXT5}" maxlength="" placeholder="这里输入扩展字段5" title="扩展字段5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#PORDER_APPLY_DETAIL_ID").val()==""){
				$("#PORDER_APPLY_DETAIL_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PORDER_APPLY_DETAIL_ID").focus();
			return false;
			}
			if($("#PORDER_APPLY_ID").val()==""){
				$("#PORDER_APPLY_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PORDER_APPLY_ID").focus();
			return false;
			}
			if($("#PORDER_APPLY_DETAIL_NO").val()==""){
				$("#PORDER_APPLY_DETAIL_NO").tips({
					side:3,
		            msg:'请输入采购订单序号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PORDER_APPLY_DETAIL_NO").focus();
			return false;
			}
			if($("#PROVIDER_ID").val()==""){
				$("#PROVIDER_ID").tips({
					side:3,
		            msg:'请输入供应商ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVIDER_ID").focus();
			return false;
			}
			if($("#PROVIDER_NAME").val()==""){
				$("#PROVIDER_NAME").tips({
					side:3,
		            msg:'请输入供应商名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVIDER_NAME").focus();
			return false;
			}
			if($("#MATERIAL_ID").val()==""){
				$("#MATERIAL_ID").tips({
					side:3,
		            msg:'请输入物料编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_ID").focus();
			return false;
			}
			if($("#MATERIAL_NAME").val()==""){
				$("#MATERIAL_NAME").tips({
					side:3,
		            msg:'请输入物料名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_NAME").focus();
			return false;
			}
			if($("#MATERIAL_SPEC").val()==""){
				$("#MATERIAL_SPEC").tips({
					side:3,
		            msg:'请输入物料规格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_SPEC").focus();
			return false;
			}
			if($("#MATERIAL_NUM").val()==""){
				$("#MATERIAL_NUM").tips({
					side:3,
		            msg:'请输入物料数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_NUM").focus();
			return false;
			}
			if($("#MATERIAL_WEIGHT").val()==""){
				$("#MATERIAL_WEIGHT").tips({
					side:3,
		            msg:'请输入物料重量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_WEIGHT").focus();
			return false;
			}
			if($("#MATERIAL_PRICE").val()==""){
				$("#MATERIAL_PRICE").tips({
					side:3,
		            msg:'请输入物料单价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_PRICE").focus();
			return false;
			}
			if($("#MATERIAL_UNIT").val()==""){
				$("#MATERIAL_UNIT").tips({
					side:3,
		            msg:'请输入单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_UNIT").focus();
			return false;
			}
			if($("#TOTAL_AMT").val()==""){
				$("#TOTAL_AMT").tips({
					side:3,
		            msg:'请输入总金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TOTAL_AMT").focus();
			return false;
			}
			if($("#PACK_TYPE").val()==""){
				$("#PACK_TYPE").tips({
					side:3,
		            msg:'请输入包装方式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PACK_TYPE").focus();
			return false;
			}
			if($("#DELIVERY_DATE").val()==""){
				$("#DELIVERY_DATE").tips({
					side:3,
		            msg:'请输入交货日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DELIVERY_DATE").focus();
			return false;
			}
			if($("#FROM_ID").val()==""){
				$("#FROM_ID").tips({
					side:3,
		            msg:'请输入来源单据ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_ID").focus();
			return false;
			}
			if($("#FROM_NO").val()==""){
				$("#FROM_NO").tips({
					side:3,
		            msg:'请输入来源单据号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_NO").focus();
			return false;
			}
			if($("#COMPANY_ID").val()==""){
				$("#COMPANY_ID").tips({
					side:3,
		            msg:'请输入公司ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANY_ID").focus();
			return false;
			}
			if($("#DEPARTMENT_ID").val()==""){
				$("#DEPARTMENT_ID").tips({
					side:3,
		            msg:'请输入录入员工所在部门ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEPARTMENT_ID").focus();
			return false;
			}
			if($("#GROUP_ID").val()==""){
				$("#GROUP_ID").tips({
					side:3,
		            msg:'请输入公司对应的集团公司ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUP_ID").focus();
			return false;
			}
			if($("#CREATE_USER").val()==""){
				$("#CREATE_USER").tips({
					side:3,
		            msg:'请输入录入员工编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_USER").focus();
			return false;
			}
			if($("#CREATE_DATE").val()==""){
				$("#CREATE_DATE").tips({
					side:3,
		            msg:'请输入录入时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_DATE").focus();
			return false;
			}
			if($("#UPDATE_USER").val()==""){
				$("#UPDATE_USER").tips({
					side:3,
		            msg:'请输入修改员工编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_USER").focus();
			return false;
			}
			if($("#UPDATE_DATE").val()==""){
				$("#UPDATE_DATE").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_DATE").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			if($("#DETAIL_STATUS").val()==""){
				$("#DETAIL_STATUS").tips({
					side:3,
		            msg:'请输入订单状态；10，新增；20，已提交；80，已完成',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DETAIL_STATUS").focus();
			return false;
			}
			if($("#EXT1").val()==""){
				$("#EXT1").tips({
					side:3,
		            msg:'请输入扩展字段1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXT1").focus();
			return false;
			}
			if($("#EXT2").val()==""){
				$("#EXT2").tips({
					side:3,
		            msg:'请输入扩展字段2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXT2").focus();
			return false;
			}
			if($("#EXT3").val()==""){
				$("#EXT3").tips({
					side:3,
		            msg:'请输入扩展字段3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXT3").focus();
			return false;
			}
			if($("#EXT4").val()==""){
				$("#EXT4").tips({
					side:3,
		            msg:'请输入扩展字段4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXT4").focus();
			return false;
			}
			if($("#EXT5").val()==""){
				$("#EXT5").tips({
					side:3,
		            msg:'请输入扩展字段5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXT5").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>