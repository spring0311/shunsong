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
		<!-- jsp文件头和头部 -->
		<%@ include file="../../system/index/top.jsp"%>
		
				
	</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
					<!-- 添加属性  -->
					<input type="hidden" name="basePath" id="basePath" value="<%=basePath%>" />
					<input type="hidden" name="msgIndex" id="msgIndex" value="" />
					<input type="hidden" name="dtype" id="dtype" value="String" />
								
					<form action="" name="Form" id="Form" method="post">
						<input type="hidden" name="zindex" id="zindex" value="0">
						<input type="hidden" name="MATERIALID" id="MATERIALID" value="${pd.MATERIAL_ID }">
						<input type="hidden" name="MATERIALNAME" id="MATERIALNAME" value="${pd.MATERIAL_NAME }">
						<input type="hidden" name="SELECT_TYPE" id="SELECT_TYPE" value="${pd.SELECT_TYPE }">
						<input type="hidden" name="FIELDLIST" id="FIELDLIST" value="">
						
						<div id="zhongxin">
						<table style="margin-top: 10px;">
							<tr>
								<td>&nbsp;&nbsp;<font style="font-weight: bold;">选择的物料如下：</font></td>
							</tr>
						</table>
						<table style="margin-top: 5px;" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;">物料名称：</td>
								<td style="width:300px;">${pd.MATERIAL_NAME }</td>
								<td style="width:100px;text-align: right;">物料编号：</td>
								<td >${pd.MATERIAL_CODE }</td>								
							</tr>
							<tr>								
								<td style="width:100px;text-align: right;">物料规格：</td>
								<td >${pd.MATERIAL_SPEC }</td>
								<td style="width:100px;text-align: right;">物料描述：</td>
								<td >${pd.MATERIAL_DESC }</td>
							</tr>							
						</table>
						<table style="margin-top: 10px;">
							<tr>
								<td>&nbsp;&nbsp;<font style="font-weight: bold;">录入本次【${pd.MATERIAL_NAME }】的入库包数和每包数量：</font></td>
							</tr>
						</table>
						
						<table style="margin-top: 10px;" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;">包数：</td>
								<td style="width:400px;"><input type="text" name="barNum" id="barNum" value="" style="width:370px" placeholder="这里输入入库包数" /></td>
								<td style="width:100px;text-align: right;">每包的数量：</td>
								<td ><input type="text" name="packageNum" id="packageNum" value="" placeholder="这里输入每包的数量" /></td>
							</tr>
						</table>
						<table style="margin-top: 5px;">
							<tr>
								<td style="width:76px;text-align: right;">点击</td>
								<td > 
									<a class="btn btn-sm btn-success" onclick="saveD();" id="productc">生成每包记录</a>
								</td>
								<td style="text-align: left;">生成每包物料的数据</td>
							</tr>
						</table>
						
						<table style="margin-top: 10px;">
							<tr>
								<td>&nbsp;&nbsp;<font style="font-weight: bold;">在下面表格中，录入每包【${pd.MATERIAL_NAME }】的条形码和数量：</font></td>
							</tr>
						</table>
						<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-top: 5px;">
								
								<thead>
									<tr>
										<th class="center" style="width:50px;">序号</th>
										<th class="center"  style="display:none;">物料ID</th>
										<th class="center"  >物料名称</th>
										<th class="center" >物料条形码</th>
										<th class="center" >数量</th>
										<th class="center" >质量等级</th>
										<th class="center" style="width:69px;">操作</th>
									</tr>
								</thead>
														
								<tbody id="fields"></tbody>
								
						</table>
						
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="text-align: center;" colspan="100">
									<a class="btn btn-sm btn-success" onclick="save();" id="productc">加入入库车</a>
									<a class="btn btn-sm btn-success" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"><strong id="second_show">10秒</strong></h4></div>
						
					</form>

	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->	
	
		<!-- 页面底部js¨ -->
		<%@ include file="../../system/index/foot.jsp"%>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script src="static/js/myjs/materialSelect.js"></script>
		<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		$(reductionFields());
		//修改时还原属性列表
		function reductionFields(){
			var msg = '${msg}';
			if('edit' == msg){
				var nowarField = '${pd.FIELDLIST}';
				var fieldarray = nowarField.split('Q313596790');
				for(var i=0;i<fieldarray.length;i++){
					if(fieldarray[i] != ''){
					appendC(fieldarray[i]);
					arField[i] = fieldarray[i];
					}
				}
			}
		}
		
		//生成
		function save(){
			
			if(!confirm("确定要加入入库车吗?")){
				return false;
			}
			
			var basePath = $("#basePath").val();
			
			var mlist = [];
			
			for(var i=0;i < document.getElementsByName('fieldBarcode').length;i++){
				var fieldBarcode = document.getElementsByName('fieldBarcode')[i].value;
				var fieldPackagenum = document.getElementsByName('fieldPackagenum')[i].value;
				var radioName = "field-radio1" +i;
				var fieldQuility = $("input[name='"+radioName+"']:checked").val();
				//var fieldRemark = document.getElementsByName('fieldRemark')[i].value;
				var MATERIALID = $("#MATERIALID").val();
				var SELECT_TYPE = $("#SELECT_TYPE").val();
				
				var json = '{';
				json = json + 'Barcode:"' + fieldBarcode + '"';
				json = json + ',Packagenum:"' + fieldPackagenum + '"';
				json = json + ',Quility:"' + fieldQuility + '"';
				//json = json + ',Remark:"' + fieldRemark + '"';
				json = json + ',MaterialId:"' + MATERIALID + '"';
				json = json + ',SelectType:"' + SELECT_TYPE + '"';
				json = json + '}';
				
				mlist.push(json);
			}
			
			$.ajax({
				type: "POST",
				url: basePath+'materialselect/insertList.do',
		    	data:  {instockData:'['+mlist.toString()+']'},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					var strBack = data.list['msg'];
					if(strBack == 'success') {
						top.Dialog.close();
					}				
					 
				}
			});
		}
		</script>
	
</body>
</html>