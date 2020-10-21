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
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
		<input type="hidden" id="MACHINE_ID">
		<input type="hidden" id="MACHINE_CODE">
		<input type="hidden" id="MACHINE_NAME">
		<input type="hidden" id="MACHINE_CLASS_ID">
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
						<!-- 设定设备周工作时间 start -->
						<div class="col-xs-9">
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">星期</th>
									<th class="center">是否工作日</th>
									<th class="center">工作时间（小时）</th>
								</tr>
							</thead>
													
							<tbody>
							</tbody>
						</table>
						
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a class="btn btn-xs btn-success" onclick="save();">保存</a>
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						</div>
						<!-- 设定设备周工作时间 end -->
					
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
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
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
				machinePlanset(machineId);
				$("#MACHINE_NAME").val(r.target.MACHINE_NAME);
				$("#MACHINE_CODE").val(r.target.MACHINE_CODE);
				$("#MACHINE_ID").val(r.target.MACHINE_ID);
				$("#MACHINE_CLASS_ID").val(r.target.MACHINE_CLASS_ID);
			});
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
		
		function machinePlanset(machineId){
			var html = "";
			$.ajax({
				type: "POST",
				url: '<%=basePath%>plansetmachineworktime/listForMachinePlanset.do?tm='+new Date().getTime(),
		    	data: {MACHINE_ID:machineId},
				dataType:'json',
				async:false, 
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					var msg = data.msg;
					if(msg == "success"){
						var list = eval(data.list);
						$.each(list,function(i,val){
							var checked = '';
							if(val.IS_WORK == 'Y') {checked = 'checked'};
							var machineWorkTimeId = val.MACHINE_WORK_TIME_ID;
							if( typeof(machineWorkTimeId)== 'undefined'){
								machineWorkTimeId = '';
							}
							
							html += "<tr>";
							html += "<td class='center'><div name='WEEK_ID'>"+val.WEEK_ID+"</div></td>";
							html += "<td class='center'><div name='WEEK_NAME'>"+val.WEEK_NAME+"</div></td>";
							html += "<td class='center'><input type='checkbox' value='Y' name='IS_WORK' "+checked+"/> </td>";
							var workTime = val.WORK_TIME;
							workTime = workTime.toFixed(2);
							html += "<td class='center'><input type='number' value='"+workTime+"' name='WORK_TIME' /></td>";
							html += "<td class='hidden'><input type='text' value='"+machineWorkTimeId+"' name='MACHINE_WORK_TIME_ID' /></td>";
							html += "</tr>";
						});
					}
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				}
			}); 
			$("#simple-table > tbody ").html(html);
		}
		
		function save(){
			var $table = $("#simple-table");
			var $tb = $table.find("tbody");
			var $tr = $tb.find("tr");
			var mlist = [];
			for(var i=0;i<$tr.length;i++){
				
				var machineId = $("#MACHINE_ID").val();
				var machineCode = $("#MACHINE_CODE").val();
				var machineName = $("#MACHINE_NAME").val();
				var machineClassId = $("#MACHINE_CLASS_ID").val();
				var weekId = $($tr[i]).find("div[name='WEEK_ID']").html();
				var weekName = $($tr[i]).find("div[name='WEEK_NAME']").html();
				var machineWorkTimeId = $($tr[i]).find("input[name='MACHINE_WORK_TIME_ID']").val();
				var workTime = $($tr[i]).find("input[name='WORK_TIME']").val();
				if(workTime==''){
					workTime=0;
				}
				var isWork = $($tr[i]).find("input[name='IS_WORK']").is(":checked");
				if(isWork){
					isWork='Y';
				}else{
					isWork="N";
				}
				var obj = {};
				obj.MACHINE_WORK_TIME_ID = machineWorkTimeId;
				obj.MACHINE_ID = machineId;
				obj.MACHINE_NAME = machineName;
				obj.MACHINE_CODE = machineCode;
				obj.MACHINE_CLASS_ID = machineClassId;
				obj.WEEK_ID = weekId;
				obj.WEEK_NAME = weekName;
				obj.IS_WORK = isWork;
				obj.WORK_TIME = workTime;
				mlist.push(obj);
			}
			if(mlist.length==0){
				return ;
			}
			$.ajax({
				type: "POST",
				url: '<%=basePath%>'+'plansetmachineworktime/editList.do',
		    	data:  {data:JSON.stringify(mlist)},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){	
					var strBack = data.msg;	
					if(strBack == 'success') {
						bootbox.alert("保存成功");
						machinePlanset($("#MACHINE_ID").val());
					}
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				}
			}); 
			
		}
	</script>


</body>
</html>