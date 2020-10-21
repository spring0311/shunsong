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
					
					<form action="materialselect/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MATERIALSELECT_ID" id="MATERIALSELECT_ID" value="${pd.MATERIALSELECT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料选择ID:</td>
								<td><input type="text" name="MATERIALSELECT_ID" id="MATERIALSELECT_ID" value="${pd.MATERIALSELECT_ID}" maxlength="" placeholder="这里输入物料选择ID" title="物料选择ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择类型（出入库类型）:</td>
								<td><input type="text" name="SELECT_TYPE" id="SELECT_TYPE" value="${pd.SELECT_TYPE}" maxlength="" placeholder="这里输入选择类型（出入库类型）" title="选择类型（出入库类型）" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">选择的状态:</td>
								<td><input type="text" name="SELECT_STATUS" id="SELECT_STATUS" value="${pd.SELECT_STATUS}" maxlength="" placeholder="这里输入选择的状态" title="选择的状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主单位数量:</td>
								<td><input type="text" name="PRIMARY_QTY" id="PRIMARY_QTY" value="${pd.PRIMARY_QTY}" maxlength="" placeholder="这里输入主单位数量" title="主单位数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">主单位:</td>
								<td><input type="text" name="PRIMARY_UNIT" id="PRIMARY_UNIT" value="${pd.PRIMARY_UNIT}" maxlength="" placeholder="这里输入主单位" title="主单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">辅单位数量:</td>
								<td><input type="text" name="SECOND_QTY" id="SECOND_QTY" value="${pd.SECOND_QTY}" maxlength="" placeholder="这里输入辅单位数量" title="辅单位数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">辅单位:</td>
								<td><input type="text" name="SECOND_UNIT" id="SECOND_UNIT" value="${pd.SECOND_UNIT}" maxlength="" placeholder="这里输入辅单位" title="辅单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料质量等级:</td>
								<td><input type="text" name="QUALITY_LEVEL" id="QUALITY_LEVEL" value="${pd.QUALITY_LEVEL}" maxlength="" placeholder="这里输入物料质量等级" title="物料质量等级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料ID:</td>
								<td><input type="text" name="MATERIAL_ID" id="MATERIAL_ID" value="${pd.MATERIAL_ID}" maxlength="" placeholder="这里输入物料ID" title="物料ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料条码:</td>
								<td><input type="text" name="MATERIAL_BARCODE" id="MATERIAL_BARCODE" value="${pd.MATERIAL_BARCODE}" maxlength="" placeholder="这里输入物料条码" title="物料条码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物料批次号:</td>
								<td><input type="text" name="MATERIAL_LOTCODE" id="MATERIAL_LOTCODE" value="${pd.MATERIAL_LOTCODE}" maxlength="" placeholder="这里输入物料批次号" title="物料批次号" style="width:98%;"/></td>
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
			if($("#MATERIALSELECT_ID").val()==""){
				$("#MATERIALSELECT_ID").tips({
					side:3,
		            msg:'请输入物料选择ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIALSELECT_ID").focus();
			return false;
			}
			if($("#SELECT_TYPE").val()==""){
				$("#SELECT_TYPE").tips({
					side:3,
		            msg:'请输入选择类型（出入库类型）',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_TYPE").focus();
			return false;
			}
			if($("#SELECT_STATUS").val()==""){
				$("#SELECT_STATUS").tips({
					side:3,
		            msg:'请输入选择的状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_STATUS").focus();
			return false;
			}
			if($("#PRIMARY_QTY").val()==""){
				$("#PRIMARY_QTY").tips({
					side:3,
		            msg:'请输入主单位数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRIMARY_QTY").focus();
			return false;
			}
			if($("#PRIMARY_UNIT").val()==""){
				$("#PRIMARY_UNIT").tips({
					side:3,
		            msg:'请输入主单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRIMARY_UNIT").focus();
			return false;
			}
			if($("#SECOND_QTY").val()==""){
				$("#SECOND_QTY").tips({
					side:3,
		            msg:'请输入辅单位数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SECOND_QTY").focus();
			return false;
			}
			if($("#SECOND_UNIT").val()==""){
				$("#SECOND_UNIT").tips({
					side:3,
		            msg:'请输入辅单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SECOND_UNIT").focus();
			return false;
			}
			if($("#QUALITY_LEVEL").val()==""){
				$("#QUALITY_LEVEL").tips({
					side:3,
		            msg:'请输入物料质量等级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUALITY_LEVEL").focus();
			return false;
			}
			if($("#MATERIAL_ID").val()==""){
				$("#MATERIAL_ID").tips({
					side:3,
		            msg:'请输入物料ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_ID").focus();
			return false;
			}
			if($("#MATERIAL_BARCODE").val()==""){
				$("#MATERIAL_BARCODE").tips({
					side:3,
		            msg:'请输入物料条码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_BARCODE").focus();
			return false;
			}
			if($("#MATERIAL_LOTCODE").val()==""){
				$("#MATERIAL_LOTCODE").tips({
					side:3,
		            msg:'请输入物料批次号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_LOTCODE").focus();
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