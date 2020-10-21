<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  网站图标 -->
<link rel="shortcut icon" href="static/login/images/shunsong.ico">
<link rel="stylesheet" href="<%= basePath%>static/login/bootstrap.min.css" />
<link rel="stylesheet" href="<%= basePath%>static/login/css/camera.css" />
<link rel="stylesheet" href="<%= basePath%>static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%= basePath%>static/login/matrix-login.css" />
<link href="<%= basePath%>static/login/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="<%= basePath%>static/login/js/jquery-1.5.1.min.js"></script>

<style>
#titlebox {    width: 40%;   position: relative; }
#titlebox {  z-index:999999999;  text-align: left; margin-left:1%; margin-top:10%; position: relative; }

</style>
</head>
<body>
	<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<div id="titlebox">
			<!-- <img src="static/login/images/title02.png" /> -->
		</div> 	
		<div id="excellentStaffBox">
			<div id="excellentStaffHead">
				<h3>
					${pd.month }月优秀员工
				</h3>
			</div>
			<div id="excellentStaffMonthBody">
				<div id="excellentStaffMonthLeftBody">
					<img src="" id="excellentStaff1" style="height:100%" /> 
				</div>
				
				<div id="excellentStaffMonthRightBody">
					<img src="" id="excellentStaff2" style="height:100%"  /> 
				</div>
			</div>
			
			<div id="excellentStaffMonthFoot">
				<div id="excellentStaffMonthLeftFoot">
					<h5 id="excellentStaffName1">
						
					</h5>
				</div>
				<div id="excellentStaffMonthRightFoot">
					<h5 id="excellentStaffName2">
						
					</h5>
				</div>
			</div>
		</div>
		<div id="loginbox">
			<form action="" method="post" name="loginForm"
				id="loginForm">
				<input type='text' style='display:none'/>
				<div class="control-group normal_text">
					<h3>
						生产实绩登录
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="<%= basePath%>static/login/user.png" /></i>
							</span><input type="text" name="loginname" id="loginname" value="" placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">
						<span class="pull-right" style="padding-right:3%;"><a href="javascript:quxiao();" class="btn btn-success">取消</a></span>
						<span class="pull-right"><a onclick="severCheck();" class="flip-link btn btn-info" id="to-recover">登录</a></span>
					</div>
				</div>
			</form>
			<div class="controls">
				<div class="main_input_box">
					<font color="white"><span id="nameerr">Copyright © ${pd.COMNAME}  2019  <br/> <!-- 技术支持QQ：50868517；微信号：zhudafeng50868517 --></span></font>
				</div>
			</div>
		</div>
	</div>
	<div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="camera_slide">
			<div data-src="<%= basePath%>static/login/images/banner_slide_02.jpg"></div>
			<div data-src="<%= basePath%>static/login/images/banner_slide_02.jpg"></div>
			<div data-src="<%= basePath%>static/login/images/banner_slide_02.jpg"></div>
		</div>
		<!-- #camera_wrap_3 -->
	</div>

	<script type="text/javascript">
		//服务器校验
		function severCheck(){
			if(check()) {
				var loginname = $("#loginname").val();
				$.ajax({
					type: "POST",
					url: 'loginA',
			    	data: {USERNAME:loginname,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							//window.location.href="main/index";
							window.location.href=data.url;
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名有误",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}else if("statuserror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户已离职不能登录",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}
					}
				});
			}
		}

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {

				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function quxiao() {
			$("#loginname").val('');
		}
		
		jQuery(function() {
			 $("#loginname").focus();
			 var list = [<c:forEach items="${listPicture}" var="list"> {url:"${list.url}",

				 USER_NAME:"${list.USER_NAME}"},</c:forEach>];
			 for(var i=0;i<list.length;i++){
				 var id = "#excellentStaff"+(i+1);
				 var name = "#excellentStaffName"+(i+1);
				 $(id).attr("src",list[i].url);
				 $(name).text(list[i].USER_NAME);
			 }
		});
		
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<c:if test="${'1' == pd.msg}">
		<script type="text/javascript">
		$(tsMsg());
		function tsMsg(){
			alert('此用户在其它终端已经早于您登录,您暂时无法登录');
		}
		</script>
	</c:if>
	<c:if test="${'2' == pd.msg}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				alert('您被系统管理员强制下线');
			}
		</script>
	</c:if>
	<script src="<%= basePath%>static/login/js/bootstrap.min.js"></script>
	<script src="<%= basePath%>static/js/jquery-1.7.2.js"></script>
	<script src="<%= basePath%>static/login/js/jquery.easing.1.3.js"></script>
	<script src="<%= basePath%>static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="<%= basePath%>static/login/js/camera.min.js"></script>
	<script src="<%= basePath%>static/login/js/templatemo_script.js"></script>
	<script type="text/javascript" src="<%= basePath%>static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="<%= basePath%>static/js/jquery.cookie.js"></script>
</body>

</html>