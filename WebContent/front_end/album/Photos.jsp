<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="">
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
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
div.album img {
	width: 100%;
}

div.addAlbum {
	background-color: gray;
	height: 340px;
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


</style>

</head>

<body>
	<div class="container">
			<div class="row">
			<div class="panel panel-default">
				  <div class="panel-heading">
				  <span class="text-left" align='left' style="margin-left: 30px;">
					<input type="button" class="btn btn-default btn-lg" id='allCheck' value="全選">
					<input type="button" class="btn btn-default btn-lg" id='choosePic' value="選取">
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
					  新增照片
					</button>
					<input type="button" id='editPic' style="display: none;" class="btn btn-primary btn-lg" onclick="editPic()" value="編輯相簿" >
					<input type="button" id='deletePic' style="display: none;" class="btn btn-primary btn-lg" onclick="return deletePic();" value="刪除照片" >
				</span>
				  </div>
				  	<div class="panel-body">				    
				  
				<div class="col-xs-12 col-sm-2 album">
				<div class="row">

				
				<div class="list-group">
					<a href="#"  onclick="showPic.call(this);">
					<div class="list-group-item">

						
						<div class="row">
						
							<img src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder">	
								
						</div>
						
					</div>
					</a>
					
					
					<div class="list-group-item text-center" style="padding-left: 0px;">						
						
						
						<div><input type="checkbox" name="photo_no" value='*' hidden><span>照片描述</span></div>						
						<div style='display:none;'>
							<div class='col-lg-8' style='padding-right: 0px;' >			
								<input type='text' class='form-control' name='photo_desc' >
							</div >
								<span class='input-group-btn' style='margin-left: 0px;' >
									<input type='button' class='btn btn-group-btn' onclick='update_photo_desc()' value='確認'>
									</span>
						</div>
						
					</div>
					
				</div>
				
				</div>
			</div>
							
		

				<!-- Button trigger modal -->
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
        <button type="button" onclick="uploadPhotos('${pageContext.request.contextPath}','${param.al_no }');" class="btn btn-primary">送出</button>
        </div>
        
      </div>
    </div>
  </div>
</div>


			
			
			
				
		</div>
		</div>
		<p><a class="group3" href="http://user-image.logdown.io/user/6631/blog/6602/post/313821/s4ZHc7RSX6DajfTQS8nA_%E6%8B%96%E6%9B%B3%E5%9C%96%E6%AA%94.png" title="Me and my grandfather on the Ohoopee.">Grouped Photo 1</a></p>
		<p><a class="group3" href="http://user-image.logdown.io/user/6631/blog/6602/post/313821/s4ZHc7RSX6DajfTQS8nA_%E6%8B%96%E6%9B%B3%E5%9C%96%E6%AA%94.png" title="On the Ohoopee as a child">Grouped Photo 2</a></p>
		<p><a class="group3" href="http://user-image.logdown.io/user/6631/blog/6602/post/313821/s4ZHc7RSX6DajfTQS8nA_%E6%8B%96%E6%9B%B3%E5%9C%96%E6%AA%94.png" title="On the Ohoopee as an adult">Grouped Photo 3</a></p>





<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/album/css/colorbox.css" />

	<script src="https://code.jquery.com/jquery.js"></script>
<script src="${pageContext.request.contextPath}/front_end/album/js/jquery.colorbox-min.js"></script>
	<script type="text/javascript">
				
		</script>
	<script src='${pageContext.request.contextPath}/front_end/album/js/jquery.ajax-progress.js'></script>	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function uploadPhotos(path,al_no){
		
		var num=0;
		var picList=[];
		var data = new FormData();
		$.each($('.pics'),function(){
			picList[num++] = {"src":$(this).attr('src'),"photo_desc":$(this).parent().parent().next().find('input').val()};
			data.append("image_data", $(this).attr('src'),"photo_desc".split(",")[1]);
			data.append("photo_desc",$(this).parent().parent().next().find('input').val())
			alert($(this).attr('src'),"photo_desc".split(",")[1]);
		
		});
		var jStr = JSON.stringify(picList);
		
		xhr = new XMLHttpRequest();
        xhr.upload.onprogress = function(e) {
           // it will never come inside here
           alert('ha');
           if(e.lengthComputable) {
               //calculate the percentage loaded
               var pct = (e.loaded / e.total) * 100;

               //log percentage loaded
               console.log(pct);
           }
           //this usually happens when Content-Length isn't set
           else {
               console.warn('Content Length not reported!');
           }
        }
        xhr.open("POST", path+"/album/PhotosActionCtrl?al_no="+al_no , true);
        xhr.send(data);

        xhr.onreadystatechange = function(){
            if(xhr.readyState === 4 && xhr.status === 200){
                console.log(xhr.responseText);              
            }
        }		
		
		
// 		$.ajax({
//             type: "POST",
//             url: path+"/album/PhotosActionCtrl?al_no="+al_no,
//             dataType:'text',
//             contentType:'application/json',
//             processData: false, //不做任何處理，只上傳原始資料
//             data: jStr,
//             success: function(msg){
//             	alert('success')
// //                 if(msg.length!=0){
// //                 	location.href =path + "/album/AlbumsShowCtrl?mem_no="+mem_no+"&thisPage="+thisPage;
// //                 }else{
// //                 	//報錯啊
// //                 }
//             },

//              error:function(xhr, ajaxOptions, thrownError){ 
//                 alert(xhr.status); 
//                 alert(thrownError); 
//             },
//             progress: function(e) {
//                 //make sure we can compute the length
//                 alert('ha');
//                 if(e.lengthComputable) {
//                     //calculate the percentage loaded
//                     var pct = (e.loaded / e.total) * 100;

//                     //log percentage loaded
//                     console.log(pct);
//                 }
//                 //this usually happens when Content-Length isn't set
//                 else {
//                     console.warn('Content Length not reported!');
//                 }
//             }
//         });

		
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
					
					ph.onload = function(){
					var pic="<div class='col-xs-12 col-sm-3 pic'>"+
					"<div class='list-group'><div class='list-group-item imgDiv'>"+
					"		<img src='/BA102G4/front_end/album/images/cross1.png' id='"+count+"' class='delete' onclick='Preview.removePic.call(this);'/>"+
					"<div align='center'><img alumb='true' class='pics' id='"+count+"' style='width:100%;' height=100  src='"+ph.src+"'>"+"</div></div><div class='list-group-item'><div class='input-group col-lg-20' style='padding-right: 0px;' >"+	
					"<span class='input-group-addon' style='paddin:0px;margin-left: 0px;' >描述"+
					"</span><input type='text' class='form-control' name='photo_desc' >"+
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
										
				//Examples of how to assign the Colorbox event to elements
						$(".group3").colorbox({rel:'group3', transition:"none", width:"75%", height:"75%"});

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
				function showPic(){
					event.preventDefault();
					var src = $(this).find('div div img').attr('src');
					$(this).html('123');
					$('.group3:eq('+src.replace('a','')+')').attr('src',)
							alert($(this).attr('id'));
						return false;
				}
				function editPic(){

					if($('input[name=album_no]:checked').length>1){
						alert('請不要選擇多個');
						return false;
					}else if($('input[name=photo_no]:checked').length==0){
						alert('請至少選擇一個');
						return false;
					}else{
						var val= $('input[name=photo_no]:checked').next('span').text();
						alert(val);
						$('input[name=photo_no]:checked').parent().hide();
						$('input[name=photo_no]:checked').parent().next('div').show();
						$('input[name=photo_no]:checked').parent().next('div').find('input[type=text]').val(val);
					}
				}
				function update_photo_desc(){
					var val = $('input[name=photo_no]:checked').parent().next('div').find('input[type=text]').val();

					if(true){
						$('input[name=photo_no]:checked').next('span').text(val);						
					}else{

					}
					$('input[name=photo_no]:checked').parent().show();
					$('input[name=photo_no]:checked').parent().next('div').hide();
					$('#choosePic').trigger('click');

				}
				function deletePic(){
					if($('input[name=photo_no]:checked').length==0){
						alert('請至少選擇一個');
						return false;
					}else{
						return confirm('確認要刪除照片?');
					}
				}


			var Preview = new function(){
				root = $('.album_form');
				count = 0;
				var picReset = $('#picReset');
				picList = [];
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
							var pic="<div class='col-xs-12 col-sm-3 pic'>"+
							"<div class='list-group'><div class='list-group-item imgDiv'>"+
							"		<img src='/BA102G4/front_end/album/images/cross1.png' id='"+(count++)+"' class='delete' onclick='Preview.removePic.call(this);'/>"+
							"<div align='center'><img alumb='true' class='pics' id='"+count+"' style='width:100%;' height=100  src='"+ph.src+"'>"+"</div></div><div class='list-group-item'><div class='input-group col-lg-20' style='padding-right: 0px;' >"+	
							"<span class='input-group-addon' style='paddin:0px;margin-left: 0px;' >描述"+
							"</span><input type='text' class='form-control' name='photo_desc' >"+
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
					picList=[];
				}
				picReset.click(function(){
					clean();
				});
				var reset = function(){

					root.find('.addAlbum').val(null);
				}
			}
			

			$(function(){
				$('#upload').click(function(){
					$('#photo').trigger('click');
				})
				Preview.change_file();
			})
			var root;
			var count;

			
		</script>
</body>
</html>