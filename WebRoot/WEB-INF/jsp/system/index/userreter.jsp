<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/matrix-login.css" />

<%@ include file="top.jsp"%>
</head>
<body>
	<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<div id="loginbox" style="width:800px;">
			<form action="" method="post" name="loginForm" 	id="loginForm">
			
				<div class="control-group normal_text">
					<h3>
						注册序列号过期，请联系供应商重新注册！
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg" style="width:200px;">
							注册码：${pd.registerNo}
							</span>
						</div>
					</div>
					
				<%-- <div class="widget-body">
			 		<div class="widget-main">
			 			<table style="width:95%;" >									
							<tr>
								<td style="padding-top: 5px;">
									<span class="add-on bg_lg" style="width:60px;">
									注册码：
									</span>
								</td>
								<td style="padding-top: 5px;">
									<input type="text" name="registerNo" id="registerNo" value="${pd.registerNo}" readonly placeholder="请输入注册码" />
								</td>
							</tr>
							<tr>
								<td style="padding-top: 5px;">
									<span class="add-on bg_ly" style="width:60px;">
									序列号：
									</span>
								</td>
								<td style="padding-top: 5px;">
									<input type="file" class="serialUpload"  id="license" name="license" onchange="fileType(this)" />
								</td>
							</tr>
							
						</table>			 		
			 		</div><!--/widget-main-->
			 	</div><!--/widget-body--> --%>
			 	</div>
			 	
				<div class="control-group">
					
					<!-- 
					<div style="width:86%;padding-left:8%;">						
						<span class="pull-right" style="padding-right:3%;"><a href="javascript:quxiao();" class="btn btn-success">取消</a></span>
						<span class="pull-right"><a onclick="severRegister();" class="flip-link btn btn-info" id="to-recover">注册</a></span>
					</div> -->
						
				</div>			
				
				
				
			</form>
			
		</div>
	</div>
	
	
	<%@ include file="foot.jsp"%>
	<!-- <script src="static/login/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script> -->
	
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
		
	<script type="text/javascript">
	
		$(function() {
			//上传
			$('.serialUpload').ace_file_input({
				no_file:'请选择注册文件...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'dat',
				blacklist:'dat'
				//onchange:''
			});
		});
		
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		    if(fileType != '.dat'){
		    	$("#license").tips({
					side:3,
		            msg:'请上传dat格式的文件',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#license").val('');
		    	document.getElementById("license").files[0] = '请选择dat格式的文件';
		    }
		}
	
		//服务器校验
		function severRegister(){
			if(check()){
				
				var loginname = $("#registerNo").val();
				var password = $("#serialNo").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh";
				$.ajax({
					type: "POST",
					url: 'login_register',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){							
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#serialNo").tips({
								side : 1,
								msg : "序列号有误",
								bg : '#FF5080',
								time : 15
							});
							$("#serialNo").focus();
						}else{
							$("#serialNo").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#serialNo").focus();
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

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		

		//客户端校验
		function check() {

			if ($("#registerNo").val() == "") {

				$("#registerNo").tips({
					side : 2,
					msg : '注册号不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#registerNo").focus();
				return false;
			} else {
				$("#registerNo").val(jQuery.trim($('#registerNo').val()));
			}

			if ($("#serialNo").val() == "") {

				$("#serialNo").tips({
					side : 2,
					msg : '序列号不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#serialNo").focus();
				return false;
			}
			
			return true;
		}

		
		function quxiao() {
			$("#serialNo").val('');
		}
		
		
	</script>
	
</body>

</html>