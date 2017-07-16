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
					 				"forum/OutputPic?art_cmt_no=$ArtCmtPrimaryKey$'>";
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