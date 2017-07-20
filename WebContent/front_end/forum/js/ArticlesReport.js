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
				 var result = false;
				 $.ajax({
		                url: "/BA102G4/forum/ArticlesReportActionCtrl",
		                data: "action=update&art_rpt_no="+$(this).val(),
		                type:"POST",
		                dataType:'text',

		                success: function(msg){		                  
		                	if(msg.legth!=0){
		                    	$('#tips').css("background","url(/BA102G4/front_end/forum/css/images/tick.png) no-repeat center center"); 		
		  					  	$('#tips').css("display","block");
		  					  	$('#tips').animate({opacity:'1'},"slow",function(){
		  						$(this).animate({opacity:'0'},"slow",function(){
		  							  $('#tips').css("display","none");					  
		  						  });
		  					  	});
		  				
		                    }else{
		                    	$('#tips').css("background","url(/BA102G4//front_end/forum/css/images/cross.png) no-repeat center center"); 		
		      				  	$('#tips').css("display","block");
		      				  	$('#tips').animate({opacity:'1'},"slow",function(){
		      				  		$(this).animate({opacity:'0'},"slow",function(){
		      							  $('#tips').css("display","none");					  
		      						});
		      			  				
		      				  	});
		                    }  
		                
		                },

		                 error:function(xhr, ajaxOptions, thrownError){ 
		                	 
		                 }
		            });
				 if(result){
					 $(this).attr("disabled","");
			 			$(this).text("已刪除");
			 			$(this).attr("disabled","");
			 			$(this).prev('button').attr("disabled","");
			 			$(this).parent().parent().unbind("click");
			 			$(this).parent().parent().prop("disabled","true");
			 			$(this).parent().parent().css("background-color","gray");
			 			$(this).text("已完成");
				 }
				
			 		
			 }
		});
		$('.delRpt').click(function(event){
			 event.stopPropagation();

			 if(confirm('確定要刪除文章?')){
				 $.ajax({
		                url: "/BA102G4/forum/ArticlesReportActionCtrl",
		                data: "action=delete&art_no="+$(this).val(),
		                type:"POST",
		                dataType:'text',

		                success: function(msg){
		                    if(msg.legth!=0){
		                    	$('#tips').css("background","url(/BA102G4/front_end/forum/css/images/tick.png) no-repeat center center"); 		
		  					  	$('#tips').css("display","block");
		  					  	$('#tips').animate({opacity:'1'},"slow",function(){
		  						$(this).animate({opacity:'0'},"slow",function(){
		  							  $('#tips').css("display","none");					  
		  						  });
		  					  	});
		  					  	$(this).attr("disabled","");
					 			$(this).text("已刪除");
		                    }else{
		                    	$('#tips').css("background","url(/BA102G4//front_end/forum/css/images/cross.png) no-repeat center center"); 		
		      				  	$('#tips').css("display","block");
		      				  	$('#tips').animate({opacity:'1'},"slow",function(){
		      				  		$(this).animate({opacity:'0'},"slow",function(){
		      							  $('#tips').css("display","none");					  
		      						});
		      			  				
		      				  	});
		                    }
		                },

		                 error:function(xhr, ajaxOptions, thrownError){ 
		                	 $('#tips').css("background","url(/BA102G4/front_end/forum/css/images/cross.png) no-repeat center center"); 		
		      				  	$('#tips').css("display","block");
		      				  	$('#tips').animate({opacity:'1'},"slow",function(){
		      				  		$(this).animate({opacity:'0'},"slow",function(){
		      							  $('#tips').css("display","none");					  
		      						});
		      			  				
		      				  	});
		                 }
		            });
			 		
			 }
		});
	})
	
