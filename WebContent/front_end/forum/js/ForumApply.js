var count = 0;
function create(pj,mem_no) {
	
	alert('in');
	
	 var result = false;
	var art_type_name = "";
		 for(var i = 0 ; i< $('input[name=art_type_name]').length ; i++){
   		  art_type_name= art_type_name+"art_type_name="+$('input[name=art_type_name]:eq('+i+')').val()+"&"
   	  }
		 $.ajax({
                url: pj+"/forum/ForumActionCtrl",
                data: "action=insert&mem_no="+mem_no+
                	  "&forum_name="+$('#forum_name').val()+"&forum_desc="+$('#forum_desc').val()+
                	  "&forum_note="+$('#forum_note').val()+"&"+art_type_name.substring(0,art_type_name.length-1),	                	  
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
  					  $(".inline").colorbox.close();
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
                	 $('#tips').css("background","url(/BA102G4//front_end/forum/css/images/cross.png) no-repeat center center"); 		
   				  	$('#tips').css("display","block");
   				  	$('#tips').animate({opacity:'1'},"slow",function(){
   				  		$(this).animate({opacity:'0'},"slow",function(){
   							  $('#tips').css("display","none");					  
   						});
   			  				
   				  	});
                 }
            });
		 
		
	 		
	 }




$(function() {

	$(".inline").colorbox({
		inline : true,
		width : "50%"
	});

	count = $('input:[name=art_type_name]:[value]').length;

	if (count > 3) {
		$('#btn').css("display", "none");
	}
	for (var i = 0; i < count; i++) {
		$('input[name=art_type_name]:eq(' + i + ")").css("display", "");
		$('input[name=art_type_name]:eq(' + i + ")").attr("readonly", "");
		$('.xbtn:eq(' + i + ')').css("display", "none");
		$('.xbtn:eq(' + i + ')').after('<br>');
		$('.xbtn:eq(' + (i) + ')').click(
				function() {
					if (count == 4) {
						$('#btn').css("display", "");
					}
					$(this).next().remove();
					$(this).unbind('click');
					$('input[name=art_type_name]:eq(' + (count) + ")").css(
							"display", "none");
					$('input[name=art_type_name]:eq(' + (count) + ")").val("");
					$(this).css("display", "none");
					$('input[name=art_type_name]:eq(' + (--count) + ")")
							.removeAttr("readonly");
					$('.xbtn:eq(' + (count - 1) + ')').css("display", "");
				});
	}
	$('input[name=art_type_name]:eq(' + count + ")").css("display", "");
	$('.xbtn:eq(' + (count - 1) + ')').css("display", "");
	$('#btn').click(
			function() {
				$('input[name=art_type_name]:eq(' + (count) + ")").attr(
						"readonly", "");
				$('.xbtn:eq(' + (count - 1) + ')').css("display", "none");
				$('.xbtn:eq(' + (count) + ')').css("display", "");
				$('.xbtn:eq(' + (count++) + ')').after('<br>');
				$('input[name=art_type_name]:eq(' + (count) + ")").css(
						"display", "");
				if (count > 3) {
					$(this).css("display", "none");
				}
				$('.xbtn:eq(' + (count - 1) + ')')
						.click(
								function() {
									if (count == 4) {
										$('#btn').css("display", "");
									}
									$(this).next().remove();
									$(this).unbind('click');
									$(
											'input[name=art_type_name]:eq('
													+ (count) + ")").css(
											"display", "none");
									$(
											'input[name=art_type_name]:eq('
													+ (count) + ")").val("");
									$(this).css("display", "none");
									$(
											'input[name=art_type_name]:eq('
													+ (--count) + ")")
											.removeAttr("readonly");
									$('.xbtn:eq(' + (count - 1) + ')').css(
											"display", "");
								});

			});
})
