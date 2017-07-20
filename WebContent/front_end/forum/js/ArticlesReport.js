	$(function(){
		$('.art_rpt').click(function(){
			if($(this).next('tr' ).css("display")=='none'){
				$(this).css("background-color","lightblue");
				$(this).next('tr' ).css("display","");
			}else{
				$(this).next('tr' ).css("display","none");
				$(this).css("background-color","");
			}
			

			

		});
		$('.fininshRpt').click(function(event){
			 event.stopPropagation();
			 if(confirm('確定要完成處理?')){
			 		if(true){
			 			$(this).attr("disabled","");
			 			$(this).prev('button').attr("disabled","");
			 			$(this).parent().parent().unbind("click");
			 			$(this).parent().parent().prop("disabled","true");
			 			$(this).text("已完成");
			 		}
			 }else{

			 }
		});
		$('.delRpt').click(function(event){
			 event.stopPropagation();
			 if(confirm('確定要刪除文章?')){
			 		if(true){
			 			$(this).attr("disabled","");
			 			$(this).text("已刪除");
			 		}
			 }else{

			 }
		});
	})
	
