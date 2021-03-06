﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
						<form action="tradeunit/customerselect.do" method="post" name="Form" id="Form">
						<input type='hidden' name='tradeunitIDSelect' id='tradeunitIDSelect' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='tradeunitCodeSelect' id='tradeunitCodeSelect' readonly='readonly' value="" class="ace" />
						<input type='hidden' name='tradeunitNameSelect' id='tradeunitNameSelect' readonly='readonly' value="" class="ace" />
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords}" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="录入日期从" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" id="lastLoginEnd" name="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="录入日期至" title="结束日期"/></td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="status" id="status" data-placeholder="请选择状态" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<option value="0" <c:if test="${pd.status eq '0'}">selected="selected"</c:if>>全部</option>
									<option value="1" <c:if test="${pd.status eq '1'}">selected="selected"</c:if>>在用</option>
									<option value="2" <c:if test="${pd.status eq '2'}">selected="selected"</c:if>>停用</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								
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
									<th class="center">客商编号</th>
									<th class="center">客商名称</th>
									<th class="center">客商简称</th>									
									<th class="center">注册地址</th>
									<th class="center" style="display:none;">客商编号</th>	
									<th class="center" style="display:none;">客商名称</th>									
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr  ondblclick="doubleClick('${var.TRADEUNIT_ID}','${var.TRADEUNIT_CODE}','${var.TRADEUNIT_NAME}');">
											<td class='center'>
												<label class="pos-rel"><input type='radio' name='ids' value="${var.TRADEUNIT_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center' style="display:none;" name = 'tradeunitId'>${var.TRADEUNIT_ID}</td>
											<td class='center'>${var.TRADEUNIT_CODE}</td>
											<td class='center'>${var.TRADEUNIT_NAME}</td>
											<td class='center'>${var.TRADEUNIT_ALT}</td>
											<td class='center'>${var.REGISTER_ADDRESS}</td>
											<td class='center' style="display:none;" ><input type='hidden' name='tradeunitCode' readonly='readonly' value="${var.TRADEUNIT_CODE}" class="ace" /></td>
											<td class='center' style="display:none;" ><input type='hidden' name='tradeunitName' readonly='readonly' value="${var.TRADEUNIT_NAME}" class="ace" /></td>											
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
		
		function doubleClick(strid,strcode,strname){
			
			document.getElementsByName('tradeunitCodeSelect').value = strcode;
		    document.getElementsByName('tradeunitNameSelect').value = strname;
		    document.getElementsByName('tradeunitIDSelect').value = strid;
			  
			var str3 = document.getElementsByName('tradeunitIDSelect').value;
			
			if(typeof(str3) != "undefined" && str3 != ""){
				
				top.Dialog.close();
			}
		}
		
		//新增
		function add(){
			
			for(var i=0;i < document.getElementsByName('ids').length;i++){
			  if(document.getElementsByName('ids')[i].checked){
			    var str = document.getElementsByName('ids')[i].value;
			    var str1 = document.getElementsByName('tradeunitCode')[i].value;
			    var str2 = document.getElementsByName('tradeunitName')[i].value;
			    
			    document.getElementsByName('tradeunitCodeSelect').value = str1;
			    document.getElementsByName('tradeunitNameSelect').value = str2;
			    document.getElementsByName('tradeunitIDSelect').value = str;
			  }
			}
			
			var str3 = document.getElementsByName('tradeunitIDSelect').value;
			
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