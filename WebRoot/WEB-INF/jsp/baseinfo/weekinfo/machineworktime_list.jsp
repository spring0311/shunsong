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
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="static/ace/css/ui.jqgrid-bootstrap4.css" />
<link rel="stylesheet" href="static/ace/css/jquery-ui.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<input type="hidden" id="MACHINE_ID">
		<input type="hidden" id="MACHINE_CODE">
		<input type="hidden" id="MACHINE_NAME">
		<input type="hidden" id="MACHINE_CLASS_ID">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<!-- 设备信息 start -->
					<div class="row">
						<div class="col-xs-12">
							<div class="col-xs-3">
								<h4 class="page-header text-primary">设备列表</h4>
							</div>
							<div class="col-xs-9">
								<h4 class="page-header text-primary">设备信息:<span id="machineName"></span></h4>
							</div>
						<div>
					</div>
					<!-- 设备信息 end -->
					<div class="row">
						<div class="col-xs-12">
						<!-- 设备树 start -->
						<div class="col-xs-3">
							<div id="tree1"></div>
						</div>
						<!-- 设备树 end -->
						<!-- 设定设备工作时间 start -->
						<div class="col-xs-9">
						
						<!-- 设备设定时间 start -->
						<table id="table-setworktime" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<tr>
								<td>选择工作日</td>
								<td><input class="span10 date-picker" id="WORK_DATE" name="WORK_DATE" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="工作日期" title="工作日期"/></td>
							</tr>
							<tr>
								<td>是否为工作日</td>
								<td><input name="IS_WORK" id="IS_WORK" type="checkbox"/></td>
							</tr>
							<tr>
								<td>工作时间</td>
								<td><input type="number" id="WORK_TIME" name="WORK_TIME"  /></td>
							</tr>
						</table>
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a class="btn btn-xs btn-success" onclick="save();">保存</a>
								</td>
								<td style="vertical-align:top;"></td>
							</tr>
						</table>
						<!-- 设备设定时间 end -->
						<!-- 设备设定历史 start -->
						<div id="taskArea">
							<table id="grid-task"></table>
							<div id="grid-task-pager" style="align:left;"></div>			
						</div>
						<!-- 设备设定历史 end -->
						</div>
						<!-- 设定设备工作时间 end -->
					
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 树 -->
	<script src="static/ace/js/fuelux/fuelux.tree.js"></script>
	<script src="static/ace/js/ace-extra.js"></script>
	<script src="static/ace/js/ace/elements.treeview.js"></script>
	<script src="static/ace/js/jqGrid5.3/jquery.jqGrid.min.js"></script>
	<script src="static/ace/js/jqGrid5.3/i18n/grid.locale-cn.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		var grid_selector = "#grid-task";
		var pager_selector = "#grid-task-pager";
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			var sampleData = initiateDemoData();
			$('#tree1').ace_tree({
				dataSource: sampleData['dataSource1'],
				multiSelect: false,
				cacheItems: true,
				'open-icon' : 'ace-icon tree-minus',
				'close-icon' : 'ace-icon tree-plus',
				'selectable' : true,
				'selected-icon' : 'ace-icon fa fa-check',
				'unselected-icon' : 'ace-icon fa fa-times',
				loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
			}).on('selected.fu.tree', function(e,r) {
				var machineId = r.target.MACHINE_ID;
				var machineName = r.target.MACHINE_NAME;
				$("#machineName").text(machineName);
		//		machinePlanset(machineId);
				$("#MACHINE_NAME").val(r.target.MACHINE_NAME);
				$("#MACHINE_CODE").val(r.target.MACHINE_CODE);
				$("#MACHINE_ID").val(r.target.MACHINE_ID);
				$("#MACHINE_CLASS_ID").val(r.target.MACHINE_CLASS_ID);
				
				machineWorktimeHistory(machineId);
			});
			
			
			jQuery(grid_selector).jqGrid({					
				mtype:"POST",
				datatype: "json",				
				colModel:[
					{name:'MACHINE_NAME',index:'MACHINE_NAME', label:'设备名称',width:150, sorttype:"string",align:"center"},
					{name:'WORK_DATE',index:'WORK_DATE',label:'工作日',align:"center"},
					{name:'STATUS',index:'STATUS', label:'是否工作日',formatter:formatStatus,align:"center"},
					{name:'WORK_TIME',index:'WORK_TIME', label:'工作时间',align:"center"}
				], 			
				viewrecords : true,
				rowNum:20,
				rowList:[10,20,30,50,100],
				pager : pager_selector,
				altRows: true,
				multiselect: true,
				multiboxonly: true,
				loadComplete : function() {
					var table = this;
					setTimeout(function(){													
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
			         
				},
				 rownumbers: true,
				 shrinkToFit:false,
				 autoScroll: true,
			//	 ondblClickRow:celldbClicked
		
			});
			
			function updatePagerIcons(table) {
				var replacement = 
				{
					'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
					'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
					'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
					'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
				};
				$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
					
					if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
				})
			};
		
			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({container:'body'});
				$(table).find('.ui-pg-div').tooltip({container:'body'});
			};
			
			
		    $(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', $("#taskArea").width() - 10 );
				$(grid_selector).jqGrid( 'setGridHeight', $("#taskArea").height()-98);
		    }) ;
			
			$(window).triggerHandler('resize.jqGrid');
			 
			$(window).off('resize.jqGrid');
		});
		

		function initiateDemoData(){
			var tree_data = [];
			$.ajax({
				type: "POST",
				url: '<%=basePath%>plansetmachineworktime/listMachineClassDetail.do?tm='+new Date().getTime(),
		    	data: {},
				dataType:'json',
				async:false, 
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					var msg = data.msg;
					if(msg == "success"){
						tree_data = eval(data.list)
					}
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				}
			}); 
			var dataSource1 = function(options, callback){
				var $data = null
				if(!("text" in options) && !("type" in options)){
					$data = tree_data;//the root tree
					callback({ data: $data });
					return;
				}
				else if("type" in options && options.type == "folder") {
					if("additionalParameters" in options && "children" in options.additionalParameters)
						$data = options.additionalParameters.children || {};
					else $data = {}//no data
				}
				
				if($data != null)//this setTimeout is only for mimicking some random delay
					setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);
			}
			return {'dataSource1': dataSource1};
		}
		
		
		function save(){
			var $table = $("#table-setworktime");
				
			var machineId = $("#MACHINE_ID").val();
			var machineCode = $("#MACHINE_CODE").val();
			var machineName = $("#MACHINE_NAME").val();
			var machineClassId = $("#MACHINE_CLASS_ID").val();
			var workDate = $table.find("input[name='WORK_DATE']").val();
			var workTime = $table.find("input[name='WORK_TIME']").val();
			if(workTime==''){
				workTime=0;
			}
			var isWork = $table.find("input[name='IS_WORK']").is(":checked");
			if(isWork){
				isWork='10';
			}else{
				isWork="20";
			}
			if(machineId==""){
				bootbox.alert("请选择设备");
				return ;
			}
			var obj = {};
			obj.MACHINE_ID = machineId;
			obj.MACHINE_NAME = machineName;
			obj.MACHINE_CODE = machineCode;
			obj.MACHINE_CLASS_ID = machineClassId;
			obj.WORK_DATE = workDate;
			obj.STATUS = isWork;
			obj.WORK_TIME = workTime;
			
			$.ajax({
				type: "POST",
				url: '<%=basePath%>'+'machineworktime/saveMachineWorktime.do',
		    	data:  {data:JSON.stringify(obj)},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){	
					var strBack = data.msg;	
					if(strBack == 'success') {
						bootbox.alert("保存成功");
					}
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				}
			});  
			
		}
		
		function machineWorktimeHistory(machineId){
			$("#grid-task").jqGrid('setGridParam',{
		        datatype:'json',
		        url:'<%=basePath%>'+'machineworktime/listMachineWorktimeHistory.do',
		        postData:{MACHINE_ID:machineId},
		        page:1
		    }).trigger("reloadGrid");
		}
		
		
		function formatStatus( rowId, val, rawObject, cm, rdata ) {
			if(rawObject.STATUS == '10'){
				return "是";	
			}else{
				return "否";	
			}
		};
	</script>


</body>
</html>