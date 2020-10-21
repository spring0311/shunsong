/**
 * @FH QQ:313596790
 */	
	
	
	//倒计时
	function timer(intDiff){
		window.setInterval(function(){
		$('#second_show').html('<s></s>'+intDiff+'秒');
		intDiff--;
		}, 1000);
	} 
	
	//保存编辑属性
	function saveD(){
		
		var barNum = $("#barNum").val(); 	 		 //属性名
		var packageNum = $("#packageNum").val(); 	 		 //类型
	
		if(barNum==""){
			$("#barNum").tips({
				side:3,
	            msg:'输入包数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#barNum").focus();
			return false;
		}
		
		if(packageNum==""){
			$("#packageNum").tips({
				side:3,
	            msg:'输入每包数量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#packageNum").focus();
			return false;
		}
		
		var packageNum = $("#packageNum").val();
		var fields = '' + ',fh,' + packageNum + ',fh,' + '' + ',fh,' + '';
		
		for(var i=0;i<barNum;i++){
			appendC(fields);
		}		
		
	}
	
	
	var arField = new Array();
	var index = 0;
	//追加属性列表
	function appendC(value){
		var fieldarray = value.split(',fh,');
		var MATERIALID = $("#MATERIALID").val();
		var MATERIALNAME = $("#MATERIALNAME").val();
				
		var inHtml = '<tr>';
		inHtml = inHtml + '<td class="center">'+Number(index+1)+'</td>';
		inHtml = inHtml + '<td class="center" style="display:none;">'+MATERIALID+'<input type="hidden" name="fieldMATERIALID" value="'+MATERIALID+'"></td>';
		inHtml = inHtml + '<td class="center" style="width:100px">'+MATERIALNAME+'<input type="hidden" name="fieldMATERIALNAME" value="'+MATERIALNAME+'"></td>';
		inHtml = inHtml + '<td class="center" style="width:50px"><input type="text" name="fieldBarcode" value="'+fieldarray[0]+'" placeholder="这里输入每包的条形码"></td>';
		inHtml = inHtml + '<td class="center" style="width:50px"><input type="text" name="fieldPackagenum" value="'+fieldarray[1]+'" placeholder="这里输入每包的数量"></td>';
		//inHtml = inHtml + '<td class="center" style="width:50px"><input type="text" name="fieldQuility" value="'+fieldarray[2]+'" placeholder="这里输入每包的质量等级"></td>';
		inHtml = inHtml + '<td class="center" style="width:50px"><input name="field-radio1'+index+'" id="field-radio1'+index+'" type="radio" value="A" checked="checked" ><span class="lbl">A品</span>';
		inHtml = inHtml + '<input name="field-radio1'+index+'" id="field-radio2'+index+'" type="radio" value="B" ><span class="lbl">B品</span></td>';
		//inHtml = inHtml + '<td class="center" style="width:50px"><input type="text" name="fieldRemark" value="'+fieldarray[3]+'" placeholder="这里输入备注信息"></td>';
		inHtml = inHtml + '<td class="center" style="width:50px;">';
		inHtml = inHtml + 	'<input type="hidden" name="field'+index+'" value="'+value+'">';
		inHtml = inHtml + 	'<a class="btn btn-mini btn-danger" title="删除" onclick="removeField(\''+index+'\')"><i class="ace-icon fa fa-trash-o bigger-120"></i></a>';
		inHtml = inHtml + '</td>';
		inHtml = inHtml + '</tr>';
		
						
		$("#fields").append(inHtml);
		index++;
		$("#zindex").val(index);
	}
		
	
	//删除数组添加元素并重组列表
	function removeField(value){
		
		for(var i=0;i < document.getElementsByName('fieldBarcode').length;i++){
			var fieldBarcode = document.getElementsByName('fieldBarcode')[i].value;
			var fieldPackagenum = document.getElementsByName('fieldPackagenum')[i].value;
			var fieldQuility = document.getElementsByName('fieldQuility')[i].value;
			//var fieldRemark = document.getElementsByName('fieldRemark')[i].value;
			
			var fields = fieldBarcode + ',fh,' + fieldPackagenum + ',fh,' + fieldQuility;// + ',fh,' + fieldRemark;
			
			arField[i] = fields;
		}
				
		$("#fields").html('');
		arField.splice(value,1);
		index = 0;
		for(var i=0;i<arField.length;i++){
			
			appendC(arField[i]);
		}
	}
	
	//判断属性名是否重复
	function isSame(value){
		for(var i=0;i<arField.length;i++){
			var array0 = arField[i].split(',fh,')[0];
			if(array0 == value){
				return false;
			}
		}
		return true;
	}
	
	
	/**
	 * @FH QQ: 3 1 3 596790
	 */