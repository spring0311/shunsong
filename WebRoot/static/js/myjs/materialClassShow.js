var basePath="";

function showMaterialClassWithRadio(selectId,basePath1,classType,selectedValue){	
	basePath = basePath1;
	
	$(selectId).html("");
	$.ajax({
		type: "POST",
		url: basePath +'materialselect/getMaterialClassList.do',
		data: {TYPE:classType},
    	dataType:'json',
		//beforeSend: validateData,
    	async: false,
		cache: false,
		success: function(data){
			var jsonDic =eval(data.materialClassList);	
			
			$.each(jsonDic,function(i,n){	
				var bianmaValue = jsonDic[i].MATERIAL_CLASS_ID;
				
				if(bianmaValue == selectedValue){
					$(selectId).append("<input type='radio' name='MATERIAL_CLASS_NAME' checked='checked' id='MATERIAL_CLASS_ID"+i+"' value='"+bianmaValue+"'/>");
					$(selectId).append("<label  for='MATERIAL_CLASS_ID"+i+"'>"+jsonDic[i].MATERIAL_CLASS_NAME+"</label>");
				}else{
					$(selectId).append("<input type='radio' name='MATERIAL_CLASS_NAME' id='MATERIAL_CLASS_ID"+i+"' value='"+bianmaValue+"'/>");
					$(selectId).append("<label  for='MATERIAL_CLASS_ID"+i+"'>"+jsonDic[i].MATERIAL_CLASS_NAME+"</label>");
				}
				
			});
						
		}
	});	
	
}

function showMaterialClassWithSelect(selectId,basePath1,classType,selectedValue){		
	basePath = basePath1;
	
	$(selectId).html("");
	$(selectId).prepend("<option value=''>请选择物料分类</option>");
	$.ajax({
		type: "POST",
		url: basePath +'materialselect/getMaterialClassList.do',
		data: {TYPE:classType},
    	dataType:'json',
		//beforeSend: validateData,
    	async: false,
		cache: false,
		success: function(data){
			var jsonDic =eval(data.materialClassList);	
			
			$.each(jsonDic,function(i,n){	
				var bianmaValue = jsonDic[i].MATERIAL_CLASS_ID;
				if(bianmaValue == selectedValue){
					$(selectId).append("<option value='"+bianmaValue+"' selected >"+jsonDic[i].MATERIAL_CLASS_NAME+"</option>");
				}else{
					$(selectId).append("<option value='"+bianmaValue+"'>"+jsonDic[i].MATERIAL_CLASS_NAME+"</option>");
				}
				
			});
						
		}
	});	
}
