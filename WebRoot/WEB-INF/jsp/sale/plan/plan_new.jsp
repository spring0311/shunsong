<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<%
	String[] weeks = {"", "日", "一", "二", "三", "四", "五", "六"};
	String[] days = new String[42];
	for (int i = 0; i < 42; i++) {
		days[i] = "";
	}
	
	//标准日历系统的当前时间
	GregorianCalendar currentDay = new GregorianCalendar();
	
	String intYearMonth = request.getParameter("yearmonth");
	if (intYearMonth != ""){
		String a[] = intYearMonth.split("-");
		int intYear = Integer.valueOf(a[0]);
		int intMonth = Integer.valueOf(a[1]) - 1;
		
		currentDay = new GregorianCalendar(intYear,intMonth,1);
	}
	
	//年
	int year = currentDay.get(Calendar.YEAR);
	//月，由于取值范围为0-11，实际月份需+1
	int month = currentDay.get(Calendar.MONTH);
	//日
	int today = currentDay.get(Calendar.DAY_OF_MONTH);
	//星期，取值范围为1-7，且以星期日为每周第一天的美国标准
	int weekday = currentDay.get(Calendar.DAY_OF_WEEK);
	//得到标准日历系统的当前时间输出字符串
	String now = year + "年" + (month + 1) + "月" + today + "日" + " 星期"
			+ weeks[weekday];
	//创建日历
	Calendar calendar = Calendar.getInstance();
	
	//月份为当前月
	calendar.set(Calendar.MONTH, month);
	//年份为当前年
	calendar.set(Calendar.YEAR, year);
	//每周第一天为星期日
	calendar.setFirstDayOfWeek(Calendar.SUNDAY);
	//该月的第一天
	calendar.set(Calendar.DAY_OF_MONTH, 1);
	//第一天的星期
	int firstIndex = calendar.get(Calendar.DAY_OF_WEEK) - 1;
	//这个月最大天数
	int maxIndex = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	//得到该月日数字符串
	for (int i = 0; i < maxIndex; i++) {
		//int需转换为字符串
		days[firstIndex + i] = String.valueOf(i + 1);
	}
%>
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
						<div class="col-xs-12">
						
							<form action="plan/goNew.do" name="Form" id="newForm" method="post">
							<input type="hidden" name="PLAN_ID" id="PLAN_ID" value="${pd.PLAN_ID}"/>
							
							<div id="zhongxin" style="padding-top: 13px;">
						    <table width="600" align="center" cellspacing="1" border="0">
									<tr height="40">
										
										<td colspan="3" style="text-align: right;padding-top: 13px;">选择月份：
										</td>
										<td colspan="3" align="left" style="border: 0 solid">
										 	<input class="span10 date-picker" name="selectmonth" id="selectmonth" readonly="readonly" value="<%=intYearMonth %>" type="text" onChange="showValue(this.value)" data-date-format="yyyy-mm"  style="width:88px;" placeholder="月份" title="月份"/>
										 	
										</td>
										<td colspan="1" style="text-align: right;padding-top: 13px;">										 	
										 	金额单位：元
										</td>
									</tr>
									<tr height="30" bgcolor="#F0F0F0" align="center">
										<td style="border: 1 solid;">日</td>
										<td style="border: 1 solid;">一</td>
										<td style="border: 1 solid;">二</td>
										<td style="border: 1 solid;">三</td>
										<td style="border: 1 solid;">四</td>
										<td style="border: 1 solid;">五</td>
										<td style="border: 1 solid;">六</td>
									</tr>
									<%
										for (int i = 0; i < 6; i++) {
									%>
									<tr height="30" align="center">
										<%
											for (int j = i * 7; j < (i + 1) * 7; j++) {
													if ((j - firstIndex + 1) == today) {
										%>
										<td height="25" align="center" bgcolor="gray" style="border: 1 solid"><fontcolor="#FFFFFF"><b><%=days[j]%></b></font></td>
										<%
											} else {
										%>
										<td height="25" align="center" style="border: 1 solid"><%=days[j]%></td>
										<%}}%>
									</tr>
									<tr height="30" align="center">
										<%
											for (int m = i * 7; m < (i + 1) * 7; m++) {
													if (days[m] != "") {
														request.setAttribute("requestI", days[m]);
										%>
										<td height="25" align="center"  style="border: 1 solid">
											<input type="text" name="PLAN_AMT<%=days[m]%>" id="PLAN_AMT<%=days[m]%>" value="${pd.PLANAMT[requestI]}" maxlength="" placeholder="输入金额" title="" style="width:98%;"/>
										</td>
										<%
											} else {
										%>
										<td height="25" align="center" style="border: 1 solid">
											<%=days[m]%>
										</td>
										<%}}%>
									</tr>
									<%}%>
							
								</table>	
					           </div>
					           
					           <div style="padding-top: 13px;">
						    	<table width="600" align="center" cellspacing="1" border="0">
						    		<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
										<td><%-- <input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="" placeholder="这里输入" title="" style="width:98%;"/> --%>
										   <textarea name="REMARK" id="REMARK" style="width:500px;height:40px;">${pd.REMARK}</textarea>
										</td>
									</tr>
									<br></br>
						           <tr>
									<td style="text-align: center;" colspan="2">
										<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
								</table>
					           </div>
					           
					           <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					           
					           <div id="zhongxin3" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
						
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
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			/* $('#selectmonth').bind('input propertychange', function() { 
				$("#newForm").submit();
				bootbox.confirm("确定要修改月份吗?", function(result) {
					if(result) {
						top.jzts();						
					}
				});  
			});   */
		});
		
		function showValue(obj){
			var intYearMonth = obj;
			var url = '<%=basePath%>plan/goNew.do?yearmonth='+intYearMonth;
			$("#newForm").attr("action", url);
			$("#newForm").submit();
		}
		
		function save(){
			$("#zhongxin2").show();
			var intMaxDay = '<%=maxIndex%>';
			var stringYearMonth = '<%=intYearMonth%>';
			var planamt1 = $("#PLAN_AMT1").val();
			var planamt2 = $("#PLAN_AMT2").val();
			var planamt3 = $("#PLAN_AMT3").val();
			var planamt4 = $("#PLAN_AMT4").val();
			var planamt5 = $("#PLAN_AMT5").val();
			var planamt6 = $("#PLAN_AMT6").val();
			var planamt7 = $("#PLAN_AMT7").val();
			var planamt8 = $("#PLAN_AMT8").val();
			var planamt9 = $("#PLAN_AMT9").val();
			var planamt10 = $("#PLAN_AMT10").val();
			var planamt11 = $("#PLAN_AMT11").val();
			var planamt12 = $("#PLAN_AMT12").val();
			var planamt13 = $("#PLAN_AMT13").val();
			var planamt14 = $("#PLAN_AMT14").val();
			var planamt15 = $("#PLAN_AMT15").val();
			var planamt16 = $("#PLAN_AMT16").val();
			var planamt17 = $("#PLAN_AMT17").val();
			var planamt18 = $("#PLAN_AMT18").val();
			var planamt19 = $("#PLAN_AMT19").val();
			var planamt20 = $("#PLAN_AMT20").val();
			var planamt21 = $("#PLAN_AMT21").val();
			var planamt22 = $("#PLAN_AMT22").val();
			var planamt23 = $("#PLAN_AMT23").val();
			var planamt24 = $("#PLAN_AMT24").val();
			var planamt25 = $("#PLAN_AMT25").val();
			var planamt26 = $("#PLAN_AMT26").val();
			var planamt27 = $("#PLAN_AMT27").val();
			var planamt28 = $("#PLAN_AMT28").val();
			var planamt29 = "";
			if(intMaxDay>=28){
				planamt29 = $("#PLAN_AMT29").val();
			}
			var planamt30 = "";
			if(intMaxDay>=29){
				planamt30 = $("#PLAN_AMT30").val();
			}
			var planamt31 = "";
			if(intMaxDay>=30){
				planamt31 = $("#PLAN_AMT31").val();
			}
			
			var remark = $("#REMARK").val();
			
			$.ajax({
				type: "POST",
				url: '<%=basePath%>plan/saveAll.do',
		    	data: {YEARMONTH:stringYearMonth,REMARK:remark,PLANAMT1:planamt1,PLANAMT2:planamt2,PLANAMT3:planamt3,PLANAMT4:planamt4,PLANAMT5:planamt5,PLANAMT6:planamt6,PLANAMT7:planamt7,PLANAMT8:planamt8,PLANAMT9:planamt9,PLANAMT10:planamt10,PLANAMT11:planamt11,PLANAMT12:planamt12,PLANAMT13:planamt13,PLANAMT14:planamt14,PLANAMT15:planamt15,PLANAMT16:planamt16,PLANAMT17:planamt17,PLANAMT18:planamt18,PLANAMT19:planamt19,PLANAMT20:planamt20,PLANAMT21:planamt21,PLANAMT22:planamt22,PLANAMT23:planamt23,PLANAMT24:planamt24,PLANAMT25:planamt25,PLANAMT26:planamt26,PLANAMT27:planamt27,PLANAMT28:planamt28,PLANAMT29:planamt29,PLANAMT30:planamt30,PLANAMT31:planamt31},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						 $("#zhongxin").show();
						
						 $("#zhongxin2").hide();
						 
						 top.Dialog.close();
					 }
				}
			});
		}
	</script>


</body>
</html>