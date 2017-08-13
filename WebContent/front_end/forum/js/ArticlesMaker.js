var editor;
var originPic = [];
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		allowFileManager : true
	});
	var path = window.location.pathname;
	webCtx = path.substring(0, path.indexOf('/', 1));
	for(var i = 0 ; i < $('#ctx img').length ; i ++){				
		var temp = $('#ctx img').eq(i).attr("id");
		temp = temp.substring(temp.length-1,temp.length); 
		originPic[i] = temp;	
	}	
	K('input[name=getHtml]').click(function(e) {
		
		e.preventDefault();
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
		var form = $('#articleForm');
		var art_ctx = document.getElementsByName("art_ctx")[0]; 
		var art_name = $('#art_name').val();
		art_ctx.innerHTML = text;
		check(art_name,text,form);
		
	});
	
});

var webCtx;
function check(art_name,art_ctx,form){
	$.ajax({
        url: webCtx+"/forum/ArticlesActionCtrl",
        data: {
        	"action":"check",
        	"art_name":art_name,
        	"art_ctx":art_ctx        	
        },                	  
        type:"POST",
        dataType:'text',

        success: function(msg){	
        	if(msg.length==0){                    	
					swal({
					  title: "發文成功",
					  text: "水喔，已成功發文，希望不是廢文。",
					  timer: 1000,
					  type: "success",
					  showConfirmButton: false
					},function(){
						form.submit();
					});
            }else{
            	$.each(JSON.parse(msg),function(v,i){
					swal({
					  title: "輸入錯誤",
					  text: v+i,
					  timer: 1000,
					  type: "error",
					  showConfirmButton: false
					});
				});
            }
        
        },

         error:function(xhr, ajaxOptions, thrownError){ 
        	 swal({
				  title: "申請失敗",
				  text: "請再嘗試看看",
				  timer: 1000,
				  type: "error",
				  showConfirmButton: false
				});
         }
    });
}
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