<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<form action="material/${msg}.do" name="Form" id="Form" method="post">
	<div id="zhongxin" style="padding-top: 13px;">
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="page-header">
					<h1>
						模具配件信息
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							这里添加模具的配件信息。
						</small>
					</h1>
				</div>
				<div class="row">
					<div class="col-xs-5">
						<input type="hidden" name="MAKE_BOM_ID" id="MAKE_BOM_ID" value="${pd.MAKE_BOM_ID}"/>
						<input type="hidden" name="MATERIAL_ID" id="MATERIAL_ID" value="${pd.MATERIAL_ID}"/>
						<input type="hidden" name="TYPE" id="TYPE" value="30"/>
						<table id="table_report1" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">模具名称:</td>
								<td>${pd.PRODUCTION_NAME}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">模具图号:</td>
								<td>${pd.PRODUCTION_CODE}</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">模具类型:</td>
								<td><label  for="chongya">冲压</label>
									<input type="radio" name="TYPE_NO" id="chongya" value="chongya"/>
									<label  for="qieduan">切断</label>
									<input type="radio" name="TYPE_NO" id="qieduan" value="qieduan"/>
								</td>
							</tr>
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">备注:</td>
								<td colspan="3">
									<pre>${pd.REMARK1}</pre>
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">录入人信息:</td>
								<td  style="padding-top: 13px;">${pd.CREATE_USER}<br/>${pd.CREATE_DATE}</td>							
								
							</tr>							
						</table>
						<ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">

							<li class="active">
								<a data-toggle="tab" href="#faq-tab-1">
									选择已有配件
								</a>
							</li>
							<li>
								<a data-toggle="tab" href="#faq-tab-2">
									新增模具配件
								</a>
							</li>
							
						</ul>
						<div class="tab-content no-border padding-24">
							<input type="hidden"  name=partsClassID id="partsClassID" value="" />	
							<div id="faq-tab-1" class="tab-pane fade in active">								
								<table id="table_head1" class="table table-striped table-bordered table-hover">
									
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">零件号:</td>
										<td>
											<input class="nextInput" type="text"  name="PRODUCTION_FIGURE_NO" id="PRODUCTION_FIGURE_NO" value="${parts.PRODUCTION_FIGURE_NO}" maxlength="" placeholder="这里输入零件号" title="生产日期" style="width:80%;"/>
											<a class="btn btn-light btn-xs" onclick="selectPart();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
										</td>
									</tr>
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">零件名称:</td>
										<td>
											<input type="hidden"  name="PRODUCTION_ID" id="PRODUCTION_ID" value="${parts.PRODUCTION_ID}" />		
											<input class="nextInput" type="text"  name="PRODUCTION_NAME" id="PRODUCTION_NAME" value="${parts.PRODUCTION_NAME}" readOnly="readOnly" placeholder="这里输入零件名称" title="生产日期" style="width:80%;"/>
										</td>
									</tr>
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">数量:</td>
										<td>
											<input class="nextInput" type="number"  name="PRODUCTION_NUM" id="PRODUCTION_NUM" value="${parts.PRODUCTION_NUM}" maxlength="" placeholder="这里输入配件的数量" title="生产日期" style="width:90%;"/>PCS
										</td>
									</tr>
												
								</table>								
							</div>
							<div id="faq-tab-2" class="tab-pane fade ">
								<table id="table_head2" class="table table-striped table-bordered table-hover">
									
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">零件号:</td>
										<td>
											<input class="nextInput" type="text"  name="PRODUCTION_FIGURE_NO_NEW" id="PRODUCTION_FIGURE_NO_NEW" onkeydown="findPartsNoByDrawingNo();" placeholder="这里输入零件号" title="生产日期" style="width:98%;"/>
										</td>
									</tr>
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">零件名称:</td>
										<td>
											<!-- <input type="hidden"  name="PRODUCTION_ID_NEW" id="PRODUCTION_ID_NEW" value="" />	 -->	
											<input class="nextInput" type="text"  name="PRODUCTION_NAME_NEW" id="PRODUCTION_NAME_NEW" value="" maxlength="" placeholder="这里输入零件名称" title="生产日期" style="width:80%;"/>
											<a class="btn btn-light btn-xs" onclick="selectMaterialNew();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
										</td>
									</tr>
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">数量:</td>
										<td>
											<input class="nextInput" type="number"  name="PRODUCTION_NUM_NEW" id="PRODUCTION_NUM_NEW" value="" maxlength="" placeholder="这里输入配件的数量" title="生产日期" style="width:90%;"/>PCS
										</td>
									</tr>
												
								</table>
							</div>
						</div>
						
					</div>
					<!-- /.col -->
					<div class="col-xs-7">
						<div class="widget-box">
							<div class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
								<h4 class="lighter">【零件名称（零件号）】配件的加工工艺信息</h4>
							</div>
							<h5 class="lighter">配件使用材料：</h5>
								<table id="table_head" class="table table-striped table-bordered table-hover">
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">材料名称:</td>
										<td>
											<input class="nextInput" type="text"  name="PART_NAME" id="PART_NAME" value="${material.PART_NAME}" maxlength="" placeholder="这里输入配件的使用材料" title="生产日期" style="width:80%;"/>
											<input type="hidden"  name="PART_ID" id="PART_ID" value="${pd.PART_ID}" />
											<a class="btn btn-light btn-xs" onclick="selectMaterial2();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
										</td>																
										
									</tr>
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">材料规格:</td>
										<td>
											<input class="nextInput" type="text" value="${material.MATEIRAL_SPEC }" name="MATERIAL_SPEC" id="MATERIAL_SPEC">（单位：mm）（H×W×L）
											<a class="btn btn-xs btn-success" id="btnClearMaterial" onclick="clearMaterial();">清除材料</a>
										</td>
									</tr>
									<tr>
										<td style="width:150px;text-align: right;padding-top: 13px;">使用规格:</td>
										<td >
											<input type="hidden"  name="PART_SPEC" id="PART_SPEC" value="${material.PART_SPEC}" maxlength="" placeholder="厚度" style="width:30%;"/>
											<input type="text"  class="nextInput" name="SIZE_H" id="SIZE_H" value="${material.SIZE_H}" maxlength="" placeholder="厚度" style="width:30%;"/>
											<input type="text"  class="nextInput" name="SIZE_W" id="SIZE_W" value="${material.SIZE_W}" maxlength="" placeholder="宽度" style="width:30%;"/>
											<input type="text"  class="nextInput" name="SIZE_L" id="SIZE_L" value="${material.SIZE_L}" maxlength="" placeholder="长度" style="width:30%;"/>
										</td>
									</tr>							
								</table>
								
							<h5 class="lighter">配件加工工艺：</h5>
							<div style="float: right;">
								&nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="saveTemplate();">保存为模板</a>&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="selectTemplate();">选择模板</a>
								&nbsp;&nbsp;<a class="btn btn-sm btn-danger" onclick="clearTemplate();">清空</a>&nbsp;
							</div>
							<table id="processListTable" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
								<thead>
									<tr>
										<th class="center" style="width:50px;">序号</th>
										<th class="center" style="display:none;"></th>
										<th class="center" style="width:150px;">加工工艺</th>
										<th class="center" style="width:90px;">加工次序</th>
										<th class="center" style="width:150px;">单件预估工时</th>
										<th class="center">操作</th>
									</tr>
								</thead>
														
								<tbody>
									<!-- 开始循环 -->	
									<c:choose>
										<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="var" varStatus="vs">
												<tr>
													<td class='center' style="width: 30px;">${var.PROCESS_ORDER}</td>
													<td class='center' style="display:none;">${var.CRAFT_NO}</td>
													<td class='center'>
													    ${var.CRAFT_NAME}
													</td>
													<td class='center'>
													    <input type="text"  name="PROCESS_ORDER" id="PROCESS_ORDER" value="${var.PROCESS_ORDER}" onkeydown="focusNextInput(this)" maxlength="" placeholder="填次序" title="加工次序" style="width:80%;padding: 1px;line-height: 5px;"/>	
													</td>
													<td class='center'>
													    <input type="text"  name="ESTIMATE_TIME" id="ESTIMATE_TIME" value="" onkeydown="focusNextInput(this)" maxlength="" placeholder="填工时（分钟）" title="预估工时" style="width:80%;padding: 1px;line-height: 5px;"/>	
													</td>	
													<td style="display: none;"><span name="PROCESS_CODE">${var.PROCESS_CODE}</span></td>
													<td style="display: none;"><span name="PROCESS_CLASS_ID">${var.PROCESS_CLASS_ID}</span></td>
													<td style="display: none;"><span name="PROCESS_CLASS_NAME">${var.PROCESS_CLASS_NAME}</span></td>
																									
													<td class="center">
															<a class="btn btn-mini btn-grey" onclick="upList(this);"><i class="icon-pencil"></i>上移</a>
													   		<a class="btn btn-mini btn-grey" onclick="downList(this);"><i class="icon-pencil"></i>下移</a> &nbsp;&nbsp;&nbsp;
													    	<a class="btn btn-mini btn-pink" onclick="deleteRow(this);"><i class="icon-pencil"></i>删除</a>																								    
												     </td> 
												</tr>																			
											
											</c:forEach>																		
											
										</c:when>
										
									</c:choose>
								</tbody>
							</table>
							
						</div>
					</div>
					
					<table id="table_report_but" class="table table-striped table-bordered table-hover">							
						<tr>
							<td style="text-align: center;" colspan="10">
								<a class="btn btn-sm btn-primary" onclick="saveAndNext();">保存并添加下一条</a>
								<a class="btn btn-sm btn-success" onclick="saveAndClose();">保存并关闭</a>
								<a class="btn btn-sm btn-danger" onclick="top.Dialog.close();">取消</a>
							</td>
						</tr>
					</table>
				</div>
				
		
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->
</div>
						
<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
</form>
	
<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			/* if($("#MATERIAL_ID").val()==""){
				$("#MATERIAL_ID").tips({
					side:3,
		            msg:'请输入',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_ID").focus();
			return false;
			} */
			if($("#MATERIAL_NAME").val()==""){
				$("#MATERIAL_NAME").tips({
					side:3,
		            msg:'请输入配件名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_NAME").focus();
			return false;
			}
			var checkDropDown = $("#DROPDOWN_FLAG").is(':checked');
			if(!checkDropDown){
				if($("#FILE_NO").val()==""){
					$("#FILE_NO").tips({
						side:3,
			            msg:'请输入模具图号',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#FILE_NO").focus();
				return false;
				}
				if($("#FIGURE_NO").val()==""){
					$("#FIGURE_NO").tips({
						side:3,
			            msg:'请输入配件零件号',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#FIGURE_NO").focus();
				return false;
				}
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show(); 
		}
		
		function saveAndNext(){
			saveDetail('next');
		}
		
		function saveAndClose(){
			saveDetail('close');
		}
		
		function addNowTabParam(obj){
			var p = $("#myTab").find("li[class='active']").find("a").attr('href');
			
			var PRODUCTION_ID = ''
			var PRODUCTION_NAME = ''
			var PRODUCTION_NUM = ''
			var PRODUCTION_FIGURE_NO = ''
			if(p == '#faq-tab-1'){
				PRODUCTION_ID = $("#PRODUCTION_ID").val();
				PRODUCTION_NAME = $("#PRODUCTION_NAME").val();
				PRODUCTION_NUM = $("#PRODUCTION_NUM").val(); 
				PRODUCTION_FIGURE_NO = $("#PRODUCTION_FIGURE_NO").val();
			}else{
		//		PRODUCTION_ID = $("#PRODUCTION_ID_NEW").val();
				PRODUCTION_NAME = $("#PRODUCTION_NAME_NEW").val();
				PRODUCTION_NUM = $("#PRODUCTION_NUM_NEW").val(); 
				PRODUCTION_FIGURE_NO = $("#PRODUCTION_FIGURE_NO_NEW").val();
			}
			
			obj.PRODUCTION_ID = PRODUCTION_ID;
			obj.PRODUCTION_FIGURE_NO = PRODUCTION_FIGURE_NO;
			obj.PRODUCTION_NAME = PRODUCTION_NAME;
			obj.PRODUCTION_NUM = PRODUCTION_NUM;
		}
		
		function saveDetail(flag){
			
			var obj = {};
			addNowTabParam(obj);
			/* var PRODUCTION_ID = $("#PRODUCTION_ID").val();
			var PRODUCTION_NAME = $("#PRODUCTION_NAME").val();
			var PRODUCTION_NUM = $("#PRODUCTION_NUM").val(); 
			var PRODUCTION_FIGURE_NO = $("#PRODUCTION_FIGURE_NO").val();*/
			
			var MAKE_BOM_ID = $("#MAKE_BOM_ID").val();
			var PART_ID = $("#PART_ID").val();
			var PART_NAME = $("#PART_NAME").val();

			var sizeH = $("#SIZE_H").val();
			var sizeW = $("#SIZE_W").val();
			var sizeL = $("#SIZE_L").val();
			if(sizeH != ''){
				$("#PART_SPEC").val(sizeH+"*"+sizeW+"*"+sizeL);
			}
			var PART_SPEC = $("#PART_SPEC").val();

			obj.MAKE_BOM_ID = MAKE_BOM_ID;
			/* obj.PRODUCTION_ID = PRODUCTION_ID;
			obj.PRODUCTION_FIGURE_NO = PRODUCTION_FIGURE_NO;
			obj.PRODUCTION_NAME = PRODUCTION_NAME;
			obj.PRODUCTION_NUM = PRODUCTION_NUM; */
			obj.PART_ID = PART_ID;
			obj.PART_NAME = PART_NAME;
			obj.PART_SPEC = PART_SPEC;
			obj.PRODUCTION_CODE_M = '${pd.PRODUCTION_CODE}';
			obj.PRODUCTION_NAME_M = '${pd.PRODUCTION_NAME}';
			
			var table =document.getElementById("processListTable");
			var rows = table.rows;			
			
			var mlist = [];
			var lastProcessOrder = 0;
			for (var i=1;i<rows.length;i++) {
				var PROCESS_ORDER = rows[i].cells[0].innerHTML;
			    var PROCESS_Id = rows[i].cells[1].innerHTML;
			    var PROCESS_name = rows[i].cells[2].innerHTML;
			    var strProcessName = PROCESS_name.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');
			    var processOrder = $(rows[i]).find('input[name="PROCESS_ORDER"]').val();
			    var singleEstimateTime = $(rows[i]).find('input[name="ESTIMATE_TIME"]').val();
			    var processCode = $(rows[i]).find('span[name="PROCESS_CODE"]').text();
			    var processClassId = $(rows[i]).find('span[name="PROCESS_CLASS_ID"]').text();
			    var processClassName = $(rows[i]).find('span[name="PROCESS_CLASS_NAME"]').text();
			    if(isNaN(singleEstimateTime)){
			    	$(rows[i]).find('input[name="ESTIMATE_TIME"]').focus();
			    	$(rows[i]).find('input[name="ESTIMATE_TIME"]').tips({
			    		side:3,
			            msg:'输入数字',
			            bg:'#AE81FF',
			            time:2
			    	});
			    	return false;
			    }
			    if(isNaN(processOrder)){
			    	$(rows[i]).find('input[name="PROCESS_ORDER"]').focus();
			    	$(rows[i]).find('input[name="PROCESS_ORDER"]').tips({
			    		side:3,
			            msg:'输入数字',
			            bg:'#AE81FF',
			            time:2
			    	});
			    	return false;
			    }
			    if(i==1){
			    	if(processOrder != 1){
				    	$(rows[i]).find('input[name="PROCESS_ORDER"]').focus();
				    	$(rows[i]).find('input[name="PROCESS_ORDER"]').tips({
				    		side:3,
				            msg:'第一道工艺次序应该为1，请重新输入',
				            bg:'#AE81FF',
				            time:2
				    	});
				    	return false;
			    	}
			    }else{
			    	if(lastProcessOrder != processOrder && lastProcessOrder != (processOrder-1)){
			    		$(rows[i]).find('input[name="PROCESS_ORDER"]').focus();
				    	$(rows[i]).find('input[name="PROCESS_ORDER"]').tips({
				    		side:3,
				            msg:'工艺次序不正确，请重新输入',
				            bg:'#AE81FF',
				            time:2
				    	});
				    	return false;
			    	}
			    }
		    	lastProcessOrder = processOrder;
			    var json = '{';
				json = json + 'processOrder:"' + processOrder + '"';
				json = json + ',processId:"' + PROCESS_Id + '"';
				json = json + ',processName:"' + strProcessName + '"';
				json = json + ',processCode:"' + processCode + '"';
				json = json + ',processClassId:"' + processClassId + '"';
				json = json + ',processClassName:"' + processClassName + '"';
				json = json + ',singleEstimateTime:"' + singleEstimateTime + '"';
				json = json + '}';
				
				var str= json.replace(/[\n]/ig,'');
				
				mlist.push(str);
			    			    
			}
			if(mlist.length != 0){
				obj.detail = JSON.stringify(mlist);
			}
			$.ajax({
				type: "POST",
				url: 'makebompart/savePartAndDetail.do',
		    	data:  obj,
				dataType:'json',
				cache: false,
				success: function(data){
					if(flag=='next'){
						location.href = '<%=basePath%>material/goAddMouldPart.do?PRODUCTION_ID='+$("#MATERIAL_ID").val();
					}else{
						top.Dialog.close();
					}
				} 
			});  
			
		}
		
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
						
			var typeNo = '${pd.TYPE_NO}'
			  
			if('chongya' == typeNo){
				$("#chongya").attr('checked','checked');
			}else{
				$("#qieduan").attr('checked','checked');
			}
		});
		
		//选择模板
		function selectTemplate(){
			
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择模板";
			 diag.URL = '<%=basePath%>demand/demandTemplateSelect.do';
			 diag.Width = 900;
			 diag.Height = 500;
			
			 diag.CancelEvent = function(){ //关闭事件
				var str = diag.innerFrame.contentWindow.document.getElementsByName('demandTemplateId').value;
				diag.close();
				if(str){
					$.ajax({
						type: "POST",
						url: 'demand/list_template_data.do',
				    	data:  {DEMAND_TEMPLATE_ID:str},
						dataType:'json',
						cache: false,
						success: function(data){
							if(data.rows.length > 0){
								clearTemplate();
								var rows = data.rows;
								for(var i=0;i<rows.length;i++){
									addProcess(rows[i].CRAFT_NO,rows[i].CRAFT_NAME,rows[i].PROCESS_CODE,rows[i].PROCESS_CLASS_ID,rows[i].PROCESS_CLASS_NAME);
								}
							}
							
						} 
					});
					
				}
				
			 };
			 diag.show();
		}
		
		//新增模板
		function saveTemplate(){
			 bootbox.confirm("请输入模板名称:   "+ '<label style="font-size:1.5em;">' +
					'<input id="templateName" style="width:200px;">' +'</label> ',function(r){
				if(r){
					var templateName = $("#templateName").val() ; 
				 	var basePath = $("#basePath").val();
					//读取工艺数据
					var table = document.getElementById("processListTable");
					var rows = table.rows;			
					var mlist = [];
					
					for (var i=1;i<rows.length;i++) {
						var PROCESS_ORDER = rows[i].cells[0].innerHTML;
					    var PROCESS_Id = rows[i].cells[1].innerHTML;
					    var PROCESS_name = rows[i].cells[2].innerHTML;
					    var strProcessName = PROCESS_name.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');
					    var json = '{';
						json = json + 'processOrder:"' + PROCESS_ORDER + '"';
						json = json + ',processId:"' + PROCESS_Id + '"';
						json = json + ',processName:"' + strProcessName + '"';
						json = json + '}';
						var str= json.replace(/[\n]/ig,'');
						mlist.push(str);
					}
					if(mlist.length == 0){
						bootbox.alert("请添加工艺");
						return ;
					}
					$.ajax({
						type: "POST",
						url: basePath+'demand/saveDemandTemplate.do',
				    	data:  {processDetail:'['+mlist.toString()+']',TEMPLATE_NAME:templateName},
						dataType:'json',
						cache: false,
						success: function(data){
							if(data.existFlag){
								bootbox.alert("相同工艺流程的模板已存在");
							}else{
								bootbox.alert("模板保存成功");			
							}
						} 
					});
					return mlist; 
			 	}	
			}) 
		}
		
		function clearTemplate(){
			var tb =document.getElementById("processListTable");
			var rowNum = tb.rows.length; 
			for (i = 1; i < rowNum; i++) { 
			  tb.deleteRow(i); 
			  rowNum = rowNum - 1; 
			  i = i - 1; 
			} 
			
			
		}
		
		function addProcess(processID,processName,processCode,processClassId,processClassName,singleEstimateTime){
			if(!singleEstimateTime){
				singleEstimateTime='';
			}
			var table =document.getElementById("processListTable");
			var rows = table.rows.length;
			$("#processListTable tbody").append(
						' <tr> '+
						' <td class="center" style="width: 30px;">' + rows +'</td>  '+
						' <td class="center" style="display:none;">' + processID + '</td>  '+
						' <td class="center">' + processName +' </td>	 '+
						' <td class="center">  '+
						'    <input type="text"  name="PROCESS_ORDER" id="PROCESS_ORDER" value="' + rows +'" onkeydown="focusNextInput(this)" maxlength="" placeholder="填次序" title="加工次序" style="width:80%;padding: 1px;line-height: 5px;"/>'+	
						' </td> '+
						' <td class="center"> '+
						'  <input type="text"  name="ESTIMATE_TIME" id="ESTIMATE_TIME" value="'+singleEstimateTime+'" onkeydown="focusNextInput(this)" maxlength="" placeholder="填工时（分钟）" title="预估工时" style="width:80%;padding: 1px;line-height: 5px;"/>	'+
						' </td> '+
						'<td style="display: none;"><span name="PROCESS_CODE">' + processCode + '</span></td>'+		
						'<td style="display: none;"><span name="PROCESS_CLASS_ID">' + processClassId + '</span></td>'+	
						'<td style="display: none;"><span name="PROCESS_CLASS_NAME">' + processClassName + '</span></td>'+	
						' <td class="center">  '+	
						'    <a class="btn btn-mini btn-grey" onclick="upList(this)\;"><i class="icon-pencil"></i>上移</a>  '+
						'    <a class="btn btn-mini btn-grey" onclick="downList(this)\;"><i class="icon-pencil"></i>下移</a> &nbsp;&nbsp;&nbsp; '+
						'    <a class="btn btn-mini btn-pink" onclick="deleteRow(this)\;"><i class="icon-pencil"></i>删除</a>  '+
						' </td> '+
						' </tr> '	
						);
			//initDatePicker($(".date-picker-Process"));
		}
		
		function updateLineID(){
			var len = $('#processListTable tr').length;
	        for(var i = 1;i<len;i++){
	            $('#processListTable tr:eq('+i+') td:first').text(i);
	        }			
		}
		
		function upList(rowLine){
			var tab1 = document.getElementById('processListTable').tBodies[0];
			var tr = rowLine.parentNode.parentNode;			
			if(tr.previousElementSibling){
				var ber = tr.previousElementSibling;
				var str = ber.cells[7].innerHTML;
				str = str.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');			
				if(str == 'NOMAKE'){
					tab1.insertBefore(tr,tr.previousElementSibling);
					updateLineID();
				}				
			}
		}
		
		function downList(rowLine){
			var tab1 = document.getElementById('processListTable').tBodies[0];
			var tr = rowLine.parentNode.parentNode;
			if(tr.nextElementSibling){
				tab1.insertBefore(tr.nextElementSibling,tr);
				updateLineID();
			}
		}
		
		function findPartsNoByDrawingNo(){
			var drawingNo = $("#PRODUCTION_FIGURE_NO_NEW").val();
			if(event.keyCode==13 &&drawingNo.length > 0){
				$.ajax({
					type: "POST",
					url: '<%=basePath%>'+'demandExt/findPartsNoByDrawingNo.do',
			    	data:  {DRAWING_NO:drawingNo},
					dataType:'json',
					//beforeSend: validateData,
					async: false,
					cache: false,
					success: function(data){
						if(data.msg == 'success'){
							if(data.size == 1){
								$("#PRODUCTION_NAME_NEW").val(data.PARTS_NO);
								$("#partsClassID").val(data.PARTS_CLASS_ID);
								$("#PRODUCTION_NUM_NEW").focus();
							}else if(data.size > 1){
								var head = drawingNo.substring(0,1);
								selectMaterialNew(head);
							}
						}
					} 
				});
			}
		}
		
		//选择配件
		function selectMaterial1(head){
			 top.jzts();
			 if(!head){
				 head = '';
			 }
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择配件";
			 diag.URL = '<%=basePath%>demand/demandMaterialSelect1.do?MATERIAL_CLASS_CODE='+head;
			 diag.Width = 800;
			 diag.Height = 500;
			
			 diag.CancelEvent = function(){ //关闭事件
				var str = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_CLASS_NAME_SELECT').value;//模具号 -- 文件编号
				var strID = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_CLASS_ID_SELECT').value;//模具号 -- 文件编号
				$("#PRODUCTION_NAME").val(str);
				$("#PRODUCTION_ID").val(strID);
				diag.close();
				$("#PRODUCTION_NUM").focus();
			 };
			 diag.show();
		}
		
		//选择配件
		function selectMaterialNew(head){
			 top.jzts();
			 if(!head){
				 head = '';
			 }
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择配件";
			 diag.URL = '<%=basePath%>demand/demandMaterialSelect1.do?MATERIAL_CLASS_CODE='+head;
			 diag.Width = 800;
			 diag.Height = 500;
			
			 diag.CancelEvent = function(){ //关闭事件
				var str = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_CLASS_NAME_SELECT').value;//模具号 -- 文件编号
				var strID = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_CLASS_ID_SELECT').value;//模具号 -- 文件编号
				$("#PARTS_NO_NEW").val(str);
				$("#PARTS_CLASS_ID_NEW").val(strID);
				diag.close();
				$("#NUM_NEW").focus();
			 };
			 diag.show();
		}
		
		//选择材料
		function selectMaterial2(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择材料";
			 diag.URL = '<%=basePath%>demand/demandMaterialSelect2.do';
			 diag.Width = 800;
			 diag.Height = 500;
			
			 diag.CancelEvent = function(){ //关闭事件

				var str = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_NAME_SELECT').value;//材料名称  --  物料名称
				var str4 = diag.innerFrame.contentWindow.document.getElementById('MATERIAL_ID_SELECT').value;//材料名称  --  物料名称
			    var str1 = diag.innerFrame.contentWindow.document.getElementById('THICKNESS_NUM_SELECT').value;//规格 - 厚
			    var str2 = diag.innerFrame.contentWindow.document.getElementById('WIDTH_NUM_SELECT').value;//规格 - 宽
			    var str3 = diag.innerFrame.contentWindow.document.getElementById('LENGTH_NUM_SELECT').value;//规格 - 长
			    if(str){
			    	$("#PART_NAME").val(str);
				    $("#PART_ID").val(str4);
				    $("#MATERIAL_SPEC").val(str1+'*'+str2+'*'+str3)
				    $("#SIZE_H").val(str1)
			    }
				diag.close();
			    $("#SIZE_W").focus();
			 };
			 diag.show();
		}
		
		
		function selectPart(){
			var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="选择已有配件";
			 diag.URL = '<%=basePath%>makebompart/selectPart.do';
			 diag.Width = 1024;
			 diag.Height = 768;
			
			 diag.CancelEvent = function(){ //关闭事件
				var id = diag.innerFrame.contentWindow.document.getElementById('MAKE_BOM_PART_ID_SELECT').value;//材料名称  --  物料名称
				$.ajax({
					type: "POST",
					url: '<%=basePath%>'+'makebompart/findPartDetail.do',
			    	data:  {MAKE_BOM_PART_ID:id},
					dataType:'json',
					cache: false,
					success: function(data){
						$("#PRODUCTION_ID").val(data.makeBomPart.PRODUCTION_ID);
						$("#PRODUCTION_NAME").val(data.makeBomPart.PRODUCTION_NAME);
						$("#PRODUCTION_FIGURE_NO").val(data.makeBomPart.PRODUCTION_FIGURE_NO);
						$("#PRODUCTION_NUM").val(data.makeBomPart.PRODUCTION_NUM);
						$("#PART_NAME").val(data.makeBomPart.PART_NAME);
						$("#PART_ID").val(data.makeBomPart.MATERIAL_ID);
						$("#MATERIAL_SPEC").val(data.makeBomPart.MATERIAL_SPEC);
						var partSpec = data.makeBomPart.PART_SPEC;
						$("#SIZE_H").val(partSpec.split("*")[0]);
						$("#SIZE_W").val(partSpec.split("*")[1]);
						$("#SIZE_L").val(partSpec.split("*")[2]);
						var list = data.listProcess;
						if(list.length >= 1){
							clearTemplate();
							for(var i=0;i<list.length;i++){
								addProcess(list[i].PROCESS_ID,list[i].PROCESS_NAME,list[i].PROCESS_CODE,list[i].PROCESS_CLASS_ID,list[i].PROCESS_CLASS_NAME,list[i].SINGLE_ESTIMATE_TIME,list[i].PROCESS_ORDER,list[i].MAKE_BOM_ID);
							}
						}
						
					} 
				});
				diag.close();
			 };
			 diag.show();
		}
		
		//回车下个
		function focusNextInput(e){
			if(event.keyCode==13){
				var name = $(e).attr("name");
				$(e).parent().parent().next('tr').find("input[name='"+name+"']").focus();
			}
		}
		</script>
</body>
</html>