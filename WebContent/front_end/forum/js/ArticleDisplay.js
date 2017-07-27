var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		allowFileManager : true
	});
	K('input[name=getHtml]').click(function(e) {
		$('#ctx').html(editor.html());
		var ctx = document.getElementById('ctx').childNodes;
		var text = "";	
		for(var i = 0 ; i<ctx.length ; i++){
 			var temp = ctx[i];	 			
 			if(temp.nodeType==1){
 				var tag = temp.tagName;
 				if(tag=='IMG'){			 					
 					if(temp.hasAttribute('alt')){
 						text = text + "<img src='"+temp.src+"' border='0'>";
 					}else{
 						text = text + "<img width=100 src='$ProjectRealPath$/"+
		 				"util/OutputPic?art_cmt_no=$ArtCmtPrimaryKey$'>";
 					}
 					
	 			}else{
 					var tagInner = temp.innerHTML;
 					text = text +"<"+tag+">"+tagInner+"</"+tag+">";	 						
	 			}					 	
 			
 			}
 			if(temp.nodeType==3){
 				text = text +temp.nodeValue;
 			}	 

		} 		 				 			
		var art_cmt_ctx = document.getElementsByName("art_cmt_ctx")[0]; 
		art_cmt_ctx.innerHTML = text;
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

(function($) {
     $(".inline").colorbox({inline:true, width:"50%"});
})(jQuery);
	

function report(pj,art_no){
	var xhr = createXHR();
	if(xhr!=null){
		xhr.onreadystatechange=function()
		{

		  if (xhr.readyState==4 && xhr.status==200){			  
			  $(".inline").colorbox.close();
			  if(xhr.responseText.length!=0){					  
					  $('#tips').css("background","url("+pj+"/front_end/forum/css/images/tick.png) no-repeat center center"); 		
					  $('#tips').css("display","block");
					  $('#tips').animate({opacity:'1'},"slow",function(){
						  $(this).animate({opacity:'0'},"slow",function(){
							  $('#tips').css("display","none");					  
						  });
					  });
			  } else{
				  $('#tips').css("background","url("+pj+"/front_end/forum/css/images/cross.png) no-repeat center center"); 		
				  $('#tips').css("display","block");
				  $('#tips').animate({opacity:'1'},"slow",function(){
			  			$(this).animate({opacity:'0'},"slow",function(){
							  $('#tips').css("display","none");					  
						  });
			  				
				  });
			  }
			 
			 
		  }else	if(xhr.status==404||xhr.status==500){
			  $('#tips').css("background","url("+pj+"/front_end/forum/css/images/cross.png) no-repeat center center"); 		
			  $('#tips').css("display","block");
			  $('#tips').animate({opacity:'1'},"slow",function(){
		  			$(this).animate({opacity:'0'},"slow",function(){
						  $('#tips').css("display","none");					  
					  });
		  				
			  }); 
		  		
		  }
	  	}
	}		
	if(xhr!=null){
		var URL = pj+"/forum/ArticlesReportActionCtrl";
		xhr.open("post",URL,true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("rpt_type="+$('#rpt_type').val()+"&rpt_ctx="+$('#rpt_ctx').val()+"&art_no="+art_no+"&action=insert");		
	}
}
function createXHR(){
	var xhr = null;
	if(window.XMLHttpRequest){
		xhr = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		xhr = new ActiveXObject("Microsoft.XMLHTTP")
	}
	return xhr;
}		
