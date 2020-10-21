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
					
					<form action="tradeunitlinkman/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TRADEUNITLINKMAN_ID" id="TRADEUNITLINKMAN_ID" value="${pd.TRADEUNITLINKMAN_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">:</td>
								<td><input type="text" name="LINKMAN_ID" id="LINKMAN_ID" value="${pd.LINKMAN_ID}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">:</td>
								<td><input type="text" name="TRADEUNIT_ID" id="TRADEUNIT_ID" value="${pd.TRADEUNIT_ID}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人姓名:</td>
								<td><input type="text" name="LINKMAN_NAME" id="LINKMAN_NAME" value="${pd.LINKMAN_NAME}" maxlength="" placeholder="这里输入联系人姓名" title="联系人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人手机:</td>
								<td><input type="text" name="MOBILE_NO" id="MOBILE_NO" value="${pd.MOBILE_NO}" maxlength="" placeholder="这里输入联系人手机" title="联系人手机" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人电话:</td>
								<td><input type="text" name="TELPHONE_NO" id="TELPHONE_NO" value="${pd.TELPHONE_NO}" maxlength="" placeholder="这里输入联系人电话" title="联系人电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人传真:</td>
								<td><input type="text" name="FAX_NO" id="FAX_NO" value="${pd.FAX_NO}" maxlength="" placeholder="这里输入联系人传真" title="联系人传真" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人办公地址:</td>
								<td><input type="text" name="OFFICE_ADDRESS_INFO" id="OFFICE_ADDRESS_INFO" value="${pd.OFFICE_ADDRESS_INFO}" maxlength="" placeholder="这里输入联系人办公地址" title="联系人办公地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人家庭地址:</td>
								<td><input type="text" name="HOME_ADDRESS_INFO" id="HOME_ADDRESS_INFO" value="${pd.HOME_ADDRESS_INFO}" maxlength="" placeholder="这里输入联系人家庭地址" title="联系人家庭地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人的职位信息:</td>
								<td><input type="text" name="POSITION_INFO" id="POSITION_INFO" value="${pd.POSITION_INFO}" maxlength="" placeholder="这里输入联系人的职位信息" title="联系人的职位信息" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人是否在职（1：在职；2：离职）:</td>
								<td><input type="text" name="IS_JOB" id="IS_JOB" value="${pd.IS_JOB}" maxlength="" placeholder="这里输入联系人是否在职（1：在职；2：离职）" title="联系人是否在职（1：在职；2：离职）" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关联联系人ID，用于记录联系人离职之前的所在公司信息:</td>
								<td><input type="text" name="REF_LINKMAN_ID" id="REF_LINKMAN_ID" value="${pd.REF_LINKMAN_ID}" maxlength="" placeholder="这里输入关联联系人ID，用于记录联系人离职之前的所在公司信息" title="关联联系人ID，用于记录联系人离职之前的所在公司信息" style="width:98%;"/></td>
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
								<td><input type="text" name="MODIFY_USER" id="MODIFY_USER" value="${pd.MODIFY_USER}" maxlength="" placeholder="这里输入修改员工编号" title="修改员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td><input type="text" name="MODIFY_DATE" id="MODIFY_DATE" value="${pd.MODIFY_DATE}" maxlength="" placeholder="这里输入修改时间" title="修改时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
			if($("#LINKMAN_ID").val()==""){
				$("#LINKMAN_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LINKMAN_ID").focus();
			return false;
			}
			if($("#TRADEUNIT_ID").val()==""){
				$("#TRADEUNIT_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TRADEUNIT_ID").focus();
			return false;
			}
			if($("#LINKMAN_NAME").val()==""){
				$("#LINKMAN_NAME").tips({
					side:3,
		            msg:'请输入联系人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LINKMAN_NAME").focus();
			return false;
			}
			if($("#MOBILE_NO").val()==""){
				$("#MOBILE_NO").tips({
					side:3,
		            msg:'请输入联系人手机',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MOBILE_NO").focus();
			return false;
			}
			if($("#TELPHONE_NO").val()==""){
				$("#TELPHONE_NO").tips({
					side:3,
		            msg:'请输入联系人电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TELPHONE_NO").focus();
			return false;
			}
			if($("#FAX_NO").val()==""){
				$("#FAX_NO").tips({
					side:3,
		            msg:'请输入联系人传真',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAX_NO").focus();
			return false;
			}
			if($("#OFFICE_ADDRESS_INFO").val()==""){
				$("#OFFICE_ADDRESS_INFO").tips({
					side:3,
		            msg:'请输入联系人办公地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OFFICE_ADDRESS_INFO").focus();
			return false;
			}
			if($("#HOME_ADDRESS_INFO").val()==""){
				$("#HOME_ADDRESS_INFO").tips({
					side:3,
		            msg:'请输入联系人家庭地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOME_ADDRESS_INFO").focus();
			return false;
			}
			if($("#POSITION_INFO").val()==""){
				$("#POSITION_INFO").tips({
					side:3,
		            msg:'请输入联系人的职位信息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POSITION_INFO").focus();
			return false;
			}
			if($("#IS_JOB").val()==""){
				$("#IS_JOB").tips({
					side:3,
		            msg:'请输入联系人是否在职（1：在职；2：离职）',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_JOB").focus();
			return false;
			}
			if($("#REF_LINKMAN_ID").val()==""){
				$("#REF_LINKMAN_ID").tips({
					side:3,
		            msg:'请输入关联联系人ID，用于记录联系人离职之前的所在公司信息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REF_LINKMAN_ID").focus();
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
			if($("#MODIFY_USER").val()==""){
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