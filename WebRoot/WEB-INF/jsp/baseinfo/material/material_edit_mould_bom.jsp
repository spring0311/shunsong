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
						模具基本信息
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							这里编辑模具的基本信息。
						</small>
					</h1>
				</div>
				<div class="row">
					<div class="col-xs-12">
					
						<input type="hidden" name="MATERIAL_ID" id="MATERIAL_ID" value="${pd.MATERIAL_ID}"/>
						<input type="hidden" name="TYPE" id="TYPE" value="30"/>
						
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">模具名称:</td>
								<td><input type="text" name="MATERIAL_NAME" id="MATERIAL_NAME" value="${pd.MATERIAL_NAME}" maxlength="" placeholder="这里输入模具名称" title="模具名称" style="width:98%;"/></td>
								<td style="width:100px;text-align: right;padding-top: 13px;">模具图号:</td>
								<td><input type="text" name="FILE_NO" id="FILE_NO" value="${pd.FILE_NO}" maxlength="" placeholder="这里输入模具图号" title="模具图号" style="width:98%;"/></td>
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
									<textarea name="REMARK" id="REMARK" style="width:98%;height:50px;">${pd.REMARK}</textarea>
								</td>
								<td style="width:100px;text-align: right;padding-top: 13px;">录入人信息:</td>
								<td  style="padding-top: 13px;">${pd.CREATE_USER}<br/>${pd.CREATE_DATE}</td>							
								
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-sm btn-primary" onclick="save();">保存基本信息</a>
									<a class="btn btn-sm btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<div class="page-header">
					<h1>
						模具的制造BOM
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							这里编辑模具的制造BOM。
						</small>
					</h1>
				</div>
				<div class="row">
						
						<div class="col-xs-12">
							
							<div class="col-xs-5 "> 
								<div class="widget-box">
								   	<div class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
										<h4 class="lighter">模具配件列表</h4>
									</div>
									<div style="text-align: right;">
										<span class="btn-toolbar inline middle no-margin">
											<span data-toggle="buttons" class="btn-group btn-corner">
												<label class="btn btn-sm btn-primary">
													所有
													<input type="radio" value="1" />
												</label>

												<label class="btn btn-sm btn-primary">
													外购
													<input type="radio" value="2" />
												</label>
												
												<label class="btn btn-sm btn-primary">
													外协
													<input type="radio" value="3" />
												</label>

												<label class="btn btn-sm btn-primary">
													自制
													<input type="radio" value="4" />
												</label>

												<!-- <label class="btn btn-sm btn-primary">
													4
													<input type="radio" value="4" />
												</label> -->
											</span>
											</span>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="btn btn-sm btn-purple" onclick="addMouldPart();">添加配件</a>
										&nbsp;&nbsp;
									</div>
									
									<div class="dd dd-nodrag">
										<c:choose>
											<c:when test="${not empty listParts }">
											<ol class="dd-list">
												<c:forEach items="${listParts}" var="var" varStatus="vs">
												
												
													<li class="dd-item dd2-item" id="part${var.MAKE_BOM_PART_ID }">
													<div class="dd-handle dd2-handle">
														<i class="normal-icon ace-icon blue bigger-130">${vs.index+1 }</i>
																
													</div>
													<div class="dd2-content" >
														<div class="pull-left" onclick="showDetail('${var.MAKE_BOM_PART_ID }')">
															【${var.PRODUCTION_NAME }】,【${var.PRODUCTION_FIGURE_NO }】,【${var.PRODUCTION_NUM }】
														</div>
														<div class="pull-right action-buttons">		
															<a class="blue"  onclick="addSonPart('${var.MAKE_BOM_PART_ID }');">
																<i class="ace-icon fa fa-plus bigger-130"></i>
															</a>															
															<a class="blue"  onclick="editPart('${var.MAKE_BOM_PART_ID }','${var.MAKE_BOM_ID }');">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red"  onclick="deletePart('${var.MAKE_BOM_PART_ID }' );">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													
													</div>
													<c:if test="${not empty var.listDetail }">
														<ol class="dd-list">
															<li class="dd-item dd2-item" data-id="16">
																<div class="dd-handle dd2-handle">
																	<i class="normal-icon ace-icon pink bigger-130">1</i>
																</div>
																<div class="dd2-content">Active Users
																	<div class="pull-right action-buttons">		
																		<a class="blue"  onclick="addSonPart('16','Active users');">
																			<i class="ace-icon fa fa-plus bigger-130"></i>
																		</a>															
																		<a class="blue"  onclick="editPart('16','Active users');">
																			<i class="ace-icon fa fa-pencil bigger-130"></i>
																		</a>
			
																		<a class="red"  onclick="deletePart('16','Active Users');">
																			<i class="ace-icon fa fa-trash-o bigger-130"></i>
																		</a>
																	</div>
																</div>
															</li>
														</ol>
													</c:if>
												</li>
												</c:forEach>
												<!-- <li class="dd-item dd2-item dd-nodrag" data-id="【配件号】" >
													<div class="dd-handle dd2-handle">
														<i class="normal-icon ace-icon blue bigger-130">1</i>
													</div>
													<div class="dd2-content">【配件名称】，【配件号】，【配件数量】，【外购/外协/自制】
														<div class="pull-right action-buttons">	
															<a class="blue"  onclick="addSonPart('【配件号】','【配件名称】');">
																<i class="ace-icon fa fa-plus bigger-130"></i>
															</a>																
															<a class="blue"  onclick="editPart('【配件号】','【配件名称】');">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>
															<a class="red"  onclick="deletePart('13','Click on an icon to start dragging');">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													</div>
												</li> -->

												<!-- <li class="dd-item dd2-item" data-id="14">
													<div class="dd-handle dd2-handle">
														<i class="normal-icon ace-icon blue bigger-130">2</i>
													</div>
													<div class="dd2-content">Recent Posts
														<div class="pull-right action-buttons">		
															<a class="blue"  onclick="addSonPart('14','Recent Posts');">
																<i class="ace-icon fa fa-plus bigger-130"></i>
															</a>																
															<a class="blue"  onclick="editPart('14','Recent Posts');">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red"  onclick="deletePart('14','Recent Posts');">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													</div>
												</li>

												<li class="dd-item dd2-item" data-id="15">
													<div class="dd-handle dd2-handle">
														<i class="normal-icon ace-icon blue bigger-130">3</i>
																
													</div>
													<div class="dd2-content">Statistics
													
														<div class="pull-right action-buttons">		
															<a class="blue"  onclick="addSonPart('15','Statistics');">
																<i class="ace-icon fa fa-plus bigger-130"></i>
															</a>															
															<a class="blue"  onclick="editPart('15','Statistics');">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red"  onclick="deletePart('15','Statistics');">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													
													</div>

													<ol class="dd-list">
														<li class="dd-item dd2-item" data-id="16">
															<div class="dd-handle dd2-handle">
																<i class="normal-icon ace-icon pink bigger-130">1</i>
															</div>
															<div class="dd2-content">Active Users
																<div class="pull-right action-buttons">		
																	<a class="blue"  onclick="addSonPart('16','Active users');">
																		<i class="ace-icon fa fa-plus bigger-130"></i>
																	</a>															
																	<a class="blue"  onclick="editPart('16','Active users');">
																		<i class="ace-icon fa fa-pencil bigger-130"></i>
																	</a>
		
																	<a class="red"  onclick="deletePart('16','Active Users');">
																		<i class="ace-icon fa fa-trash-o bigger-130"></i>
																	</a>
																</div>
															
															</div>
														</li>

														<li class="dd-item dd2-item dd-colored" data-id="17">
															<div class="dd-handle dd2-handle btn-info">
																<i class="normal-icon ace-icon pink bigger-130">2</i>

															</div>
															<div class="dd2-content">Published Articles
																<div class="pull-right action-buttons">	
																	<a class="blue"  onclick="addSonPart('17','Published Articles');">
																		<i class="ace-icon fa fa-plus bigger-130"></i>
																	</a>																
																	<a class="blue"  onclick="editPart('17','Published Articles');">
																		<i class="ace-icon fa fa-pencil bigger-130"></i>
																	</a>
		
																	<a class="red"  onclick="deletePart('17','Published Articles');">
																		<i class="ace-icon fa fa-trash-o bigger-130"></i>
																	</a>
																</div>
															</div>
														</li>

														<li class="dd-item dd2-item" data-id="18">
															<div class="dd-handle dd2-handle">
																<i class="normal-icon ace-icon pink bigger-130">3</i>

															</div>
															<div class="dd2-content">Visitors
																<div class="pull-right action-buttons">	
																	<a class="blue"  onclick="addSonPart('18','Visitors');">
																		<i class="ace-icon fa fa-plus bigger-130"></i>
																	</a>																
																	<a class="blue"  onclick="editPart('18','Visitors');">
																		<i class="ace-icon fa fa-pencil bigger-130"></i>
																	</a>
		
																	<a class="red"  onclick="deletePart('18','Visitors');">
																		<i class="ace-icon fa fa-trash-o bigger-130"></i>
																	</a>
																</div>
															</div>
														</li>
													</ol>
												</li>

												<li class="dd-item dd2-item" data-id="19">
													<div class="dd-handle dd2-handle">
														<i class="normal-icon ace-icon blue bigger-130">4</i>

													</div>
													<div class="dd2-content">Menu
														<div class="pull-right action-buttons">		
															<a class="blue"  onclick="addSonPart('19','Menu');">
																<i class="ace-icon fa fa-plus bigger-130"></i>
															</a>															
															<a class="blue"  onclick="editPart('19','Menu');">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red"  onclick="deletePart('19','Menu');">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
													</div>
												</li> -->
											</ol>
											</c:when>
											<c:otherwise>
												该模具还没有添加配件
											</c:otherwise>
											</c:choose>
										</div>
											
											
								</div>
								 	
							</div>
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
													<input type="text" id="MATERIAL_NAME1" placeholder="配件的使用材料" style="width:80%;"/>
													<input type="hidden" id="MATERIAL_ID1" />
												</td>																
												
											</tr>
											<tr>
												<td style="width:150px;text-align: right;padding-top: 13px;">材料规格:</td>
												<td>
													<input class="nextInput" type="text" name="SIZE" id="SIZE">（单位：mm）（H×W×L）
													<!-- <a class="btn btn-xs btn-success" id="btnClearMaterial" onclick="clearMaterial();">清除材料</a> -->
												</td>
											</tr>
											<tr>
												<td style="width:150px;text-align: right;padding-top: 13px;">使用规格:</td>
												<td >
													<input type="text"  class="nextInput" name="SIZE_H" id="SIZE_H" value="${MATERIAL.SIZE_H}" maxlength="" placeholder="厚度" style="width:30%;"/>
													<input type="text"  class="nextInput" name="SIZE_W" id="SIZE_W" value="${MATERIAL.SIZE_W}" maxlength="" placeholder="宽度" style="width:30%;"/>
													<input type="text"  class="nextInput" name="SIZE_L" id="SIZE_L" value="${MATERIAL.SIZE_L}" maxlength="" placeholder="长度" style="width:30%;"/>
												</td>
											</tr>							
										</table>
										
									<h5 class="lighter">配件加工工艺：</h5>
									<div style="float: right;">
										<!-- &nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="saveTemplate();">保存为模板</a>&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="selectTemplate();">选择模板</a>
										 -->&nbsp;&nbsp;<a class="btn btn-sm btn-danger" onclick="clearTemplate();">清空</a>&nbsp;
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
															<td class='center' style="display:none;">${var.MAKE_BOM_ID}</td>
															<td class='center'>
															    ${var.CRAFT_NAME}
															</td>
															<td class='center'>
															    <input type="text"  name="PROCESS_ORDER" id="PROCESS_ORDER" value="${var.PROCESS_ORDER}" onkeydown="focusNextInput(this)" maxlength="" placeholder="填次序" title="加工次序" style="width:80%;padding: 1px;line-height: 5px;"/>	
															</td>
															<td class='center'>
															    <input type="text"  name="ESTIMATE_TIME" id="ESTIMATE_TIME" value="" onkeydown="focusNextInput(this)" maxlength="" placeholder="填工时（分钟）" title="预估工时" style="width:80%;padding: 1px;line-height: 5px;"/>	
															</td>	
															<td style="display: none;">${var.DEMAND_CRAFT_ID }</td>		
															<td style="display: none;">${var.WORK_STATUS }</td>		
															<td style="display: none;">${var.PROCESS_ORDER}</td>	
															<td style="display: none;">${var.WORK_ID}</td>
																											
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
									<table style="width:100%;">
										<tr>
											<td style="vertical-align:top;">
												<a class="btn btn-sm btn-success" id="btnSave" onclick="saveCraft('确定要保存配件加工工艺吗？');">保存配件加工工艺</a>
												
											</td>
										</tr>
									</table>
								</div>
								</div>
					</div>
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
	
	<script src="static/ace/js/jquery.nestable.js"></script>
	
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#MATERIAL_NAME").val()==""){
				$("#MATERIAL_NAME").tips({
					side:3,
		            msg:'请输入模具名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MATERIAL_NAME").focus();
			return false;
			}
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

			var typeNo = $("input[name='TYPE_NO']:checked").val();
			if(typeof(typeNo)=='undefined'){
				$("#chongya").tips({
					side:3,
		            msg:'请选择模具类型',
		            bg:'#AE81FF',
		            time:2
		        });
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			$('.dd').nestable();
			  
			var typeNo = '${pd.TYPE_NO}'
			$("#"+typeNo).attr('checked','checked');
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
									addProcess(rows[i].CRAFT_NO,rows[i].CRAFT_NAME);
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
		
		function addProcess(processID,processName,processCode,processClassId,processClassName,singleEstimateTime,processOrder,makeBomId){
			
			var table =document.getElementById("processListTable");
			var rows = table.rows.length;
			$("#processListTable tbody").append(
						' <tr> '+
						' <td class="center" style="width: 30px;">' + rows +'</td>  '+
						' <td class="center" style="display:none;">' + processID + '</td>  '+
						' <td class="center">' + processName +' </td>	 '+
						' <td class="center">  '+
						'    <input type="text"  name="PROCESS_ORDER" id="PROCESS_ORDER" value="' + processOrder +'" onkeydown="focusNextInput(this)" maxlength="" placeholder="填次序" title="加工次序" style="width:80%;padding: 1px;line-height: 5px;"/>'+	
						' </td> '+
						' <td class="center"> '+
						'  <input type="text"  name="ESTIMATE_TIME" id="ESTIMATE_TIME" value="'+singleEstimateTime+'" onkeydown="focusNextInput(this)" maxlength="" placeholder="填工时（分钟）" title="预估工时" style="width:80%;padding: 1px;line-height: 5px;"/>	'+
						' </td> '+
						'<td style="display: none;"><span name="PROCESS_CODE">' + processCode + '</span></td>'+		
						'<td style="display: none;"><span name="PROCESS_CLASS_ID">' + processClassId + '</span></td>'+	
						'<td style="display: none;"><span name="PROCESS_CLASS_NAME">' + processClassName + '</span></td>'+	
						'<td style="display: none;"><span name="MAKE_BOM_ID">' + makeBomId + '</span></td>'+	
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
				tab1.insertBefore(tr,tr.previousElementSibling);
				updateLineID();
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
		
		$('[data-toggle="buttons"] .btn').on('click', function(e){
			var target = $(this).find('input[type=radio]');
			var which = parseInt(target.val());
			if(which >= 1 && which <= 4) {
				
			}
			alert(which);
		});
		
		function addSonPart(id,name){
			alert('addSonPart-' + id + ' ' + name);
			addMouldPart();
		}
		
		function editPart(id,makeBomId){
			top.jzts();
			
			//var id = $('#MATERIAL_ID').val();
				
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改模具配件";
			 diag.URL = '<%=basePath%>makebompart/goEditPart.do?MAKE_BOM_PART_ID='+id+'&MAKE_BOM_ID='+makeBomId;
			 diag.Width = 1500;
			 diag.Height = 800;
			 diag.CancelEvent = function(){ //关闭事件
				 /* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				} */
				diag.close();
				location.reload();
			 };
			 diag.show();
		}
		
		function deletePart(id,e){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>'+'makebompart/delPart.do',
		    	data:  {MAKE_BOM_PART_ID:id},
				dataType:'json',
				cache: false,
				success: function(data){
					location.reload();
				} 
			}); 
		}
		
		function addMouldPart(){
			top.jzts();
			
			var id = $('#MATERIAL_ID').val();
				
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="添加模具配件";
			 diag.URL = '<%=basePath%>material/goAddMouldPart.do?PRODUCTION_ID='+id;
			 diag.Width = 1500;
			 diag.Height = 800;
			 diag.CancelEvent = function(){ //关闭事件
				 /* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				} */
				diag.close();
			 };
			 diag.show();
		}
		
		function showDetail(id){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>'+'makebompart/findPartDetail.do',
		    	data:  {MAKE_BOM_PART_ID:id},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#MATERIAL_NAME1").val(data.makeBomPart.MATERIAL_NAME);
					$("#MATERIAL_ID1").val(data.makeBomPart.MATERIAL_ID1);
					$("#SIZE").val(data.makeBomPart.MATERIAL_SPEC);
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
		}
		
		function clearMaterial(){
			$("#MATERIAL_ID1").val('');
			$("#MATERIAL_NAME1").val('');
			$("#SIZE").val('');
			$("#SIZE_L").val('');
			$("#SIZE_H").val('');
			$("#SIZE_W").val('');
		}
		
		function upList(rowLine){
			var tab1 = document.getElementById('processListTable').tBodies[0];
			var tr = rowLine.parentNode.parentNode;			
			if(tr.previousElementSibling){
				var ber = tr.previousElementSibling;
				var str = ber.cells[7].innerHTML;
				str = str.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'');			
				tab1.insertBefore(tr,tr.previousElementSibling);
				updateLineID();
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
		
		function deleteRow(tdnode){
		 	
			var tr = tdnode.parentNode.parentNode;
			var id = $(tr).find('td').eq(-2).text();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>makebom/delete.do',
		    	data:  {MAKE_BOM_ID:id},
				dataType:'json',
				async: false,
				cache: false,
				success: function(data){
					if(data.msg='success'){
						updateProcessOrder(tr);
						tr.parentNode.removeChild(tr);
						updateLineID();
						saveCraft();
					}
				},
				error: function(xhr,errorText,errorType){					  
					window.location.href='<%=basePath%>tool/errorInfo.do?Exception='+xhr.responseText;					                     
				}
			});  
				
		}
		
		function saveCraft(){
			var len = $('#processListTable tr').length;
			var lastProcessOrder = 0;
			var mlist = [];
			var obj = {};
	        for(var i = 1;i<len;i++){
				var $input = $('#processListTable tr:eq('+i+') td input[name="PROCESS_ORDER"]');
				var $estimate = $('#processListTable tr:eq('+i+') td input[name="ESTIMATE_TIME"]');
	           var processOrder = $input.val();
	           var singleEstimateTime = $estimate.val();
	           var makeBomId = $('#processListTable tr:eq('+i+')').find('td').eq(-2).text();
	           if(makeBomId == ''){
	        	   alert("mei id")
	        	   return false;
	           }
	           if(isNaN(singleEstimateTime)){
	        	   $estimate.focus();
	        	   $estimate.tips({
			    		side:3,
			            msg:'输入数字',
			            bg:'#AE81FF',
			            time:2
			    	});
			    	return false;
			    }
	           if(isNaN(processOrder)){
	        	   $input.focus();
	        	   $input.tips({
      			  		side:3,
	  		            msg:'不是数字，请重新输入',
	  		            bg:'#AE81FF',
	  		            time:2
	        		  });
	        	   return false;
	           }
	           
	           if(i==1){
	        	   if(processOrder != 1){
	        		   $input.focus();
	        		  $input.tips({
       			  		side:3,
	  		            msg:'第一道工艺次序应该为1，请重新输入',
	  		            bg:'#AE81FF',
	  		            time:2
	        		  });
	        		  return false;
	        	   }
	           }else{
	        	   if(lastProcessOrder != processOrder && lastProcessOrder != (processOrder-1)){
	        		   $input.focus();
	        		   $input.tips({
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
				json = json + ',singleEstimateTime:"' + singleEstimateTime + '"';
				json = json + ',makeBomId:"' + makeBomId + '"';
				json = json + '}';
				
				var str= json.replace(/[\n]/ig,'');
				
				mlist.push(str);
	        }
			
			if(mlist.length != 0){
				obj.detail = JSON.stringify(mlist);
			}
			$.ajax({
				type: "POST",
				url: 'makebom/editPartDetail.do',
		    	data:  obj,
				dataType:'json',
				cache: false,
				success: function(data){
					if(data.msg=='success'){
						//保存成功
						$("#btnSave").tips({
							side:3,
		  		            msg:'保存成功',
		  		            bg:'#AE81FF',
		  		            time:2
						});
					}
				} 
			});  
			
		}
		
		
		function updateProcessOrder(tr){
			var nowProcessOrder = $(tr).find('input[name="PROCESS_ORDER"]').val();
			var nextInput = $(tr).next('tr').find('input[name="PROCESS_ORDER"]');
			while(!isNaN(nowProcessOrder)){
				var nextProcessOrder = nextInput.val();
				if(nextProcessOrder != nowProcessOrder){
					nextProcessOrder--;
					nextInput.val(nextProcessOrder);
				}
				nowProcessOrder = nextProcessOrder;
				nextInput = $(nextInput).parent().parent().next('tr').find('input[name="PROCESS_ORDER"]');
			}
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