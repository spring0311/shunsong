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
					
					<form action="excellentstaff/${msg }.do" name="Form" id="Form" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年份:</td>
								<td><input type="text" name="YEAR" id="YEAR" value="${pd.YEAR}" maxlength="" placeholder="这里输入年份" title="年份" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">月份:</td>
								<td><input type="text" name="MONTH" id="MONTH" value="${pd.MONTH}" maxlength="" placeholder="这里输入月份" title="月" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户:</td>
								<td>
								<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" readonly="readonly"/>
								<input type="hidden" name="USER_CODE" id="USER_CODE" value="${pd.USER_CODE}" readonly="readonly"/>
								<input type="text" name="USER_NAME" id="USER_NAME" value="${pd.USER_NAME}" readonly="readonly" placeholder="选择用户" title="" style="width:80%;"/>
								<a class="btn btn-light btn-xs" onclick="selectUser();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
								</td>
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
			if($("#YEAR").val()==""){
				$("#YEAR").tips({
					side:3,
		            msg:'请输入年份',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#YEAR").focus();
			return false;
			}
			if($("#MONTH").val()==""){
				$("#MONTH").tips({
					side:3,
		            msg:'请输入月',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MONTH").focus();
			return false;
			}
			if($("#USER_ID").val()==""){
				$("#USER_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_ID").focus();
			return false;
			}
			if($("#USER_NAME").val()==""){
				$("#USER_NAME").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_NAME").focus();
			return false;
			}
			if($("#USER_CODE").val()==""){
				$("#USER_CODE").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_CODE").focus();
			return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			var year = $("#YEAR").val();
			var month = $("#MONTH").val();
			var date = new Date();
			if(year==''){
				$("#YEAR").val(date.getFullYear());
			}
			if(month==''){
				month = date.getMonth();
				if(month === 0){
					month = 12;
				}
				if(month < 10){
					month = '0'+month;
				}
				$("#MONTH").val(month);
			}
		});
		
		//选择客户
		function selectUser(){
			var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择用户";
			 diag.URL = '<%=basePath%>user/goListUsersChoose.do?flag=single';
			 diag.Width = 400;
			 diag.Height = 755;
			
			 diag.CancelEvent = function(){ //关闭事件
				 
				var str = diag.innerFrame.contentWindow.document.getElementById('USER_ID').value;
			    var str1 = diag.innerFrame.contentWindow.document.getElementById('USER_NAME').value;
			    var str2 = diag.innerFrame.contentWindow.document.getElementById('USER_CODE').value;
			   
			    $("#USER_ID").val(str);
			    $("#USER_NAME").val(str1);
			    $("#USER_CODE").val(str2);
				diag.close();
			 };
			 diag.show();
		}
		</script>
</body>
</html>