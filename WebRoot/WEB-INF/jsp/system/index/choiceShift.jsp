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

	<!-- jsp文件头和头部 -->
	<%@ include file="top.jsp"%>
	<style type="text/css">
	.commitopacity{position:absolute; width:100%; height:100px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.8; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
	</style>
	
	<!-- 即时通讯 -->
	<link rel="stylesheet" type="text/css" href="plugins/websocketInstantMsg/ext4/resources/css/ext-all.css">
	<link rel="stylesheet" type="text/css" href="plugins/websocketInstantMsg/css/websocket.css" />
	<script type="text/javascript" src="plugins/websocketInstantMsg/ext4/ext-all-debug.js"></script>
	<script type="text/javascript" src="plugins/websocketInstantMsg/websocket.js"></script>
	<!-- 即时通讯 -->
	
</head>
	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		
		<!-- 页面顶部¨ -->
		<%@ include file="head.jsp"%> 
		<div id="websocket_button"></div><!-- 少了此处，聊天窗口就无法关闭 -->
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
						
			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<!-- #section:settings.box -->
						<table id="table_report" style="margin-top:100px;">
						</table>
						
						<div class="row">	
								<div class="col-xs-3">
								</div>
								<div class="col-xs-6">
									
								<!-- 检索  -->
								<form action="actual/goActual.do" method="post" name="Form" id="Form">
								<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
									<tr>
										
										<td style="text-align: center;" colspan="4">
										   <b>选择您的班次：</b>
										</td>
										<td>
											<c:forEach items="${varList }" var="var">
												<input type="radio" name="SHIFT_NAME" value="${var.id }" ><label> ${var.text }</label>
											</c:forEach>
										</td>
										
									</tr>
								</table> 
								
								<div class="page-header position-relative">
								<table style="width:100%;">
									<tr>
										<td class="center" style="vertical-align:top;">
											<a class="btn btn-sm btn-success" onclick="commit()">确认</a>
										</td>
									</tr>
								</table>
								</div>
								</form>
							
								</div>
								<!-- /.col -->
								<div class="col-xs-3">
								</div>
						
						</div><!-- /.row -->	
					</div><!-- /.page-content -->
					
				</div>
			</div><!-- /.main-content -->

		</div><!-- /.main-container -->

		<!-- basic scripts -->
		<!-- 页面底部js¨ -->
		<%@ include file="foot.jsp"%>
		<!-- 删除时确认窗口 -->
		<script src="static/ace/js/bootbox.js"></script>
		
		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="static/ace/css/ace.onpage-help.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="static/ace/js/ace/elements.onpage-help.js"></script>
		<script src="static/ace/js/ace/ace.onpage-help.js"></script>
	
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/index.js"></script>
		<!--引入弹窗组件start-->
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script> 
		<!--引入弹窗组件end-->
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		
		
		function commit(){
			var shiftid = $("input[name='SHIFT_NAME']:checked").val();
			if(shiftid==null || shiftid==""){
				bootbox.alert("请选择一个班次!");
			}
			
			var url = '<%=basePath%>mainop/select_shift.do';
			
			$.ajax({
				type: "POST",
				url: url,
		    	data: {KEYDATA:shiftid,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){						
						window.location.href="mainop/worklist";
					}else{
						window.location.href="login_toLogin";
					}
				}
			});
			
		}
				
	</script>
	</body>
</html>