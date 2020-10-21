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
	<link rel="stylesheet" href="static/ace/css/bootstrap-timepicker.css" />
	
		
	    <link rel="stylesheet" href="static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="static/ace/css/font-awesome.css" />
		
		<link rel="stylesheet" href="static/ace/css/dropzone.css" />
		
		<link rel="stylesheet" href="static/ace/css/ace-fonts.css" />
		<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner"> 
			<div class="page-content">
				<div class="page-header">
					<h1>
						文件上传
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							拖放文件上传。
						</small>
					</h1>
				</div>
			
				<div class="row">
					<div class="col-xs-12">
					
					<input type="hidden" name="TRADEUNIT_ID" id="TRADEUNIT_ID" value="${pd.TRADEUNIT_ID}"/>
					<input type="hidden" name="BILL_ID" id="BILL_ID" value="${pd.BILL_ID}"/>
					<input type="hidden" name="BILL_TYPE" id="BILL_TYPE" value="${pd.BILL_TYPE}"/>
					
					<form action="attachmant/fileUpload" class="dropzone" id="dropzone">
						<div class="fallback">
							<input name="file" type="file" multiple="" />
						</div>
					</form>
	
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	
	<script src="static/ace/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="static/ace/js/dropzone.js"></script>
		<!-- ace scripts -->
		
	
		<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		jQuery(function($){
			
			
			var tid = $("#TRADEUNIT_ID").val();
			var bid = $("#BILL_ID").val();
			var btype = $("#BILL_TYPE").val();
			
			var url = '<%=basePath%>attachment/fileUpload.do?BILL_ID='+bid+'&BILL_TYPE='+btype+'&TRADEUNIT_ID='+tid;
			
			try {
			  Dropzone.autoDiscover = false;
			  var myDropzone = new Dropzone("#dropzone" , {
				url: url,
				method:"post",
			    paramName: "file", 
			    maxFilesize: 5, 	  
				addRemoveLinks : true,
				dictDefaultMessage :'<span class="bigger-150 bolder"><i class="ace-icon fa fa-caret-right red"></i>拖放文件</span> 上传 <span class="smaller-80 grey">(或者 点击)</span> <br /> <i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i>',
				dictResponseError: '文件上传失败!',				
				previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
			  });
			 
			   $(document).one('ajaxloadstart.page', function(e) {
					try {
						myDropzone.destroy();
					} catch(e) {}
			   });
			
			} catch(e) {
			  alert('Dropzone.js does not support older browsers!');
			}
			
			});
		
	  
		
		</script>
</body>
</html>