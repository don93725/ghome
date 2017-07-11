var count = 0;
$(function(){
		$('#pic').change(function(event){			
			var myarea = document.getElementById("ctx"); 
  			var file    = document.querySelector('#pic').files[0];
 			var reader  = new FileReader();
 			var img = new Image(); 	
 			img.height = 100;
  			reader.addEventListener("load", function () {  			
  			img.id = 'pic'+count;
    		img.src = reader.result;
    		$('#ctx img').remove();
    		myarea.appendChild(img); 
  			}, false);

  			if (file) {
   			reader.readAsDataURL(file);
  			}  			
		});
})
function getContent(){
	 	
	 	var ctx = document.getElementById('ctx').childNodes;
	 	var text = "";	
	 	for(var i = 0 ; i<ctx.length ; i++){
	 		var temp = ctx[i].nodeType;
	 		if(temp==1){
	 			text = text + "<img width=100 src='$ProjectRealPath$/forum/OutputPic?art_cmt_no=$ArtCmtPrimaryKey$'>"
	 		}
	 		if(temp==3){
	 			text = text +ctx[i].nodeValue;
	 		}
	 	}
	 	var art_cmt_ctx = document.getElementById("art_cmt_ctx"); 
	 	alert(text);
 		art_cmt_ctx.innerHTML = text;
 }