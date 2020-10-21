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
					
					<form action="hrmanpower/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="HRMANPOWER_ID" id="HRMANPOWER_ID" value="${pd.HRMANPOWER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">:</td>
								<td><input type="text" name="MANPOWER_ID" id="MANPOWER_ID" value="${pd.MANPOWER_ID}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">工作日期:</td>
								<td><input type="text"  class="span10 date-picker" data-date-format="yyyy-mm-dd" readonly="readonly" name="WORK_DATE" id="WORK_DATE" value="${pd.WORK_DATE}" maxlength="" placeholder="这里输入工作日期" title="工作日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">正常上班人数:</td>
								<td><input type="text" name="WORKTIME_NUMBER" id="WORKTIME_NUMBER" value="${pd.WORKTIME_NUMBER}" maxlength="" placeholder="这里输入正常上班人数" title="正常上班人数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">正常上班时间(单位：小时):</td>
								<td><input type="text" name="WORKTIME_TIME" id="WORKTIME_TIME" value="${pd.WORKTIME_TIME}" maxlength="" placeholder="这里输入正常上班时间" title="正常上班时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">加班人数:</td>
								<td><input type="text" name="OVERTIME_NUMBER" id="OVERTIME_NUMBER" value="${pd.OVERTIME_NUMBER}" maxlength="" placeholder="这里输入加班人数" title="加班人数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">加班时间(单位：小时):</td>
								<td><input type="text" name="OVERTIME_TIME" id="OVERTIME_TIME" value="${pd.OVERTIME_TIME}" maxlength="" placeholder="这里输入加班时间" title="加班时间" style="width:98%;"/></td>
							</tr>
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
								<td><input type="text" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}" readonly="readonly" maxlength="" placeholder="这里输入录入员工编号" title="录入员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">录入时间:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="" readonly="readonly" placeholder="这里输入录入时间" title="录入时间" style="width:98%;"/></td>
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
			/* if($("#MANPOWER_ID").val()==""){
				$("#MANPOWER_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MANPOWER_ID").focus();
			return false;
			} */
			if($("#WORK_DATE").val()==""){
				$("#WORK_DATE").tips({
					side:3,
		            msg:'请输入工作日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORK_DATE").focus();
			return false;
			}
			if($("#WORKTIME_NUMBER").val()==""){
				$("#WORKTIME_NUMBER").tips({
					side:3,
		            msg:'请输入正常上班人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORKTIME_NUMBER").focus();
			return false;
			}
			if($("#WORKTIME_TIME").val()==""){
				$("#WORKTIME_TIME").tips({
					side:3,
		            msg:'请输入正常上班时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORKTIME_TIME").focus();
			return false;
			}
			if($("#OVERTIME_NUMBER").val()==""){
				$("#OVERTIME_NUMBER").tips({
					side:3,
		            msg:'请输入加班人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OVERTIME_NUMBER").focus();
			return false;
			}
			if($("#OVERTIME_TIME").val()==""){
				$("#OVERTIME_TIME").tips({
					side:3,
		            msg:'请输入加班时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OVERTIME_TIME").focus();
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
			} */
			/* if($("#REMARK").val()==""){
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