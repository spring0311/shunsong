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
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" type="text/css" href="static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
<link rel="stylesheet" href="static/css/production/work/work.css" />
</head>
<body class="easyui-layout">
	<form action="work/list_zhongrui" method="post" name="Form" id="Form">
		<input type="hidden"  id="basePath" name="basePath" value="<%=basePath%>" />	
		<input type="hidden"  id="USER_ID" name="USER_ID"  />	
		<input type="hidden"  id="USER_NAME" name="USER_NAME"  />
		<input type="hidden"  id="USER_CODE" name="USER_CODE"  />
		
		<div data-options="region:'south',border:false" style="height:60px;padding:10px;">
			<table style="width:100%;">
				<td style="vertical-align:top;">
					<a class="btn btn-sm btn-success" onclick="commit();">确定选择</a>
				</td>
					
			</table>
		</div>
		<div data-options="region:'center',title:'列表数据'">
			<table id="dg" style="width:100%;padding-top:5px;height:auto">	
			</table>
		</div>
	</form>

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>	
	<script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
		
		$(top.hangge());//关闭加载状态
		
		
		$(function() {
			var  vbasePath = $('#basePath').val();
			var  vurl = vbasePath + '/user/listUserData.do';
			$('#dg').datagrid({  
		        nowrap: false,  
		        striped: true,  
		        url:vurl,  
		        queryParams:{CRAFT_NO:'${pd.CRAFT_NO}'},
		        fit:true,
		        idField:'USER_ID', 
		        remoteSort:false,
		        singleSelect:false,  
		        columns:[[    
						{field:'ck',checkbox:true},  	
						{field:'USERNAME',title:'用户名',width:80,sortable:true},
						{field:'NAME',title:'姓名',width:100,sortable:true},
						{field:'PHONE',title:'电话',width:100,sortable:true},
		            ]],  
		        pagination:true, 
		        pageSize:20,
		        pageList:[10,20,30,50,100,200],
		        method:'get',
		        rownumbers:true
		    });
			
						
		});
		
		function commit() {
			
			var rows = $("#dg").datagrid("getSelections");
			var flag = '${pd.flag}';
			if(flag=='single'){
				if(rows.length != 1){
					bootbox.alert("请选择一条数据");
					return ;
				}
				$("#USER_ID").val(rows[0].USER_ID);
				$("#USER_NAME").val(rows[0].NAME);
				$("#USER_CODE").val(rows[0].NUMBER);
			}else{
				if(rows.length == 0){
					bootbox.alert("请选择至少一条数据");
					return ;
				}
				var ids = new Array();
				var names = new Array();
				for(var i=0;i<rows.length;i++){
					ids.push(rows[i].USER_ID);
					names.push(rows[i].NAME);
				}
				$("#USER_ID").val(ids.toString());
				$("#USER_NAME").val(names.toString());
			}
			top.Dialog.close();
		}
	</script>
</body>
</html>