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
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div id="zhongxin" style="padding-top: 13px;">
						<div class="col-xs-12">
							
						<!-- 检索  -->
						<form action="material/goMaterialSelect.do" method="post" name="Form" id="Form">
						<input type='hidden' name='MATERIAL_NAME_SELECT' id='MATERIAL_NAME_SELECT' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='MATERIAL_CODE_SELECT' id='MATERIAL_CODE_SELECT' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='MATERIAL_SPEC_SELECT' id='MATERIAL_SPEC_SELECT' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='THICKNESS_NUM_SELECT' id='THICKNESS_NUM_SELECT' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='WIDTH_NUM_SELECT' id='WIDTH_NUM_SELECT' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='LENGTH_NUM_SELECT' id='LENGTH_NUM_SELECT' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='MATERIAL_ID_SELECT' id='MATERIAL_ID_SELECT' readonly='readonly' value="" class="ace" />
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" style="width:180px;"  value="${pd.keywords}" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td  style="padding-left:5px;" class="center">
									<a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
								</td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center" style="display:none;"></th>
									<th class="center">物料名称</th>
									<th class="center">物料编号</th>
									<th class="center">物料规格</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr  ondblclick="doubleClick('${var.MATERIAL_NAME}','${var.MATERIAL_CODE}','${var.MATERIAL_SPEC}','${var.MATERIAL_ID}');"  style="padding: 1px;">
											<td class='center'>
												<label class="pos-rel"><input type='radio' name='ids' value="${var.MATERIAL_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center' style="display:none;" name = 'MATERIAL_ID'>${var.MATERIAL_ID}</td>
											<td class='center'>${var.MATERIAL_NAME}</td>
											<td class='center'>${var.MATERIAL_CODE}</td>
											<td class='center'>${var.MATERIAL_SPEC}</td>
											<td class='center' style="display:none;"><input type="hidden" name="MATERIAL_NAME" value="${var.MATERIAL_NAME }"></td>
											<td class='center' style="display:none;"><input type="hidden" name="MATERIAL_CODE" value="${var.MATERIAL_CODE }"></td>
											<td class='center' style="display:none;"><input type="hidden" name="MATERIAL_SPEC" value="${var.MATERIAL_SPEC }"></td>
											<td class='center' style="display:none;"><input type="hidden" name="WIDTH_NUM" value="${var.WIDTH_NUM }"></td>
											<td class='center' style="display:none;"><input type="hidden" name="LENGTH_NUM" value="${var.LENGTH_NUM }"></td>
											<td class='center' style="display:none;"><input type="hidden" name="THICKNESS_NUM" value="${var.THICKNESS_NUM }"></td>
										</tr>
									
									</c:forEach>									
									
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a class="btn btn-sm btn-success" onclick="add();">确认</a>																		
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						</form>
					
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				  </div>
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
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
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
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		function doubleClick(materialName,materialCode,materialSpec,materialId){

			$("#MATERIAL_NAME_SELECT").val(materialName);
			$("#MATERIAL_CODE_SELECT").val(materialCode);
			$("#MATERIAL_SPEC_SELECT").val(materialSpec);
			$("#MATERIAL_ID_SELECT").val(materialId);
			  
			var str3 = $("#MATERIAL_ID_SELECT").val();
			
			if(typeof(str3) != "undefined" && str3 != ""){
				top.Dialog.close();
			}
		}
		
		//新增
		function add(){
			
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				  if(document.getElementsByName('ids')[i].checked){
				    $("#MATERIAL_NAME_SELECT").val(document.getElementsByName('MATERIAL_NAME')[i].value);
				    $("#MATERIAL_CODE_SELECT").val(document.getElementsByName('MATERIAL_CODE')[i].value);
				    $("#MATERIAL_SPEC_SELECT").val(document.getElementsByName('MATERIAL_SPEC')[i].value);					
					$("#MATERIAL_ID_SELECT").val(document.getElementsByName('ids')[i].value);
				  }
				}
			var str3 = $("#MATERIAL_NAME_SELECT").val();
			
			 if(typeof(str3) != "undefined" && str3 != ""){
				
				top.Dialog.close();
			}			
			
		}
		
		$("#simple-table tbody").find("tr").dblclick(function(e){
            //真正双击代码
			$($(this).find("td")[0]).find("input").attr("checked",'checked')
			add();
        });

		
	</script>


</body>
</html>