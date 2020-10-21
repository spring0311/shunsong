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
					
					<form action="material/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MATERIAL_ID" id="MATERIAL_ID" value="${pd.MATERIAL_ID}"/>
						<input type="hidden" name="TYPE" id="TYPE" value="20"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">:</td>
								<td><input type="text" name="MATERIAL_ID" id="MATERIAL_ID" value="${pd.MATERIAL_ID}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">材料编号:</td>
								<td ><input type="text" name="MATERIAL_CODE" id="MATERIAL_CODE" value="${pd.MATERIAL_CODE}" maxlength="" placeholder="这里输入物料编号" title="物料编号" style="width:98%;"/></td>
							</tr>	
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">材料名称:</td>
								<td ><input type="text" name="MATERIAL_NAME" id="MATERIAL_NAME" value="${pd.MATERIAL_NAME}" maxlength="" placeholder="这里输入物料名称" title="物料名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">材料规格:</td>
								<td ><input type="text" name="MATERIAL_SPEC" id="MATERIAL_SPEC" value="${pd.MATERIAL_SPEC}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
							</tr>							
							<%-- <tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">厚度:</td>
								<td><input type="text" name="THICKNESS_NUM" id="THICKNESS_NUM" value="${pd.THICKNESS_NUM}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
								<td style="width:80px;text-align: right;padding-top: 13px;">实际厚度:</td>
								<td><input type="text" name="THICKNESS_NUM_REAL" id="THICKNESS_NUM_REAL" value="${pd.THICKNESS_NUM_REAL}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">宽度:</td>
								<td><input type="text" name="WIDTH_NUM" id="WIDTH_NUM" value="${pd.WIDTH_NUM}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
								<td style="width:80px;text-align: right;padding-top: 13px;">实际宽度:</td>
								<td><input type="text" name="WIDTH_NUM_REAL" id="WIDTH_NUM_REAL" value="${pd.WIDTH_NUM_REAL}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">长度:</td>
								<td><input type="text" name="LENGTH_NUM" id="LENGTH_NUM" value="${pd.LENGTH_NUM}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
								<td style="width:80px;text-align: right;padding-top: 13px;">实际长度:</td>
								<td><input type="text" name="LENGTH_NUM_REAL" id="LENGTH_NUM_REAL" value="${pd.LENGTH_NUM_REAL}" maxlength="" placeholder="这里输入物料规格" title="物料规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">采购单价:</td>
								<td colspan="3"><input type="number" name="PURCHASE_PRICE" id="PURCHASE_PRICE" value="${pd.PURCHASE_PRICE}" maxlength="" placeholder="这里输入采购单价" title="物料规格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">单件重量（kg）:</td>
								<td colspan="3"><input type="number" name="WEIGHT_LOGIC" id="WEIGHT_LOGIC" value="${pd.WEIGHT_LOGIC}" maxlength="" placeholder="这里输入单件重量" title="单件重量" style="width:98%;"/></td>
							</tr> --%>
							
							<%-- <tr>
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
							</tr> --%>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">录入员工编号:</td>
								<td ><input type="text" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}" readonly="readonly" maxlength="" placeholder="这里输入录入员工编号" title="录入员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">录入时间:</td>
								<td ><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" readonly="readonly" maxlength="" placeholder="这里输入录入时间" title="录入时间" style="width:98%;"/></td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改员工编号:</td>
								<td><input type="text" name="MODIFY_USER" id="MODIFY_USER" value="${pd.MODIFY_USER}" maxlength="" placeholder="这里输入修改员工编号" title="修改员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input type="text" name="MODIFY_DATE" id="MODIFY_DATE" value="${pd.MODIFY_DATE}" maxlength="" placeholder="这里输入修改时间" title="修改时间" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">备注:</td>
								<td >
								<textarea name="REMARK" id="REMARK" style="width:600px;height:80px;">${pd.REMARK}</textarea>
								</td>
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
			/* if($("#MATERIAL_ID").val()==""){
				$("#MATERIAL_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_ID").focus();
			return false;
			} */
			if($("#MATERIAL_CODE").val()==""){
				$("#MATERIAL_CODE").tips({
					side:3,
		            msg:'请输入物料编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_CODE").focus();
			return false;
			}
			if($("#MATERIAL_NAME").val()==""){
				$("#MATERIAL_NAME").tips({
					side:3,
		            msg:'请输入材料名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_NAME").focus();
			return false;
			}
			if($("#MATERIAL_SPEC").val()==""){
				$("#MATERIAL_SPEC").tips({
					side:3,
		            msg:'请输入材料规格',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_SPEC").focus();
			return false;
			}
			
			
			
			/* if($("#COMPANY_ID").val()==""){
				$("#COMPANY_ID").tips({
					side:3,
		            msg:'请输入公司ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANY_ID").focus();
			return false;
			} */
			/* if($("#DEPARTMENT_ID").val()==""){
				$("#DEPARTMENT_ID").tips({
					side:3,
		            msg:'请输入录入员工所在部门ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEPARTMENT_ID").focus();
			return false;
			} */
			/* if($("#GROUP_ID").val()==""){
				$("#GROUP_ID").tips({
					side:3,
		            msg:'请输入公司对应的集团公司ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUP_ID").focus();
			return false;
			} */
			/* if($("#CREATE_USER").val()==""){
				$("#CREATE_USER").tips({
					side:3,
		            msg:'请输入录入员工编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_USER").focus();
			return false;
			} */
			/* if($("#CREATE_DATE").val()==""){
				$("#CREATE_DATE").tips({
					side:3,
		            msg:'请输入录入时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_DATE").focus();
			return false;
			} */
			/* if($("#MODIFY_USER").val()==""){
				$("#MODIFY_USER").tips({
					side:3,
		            msg:'请输入修改员工编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODIFY_USER").focus();
			return false;
			}
			if($("#MODIFY_DATE").val()==""){
				$("#MODIFY_DATE").tips({
					side:3,
		            msg:'请输入修改时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODIFY_DATE").focus();
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
			} */
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