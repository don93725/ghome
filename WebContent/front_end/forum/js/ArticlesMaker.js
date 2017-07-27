var editor;
var originPic = [];
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		allowFileManager : true
	});
	
	for(var i = 0 ; i < $('#ctx img').length ; i ++){				
		var temp = $('#ctx img').eq(i).attr("id");
		temp = temp.substring(temp.length-1,temp.length); 
		originPic[i] = temp;	
	}	
	K('input[name=getHtml]').click(function(e) {
		
	
		$('#ctx').html(editor.html());
		
		var deleteInfo = "";
		var ctx = document.getElementById('ctx').childNodes;
		var text = "";
		var arr = [];		
		for(var i = 0 ; i < $('input[type=file]').length;i++){
			arr[i] = i+"";
		}		
		var order = "";
		for(var i = 0 ; i<ctx.length ; i++){
			
 			var temp = ctx[i];

 			if(temp.nodeType==1){
 				var tag = temp.tagName;
 				if(tag=='IMG'){
 					if(temp.hasAttribute('alt')){
 						text = text + "<img src='"+temp.src+"' border='0'>";
 					}else{
 						var id = temp.id;
 						id = id.substring(id.length-1,id.length);		 						
 						for(var j = 0 ; j < arr.length ; j++){
 							if(arr[j]==id){
 								delete arr[j];
 							}
 						} 						
 						order = order + id + ",";
 						text = text + "<img width=100 id='pic"+id+"' src='$ProjectRealPath$/"+
		 				"util/OutputPic?art_no=$ArticlesPrimaryKey$&art_pt_idx="+id+"'>";
		 				
 					}
 					
	 			}else if(tag!='BR'){
 					var tagInner = temp.innerHTML;
 					text = text +"<"+tag+">"+tagInner+"</"+tag+">";	 						
	 			}					 	
 			
 			}
 			if(temp.nodeType==3){
 				text = text +temp.nodeValue;
 			}	 

		}
		
		if(arr.length!=0){
			for(var i = 0 ; i < arr.length ; i++){
				$('#file'+arr[i]).remove();
				for(var j = 0 ; j < originPic.length ; j++){
					
					if(arr[i]==originPic[j]){						
						deleteInfo = deleteInfo + originPic[j]+",";						
						$('#file'+originPic[j]).remove();			
						
					}	
				}								
			}							
		}
		$('#order').val(order);
		$('#deleteInfo').val(deleteInfo);
		var art_ctx = document.getElementsByName("art_ctx")[0]; 
		art_ctx.innerHTML = text;
		
	});
	
});

var editor;
KindEditor.ready(function(K) {
	editor = K.create('div[name="content"]', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : true,
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link']
	});
});