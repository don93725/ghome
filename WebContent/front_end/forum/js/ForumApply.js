var count=0;
    $(function(){
    	count=$('input:[name=art_type_name]:[value]').length;
    	alert($('input:[name=art_type_name]:[value]').length);
    	for(var i = 0 ; i<count ; i++){
    		$('input[name=art_type_name]:eq('+i+")").css("display","");
    		$('input[name=art_type_name]:eq('+i+")").attr("readonly","");
    		$('.xbtn:eq('+i+')').css("display","none");
    		$('.xbtn:eq('+i+')').after('<br>');
    		$('.xbtn:eq('+(i)+')').click(function(){
    			if(count>4){
    			$('#btn').css("display","");
    			}
    			$(this).next().remove();
    			$(this).unbind('click');
    			$('input[name=art_type_name]:eq('+(count)+")").css("display","none");
    			$('input[name=art_type_name]:eq('+(count)+")").val("");
    			$(this).css("display","none");	
    			$('input[name=art_type_name]:eq('+(--count)+")").removeAttr("readonly");
    			$('.xbtn:eq('+(count-1)+')').css("display","");		
    		});		    	    		
    	}
    	$('input[name=art_type_name]:eq('+count+")").css("display","");
    	$('.xbtn:eq('+(count-1)+')').css("display","");
    	$('#btn').click(function(){    
    		$('input[name=art_type_name]:eq('+(count)+")").attr("readonly","");
    		$('.xbtn:eq('+(count-1)+')').css("display","none");	
    		$('.xbtn:eq('+(count)+')').css("display","");	
    		$('.xbtn:eq('+(count++)+')').after('<br>');
    		$('input[name=art_type_name]:eq('+(count)+")").css("display","");
    		if(count>4){
    			$(this).css("display","none");
    		}
    		$('.xbtn:eq('+(count-1)+')').click(function(){
    			if(count>4){
    			$('#btn').css("display","");
    			}
    			$(this).next().remove();
    			$(this).unbind('click');
    			$('input[name=art_type_name]:eq('+(count)+")").css("display","none");
    			$('input[name=art_type_name]:eq('+(count)+")").val("");
    			$(this).css("display","none");	
    			$('input[name=art_type_name]:eq('+(--count)+")").removeAttr("readonly");
    			$('.xbtn:eq('+(count-1)+')').css("display","");		
    		});

    		

    	});
    })	