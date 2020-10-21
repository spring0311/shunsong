<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="plugins/tab/js/framework.js"></script>
	<link href="plugins/tab/css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link href="plugins/tab/skins/sky/import_skin.css" rel="stylesheet" type="text/css"/>
	<%-- <link  rel="stylesheet" type="text/css" id="skin" prePath="plugins/tab/" /><!--默认相对于根目录路径为../，可添加prePath属性自定义相对路径，如prePath="<%=request.getContextPath()%>"-->
	 --%><script type="text/javascript" charset="utf-8" src="plugins/tab/js/tab.js"></script>
	</head>
<body>
	<form action="" method="post" name="Form" id="Form">
		<div id="tab_menu" style="height:30px;"></div>
		<div style="width:100%;">
			<div id="page" style="width:100%;height:100%;"></div>
		</div>
	</form>
						
	
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
<%-- 	<%@ include file="../../system/index/foot.jsp"%> --%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts 
	<script src="static/ace/js/ace/ace.js"></script>
	-->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script> 


<script type="text/javascript">

function tabAddHandler(mid,mtitle,murl){
	tab.update({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	
	tab.add({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});

	tab.activate(mid);
}
 var tab;	
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top",
		current_index:0
	});	
	 tab.add( {
			id :'tab1_index1',
			title :"设置通用的工作时间",
			url :"<%=basePath%>weekinfo/goSetWeekinfo.do",
			isClosed :false
		});	
		tab.add( {
			id :'tab1_index2',
			title :"设置设备的周工作时间",
			url :"<%=basePath%>plansetmachineworktime/goSetPlansetMachineWorktime.do",
			isClosed :false
		});
		tab.add( {
			id :'tab1_index3',
			title :"设置设备的日工作时间",
			url :"<%=basePath%>machineworktime/goSetMachineWorktime.do",
			isClosed :false
		});
		tab.add( {
			id :'tab1_index4',
			title :"设置设备的开机率",
			url :"<%=basePath%>plansetmachineworkrate/goSetMachineWorkrate.do",
			isClosed :false
		});

	
	tab.activate('tab1_index1');

});

	function cmainFrameT(){
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT  - 75) + 'px';
	}
	cmainFrameT();
	window.onresize=function(){  
		cmainFrameT();
	};

</script>

</body>
</html>

