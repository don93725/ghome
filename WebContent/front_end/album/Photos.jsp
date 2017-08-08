<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-ch-en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta content="Expires" content="-1">
<meta content="Catch-Control" content="no-cache">
<meta content="Pragma" content="no-cache">
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front_end/album/css/jquery.fancybox.css">
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
div.album img {
	width: 100%;
	
}

div.addAlbum {
	position:relative;
	background-color: gray;
	height: 340px;
	z-index: 0;
	
}

.test {
	height: 200px;
}

.imgDiv .delete {
	position: absolute;
	top: 0px;
	right: 0px;
	width: 50px;
	height: 50px;
	display: none;
	
}
.progressCr{
	position: fixed;
	height: 340px;
	width:91%;
	background-color:gray;
	-webkit-filter:blur(80px);
	opacity :0.8;
	z-index: 1;
	display: none;
}
.progress {
	position: fixed;
	top: 40%;
	width:95%;
	z-index: 2;
	display: none;
	
}
.pht_cmt{
	position : fixed;
	z-index: 99999;
}
#pht_cmt{
	position : fixed;
	top:50%;
	width:27%;
	margin-right:30px;
	z-index: 1000000;
	color
}
#hidden-content-b {
  /* Custom styling */
  max-width: 550px;
  border-radius: 4px;

  /* Custom transition - slide from top*/
  transform: translateY(-50px);
  transition: all .33s;
}

.fancybox-slide--current #hidden-content-b {
  transform: translateY(0);
}
#cmt-container {
  position: fixed;
  top: 0;
  right: 0;
  width: 30%;
  height: 100%;
  z-index: 99991;
  background-color:blue;
  -webkit-tap-highlight-color: transparent;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  display:none;
  -webkit-transform: translateZ(0);
  transform: translateZ(0); 
 }
#cmt-container .list-group-item{
	width:100%;
	
}
</style>

</head>

<body>
	<div class="container">
			<div class="row">
			<div class="panel panel-default">
				  <div class="panel-heading">
				 	<div class="row">
					<div class="col-xs-12 col-sm-8">
					<input type="button" class="btn btn-default btn-lg" id='allCheck' value="全選">
					<input type="button" class="btn btn-default btn-lg" id='choosePic' value="選取">
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
					  新增照片
					</button>
					<input type="button" id='editPic' style="display: none;" class="btn btn-primary btn-lg" onclick="editPic()" value="編輯相簿" >
					<input type="button" id='deletePic' style="display: none;" class="btn btn-danger btn-lg" onclick="return deletePic('${pageContext.request.contextPath}','${param.mem_no }','${param.al_no }','${thisPage }');" value="刪除照片" >
					</div>
					<div class="col-xs-12 col-sm-4 text-right" style="vertical-align: middle;">
				<button type="button" class="btn btn-default btn-lg" aria-label="Left Align" onclick="four();">
				<span class="glyphicon glyphicon-th-large"></span></button>
				<button type="button" class="btn btn-default btn-lg" aria-label="Left Align" onclick="six();">
				<span class="glyphicon glyphicon-th"></span>
				</div>
				</div>
				  </div>
				  	<div class="panel-body">				    
				 
				 
				<c:forEach var="photo" items="${photos }" varStatus="loop"> 
				<div class="col-xs-12 col-sm-2 album" style='padding: 2px;'>
				<div class="list-group">				
				<figure>
					<a href="${pageContext.request.contextPath}/util/OutputPic?photo_no=${photo.photo_no }&type=big" class='try' data-fancybox="group" >
					
					<div class="list-group-item">			
						<div class="row">						 						
				
							
							<img style="height:200px; width:100%" src="${pageContext.request.contextPath}/util/OutputPic?photo_no=${photo.photo_no }">									
						</div>						
					</div>
					
					</a>	
					</figure>							
					<div class="list-group-item text-center" style="padding-left: 0px ;height: 50px; ">								
						<div><input type="checkbox" name="photo_no" value='${photo.photo_no }' hidden><span><c:out value="${photo.photo_desc}" /></span></div>						
						<div style='display:none;'>
							<div class='col-lg-8' style='padding-right: 0px;' >			
								<input type='text' class='form-control' name='photo_desc' >
							</div >
							<span class='input-group-btn' style='margin-left: 0px;' >
								<input type='button' class='btn btn-group-btn' onclick='update_photo_desc.call(this,"${pageContext.request.contextPath}","${param.mem_no }","${photo.al_no }","${photo.photo_no }","${thisPage }");' value='確認'>
							</span>
						</div>						
					</div>		
								

				</div>	
			</div>			
			<div id='picCmt${photo.photo_no}' style='display:none;'>
						<div class="panel panel-default" style='font-size: 20px;max-height:103%; height:103%;'>
							  <div class="panel-heading" >留言</div>
							     <ul class="list-group pre-scrollable" style=' vertical-align:middle;max-height:88%; height:88%;'>
								    <c:if test="${empty photo.comments }">
								    	<li class="list-group-item text-center" style='height: 100%; font-size: 20px;'>							    		
								    	<div>目前尚無留言</div>
								    	</li>
								    	</c:if>
								    <c:forEach var="comment" items="${photo.comments }" varStatus="cmt">
								    
								    	
										<li class="list-group-item comments photo_key_${photo.photo_no}_<fmt:formatNumber type="number" value="${(cmt.index-cmt.index%8)/8 }" />" ${(cmt.count>8)? 'style="display:none"':'' }>
										<div class="row">
												
												<div class="col-xs-12 col-sm-2">
													<a href="${pageContext.request.contextPath}/PersonalPageCtrl?mem_no=${comment.mem_no.mem_no}&mem_rank=${comment.mem_no.mem_rank}">
													<img
														src="${pageContext.request.contextPath}/util/OutputPic?mem_no=${comment.mem_no.mem_no}&mem_rank=${comment.mem_no.mem_rank}"
														class="img-circle cmt_mem_pic" title="${comment.mem_no.mem_nickname }" style='z-index: 10;'>
													</a>
												</div>
												
												<div class="col-xs-12 col-sm-8 cmt" >
													<span class='a' style='padding:50px; margin-top:50px; padding-right: 0px;'>${comment.bd_cmt_ctx }</span>
													<input type='text' class='b' value='${comment.bd_cmt_ctx }' style='display:none;' onfocus='this.value = this.value;'/>
													<span class='c' ><a href="#" style='margin-left: 3px' onclick='addPhotoCmtLikes.call(this,event,"${pageContext.request.contextPath}","${comment.bd_cmt_no }");'><span class='cmtLikes'>${(comment.ifClick)?'收回讚':'讚'}</span><span style='margin-left: 5px;'>${(comment.cmt_likes>0)? comment.cmt_likes:''  }</span></a></span>
										
												</div>
												<div class="col-xs-12 col-sm-2 cmt">
												<c:if test="${user.mem_no==comment.mem_no.mem_no }">
												<a href='#' onclick='editPhotoCmmt.call(this,event,"${pageContext.request.contextPath}","${comment.bd_cmt_no }");' style='color:black'>
													<span class='glyphicon glyphicon-pencil'></span></a>
													&nbsp&nbsp&nbsp&nbsp&nbsp
												<a href='#' onclick='delPhotoCmmt.call(this,event,"${pageContext.request.contextPath}","${comment.bd_cmt_no }","${comment.mem_no.mem_no}");' style='color:black'>
													<span class='glyphicon glyphicon-remove'></span></a>
												</c:if>
												
											</div>
										</div>	
										</li>
										</c:forEach>
										<c:if test="${not empty photo.comments&& fn:length(photo.comments)>7}">			
										<li class="list-group-item text-center" style='height: 60px;'><a href="#"
											onclick="showMore.call(this,event,'${photo.photo_no}','${fn:length(photo.comments)}');">顯示更多</a>
											<input type='hidden' id='count${photo.photo_no}' value=1>
											</li>
										</c:if>
																	    
								  </ul>
								  <div>
								 		 <li class="list-group-item">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="${(not empty user)? "留些什麼吧":"請先登入會員" }" ${(not empty user)?"":"disabled"}>
												<span class="input-group-btn">
													<button class="btn btn-default ${(not empty user)?"":"disabled"}" ${(not empty user)?"":"disabled"} type="button" onclick='sendPhotoComments.call(this,"${pageContext.request.contextPath}","${user.mem_no }","${photo.photo_no}");'>送出</button>
												</span>
											</div>
										</li>
								  </div>
							</div>
							</div>
				</c:forEach>		
		

				<!-- Button trigger modal -->											
				<div class="col-xs-12 col-sm-12 text-center">
				
	<jsp:include page="/front_end/comm/ChangePage.jsp"></jsp:include>
				 
  				</div>
					</div>

				</div>
				


<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        
		<h4 class="modal-title" id="myModalLabel">新增照片</h4>
        <div class="col-xs-12 col-sm-2 col-sm-push-10">
        
         
        </div>
      </div>
      <div class="modal-body">
 		<div class='progressCr' >

</div>  
<div class="progress text-center">
<div id="upload_progress" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100">
</div>
</div>   	
        	<div class="inline">
					<div class="inline_content " >
						
						<form action="" method="get" class="album_form" >
						<input type="file" class="photo" id='photo' accept='image/*' style="display: none;" name="photo" multiple>
						<div class="col-xs-12 col-sm-12 pre-scrollable addAlbum" ondragover="javascript: dragHandler(event);" ondrop="javascript: drop_image(event);" id="drop_image" >

						</div>
			
						
						

						<div class="text-center">
						<input type='button' class="btn btn-primary btn-lg" id='upload' value="上傳照片">
							<button type="reset" class="btn btn-default btn-lg" id='picReset'>清除所有</button>
						</div>
					</form>
					</div>
				</div>
      </div>
      <div class="modal-footer">

      	<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
        <button type="button" onclick="uploadPhotos('${pageContext.request.contextPath}','${param.mem_no }','${param.al_no }','${thisPage }');" class="btn btn-primary">送出</button>
        </div>
        
      </div>
    </div>
  </div>
</div>

			
			
			
				
		</div>
		</div>


   <a data-fancybox data-src="#hidden-content-b" href="javascript:;" id='rptBtn' class="btn">Open demo</a>
  <div style="display: none;" id="hidden-content-b">
    <h2>Hello!</h2>
    <p>rpt</p>
  </div>
     <a data-fancybox data-src="#hidden-content-b" href="javascript:;" id='shareBtn' class="btn">Open demo</a>
  <div style="display: none;" id="hidden-content-b">
    <h2>Hello!</h2>
    <p>previeShare</p>
  </div>




<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/album/css/colorbox.css" />

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src='${pageContext.request.contextPath}/front_end/album/js/jquery.ajax-progress.js'></script>	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/front_end/album/js/jquery.fancybox.js"></script>
	<script type="text/javascript">
	function addPhotoCmtLikes(event,path,bd_cmt_no,mem_no){
		event.preventDefault();
		var span = $(this).find('.cmtLikes');
		var action ;
		if(span.text()=='讚'){
			action = 'addCmtLikes';
		}else{
			action = 'negativeCmtLikes';
			
		}
		$.ajax({
			type : "POST",
			url : path + "/all/CommentsCtrl?action="+action+"&mem_no="+mem_no,
			dataType : 'text',
			data: "cmt_type=1&bd_cmt_no="+bd_cmt_no,
			success : function(msg) {
				if (msg.length != 0) {
					var num = parseInt(span.next().text(),10);
					if(num==undefined||num==null||span.next().text().length==0){
						num=0;
					}
					
					if(span.text()=='讚'){
						span.text('收回讚');
						span.next().text(num+1);
					}else{
						span.text('讚');	
						if(num-1>0){
							span.next().text(num-1);
							
						}else{
							span.next().text('');
						}
					}
					
				} else {						
					
					
					
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
			}

		});
		
	}
	function delPhotoCmmt(event,path,bd_cmt_no,mem_no){
		event.preventDefault();
		var _self = $(this).parents('.comments');
		var _CommtNum = $(this).parents('.list-group').prev().find('.badage');
		if(confirm('你確定要很獨裁的刪除此筆留言嗎？')){
			$.ajax({
				type : "POST",
				url : path + "/all/CommentsCtrl?action=delete&mem_no="+mem_no,
				dataType : 'text',
				data: "cmt_type=1&bd_cmt_no="+bd_cmt_no,
				success : function(msg) {
					if (msg.length != 0) {
						_self.remove();
						var num = parseInt(_CommtNum.text(),10);
						if(num-1!=0){
							_CommtNum.text(num-1);							
						}else{
							_CommtNum.text('');
						}
					} else {						
						
						
						
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status);
					alert(thrownError);
				}

			});
		}
	}
	function editPhotoCmmt(event,path,bd_cmt_no,mem_no){
		event.preventDefault();
		var val = $(this).parent().prev().children().text();
		var clazz = $(this).children().attr('class');
		var content = $(this).parent().prev();
		if(clazz=='glyphicon glyphicon-pencil'){
			$(this).children().removeClass();
			$(this).children().addClass('glyphicon glyphicon-ok');
			$(this).children().css("color","green");
			content.find('.a').css("display", "none");
			content.find('.b').css("display", "");
			content.find('.b').focus();
			
		}else{
			submitEditCmt(path,mem_no,bd_cmt_no,content.find('.b').val(),$(this).children(),content);
			
		}
	}
	function submitEditCmt(path,mem_no,bd_cmt_no,val,ch,content){
		var result;
		$.ajax({
			type : "POST",
			url : path + "/all/CommentsCtrl?action=update&mem_no="+mem_no,
			dataType : 'text',
			data: "bd_cmt_no="+bd_cmt_no+"&bd_cmt_ctx="+val,
			success : function(msg) {
				if (msg.length != 0) {
					ch.removeClass();
					ch.addClass('glyphicon glyphicon-pencil');
					ch.css("color","black");
					content.find('.a').css("display", "");
					content.find('.b').css("display","none");
					content.find('.a').text(content.find('.b').val());
				} else {						
					
					result = false;
					
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
				result = false;
			}

		});
		return result;
	}
	function showMore(event,bd_msg_no,size){
		event.preventDefault();
		var cmt = $(this).parent().parent().children(".comments");
		var count = parseInt( $(this).next().val(),10);
		if(count+1>(size-size%5)/5){
			$(this).hide();
		}
			$(".photo_key_"+bd_msg_no+"_"+count).css('display','block');
			
			$(this).next().val(count+1);
		
	}
	function sendPhotoComments(path, mem_no, photo_no){
		var val = $(this).parent().prev().val();	
		$.ajax({
			type : "POST",
			url : path + "/all/CommentsCtrl?action=insert&mem_no="+mem_no,
			dataType : 'text',
			data: "cmt_type=1&org_no="+photo_no+"&bd_cmt_ctx="+val,
			success : function(msg) {
				if (msg.length != 0) {
					location.reload();
				} else {						
					
					
					
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
			}

		});
	}
	function report(){
		$('#rptBtn').trigger('click');
	}
	function makePhotoCmmt(){
		$(this).prev().val();
	}
	function sharePhoto(){
		
	}
	function four(){
		$('.album').removeClass('col-sm-1');
		$('.album').addClass('col-sm-2');	
		$('.album img').css("height","200px");

	}
	function six(){
		$('.album').removeClass('col-sm-2');
		$('.album').addClass('col-sm-1');
		$('.album img').css("height","120px");
	}
	function uploadPhotos(path,mem_no,al_no,thisPage){
		var num=0;
		var data = new FormData();
		var upload_progress = $('#upload_progress');
		$('.progress').css('display','block');
		$('.progressCr').css('display','block');
		upload_progress.html('') ; 
    	upload_progress.css("width",'') ;                 
    	upload_progress.attr('aria-valuenow', '') ;
		$.each(fileList,function(){
	
			data.append("image",$(this)[0]);
			data.append("photo_desc",$("input[name=photo_desc][id="+$(this)[1]+"]").val());

		});
		$.ajax({
            type: "POST",
            url: path+"/album/PhotosActionCtrl?action=insert&mem_no="+mem_no+"&al_no="+al_no,
            dataType:'text',
            contentType: false,
            processData: false, //不做任何處理，只上傳原始資料
            data: data,
            progress: function(e) {
                //make sure we can compute the length
                if(e.lengthComputable) {
                	var intComplete = (e.loaded / e.total) * 100 | 0 ;                    
                	upload_progress.html(intComplete + '%') ; // 控制進度條的顯示數字，例如65%
                	upload_progress.css("width",intComplete + '%') ; // 控制進度條的長度                        
                	upload_progress.attr('aria-valuenow', intComplete) ;
                }
                //this usually happens when Content-Length isn't set
                else {
                    console.warn('Content Length not reported!');
                }
            },
            success: function(msg){
            	
				if(msg.length!=0){	
					upload_progress.html(100 + '%') ; // 控制進度條的顯示數字，例如65%
                	upload_progress.css("width",100 + '%') ; // 控制進度條的長度                        
                	upload_progress.attr('aria-valuenow', 100) ;
	        		
	        		$('#picReset').trigger('click');
	        		alert('上傳完成');		
	        		$('.progress').css('display','none');
	        		$('.progressCr').css('display','none');
                	location.href ="PhotosShowCtrl?mem_no="+mem_no+"&al_no="+al_no+"&thisPage=1";
             	}else{
                	//報錯啊
                	alert('上傳失敗');
             	}
            },

             error:function(xhr, ajaxOptions, thrownError){ 
                alert(xhr.status); 
                alert(thrownError); 
            }
           
        });
// 		xhr = new XMLHttpRequest();
//         xhr.upload.onprogress = function(e) {
//            // it will never come inside here
//            alert('ha');
//            if(e.lengthComputable) {
//                //calculate the percentage loaded
//                var pct = (e.loaded / e.total) * 100;

//                //log percentage loaded
//                console.log(pct);
//            }
//            //this usually happens when Content-Length isn't set
//            else {
//                console.warn('Content Length not reported!');
//            }
//         }
//         xhr.open("POST", path+"/album/PhotosActionCtrl?al_no="+al_no , true);
//         xhr.send(data);

//         xhr.onreadystatechange = function(){
//             if(xhr.readyState === 4 && xhr.status === 200){
//                 console.log(xhr.responseText);              
//             }
//         }		
		
		


		
	}
	function dragHandler(e){
	    e.preventDefault() ; //防止瀏覽器執行預設動作

	}
	function drop_image(e){
	    e.preventDefault() ; //防止瀏覽器執行預設動作

	    var files  = e.dataTransfer.files ; //擷取拖曳的檔案
	    for(var i =0 ; i < files.length ; i++){
	    	$.each(files, function(index,file){
	    		if (!file.type.match('image')){
	    			alert('這又不是圖片..');
	    			return;
	    		}
	    		
				var reader  = new FileReader();
				
				//var src = URL.createObjectURL(file);
				var ph = new Image();
				var rate ;
				var width =0; 
				reader.onload = function(){
					ph.src = reader.result;
					fileList[count] = [file,count];
					ph.onload = function(){
					var pic="<div class='col-xs-12 col-sm-3 pic'>"+
					"<div class='list-group'><div class='list-group-item imgDiv'>"+
					"		<img src='"+webCtx+"/front_end/album/images/cross1.png' id='"+count+"' class='delete' onclick='Preview.removePic.call(this);'/>"+
					"<div align='center'><img alumb='true' class='pics' style='width:100%;' height=100  src='"+ph.src+"'>"+"</div></div><div class='list-group-item'><div class='input-group col-lg-20' style='padding-right: 0px;' >"+	
					"<span class='input-group-addon' style='paddin:0px;margin-left: 0px;' >描述"+
					"</span><input type='text' class='form-control' id='"+(count-1)+"' name='photo_desc' >"+
					"</div ></div></div>";


					root.find(".addAlbum").append(pic);
					$(".imgDiv").mouseenter(function () {
    			 	$(this).find(".delete").show();

        				});   
            
    				$(".imgDiv").mouseleave(function () {
        				$(this).find(".delete").hide();	            				
    				});		

					}
					
				}
				if(file){
					reader.readAsDataURL(file);
				}
					

					});
				}
	    }		
	$(function (){	
										
			
					var flag = 1;
					$('#choosePic').click(function(){
						
							$('input[name=photo_no]').toggle();
							$('#editPic').toggle();
							$('#deletePic').toggle();																		
					})
					$('#allCheck').click(function(){						
						if(flag==1){
							$('input[name=photo_no]').prop('checked',true);
							flag=0;
						}else{
							$('input[name=photo_no]').prop('checked',false);	
							flag=1;	
						}
					
					})
						

				})

				function editPic(){

					if($('input[name=album_no]:checked').length>1){
						alert('請不要選擇多個');
						return false;
					}else if($('input[name=photo_no]:checked').length==0){
						alert('請至少選擇一個');
						return false;
					}else{
						
						$.each($('input[name=photo_no]:checked'),function(){
							var val= $(this).next('span').text();
							$(this).parent().hide();
	 						$(this).parent().next('div').show();
	 						$(this).parent().next('div').find('input[type=text]').val(val);
	 						
						});
// 						$('input[name=photo_no]:checked').parent().hide();
// 						$('input[name=photo_no]:checked').parent().next('div').show();
// 						$('input[name=photo_no]:checked').parent().next('div').find('input[type=text]').val(val);
					}
				}
				function update_photo_desc(path,mem_no,al_no,photo_no,thisPage){
					var val = $(this).parent().prev().find('input[type=text]').val();
					var self = $(this);
					 $.ajax({
			                url: path+"/album/PhotosActionCtrl?mem_no="+mem_no+"&al_no="+al_no+"&photo_no="+photo_no+"&thisPage="+thisPage,
			                data: {	
			                	action:"update",			             
			                	photo_desc:val
			                },
			                
			                type:"POST",
			                dataType:'text',
			                success: function(msg){
			                    if(msg.length!=0){
			                    	self.parent().parent().prev().children('span').text(val);	
			                    	
			                    }else{
			                    	//報錯啊
			                    	alert('更新失敗');
			                    }
			                },

			                 error:function(xhr, ajaxOptions, thrownError){ 
			                    alert('更新失敗');
			                 }
			            });
					
					$(this).parent().parent().prev().show();
					$(this).parent().parent().hide();                    			                    		
                    	

				}
				function deletePic(path,mem_no,al_no,thisPage){
					if($('input[name=photo_no]:checked').length==0){
						alert('請至少選擇一個');
						return false;
					}else{
						if(confirm('確認要刪除照片?')){
							var photo_no = "";
							$.each($('input[name=photo_no]:checked') ,function(){
								photo_no = photo_no + "photo_no=" + $(this).val() +"&";
							});
							photo_no = photo_no.substring(0,photo_no.length-1);
							console.log("action=delete&"+photo_no);
							$.ajax({
				                url: path+"/album/PhotosActionCtrl?mem_no="+mem_no+"&al_no="+al_no+"&thisPage="+thisPage,
				                data:   "action=delete&"+photo_no,				                
				                type:"POST",
				                dataType:'text',
				                success: function(msg){
				                    if(msg.length!=0){	
				                    	alert('刪除成功')
				                    	location.href =path + "/album/PhotosShowCtrl?mem_no="+mem_no+"&al_no="+al_no+"&thisPage="+thisPage;
				                    }else{
				                    	//報錯啊
				                    	alert('刪除失敗');
				                    }
				                },

				                 error:function(xhr, ajaxOptions, thrownError){ 
				                    alert('刪除失敗');
				                 }
				            });
						}else{
							
						}
					}
				}


			var Preview = new function(){
				root = $('.album_form');
				count = 0;
				var picReset = $('#picReset');
				this.change_file = function(){

					root.on('change',".photo", function(){
						show(this);
						count = 0;
					});
				}
				var show = function(input){
					if(input.files && input.files[0]){
						each_img(input.files);
					}
				}
				this.removePic = function (){
					var id = $(this).attr('id');
					$(this).parent().parent().parent().remove();
					delete fileList[id];
				}

				var each_img = function(files){
					$.each(files, function(index,file){
						if (!file.type.match('image')){
			    			alert('這又不是圖片..');
			    			return;
			    		}
						var reader  = new FileReader();
						
						//var src = URL.createObjectURL(file);
						var ph = new Image();
						var rate ;
						var width =0; 
						reader.onload = function(){
							ph.src = reader.result;
							ph.onload = function(){
							fileList[count] = [file,count];
							var pic="<div class='col-xs-12 col-sm-3 pic'>"+
							"<div class='list-group'><div class='list-group-item imgDiv'>"+
							"		<img src='"+webCtx+"/front_end/album/images/cross1.png' id='"+(count++)+"' class='delete' onclick='Preview.removePic.call(this);'/>"+
							"<div align='center'><img alumb='true' class='pics' style='width:100%;' height=100  src='"+ph.src+"'>"+"</div></div><div class='list-group-item'><div class='input-group col-lg-20' style='padding-right: 0px;' >"+	
							"<span class='input-group-addon' style='paddin:0px;margin-left: 0px;' >描述"+
							"</span><input type='text' class='form-control' id='"+(count-1)+"' name='photo_desc' >"+
							"</div ></div></div>";
   							
							root.find(".addAlbum").append(pic);
							$(".imgDiv").mouseenter(function () {
            			 	$(this).find(".delete").show();

		        				});   
		            
	        				$(".imgDiv").mouseleave(function () {
	            				$(this).find(".delete").hide();	            				
	        				});		

						}
							
							}
							if(file){
								reader.readAsDataURL(file);
							}
							

							});
				}

				var clean = function(){
					root.find(".addAlbum").empty();
					fileList=[];
				}
				picReset.click(function(){
					clean();
				});
				var reset = function(){

					root.find('.addAlbum').val(null);
				}
			}
			

			$(function(){
				
// 				$( '[data-fancybox=group]' ).fancybox({
					 
// 					clickSlide : false,				    
// 						caption : function( instance, item ) {
// 						  return $(this).find('figcaption').html();
// 				 }
// 				});
				$('#upload').click(function(){
					$('#photo').trigger('click');
				});
				Preview.change_file();
				var path = window.location.pathname;
			    webCtx = path.substring(0, path.indexOf('/', 1));
			})
			var root,count,webCtx;
			var fileList = [];
			
			
		</script>
</body>
</html>