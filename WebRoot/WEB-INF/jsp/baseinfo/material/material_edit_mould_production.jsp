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
						<input type="hidden" name="TYPE" id="TYPE" value="50"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">产品代码:</td>
								<td><input type="text" name="MATERIAL_CODE" id="MATERIAL_CODE" value="${pd.MATERIAL_CODE}" maxlength="" placeholder="这里输入文件编号" title="文件编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">产品名称:</td>
								<td><input type="text" name="MATERIAL_NAME" id="MATERIAL_NAME" value="${pd.MATERIAL_NAME}" maxlength="" placeholder="这里输入物料名称" title="物料名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">产品规格:</td>
								<td><input type="text" name="MATERIAL_SPEC" id="MATERIAL_SPEC" value="${pd.MATERIAL_SPEC}" maxlength="" placeholder="这里输入物料名称" title="物料名称" style="width:98%;"/></td>
							</tr>						
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">录入员工编号:</td>
								<td><input type="text" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}" readonly="readonly" maxlength="" placeholder="这里输入录入员工编号" title="录入员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">录入时间:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" readonly="readonly" maxlength="" placeholder="这里输入录入时间" title="录入时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">备注:</td>
								<td>
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
			if($("#MATERIAL_NAME").val()==""){
				$("#MATERIAL_NAME").tips({
					side:3,
		            msg:'请输入产品名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_NAME").focus();
			return false;
			}
			if($("#MATERIAL_CODE").val()==""){
				$("#MATERIAL_CODE").tips({
					side:3,
		            msg:'请输入产品代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_CODE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show(); 
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			var dropdownFlag = '${pd.DROPDOWN_FLAG}';
			if( 'Y' == dropdownFlag){
				$("#DROPDOWN_FLAG").attr('checked','true');
			}
			var typeNo = '${pd.TYPE_NO}';
			if(typeNo){
				$("#"+typeNo).attr('checked','checked');
			}
		});
		</script>
</body>
</html>