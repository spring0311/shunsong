var locat = (window.location+'').split('/'); 
$(function(){if('main'== locat[3]){locat =  locat[0]+'//'+locat[2];}else{locat =  locat[0]+'//'+locat[2]+'/'+locat[3];};});

var fmid = "fhindex";	//菜单点中状态
var mid = "fhindex";	//菜单点中状态
var fhsmsCount = 0;		//站内信总数
var USER_ID;			//用户ID
var user = "FH";		//用于即时通讯（ 当前登录用户）
var TFHsmsSound = '1';	//站内信提示音效
var websocket;			//websocket对象
var wimadress="";		//即时聊天服务器IP和端口
var oladress="";		//在线管理和站内信服务器IP和端口
var plantipsadress="";  //生产计划排程设置服务器IP和端口
function siMenu(id,fid,MENU_NAME,MENU_URL){
	if(id != mid){
		$("#"+mid).removeClass();
		mid = id;
	}
	if(fid != fmid){
		$("#"+fmid).removeClass();
		fmid = fid;
	}
	$("#"+fid).attr("class","active open");
	$("#"+id).attr("class","active");
	top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
	if(MENU_URL != "druid/index.html"){
		jzts();
	}
}

$(function(){
	getHeadMsg();	//初始页面最顶部信息
});

$(window).unload(function(){
    //响应事件
	websocket.send('[leave]');//关闭
});

//初始页面信息
function getHeadMsg(){
	$.ajax({
		type: "POST",
		url: locat+'/head/getList.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		//beforeSend: validateData,
		cache: false,
		success: function(data){
			 $.each(data.list, function(i, list){
				 $("#user_info").html('<small>'+list.DEPTNAME+'</small> '+list.NAME+'');//登陆者资料
				 user = list.USERNAME;
				 USER_ID = list.USER_ID;		//用户ID
				 if(list.USERNAME != 'admin'){
					 $("#systemset").hide();	//隐藏系统设置					 
					 $("#adminmenu").hide();	//隐藏菜单设置
					 $("#adminzidian").hide();	//隐藏数据字典					
					 $("#productCode").hide();	//隐藏代码生成
				 }
			 });
			 fhsmsCount = Number(data.fhsmsCount);
			 $("#fhsmsCount").html(Number(fhsmsCount));	//站内信未读总数
			 $("#countStockhandNoEnough").html(Number(data.countStockhandNoEnough));	//配件库存不足条数
			 TFHsmsSound = data.FHsmsSound;				//站内信提示音效
			 wimadress = data.wimadress;				//即时聊天服务器IP和端口
			 oladress = data.oladress;					//在线管理和站内信服务器IP和端口
			 plantipsadress = data.plantipsadress;		//生产计划排程设置服务器IP和端口
			 online();									//连接在线
			 //默认展开提示消息
			 if(Number(data.estimateCcountStockhandNoEnoughount) != 0){
				 $("#messUl").click();
				 if(Number(data.countStockhandNoEnough) != 0) messCount ++;
				 $("#messCount").html(Number(messCount));	//站内信未读总数			 
			 }
		}
	});
}

//获取站内信未读总数(在站内信删除未读新信件时调用此函数更新未读数)
function getFhsmsCount(){
	$.ajax({
		type: "POST",
		url: locat+'/head/getFhsmsCount.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		cache: false,
		success: function(data){
			 fhsmsCount = Number(data.fhsmsCount);
			 $("#fhsmsCount").html(Number(fhsmsCount));	//站内信未读总数
		}
	});
}

function goStockPartNoEnough(){
	var url = locat+"/moulddetail/goListNoEnough.do";
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="配件库存不足列表";
	 diag.URL = url;
	 diag.Width = 800;
	 diag.Height = 1000;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
		getMessList();
	 };
	 diag.show();
}

//加入在线列表
function online(){
	if (window.WebSocket) {
		websocket = new WebSocket(encodeURI('ws://'+oladress)); //oladress在main.jsp页面定义
		websocket.onopen = function() {
			//连接成功
			websocket.send('[join]'+user);
		};
		websocket.onerror = function() {
			//连接失败
		};
		websocket.onclose = function() {
			//连接断开
		};
		//消息接收
		websocket.onmessage = function(message) {
			var message = JSON.parse(message.data);
			if(message.type == 'goOut'){
				$("body").html("");
				goOut("1");
			}else if(message.type == 'thegoout'){
				$("body").html("");
				goOut("2");
			}else if(message.type == 'senFhsms'){
				fhsmsCount = Number(fhsmsCount)+1;
				$("#fhsmsCount").html(Number(fhsmsCount));
				$("#fhsmsobj").html('<audio style="display: none;" id="fhsmstsy" src="static/sound/'+TFHsmsSound+'.mp3" autoplay controls></audio>');
				$("#fhsmstss").tips({
					side:3,
		            msg:'有新消息',
		            bg:'#AE81FF',
		            time:30
		        });
			}
		};
	}
}

//下线
function goOut(msg){
	window.location.href=locat+"/logout.do?msg="+msg;
}

//去通知收信人有站内信接收
function fhsmsmsg(USERNAME){
	var arrUSERNAME = USERNAME.split(';');
	for(var i=0;i<arrUSERNAME.length;i++){
		websocket.send('[fhsms]'+arrUSERNAME[i]);//发送通知
	}
}

//读取站内信时减少未读总数
function readFhsms(){
	fhsmsCount = Number(fhsmsCount)-1;
	$("#fhsmsCount").html(Number(fhsmsCount) <= 0 ?'0':fhsmsCount);
}

//修改个人资料
function editUserH(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="个人资料";
	 diag.URL = locat+'/user/goEditU.do?USER_ID='+USER_ID+'&fx=head';
	 diag.Width = 469;
	 diag.Height = 469;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//修改当前部门
function changeCurrentDept(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="切换部门";
	 diag.URL = locat+'/user/goChangeCurrentDept.do?USER_ID='+USER_ID+'&fx=head';
	 diag.Width = 469;
	 diag.Height = 469;
	 diag.CancelEvent = function(){ //关闭事件
		
		 window.location.href=locat+'/main/index';
	 };
	 diag.show();
}



//系统设置
function editSys(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="系统设置";
	 diag.URL = locat+'/head/goSystem.do';
	 diag.Width = 600;
	 diag.Height = 526;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//站内信
function fhsms(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="站内信";
	 diag.URL = locat+'/fhsms/list.do?STATUS=2';
	 diag.Width = 800;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//代码生成
function productCode(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="代码生成器";
	 diag.URL = locat+'/head/goProductCode.do';
	 diag.Width = 800;
	 diag.Height = 450;
	 diag.CancelEvent = function(){ //关闭事件
		hangge();
		diag.close();
	 };
	 diag.show();
}

//数据字典
function zidian(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="数据字典";
	 diag.URL = locat+'/dictionaries/list';
	 diag.Width = 799;
	 diag.Height = 460;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
	 
}

//菜单
function menu(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="菜单编辑";
	 diag.URL = locat+'/menu.do';
	 diag.Width = 720;
	 diag.Height = 390;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
	 
}

//切换菜单
function changeMenus(){
	window.location.href=locat+'/main/yes';
}

//清除加载进度
function hangge(){
	$("#jzts").hide();
}

//显示加载进度
function jzts(){
	$("#jzts").show();
}

function getMessList(){
	$.ajax({
		type: "POST",
		url: locat+'/head/getMessList.do?tm='+new Date().getTime(),
    	data: encodeURI(""),
		dataType:'json',
		cache: false,
		success: function(data){
			 $("#estimateCount").html(Number(data.estimateCount));	//站内信未读总数
			 $("#userWorktimeCount").html(Number(data.userWorktimeCount));	//站内信未读总数
			 if(Number(data.estimateCount) != 0 || Number(data.userWorktimeCount) != 0){
				 var messCount = 0;
				 if(Number(data.estimateCount) != 0) messCount ++ ;
				 if(Number(data.userWorktimeCount) != 0) messCount ++;
				 $("#messCount").text(Number(messCount));	//站内信未读总数			 
			 }
		}
	});
}