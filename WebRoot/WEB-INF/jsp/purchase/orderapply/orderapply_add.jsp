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
<body class="no-skin">
	<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
    <input type="hidden"  id="basePath" name="basePath" value="<%=basePath%>"/>	
    <input type="hidden"  id="PORDER_APPLY_ID"  value="${pd.PORDER_APPLY_ID }"/>	
    <input type="hidden"  id="PORDER_APPLY_DETAIL_ID"  value="${detail.PORDER_APPLY_DETAIL_ID }"/>	
	<!-- /section:basics/navbar.layout -->
		<div class="row">
		<div class="col-xs-12">
		<div class="row" >
			<div class="col-xs-12">
			<table style="margin-top:5px; width:100%" class="table table-striped table-bordered table-hover" >
				<tbody>
				<tr>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						选择配件：
					</td>
					<td>
						<input type="text" id="MATERIAL_NAME" name="MATERIAL_NAME" value="${detail.MATERIAL_NAME }" placeholder="配件名称"/>
						<input type="hidden" id="MATERIAL_ID" value="${detail.MATERIAL_ID }" />
						<input type="hidden" id="MATERIAL_SPEC" value="${detail.MATERIAL_SPEC }" />
						<a class="btn btn-light btn-xs" onclick="selectPart();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						件号：
					</td>
					<td>
						<input type="text" placeholder="件号" readonly="readonly" class="nav-search-input" id="MATERIAL_CODE" name="MATERIAL_CODE" value="${detail.MATERIAL_CODE }" />
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						配件数量：
					</td>
					<td>
						<input type="number" placeholder="数量" class="nav-search-input" id="MATERIAL_NUM" name="MATERIAL_NUM" value="${detail.MATERIAL_NUM }" />
					</td>
				</tr>
				<tr>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						供应商名称：
					</td>
					<td>
						<input type="text" placeholder="供应商" class="nav-search-input" id="PROVIDER_NAME" name="PROVIDER_NAME" value="${detail.PROVIDER_NAME }" />
						<a class="btn btn-light btn-xs" onclick="selectProvider();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
						<input type="hidden" id="PROVIDER_ID" value="${detail.PROVIDER_ID }" />
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						交货期：
					</td>
					<td>
						<input class="span10 date-picker" name="DELIVERY_DATE" id="DELIVERY_DATE"  type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" value="${detail.DELIVERY_DATE }" title="交货期"/>
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						预计单价：
					</td>
					<td>
						<input type="number" placeholder="预计单价" id="MATERIAL_PRICE" name="MATERIAL_PRICE" value="${pd.MATERIAL_PRICE }" />
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						备注：
					</td>
					<td colspan="10"><textarea rows="1" style="width:80%" id="REMARK_DETAIL" value="${detial.REMARK }" ></textarea></td>
				</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="20" style="text-align: center;">
							<c:if test="${empty pd.STATUS || pd.STATUS == '10' }">
								<a class="btn btn-sm btn-success" onclick="addDetail();">添加</a>&nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="goPartSelect();">从库存预警中选择配件</a>
							</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
		</div>
								
		<div class="row" id="taskArea" style="z-index:1;height:400px;" >		
			<<div class="col-xs-12">						
			<table id="grid-task"></table>
			<div id="grid-task-pager" style="align:left;"></div>			
			</div>				
		</div>
		
		<div class="row" style="padding:10px;" >
			<div class="col-xs-12">
			<table style="width:100%;" class="table table-striped table-bordered table-hover">
				<tr>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						总数量：
					</td>
					<td>
						<input type='number' id="TOTAL_NUM" readonly="readonly" value="${pd.TOTAL_NUM }" />
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						总金额：
					</td>
					<td>
						<input type='number' id="TOTAL_AMT" readonly="readonly" value="${pd.TOTAL_AMT }"/>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						请购单号：
					</td>
					<td>
						<input type='text' id="PORDER_APPLY_NO" readonly="readonly" value="${pd.PORDER_APPLY_NO }"/>
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						请购日期：
					</td>
					<td>
						<input class="span10 date-picker" id="PORDER_APPLY_DATE"  type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" value="${pd.PORDER_APPLY_DATE }" title="请购日期"/>
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						请购人：
					</td>
					<td>
						<input type='text' id="APPLY_USER" value="${pd.APPLY_USER }"/>
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						请购部门
					</td>
					<td>
						<select class="chosen-select form-control" name="APPLY_DEPARTMENT_ID" id="APPLY_DEPARTMENT_ID" data-placeholder="请选择请购部门" style="vertical-align:top;" style="width:98%;" >
							<option value=""></option>
							<c:forEach items="${deptList}" var="deptuser">
								<option value="${deptuser.DEPARTMENT_ID }" <c:if test="${deptuser.DEPARTMENT_ID == pd.APPLY_DEPARTMENT_ID }">selected</c:if>>${deptuser.NAME }</option>
							</c:forEach>
						</select>
						<input type='hidden' id="DEPARTMENT_NAME" value="${pd.DEPARTMENT_NAME }"/>
					</td>
				</tr>
				<tr>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						状态：
					</td>
					<td style="vertical-align: center;padding-top: 13px;">
						<c:if test="${pd.STATUS=='10'}">新增</c:if>
						<c:if test="${pd.STATUS=='30'}">已提交</c:if>
						<c:if test="${pd.STATUS=='80'}">已完成</c:if>
					</td>
					<td style="width:120px;text-align: right;padding-top: 13px;">
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td style="width:120px;text-align: right;padding-top: 13px;">
						备注：
					</td>
					<td colspan="20">
						<textarea rows="1" style="width:80%" id="REMARK" value="${pd.REMARK }"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="20" class="center">
						<c:if test="${empty pd.STATUS || pd.STATUS == '10' }"><a class="btn btn-sm btn-success" onclick="saveMain();">保存</a>&nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="commit();">提交</a></c:if>
					</td>
				</tr>
			</table>
			</div>
		</div>
</div>
</div>
</div>
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
		
		var grid_selector = "#grid-task";
		var pager_selector = "#grid-task-pager";
		$(function() {
			
			//resize to fit page size
			 $(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', $("#taskArea").width() - 30 );
				$(grid_selector).jqGrid( 'setGridHeight', $("#taskArea").height()-70);
		    }) 
			
		   var vurl = "";
		   if($("#PORDER_APPLY_ID").val() != ''){ 
			   vurl = "<%=basePath%>" + '/orderapplydetail/list_data_json.do?PORDER_APPLY_ID='+$("#PORDER_APPLY_ID").val();
		   }
		   jQuery(grid_selector).jqGrid({					
					mtype:"POST",
					url:vurl,
					datatype: "json",				
					colModel:[
						{name:'PORDER_APPLY_DETAIL_ID',index:'PORDER_APPLY_DETAIL_ID', label:'ID',width:110, hidden:true,key:true},
						{name:'PORDER_APPLY_ID',index:'PORDER_APPLY_ID', hidden:true},
						{name:'MATERIAL_NAME',index:'MATERIAL_NAME', label:'配件名称',width:150, sorttype:"string"},
						{name:'MATERIAL_CODE',index:'MATERIAL_CODE', label:'件号',width:150, sorttype:"string"},
						{name:'MATERIAL_SPEC',index:'MATERIAL_SPEC',label:'配件规格',width:120, sorttype:"string"},
						{name:'MATERIAL_NUM',index:'MATERIAL_NUM', label:'配件数量',width:60,align:'right'},
						{name:'DELIVERY_DATE',index:'DELIVERY_DATE', label:'交货期',width:120},
						{name:'MATERIAL_PRICE',index:'MATERIAL_PRICE', label:'预计单价',width:70,align:'right'},
						{name:'TOTAL_AMT',index:'TOTAL_AMT', label:'预计金额',width:70,align:'right'},
						{name:'PROVIDER_NAME',index:'PROVIDER_NAME', label:'预计供应商',width:150},
						{name:'DETAIL_STATUS',index:'DETAIL_STATUS', label:'状态',width:80,formatter:formatStatus} ,
						{name:'MOULD_INFO_NO',index:'MOULD_INFO_NO', label:'模具档案号',align:'right',width:150},
						{name:'',index:'PORDER_APPLY_DETAIL_ID',label:'操作',width:150,align:'center',formatter:btnFormat},
					], 			
					viewrecords : true,
					rowNum:20,
					rowList:[10,20,30,50,100],
					pager : pager_selector,
					altRows: true,
					multiselect: true,
					multiboxonly: true,
					 rownumbers: true,
					 shrinkToFit:false,
					 autoScroll: true
				});

			 $(window).triggerHandler('resize.jqGrid');
			 
			 $(window).off('resize.jqGrid');
			 
		
			
			function formatStatus( cellvalue, options, cell ) {
				if(cellvalue=="10"){ return "新增";}
	            if(cellvalue=="30"){ return "已提交";}
	            if(cellvalue=="80"){ return "完成";}
			};
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
		
		
		function del(applyDetailId,applyId,status){
			if(status == "10"){
				bootbox.confirm("确定删除这条采购申请吗？",function(r){
				 if(r){
					 $.ajax({
							type: "POST",
							url: '<%=basePath%>orderapplydetail/delDetail.do?tm='+new Date().getTime(),
					    	data: {PORDER_APPLY_ID:applyId,PORDER_APPLY_DETAIL_ID:applyDetailId},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								var vurl = "<%=basePath%>" + '/orderapplydetail/list_data_json.do';
								$("#grid-task").jqGrid('setGridParam',{
									url:vurl,
							        datatype:'json',
							        postData:{PORDER_APPLY_ID:data.main.PORDER_APPLY_ID},
							        page:1
							    }).trigger("reloadGrid");
								$("#PORDER_APPLY_ID").val(data.main.PORDER_APPLY_ID);
								$("#TOTAL_AMT").val(data.main.TOTAL_AMT);
								$("#TOTAL_NUM").val(data.main.TOTAL_NUM);
								$("#PORDER_APPLY_NO").val(data.main.PORDER_APPLY_NO);
								$("#PORDER_APPLY_DATE").val(data.main.PORDER_APPLY_DATE);
								$("#APPLY_USER").val(data.main.APPLY_USER);
							},
							error: function(xhr,errorText,errorType){					  
								window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
							}
					}); 
				 }
			 }); 
			}else{
				bootbox.alert("该条采购申请状态非新增不能删除")
			}
		 
		 }
		
		function edit(applyDetailId,applyId,status){
			if(status == "10"){
				 $.ajax({
						type: "POST",
						url: '<%=basePath%>orderapplydetail/findById.do?tm='+new Date().getTime(),
				    	data: {PORDER_APPLY_ID:applyId,PORDER_APPLY_DETAIL_ID:applyDetailId},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							$("#PORDER_APPLY_ID").val(data.detail.PORDER_APPLY_ID);
							$("#PORDER_APPLY_DETAIL_ID").val(data.detail.PORDER_APPLY_DETAIL_ID);
							$("#MATERIAL_NAME").val(data.detail.MATERIAL_NAME);
							$("#MATERIAL_SPEC").val(data.detail.MATERIAL_SPEC);
							$("#MATERIAL_ID").val(data.detail.MATERIAL_ID);
							$("#MATERIAL_NUM").val(data.detail.MATERIAL_NUM);
							$("#MATERIAL_PRICE").val(data.detail.MATERIAL_PRICE);
							$("#DELIVERY_DATE").val(data.detail.DELIVERY_DATE);
							$("#PROVIDER_ID").val(data.detail.PROVIDER_ID);
							$("#PROVIDER_NAME").val(data.detail.PROVIDER_NAME);
						},
						error: function(xhr,errorText,errorType){					  
							window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
						}
				}); 
			}else{
				bootbox.alert("该条采购申请状态非新增不能修改")
			}
		 
		 }
		
		
		
		
		function btnFormat(rowId, val, rawObject, cm, rdata){
			if(rawObject.DETAIL_STATUS=='10'){
				return "<a class='btn btn-xs btn-danger' onclick=\"del('"+rawObject.PORDER_APPLY_DETAIL_ID+"','"+rawObject.PORDER_APPLY_ID+"','"+rawObject.DETAIL_STATUS+"')\">删除</a>&nbsp;&nbsp;"+
				"<a class='btn btn-xs btn-success' onclick=\"edit('"+rawObject.PORDER_APPLY_DETAIL_ID+"','"+rawObject.PORDER_APPLY_ID+"','"+rawObject.DETAIL_STATUS+"')\">修改</a>"
			}else{
				return "";
			}
		};
		
		function addDetail(){
			//明细信息
			var materialId = $("#MATERIAL_ID").val();
			var materialName = $("#MATERIAL_NAME").val();
			var materialSpec = $("#MATERIAL_SPEC").val();
			var materialNum = $("#MATERIAL_NUM").val();
			var materialPrice = $("#MATERIAL_PRICE").val();
			var providerId = $("#PROVIDER_ID").val();
			var providerName = $("#PROVIDER_NAME").val();
			var deliveryDate = $("#DELIVERY_DATE").val();
			var remark = $("#DETAIL_REMARK").val();
			var applyDetailId = $("#PORDER_APPLY_DETAIL_ID").val();
			
			//主项信息
			var applyId = $("#PORDER_APPLY_ID").val();
			var totalAmt = $("#TOTAL_AMT").val();
			var totalNum = $("#TOTAL_NUM").val();
			var applyNo = $("#PORDER_APPLY_NO").val();
			var applyDate = $("#PORDER_APPLY_DATE").val();
			var applyUser = $("#APPLY_USER").val();
			var applyDepartmentId = $("#APPLY_DEPARTMENT_ID").val();
			var mObj = {};
			mObj.TOTAL_AMT = totalAmt;
			mObj.TOTAL_NUM = totalNum;
			mObj.PORDER_APPLY_NO = applyNo;
			mObj.PORDER_APPLY_DATE = applyDate;
			mObj.APPLY_USER = applyUser;
			mObj.APPLY_DEPARTMENT_ID = applyDepartmentId;
			mObj.PORDER_APPLY_ID = applyId;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>orderapplydetail/saveDetail.do',
		    	data: {PORDER_APPLY_ID:applyId,PORDER_APPLY_DETAIL_ID:applyDetailId,MATERIAL_ID:materialId,MATERIAL_NAME:materialName,MATERIAL_SPEC:materialSpec,MATERIAL_NUM:materialNum,MATERIAL_PRICE:materialPrice,
		    		PROVIDER_ID:providerId,PROVIDER_NAME:providerName,DELIVERY_DATE:deliveryDate,REMARK:remark,mData:JSON.stringify(mObj)}, 
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					var vurl = "<%=basePath%>" + '/orderapplydetail/list_data_json.do';
					$("#grid-task").jqGrid('setGridParam',{
						url:vurl,
				        datatype:'json',
				        postData:{PORDER_APPLY_ID:data.main.PORDER_APPLY_ID},
				        page:1
				    }).trigger("reloadGrid");
					$("#PORDER_APPLY_ID").val(data.main.PORDER_APPLY_ID);
					$("#TOTAL_AMT").val(data.main.TOTAL_AMT);
					$("#TOTAL_NUM").val(data.main.TOTAL_NUM);
					$("#PORDER_APPLY_NO").val(data.main.PORDER_APPLY_NO);
					$("#PORDER_APPLY_DATE").val(data.main.PORDER_APPLY_DATE);
					$("#APPLY_USER").val(data.main.APPLY_USER);
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				} 
				 
			}); 
		}
		
		//选择供应商
		function selectProvider(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择供应商";
			 diag.URL = '<%=basePath%>tradeunit/providerselect.do';
			 diag.Width = 850;
			 diag.Height = 355;
			
			 diag.CancelEvent = function(){ //关闭事件
				 
				var str = diag.innerFrame.contentWindow.document.getElementsByName('tradeunitIDSelect').value;
			    var str1 = diag.innerFrame.contentWindow.document.getElementsByName('tradeunitCodeSelect').value;
			    var str2 = diag.innerFrame.contentWindow.document.getElementsByName('tradeunitNameSelect').value;
			    if(str2){
				    $("#PROVIDER_NAME").val(str2);
				    $("#PROVIDER_ID").val(str);
			    }
				diag.close();
				$("#PROVIDER_NAME").focus();
			 };
			 diag.show();
		}
		
		
		function selectPart(){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择配件";
			 diag.URL = '<%=basePath%>material/goPartSelect.do';
			 diag.Width = 1500;
			 diag.Height = 1000;
			
			 diag.CancelEvent = function(){ //关闭事件

				var str = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_ID_SELECT').value;
				var str1 = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_NAME_SELECT').value;
				var str2 = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_SPEC_SELECT').value;
				var str3 = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_CODE_SELECT').value;
				$("#MATERIAL_ID").eq(0).val(str);
				$("#MATERIAL_NAME").eq(0).val(str1);
				$("#MATERIAL_SPEC").eq(0).val(str2);
				$("#MATERIAL_CODE").eq(0).val(str3);
				diag.close();
			 };
			 diag.show();
		}
		
		
		function saveMain(){
			var applyId = $("#PORDER_APPLY_ID").val();
			var totalAmt = $("#TOTAL_AMT").val();
			var totalNum = $("#TOTAL_NUM").val();
			var applyNo = $("#PORDER_APPLY_NO").val();
			var applyDate = $("#PORDER_APPLY_DATE").val();
			var applyUser = $("#APPLY_USER").val();
			var applyDepartmentId = $("#APPLY_DEPARTMENT_ID").val();
			var mObj = {};
			mObj.TOTAL_AMT = totalAmt;
			mObj.TOTAL_NUM = totalNum;
			mObj.PORDER_APPLY_NO = applyNo;
			mObj.PORDER_APPLY_DATE = applyDate;
			mObj.APPLY_USER = applyUser;
			mObj.APPLY_DEPARTMENT_ID = applyDepartmentId;
			mObj.PORDER_APPLY_ID = applyId;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>orderapply/saveMain.do',
		    	data: {data:JSON.stringify(mObj)}, 
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					var vurl = "<%=basePath%>" + '/orderapplydetail/list_data_json.do';
					$("#grid-task").jqGrid('setGridParam',{
						url:vurl,
				        datatype:'json',
				        postData:{PORDER_APPLY_ID:data.main.PORDER_APPLY_ID},
				        page:1
				    }).trigger("reloadGrid");
					$("#PORDER_APPLY_ID").val(data.main.PORDER_APPLY_ID);
					$("#TOTAL_AMT").val(data.main.TOTAL_AMT);
					$("#TOTAL_NUM").val(data.main.TOTAL_NUM);
					$("#PORDER_APPLY_NO").val(data.main.PORDER_APPLY_NO);
					$("#PORDER_APPLY_DATE").val(data.main.PORDER_APPLY_DATE);
					$("#APPLY_USER").val(data.main.APPLY_USER);
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				} 
				 
			}); 
		}

		function commit(){
			var applyId = $("#PORDER_APPLY_ID").val();
			if(!applyId){
				bootbox.alert("请先添加明细");
			}
			var totalAmt = $("#TOTAL_AMT").val();
			var totalNum = $("#TOTAL_NUM").val();
			var applyNo = $("#PORDER_APPLY_NO").val();
			var applyDate = $("#PORDER_APPLY_DATE").val();
			var applyUser = $("#APPLY_USER").val();
			var applyDepartmentId = $("#APPLY_DEPARTMENT_ID").val();
			var mObj = {};
			mObj.TOTAL_AMT = totalAmt;
			mObj.TOTAL_NUM = totalNum;
			mObj.PORDER_APPLY_NO = applyNo;
			mObj.PORDER_APPLY_DATE = applyDate;
			mObj.APPLY_USER = applyUser;
			mObj.APPLY_DEPARTMENT_ID = applyDepartmentId;
			mObj.PORDER_APPLY_ID = applyId;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>orderapply/editCommit.do',
		    	data: {data:JSON.stringify(mObj)}, 
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					$("#grid-task").jqGrid().trigger("reloadGrid");
					$(".btn").addClass("hidden");
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				} 
				 
			}); 
		}
		
		
		//选择库存预警的配件
		function goPartSelect(){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择库存预警配件";
			 diag.URL = '<%=basePath%>moulddetail/goListNoEnoughSelect.do';
			 diag.Width = 1200;
			 diag.Height = 800;
			
			 diag.CancelEvent = function(){ //关闭事件
				 
				var str = diag.innerFrame.contentWindow.document.getElementById('partsSelect').value;
			    if(str){
				   var list = eval(str);
				   var listDetail = new Array();
				   for(var i=0;i<list.length;i++){
					   var materialId = list[i].PART_ID;
					   var materialName = list[i].PART_NAME;
					   var materialSpec = list[i].PART_SPEC;
					   var materialFigureNo = list[i].PART_FIGURE_NO;
					   var obj = {};
					   obj.MATERIAL_ID = materialId;
					   obj.MATERIAL_NAME = materialName;
					   obj.MATERIAL_SPEC = materialSpec;
					   obj.MATERIAL_FIGURE_NO = materialFigureNo;
					   listDetail.push(obj);
				   }
				 //主项信息
					var applyId = $("#PORDER_APPLY_ID").val();
					var totalAmt = $("#TOTAL_AMT").val();
					var totalNum = $("#TOTAL_NUM").val();
					var applyNo = $("#PORDER_APPLY_NO").val();
					var applyDate = $("#PORDER_APPLY_DATE").val();
					var applyUser = $("#APPLY_USER").val();
					var applyDepartmentId = $("#APPLY_DEPARTMENT_ID").val();
					var mObj = {};
					mObj.TOTAL_AMT = totalAmt;
					mObj.TOTAL_NUM = totalNum;
					mObj.PORDER_APPLY_NO = applyNo;
					mObj.PORDER_APPLY_DATE = applyDate;
					mObj.APPLY_USER = applyUser;
					mObj.APPLY_DEPARTMENT_ID = applyDepartmentId;
					mObj.PORDER_APPLY_ID = applyId;
					$.ajax({
						type: "POST",
						url: '<%=basePath%>orderapplydetail/saveDetails.do',
				    	data: {detailData:JSON.stringify(listDetail),mData:JSON.stringify(mObj)}, 
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							var vurl = "<%=basePath%>" + '/orderapplydetail/list_data_json.do';
							$("#grid-task").jqGrid('setGridParam',{
								url:vurl,
						        datatype:'json',
						        postData:{PORDER_APPLY_ID:data.main.PORDER_APPLY_ID},
						        page:1
						    }).trigger("reloadGrid");
							$("#PORDER_APPLY_ID").val(data.main.PORDER_APPLY_ID);
							$("#TOTAL_AMT").val(data.main.TOTAL_AMT);
							$("#TOTAL_NUM").val(data.main.TOTAL_NUM);
							$("#PORDER_APPLY_NO").val(data.main.PORDER_APPLY_NO);
							$("#PORDER_APPLY_DATE").val(data.main.PORDER_APPLY_DATE);
							$("#APPLY_USER").val(data.main.APPLY_USER);
						},
						error: function(xhr,errorText,errorType){					  
							window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
						} 
						 
					}); 
			    }
				diag.close();
			 };
			 diag.show();
		}
		
		
	</script>
	
	

</body>
</html>