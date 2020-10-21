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
	
	<!-- 即时通讯 -->
	<link rel="stylesheet" type="text/css" href="plugins/websocketInstantMsg/ext4/resources/css/ext-all.css">
	<link rel="stylesheet" type="text/css" href="plugins/websocketInstantMsg/css/websocket.css" />
	<script type="text/javascript" src="plugins/websocketInstantMsg/ext4/ext-all-debug.js"></script>
	<script type="text/javascript" src="plugins/websocketInstantMsg/websocket.js"></script>
	<!-- 即时通讯 -->
	
	
	<style type="text/css"> 

/* scrollDiv */
.scrollDiv {	
	margin-top: 2px;
	height: 36px;/* 必要元素 */
	line-height: 36px;
	overflow: hidden;/* 必要元素 */
}
.scrollDiv li {
	height: 36px;
	padding-left: 10px;
}
.scrollDivText {
  color: #ffff00;
  font-size: 24px;
  text-shadow: none;
  padding-top: 10px;
  padding-bottom: 10px;
  height: auto;
}
</style> 
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
						<table id="table_report" style="margin-top:30px;">
						</table>
						
						<div class="row">	
								<div class="col-xs-4">
								</div>
								<div class="col-xs-4">
									
								<!-- 检索  -->
								<form action="" method="post" name="Form" id="Form">
								<input type="hidden" id="basePath" name="basePath" value="<%=basePath%>"/>
								<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
									<thead>
										<tr>
											<th class="center">机台代码</th>
											<th class="center">机台名称</th>
																					
										</tr>
									</thead>								
									<tbody>
										<c:if test="${not empty varList }">
										<c:forEach items="${varList }" var="var">
										<tr <c:if test="${var.MAKE_MODE != 'MAKEMODE50'}">onclick="selectMachine('${var.CRAFT_NO}','${var.CRAFT_CODE}','${var.CRAFT_NAME}','${var.MACHINE_NO}','${var.MACHINE_CODE}','${var.MACHINE_NAME}','${var.MAKE_MODE}','CNC')"</c:if> >
											<td style="text-align: center;">
												 <b>${var.MACHINE_CODE }</b>
												
											</td>
											<td class="center">
													<b>${var.MACHINE_NAME}</b>
											</td>
											<c:if test="${var.MAKE_MODE == 'MAKEMODE50'}">
												<td class="center">
													<a class="btn btn-mini btn-primary" onclick="goOnline('${var.CRAFT_NO}','${var.CRAFT_CODE}','${var.CRAFT_NAME}','${var.MACHINE_NO }','${var.MACHINE_CODE }','${var.MACHINE_NAME}','${var.MAKE_MODE}');">上线工位</a>
													<a class="btn btn-mini btn-success" onclick="goOffline('${var.CRAFT_NO}','${var.CRAFT_CODE}','${var.CRAFT_NAME}','${var.MACHINE_NO }','${var.MACHINE_CODE }','${var.MACHINE_NAME}','${var.MAKE_MODE}');">包装工位</a>
													
												</td>
											</c:if>
											<td class="hidden">${var.MACHINE_NO }</td>
											<td class="hidden">${var.CRAFT_NO}</td>
											<td class="hidden">${var.CRAFT_NAME }</td>
										</tr>
										</c:forEach>
										</c:if>
									</tbody>	
								</table> 
								</form>
							
								</div>
								<!-- /.col -->
								<div class="col-xs-4">
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
		
		function selectMachine(craftNO,craftCode,craftName,machineID,machineCode,machineName,makeMode,type){
			/* var url = 'mainop/selectMahchine_MD.do?MACHINE_ID='+machineID+'&MACHINE_CODE='+machineCode+'&MACHINE_NAME='+machineName;
			url = $("#basePath").val() + url;
			$("#Form").attr('action',url); 
			$("#Form").submit(); */
			var url = $("#basePath").val() + 'mainop/selectMahchine_MD.do';
			
			$.ajax({
				type: "POST",
				url: url,
		    	data: {CRAFT_NO:craftNO,CRAFT_CODE:craftCode,CRAFT_NAME:craftName,MACHINE_ID:machineID,MACHINE_CODE:machineCode,MACHINE_NAME:machineName,MAKE_MODE:makeMode,MODE_TYPE:type},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){						
						window.location.href="mainop/indexactualMD";
					}else{
						window.location.href="login_toLogin";
					}
				}
			});
		}
		
		function goOnline(craftNO,craftCode,craftName,machineID,machineCode,machineName,makeMode){
			selectMachine(craftNO,craftCode,craftName,machineID,machineCode,machineName,makeMode,'ASSEMBLYSONTYPE10');
		}
		
		function goOffline(craftNO,craftCode,craftName,machineID,machineCode,machineName,makeMode){
			selectMachine(craftNO,craftCode,craftName,machineID,machineCode,machineName,makeMode,'ASSEMBLYSONTYPE30');
		}
		
		<%-- function commit(){
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
			
		} --%>
				
	</script>
	</body>
</html>