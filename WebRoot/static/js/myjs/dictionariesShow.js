var basePath="";

function showDictionariesWithRadio(selectId,basePath1,parentName,selectedValue){	
	basePath = basePath1;
	
	$(selectId).html("");
	$.ajax({
		type: "POST",
		url: basePath +'dictionaries/getDictionariesList.do',
		data: {BIANMA:parentName},
    	dataType:'json',
		//beforeSend: validateData,
    	async: false,
		cache: false,
		success: function(data){
			var jsonDic =eval(data.dictionariesList);	
			
			$.each(jsonDic,function(i,n){	
				var bianmaValue = jsonDic[i].BIANMA;
				
				if(bianmaValue == selectedValue){
					$(selectId).append("<input type='radio' name='DICBIANMA' checked='checked' id='DICBIANMA"+i+"' value='"+bianmaValue+"'/>");
					$(selectId).append("<label  for='DICBIANMA"+i+"'>"+jsonDic[i].NAME+"</label>");
				}else{
					$(selectId).append("<input type='radio' name='DICBIANMA' id='DICBIANMA"+i+"' value='"+bianmaValue+"'/>");
					$(selectId).append("<label  for='DICBIANMA"+i+"'>"+jsonDic[i].NAME+"</label>");
				}
				
			});
						
		}
	});	
	
}

function showDictionariesWithSelect(selectId,basePath1,parentName,showOption,selectedValue){		
	basePath = basePath1;
	
	$(selectId).html("");
	$(selectId).prepend("<option value=''>"+showOption+"</option>");
	$.ajax({
		type: "POST",
		url: basePath +'dictionaries/getDictionariesList.do',
		data: {BIANMA:parentName},
    	dataType:'json',
		//beforeSend: validateData,
    	async: false,
		cache: false,
		success: function(data){
			var jsonDic =eval(data.dictionariesList);	
			
			$.each(jsonDic,function(i,n){	
				var bianmaValue = jsonDic[i].BIANMA;
				if(bianmaValue == selectedValue){
					$(selectId).append("<option value='"+bianmaValue+"' selected >"+jsonDic[i].NAME+"</option>");
				}else{
					$(selectId).append("<option value='"+bianmaValue+"'>"+jsonDic[i].NAME+"</option>");
				}
				
			});
						
		}
	});	
}
