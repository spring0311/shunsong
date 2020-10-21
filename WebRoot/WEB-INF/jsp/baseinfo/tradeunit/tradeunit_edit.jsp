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
					
					<form action="tradeunit/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TRADEUNIT_ID" id="TRADEUNIT_ID" value="${pd.TRADEUNIT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">:</td>
								<td><input type="text" name="TRADEUNIT_ID" id="TRADEUNIT_ID" value="${pd.TRADEUNIT_ID}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">客商编号:</td>
								<td><input type="text" name="TRADEUNIT_CODE" id="TRADEUNIT_CODE" value="${pd.TRADEUNIT_CODE}" maxlength="" placeholder="这里输入客商编号" title="客商编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">客商名称:</td>
								<td><input type="text" name="TRADEUNIT_NAME" id="TRADEUNIT_NAME" value="${pd.TRADEUNIT_NAME}" maxlength="" placeholder="这里输入客商名称" title="客商名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">客商简称:</td>
								<td><input type="text" name="TRADEUNIT_ALT" id="TRADEUNIT_ALT" value="${pd.TRADEUNIT_ALT}" maxlength="" placeholder="这里输入客商简称" title="客商简称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">税号:</td>
								<td><input type="text" name="TAX_NO" id="TAX_NO" value="${pd.TAX_NO}" maxlength="" placeholder="这里输入税号" title="税号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">客商属性:</td>
								<td>
									<select class="chosen-select form-control" name="TRADEUNIT_TYPE" id="TRADEUNIT_TYPE" data-placeholder="请选择客商属性" style="vertical-align:top;width: 98%;">
										<option value="1" <c:if test="${pd.TRADEUNIT_TYPE eq '1'}">selected="selected"</c:if>>仅客户</option>
										<option value="2" <c:if test="${pd.TRADEUNIT_TYPE eq '2'}">selected="selected"</c:if>>仅供应商</option>
										<option value="3" <c:if test="${pd.TRADEUNIT_TYPE eq '3'}">selected="selected"</c:if>>客户和供应商</option>
									</select>
									<%-- <input type="text" name="TRADEUNIT_TYPE" id="TRADEUNIT_TYPE" value="${pd.TRADEUNIT_TYPE}" maxlength="" placeholder="这里输入客商属性（1：客户:2：供应商:3：客户和供应商）" title="客商属性（1：客户:2：供应商:3：客户和供应商）" style="width:98%;"/>
									 --%>
								 </td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">注册地址:</td>
								<td><input type="text" name="REGISTER_ADDRESS" id="REGISTER_ADDRESS" value="${pd.REGISTER_ADDRESS}" maxlength="" placeholder="这里输入注册地址" title="注册地址" style="width:98%;"/></td>
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
								<td><input type="text" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}"  readonly="readonly" maxlength="" placeholder="这里输入录入员工编号" title="录入员工编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">录入时间:</td>
								<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}"  readonly="readonly" maxlength="" placeholder="这里输入录入时间" title="录入时间" style="width:98%;"/></td>
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
			/* if($("#TRADEUNIT_ID").val()==""){
				$("#TRADEUNIT_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TRADEUNIT_ID").focus();
			return false;
			} */
			if($("#TRADEUNIT_CODE").val()==""){
				$("#TRADEUNIT_CODE").tips({
					side:3,
		            msg:'请输入客商编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TRADEUNIT_CODE").focus();
			return false;
			}
			if($("#TRADEUNIT_NAME").val()==""){
				$("#TRADEUNIT_NAME").tips({
					side:3,
		            msg:'请输入客商名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TRADEUNIT_NAME").focus();
			return false;
			}
			if($("#TRADEUNIT_ALT").val()==""){
				$("#TRADEUNIT_ALT").tips({
					side:3,
		            msg:'请输入客商简称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TRADEUNIT_ALT").focus();
			return false;
			}
			if($("#TAX_NO").val()==""){
				$("#TAX_NO").tips({
					side:3,
		            msg:'请输入税号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TAX_NO").focus();
			return false;
			}
			if($("#TRADEUNIT_TYPE").val()==""){
				$("#TRADEUNIT_TYPE").tips({
					side:3,
		            msg:'请输入客商属性（1：客户:2：供应商:3：客户和供应商）',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TRADEUNIT_TYPE").focus();
			return false;
			}
			if($("#REGISTER_ADDRESS").val()==""){
				$("#REGISTER_ADDRESS").tips({
					side:3,
		            msg:'请输入注册地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGISTER_ADDRESS").focus();
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
			} */
			/* if($("#MODIFY_DATE").val()==""){
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