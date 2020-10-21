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
<link rel="stylesheet" type="text/css" href="static/easyui/themes/bootstrap/easyui.css">

</head>
<body class="easyui-layout">
    <input type="hidden"  id="basePath" name="basePath" value="<%=basePath%>"/>	
    <input type="hidden"  id="day"  value=""/>	
	<!-- /section:basics/navbar.layout -->
		<div data-options="region:'north',border:false" style="height:110px;">
			<table style="margin-top:5px; width:100%" >
				<tr>
					<td style="width:25%">
						<div class="nav-search">
							申请单号：
							<span class="input-icon">
								<input type="text" placeholder="申请单号" class="nav-search-input" id="PORDER_APPLY_NO_LIKE" name="PORDER_APPLY_NO_LIKE" onchange="tosearch();" autocomplete="off" name="keywords" value="${pd.PORDER_APPLY_NO_LIKE }" placeholder="这里输入关键词"/>
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</div>
					</td>
					<td style="width:25%">
						<div class="nav-search">
							物料名称：
							<span class="input-icon">
								<input type="text" placeholder="物料名称" class="nav-search-input" id="MATERIAL_NAME_LIKE" onchange="tosearch();" autocomplete="off" name="MATERIAL_NAME_LIKE" value="${pd.MATERIAL_NAME_LIKE }" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</div>
					</td>
					<td style="width:25%">
						<div class="nav-search">
							物料规格：
							<span class="input-icon">
								<input type="text" placeholder="物料规格" class="nav-search-input" id="MATERIAL_SPEC_LIKE" onchange="tosearch();" autocomplete="off" name="MATERIAL_SPEC_LIKE" value="${pd.MATERIAL_SPEC_LIKE }" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</div>
					</td>
					<td style="width:25%">
						<a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
					</td>
				</tr>
				<tr>
					<td>
						<div class="nav-search">
							供应商名称：
							<span class="input-icon">
								<input type="text" placeholder="供应商" class="nav-search-input" id="PROVIDER_NAME_LIKE" onchange="tosearch();" autocomplete="off" name="PROVIDER_NAME_LIKE" value="${pd.PROVIDER_NAME_LIKE }" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</div>
					</td>
					
					<td style="padding-top:4px;">
						申请日期从：<input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  onchange="tosearch();"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/>
						至<input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value=""  onchange="tosearch();" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/>
					</td>
					<td style="padding-left:5px;">
						交货期从：<input class="span10 date-picker" name="DateStart" id="DateStart"  onchange="tosearch();"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/>
						至<input class="span10 date-picker" name="DateEnd" id="DateEnd"  value="" onchange="tosearch();"  type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/>
					</td>
					<td  style="padding-left:5px;">
							订单状态： 
						<input id="statusSelect" class="easyui-combobox" data-options="
															valueField: 'id',
															textField: 'text',
															multiple: true
															"> 
					</td>
					
				</tr>
			</table>
		</div>
								
		<div data-options="region:'center',border:false" id="taskArea" style="z-index:1;">								
			<table id="grid-task"></table>
			<div id="grid-task-pager" style="align:left;"></div>							
		</div>
		
		<div data-options="region:'south',border:false" style="height:85px;padding:10px;">
			<div id="showFooter">
			</div>
			<table style="width:100%;">
				<tr>
					<td style="vertical-align:top;">
						<c:if test="${QX.add == 1 }">
						<a class="btn btn-sm btn-success" onclick="add();">新增</a>
						<a class="btn btn-sm btn-success" onclick="commit();">提交</a>
						</c:if>
					</td>
					<td style="" align="right">
					</td>
				</tr>
			</table>
		</div>

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

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
		
	<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>	
	<script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="static/ace/js/jqGrid5.3/jquery.jqGrid.min.js"></script>
	<script src="static/ace/js/jqGrid5.3/i18n/grid.locale-cn.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(day){
			var  vApplyNo = $("#PORDER_APPLY_NO_LIKE").val();
			var  vMaterialName = $('#MATERIAL_NAME_LIKE').val();
			var  vMaterialSpec = $('#MATERIAL_SPEC_LIKE').val();
			var  vProviderName = $('#PROVIDER_NAME_LIKE').val();
			var  vDateStart = $('#DateStart').val();
			var  vDateEnd = $('#DateEnd').val();			
			var  lastLoginStart = $("#lastLoginStart").val();
			var  lastLoginEnd = $("#lastLoginEnd").val();
			var  statuses = $("#statusSelect").combobox('getValues');
			statuses = statuses.toString();
			$("#grid-task").jqGrid('setGridParam',{
		        datatype:'json',
		        postData:{STATUSES:statuses,DateStart:vDateStart,DateEnd:vDateEnd,lastLoginStart:lastLoginStart,lastLoginEnd:lastLoginEnd,PROVIDER_NAME_LIKE:vProviderName,PORDER_APPLY_NO_LIKE:vApplyNo,
		        	MATERIAL_NAME_LIKE:vMaterialName,MATERIAL_SPEC_LIKE:vMaterialSpec},
		        page:1
		    }).trigger("reloadGrid");
					
		}
		var grid_selector = "#grid-task";
		var pager_selector = "#grid-task-pager";
		$(function() {
			var  vbasePath = $('#basePath').val();
			var  vurl = vbasePath + '/orderapply/list_data_json.do';
			
			
			//resize to fit page size
			 $(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', $("#taskArea").width() - 10 );
				$(grid_selector).jqGrid( 'setGridHeight', $("#taskArea").height()-98);
		    }) 
			
		    
		   jQuery(grid_selector).jqGrid({					
					url:vurl,
					mtype:"POST",
					datatype: "json",				
					colModel:[
						{name:'PORDER_APPLY_DETAIL_ID',index:'PORDER_APPLY_DETAIL_ID', label:'ID',width:110, hidden:true,key:true},
						{name:'PORDER_APPLY_ID',index:'PORDER_APPLY_ID', hidden:true},
						{name:'DETAIL_STATUS1', hidden:true,formatter:formatStatus1},
						{name:'PORDER_APPLY_NO',index:'PORDER_APPLY_NO', label:'申请单号',width:120, sorttype:"string"},
						{name:'PORDER_APPLY_DATE',index:'PORDER_APPLY_DATE',label:'申请日期',width:120, sorttype:"string"},
						{name:'MATERIAL_NAME',index:'MATERIAL_NAME', label:'物料名称',width:120},
						{name:'MATERIAL_CODE',index:'MATERIAL_CODE', label:'物料代码',width:120},
						{name:'MATERIAL_SPEC',index:'MATERIAL_SPEC', label:'物料规格',width:120},
						{name:'MATERIAL_NUM',index:'MATERIAL_NUM', label:'申请数量',width:80,align:'right'},
						{name:'MATERIAL_WEIGHT',index:'MATERIAL_WEIGHT', label:'申请重量',width:80,align:'right'},
						{name:'MATERIAL_PRICE',index:'MATERIAL_PRICE', label:'预估单价',width:80,align:'right'},
						{name:'TOTAL_AMT',index:'TOTAL_AMT', label:'预估金额',width:80,align:'right'} ,
						{name:'DELIVERY_DATE',index:'DELIVERY_DATE',label:'交货期', width:80},
						{name:'APPLY_USER',index:'APPLY_USER',label:'申请人',width:80,align:'right'},
						{name:'DEPARTMENT_NAME',index:'DEPARTMENT_NAME', label:'申请部门',width:120,align:'left'},
						{name:'DETAIL_STATUS',index:'DETAIL_STATUS', label:'状态',width:80,align:'left',formatter:formatStatus}
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
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
				         
					},
					 rownumbers: true,
					 shrinkToFit:false,
					 autoScroll: true,
					 ondblClickRow:celldbClicked
			
				});

			 $(window).triggerHandler('resize.jqGrid');
			 
			 $(window).off('resize.jqGrid');
			 
			 
			//navButtons
			jQuery(grid_selector).jqGrid('navGrid',pager_selector,
				{ 	//navbar options
					edit: false,
					editicon : 'ace-icon fa fa-pencil blue',
					add: false,
					addicon : 'ace-icon fa fa-plus-circle purple',
					del: false,
					delicon : 'ace-icon fa fa-trash-o red',
					search: false,
					searchicon : 'ace-icon fa fa-search orange',
					refresh: false,
					refreshicon : 'ace-icon fa fa-refresh green',
					view: true,
					viewicon : 'ace-icon fa fa-search-plus grey',
				},
				{
					//edit record form
					//closeAfterEdit: true,
					//width: 700,
					recreateForm: true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_edit_form(form);
					}
				},
				{
					//new record form
					//width: 700,
					closeAfterAdd: true,
					recreateForm: true,
					viewPagerButtons: false,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
						.wrapInner('<div class="widget-header" />')
						style_edit_form(form);
					}
				},
				{
					//delete record form
					recreateForm: true,
					beforeShowForm : function(e) {
						var form = $(e[0]);
						if(form.data('styled')) return false;
						
						form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
						style_delete_form(form);
						
						form.data('styled', true);
					},
					onClick : function(e) {
						alert(1);
					}
				},
				{
					//search form
					recreateForm: true,
					afterShowSearch: function(e){
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						style_search_form(form);
					},
					afterRedraw: function(){
						style_search_filters($(this));
					}
					,
					multipleSearch: true,
					/**
					multipleGroup:true,
					showQuery: true
					*/
				},
				{
					//view record form
					recreateForm: true,
					beforeShowForm: function(e){
						var form = $(e[0]);
						form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					}
				}
			);
			
			function style_edit_form(form) {
				//enable datepicker on "sdate" field and switches for "stock" field
				form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
				
				form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
						   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
						  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
		
						
				//update buttons classes
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
				buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
				
				buttons = form.next().find('.navButton a');
				buttons.find('.ui-icon').hide();
				buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
				buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
			};
		
			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
				buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
			};
			
			function style_search_filters(form) {
				form.find('.delete-rule').val('X');
				form.find('.add-rule').addClass('btn btn-xs btn-primary');
				form.find('.add-group').addClass('btn btn-xs btn-success');
				form.find('.delete-group').addClass('btn btn-xs btn-danger'); 
			};
			function style_search_form(form) {
				var dialog = form.closest('.ui-jqdialog');
				var buttons = dialog.find('.EditTable')
				buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
				buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
				buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
			};
			
			function beforeDeleteCallback(e) {
				var form = $(e[0]);
				if(form.data('styled')) return false;
				
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				
				form.data('styled', true);
			};
			
			function beforeEditCallback(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			};
		
		
		
			//it causes some flicker when reloading or navigating grid
			//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
			//or go back to default browser checkbox styles for the grid
			function styleCheckbox(table) {
			/**
				$(table).find('input:checkbox').addClass('ace')
				.wrap('<label />')
				.after('<span class="lbl align-top" />')
		
		
				$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
				.find('input.cbox[type=checkbox]').addClass('ace')
				.wrap('<label />').after('<span class="lbl align-top" />');
			*/
			};
			
		
			//unlike navButtons icons, action icons in rows seem to be hard-coded
			//you can change them like this in here if you want
			function updateActionIcons(table) {
				/**
				var replacement = 
				{
					'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
					'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
					'ui-icon-disk' : 'ace-icon fa fa-check green',
					'ui-icon-cancel' : 'ace-icon fa fa-times red'
				};
				$(table).find('.ui-pg-div span.ui-icon').each(function(){
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
					if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
				})
				*/
			};
			
			//replace icons with FontAwesome icons like above
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
			
			
			function formatStatus( cellvalue, options, cell ) {
				if(cellvalue=="10"){ return "新增";}
	            if(cellvalue=="30"){ return "已提交";}
	            if(cellvalue=="80"){ return "完成";}
			};
			
			function formatStatus1(  rowId, val, rawObject, cm, rdata ) {
				return rawObject.DETAIL_STATUS
			};
			
			//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
		
			$(document).one('ajaxloadstart.page', function(e) {
				$(grid_selector).jqGrid('GridUnload');
				$('.ui-jqdialog').remove();
			});
			
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
		
			
		});
		
		
		//新增
		function add(){
			
			var url = '<%=basePath%>orderapply/goAdd.do';
			
			top.mainFrame.tabAddHandler("plan001","新增请购单",url);
			 
		}
		
		
		function del(){
			var rows = $('#grid-task').jqGrid('getGridParam', 'selarrrow');
		
			 for(var i=0;i<rows.length;i++){
				var row = $("#grid-task").jqGrid('getRowData', rows[i]);
				
				if(row["DEMAND_STATUS"] != '新增' && row["DEMAND_STATUS"] != '已提交'){
					bootbox.alert("只能删除新增或已提交状态的生产订单："+row["DEMAND_TAG"]);
					return ;
				}
			 }
			 
			 if(rows.length == 0){
				 bootbox.alert("请选择至少一条数据");
				 return ;
			 }
			 bootbox.confirm("确定删除这"+rows.length+"条生产订单吗？",function(r){
				 if(r){
					 var demandIds = new Array();
					 for(var i=0;i<rows.length;i++){
						 var row1 = $("#grid-task").jqGrid('getRowData', rows[i]);
						 demandIds.push(row1["DEMAND_ID"]);
					 }
					 $.ajax({
							type: "POST",
							url: '<%=basePath%>demand/deleteDemand.do?tm='+new Date().getTime(),
					    	data: {DEMAND_IDS:demandIds.toString()},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								$("#grid-task").jqGrid().trigger("reloadGrid");
										
							},
							error: function(xhr,errorText,errorType){					  
								window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
							}
					}); 
				 }
			 });
		 
		 }
		
		function getClientHeight()
		{
		  var clientHeight=0;
		  if(document.body.clientHeight&&document.documentElement.clientHeight)
		  {
		  var clientHeight = (document.body.clientHeight<document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
		  }
		  else
		  {
		  var clientHeight = (document.body.clientHeight>document.documentElement.clientHeight)?document.body.clientHeight:document.documentElement.clientHeight;
		  }
		  return window.screen.height;
		}
		
		function formatDayColor( rowId, val, rawObject, cm, rdata ) {
			if(val < 0){
				return "style='color:red;font-weight:bold;text-decoration:underline'";	
			}
		};
		
		function celldbClicked(rowid,iRow,iCol,e){
			
			//查看订单明细
			var row1 = $("#grid-task").jqGrid('getRowData', rowid);
            //获取点击的行
            var applyId = row1['PORDER_APPLY_ID'];
           
            var url = '<%=basePath%>' + 'orderapply/goEdit.do?PORDER_APPLY_ID='+applyId;
            var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑请购单";
			 diag.URL = url ;
			 diag.Width = 1500;
			 diag.Height = 755;
			 diag.CancelEvent = function(){ //关闭事件
				jQuery("#grid-task").jqGrid('setGridParam', {}).trigger('reloadGrid');
				diag.close();
			 };
			 diag.show();
		};
		
		
		function commit(){
			var rows = $('#grid-task').jqGrid('getGridParam', 'selarrrow');
			
			if(rows.length == 0){
				bootbox.alert("请选择至少一条数据");
				return ;
			}
			var list = new Array();
			for(var i=0;i<rows.length;i++){
				var row = $("#grid-task").jqGrid('getRowData', rows[i]);
				if(row["DETAIL_STATUS1"] == '10'){
					list.push(row["PORDER_APPLY_DETAIL_ID"]);
				}
			}
			$.ajax({
				type: "POST",
				url: '<%=basePath%>orderapplydetail/editCommitDetial.do?tm='+new Date().getTime(),
		    	data: {data:JSON.stringify(list)},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					$("#grid-task").jqGrid().trigger("reloadGrid");
							
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				}
			}); 
		}
	</script>
	
	
	<script type="text/javascript">
	$(function(){
		var queryItemData = [
		                     {id:10,text:'新增' },
		                     {id:30,text:"已提交"},
		                     {id:80,text:"已完成"}
		                     ]
        $("#statusSelect").combobox({
        	data:queryItemData,
        	onChange : function(){
        		tosearch();
        	}
        }
        		
		)
	})
	</script>

</body>
</html>