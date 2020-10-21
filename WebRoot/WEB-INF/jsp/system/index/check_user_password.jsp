<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />

</head>
<body class="no-skin">
<!-- 工单报表 -->
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<input type="hidden" name="basePath" id="basePath" value="<%=basePath%>" />
						<input type="hidden" name="msg" id="msg" value="${pd.msg}" />
							<div id="loginbox">
								<form action="" method="post" name="Form"
									id="Form">
									<div class="control-group normal_text">
										<h3>
											请输入登录密码
										</h3>
									</div>
									<div class="control-group  normal_text">
										<h4>用户：${pd.UserFullName}</h4>	
										<input type="hidden" name="loginname" id="loginname" value="${pd.UserName}" placeholder="请输入用户名" />										
									</div>
									<div class="control-group">
										<div class="controls">
											<div class="main_input_box">
											<input type="password" name="password" id="password" placeholder="请输入密码" value="" onkeydown="return ClearSubmit(event)"/>
											</div>											
										</div>
									</div>
									
									<div class="form-actions">
										<div style="width:86%;padding-left:8%;">
											<span class="pull-right" style="padding-right:3%;"><a href="javascript:quxiao();" class="btn btn-success">取消</a></span>
											<span class="pull-right">
												<a onclick="severCheck();" class="flip-link btn btn-info" id="to-recover">确认</a>
											</span>
										
										</div>
									</div>
								</form>
								
							</div> 
					
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	
	<div>
		
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
		
	
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	
	<script type="text/javascript">
		
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			var basePath = $("#basePath").val();
			var msg = $("#msg").val();
			
			var url = basePath + "work/" + msg + ".do";
			
			$("#Form").attr('action',url);
			$("#Form").submit();
		}
		
				
		/* $(function() {
			$("#password").focus(); 
			
		}); */
		
		function quxiao() {
			$("#password").val('');
		}
		
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});
		
		function ClearSubmit(e) {
	            if (e.keyCode == 13) {
	                return false;
	            }
		}
		
		
		function severCheck(){
			
			var basePath = $("#basePath").val();
			
			 if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh";
				$.ajax({
					type: "POST",
					url: basePath +'work/check_user_password.do',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							
							tosearch();
						}else if("usererror" == data.result){
							$("#password").tips({
								side : 1,
								msg : "密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#password").focus();
						}else{
							$("#password").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#password").focus();
						}
					}
				});
			
		}
		
		
			
	</script>
</body>
</html>