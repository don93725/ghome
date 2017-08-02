<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html lang="zh-ch-en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title >���f - GYMHome</title>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			.shareContent{
				margin-top: 2em;
			}
			.cmt{
				height: 60px;
				padding-top: 20px;
				padding-left: 0px;
			}
			.cmt_mem_pic {
				height: 60px;
				width: 60px;
				margin-top: 2px;
				margin-bottom: 2px;
			}
			.cmtInfo{
				margin-top: 10px;
			}
			.cmtTime{
				color: gray;
				
			}
			.cmtPrvt{
				margin-left: 8px;
			}
			.updatTime {
				color: gray;
			}
			.row-fluid {
				padding-left: 10px;
				padding-right: 30px;
			    overflow: auto;
			    white-space: nowrap;
			}

			.row-fluid .col-sm-2 {
			    display: inline-block;
			    float: none;
			    padding: 5px;
			}
			.row-fluid .col-sm-2 img{
				border: 2px
				height: 150px;
				width: 100%;
			}
			.imgDiv img.delete {
				position: absolute;
				top: 0px;
				right: 0px;
				width: 30px;
				height: 30px;
				display: none;
				
			}
			.showBorder{
				border: 5px dotted yellow;
				background-image:url('http://gb.cri.cn/mmsource/images/2015/05/12/24/6068039622117627944.jpg');
				background-size : cover;
				background-position: 0% 55%;
				background-repeat:no-repeat;
				opacity: 0.5;
			}
		</style>
	</head>
	<body ondragover="javascript: dragHandler(event);"  ondragleave="javascript: leave_image(event);">

		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-2">
					<div class="panel panel-default">
							  <div class="panel-heading">
							    <h3 class="panel-title">Panel title</h3>
							  </div>
							  <div class="panel-body">
							    Panel content
							  </div>
							</div>
				</div>
				<div class="col-xs-12 col-sm-10">
							<div class="panel panel-default opcityDiv" id='showBorder' ondrop="javascript: drop_image(event);" >
							  <div class="panel-heading">
							    <h3 class="panel-title">�s�W�ʺA</h3>
							  </div>
							  <div class="panel-body">
							   <textarea class="form-control scrollable" id='bd_msg_ctx' style="resize: none;background-color:transparent;" rows="8" placeholder="���v�M�A�b�Q�Ǥ���O�H"></textarea>
							  </div>
							  	<div class="row-fluid" id='media'>						  		
							  		
							  	</div>
							  	<div class="row-fluid" id='filmContainer'>
							  								  		
							  		
							  	</div>
							  <div class="panel panel-default" style="margin-bottom: 0px; background-color:transparent;">
							  <div class="row">
							  		<div class="col-xs-12 col-sm-8">
							  			<div class="panel-heading" >
								  <button class="btn btn-default" id='uploadTrigger'><span class="glyphicon glyphicon-picture"> �s�W�Ӥ�</span></button>
								  <input type="file" style="display:none;"  id="uploadPhoto" multiple>
								  <button  class="btn btn-default" id='uploadFilmTrigger'><span class="glyphicon glyphicon-facetime-video"> �s�W�v��</span>
								  </button>
								  <input type="file" style="display:none;"  id="uploadFilm">								  
							  </div>
							  		</div>


								<div class="col-xs-12 col-sm-2" >
									<div class="row" style="padding-left: 100px; ">
										<div class="panel-heading" >
											<div class="dropdown">
												 <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" value="0">
												    ���p�]�w
												    <span class="caret"></span>
												  </button>
												  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
												    <li><a href="#" onclick="chooseCmmtPrvt.call(this,'0');">�B��&nbsp</a></li>
												    <li><a href="#" onclick="chooseCmmtPrvt.call(this,'1');">���}&nbsp</a></li>
												    <li><a href="#" onclick="chooseCmmtPrvt.call(this,'2');">���H&nbsp</a></li>
												  </ul>											
											</div>

										</div>
	
							  		</div>

							  	</div>



							  		<div class="col-xs-12 col-sm-1" style="margin-left: 35px;  ">

							  		<div class="row">
										  			
							  			<div class="panel-heading" style="padding-left: " >
										
							  			<button class="btn btn-primary" onclick="submit.call(this,'${pageContext.request.contextPath}','${param.mem_no }');">
							  			&nbsp&nbsp&nbsp�e�X&nbsp&nbsp&nbsp</button>		

								 	 </div>
							  		</div>
							  		</div>
							  </div>
							</div>
							</div>
							<div class="panel panel-default">
							  <div class="panel-heading">
							    <h3 class="panel-title">
							    	<div class="row">
							    		<div class="col-xs-12 col-sm-1">
								  				 
								  	<img  src="http://www.imageshop.com.tw/pic/shop/home/img1-01.jpg" class="img-circle cmt_mem_pic">
								
								  			</div>
								  			  </a>								  			
								  			<div class="col-xs-12 col-sm-11">
								  			<div class="col-xs-12 col-sm-12 cmtInfo">
								  				<a href="#">���v�M</a>
								  			</div>
								  			<div class="col-xs-12 col-sm- cmtInfo cmtTime">
								  				yyyy/MM/dd HH:mm
								  				<div class="btn-group cmtPrvt">
													<div data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														  <img src="${pageContext.request.contextPath}/front_end/board/images/cmmtPrvt1.png" >
														   <span class="caret"></span>
													</div>
												 	 <ul class="dropdown-menu" id='cmtPrvt'>
												  		<li><a href="#">���p�]�w</a></li>
													  	<li role="separator" class="divider"></li>	
													    <li><a href="#" onclick="setCmmtPrvt.call(this,'0');">�B��</a></li>
													    <li><a href="#" onclick="setCmmtPrvt.call(this,'1');">���}</a></li>
													    <li><a href="#" onclick="setCmmtPrvt.call(this,'2');">���H</a></li>
													 </ul>
												</div>
								  			</div>

								  				
								  			</div>
							    	</div>

							    </h3>
							  </div>
							  <div class="panel-body">
							    �ʺA���e
							    	<div class="panel panel-default shareContent" >
									  <div class="panel-heading">
									    <h3 class="panel-title">Panel title</h3>
									  </div>
									 
									  <div class="panel-body">
									    ���ɤ��e
									  </div>
									</div>
							  </div>
							<div class="panel-body updatTime">
								<div class="col-xs-12 col-sm-4 col-sm-offset-8">
									 �̫��s�� yyyy/MM/dd HH:mm
								</div>								
									   
									  </div>
							  <div class="panel panel-default" style="margin-bottom: 0px;">
							  <div class="panel-heading" >
							    <ul class="nav nav-pills">
								  <li role="presentation"><a href="#" onclick="return false;">
								  	<span class="glyphicon glyphicon-thumbs-up">&nbsp�g</span>
								  </a></li>
								  <li role="presentation"><a href="#" onclick="return showCmmt('1','1');">
								  	<span class="badage">10</span>
								  	<span class="glyphicon glyphicon-comment">&nbsp�d��</span>
								  </a></li>
								  <li role="presentation"><a href="#" onclick="return false;">
								  	<span class="glyphicon glyphicon-share-alt">&nbsp����</span>
								  </a></li>
								</ul>
							  </div>
							</div>
							  							    
							 <ul id='b1_commt1' class="list-group" style="display: none;">
								  <div class="row">
								  	<div class="container">
										<a href="#">
								  			<div class="col-xs-12 col-sm-1">
								  				 
								  	<img  src="http://www.imageshop.com.tw/pic/shop/home/img1-01.jpg" class="img-circle cmt_mem_pic">
								
								  			</div>
								  			  </a>								  			
								  			<div class="col-xs-12 col-sm-11 cmt">
								  			<div  >
								  				hahaha
								  			</div>
								  				
								  			</div>
								  		
								  	</div>
								  </div>		
								  <li class="list-group-item">Dapibus ac facilisis in</li>
								  <li class="list-group-item">Morbi leo risus</li>
								  <li class="list-group-item">Porta ac consectetur ac</li>
								  <li  class="list-group-item" ><a href="#" onclick="return false;">��ܧ�h</a></li>
								  <li  class="list-group-item" >
								  	 <div class="input-group">									      
									      <input type="text" class="form-control" placeholder="�d�Ǥ���a">
									      <span class="input-group-btn">
									        <button class="btn btn-default" type="button">�e�X</button>
									      </span>
									    </div>
								  </li>
							</ul>							    
							</div>

				</div>
			</div>
		</div>	

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">

			function submit(path,mem_no){
				var bd_prvt = $('#dropdownMenu1').val()
				var bd_msg_ctx = $('#bd_msg_ctx').val()
				fileList;
				film;
				var num=0;
				var data = new FormData();
				$.each(fileList,function(){
					
					data.append("image",$(this)[0]);

				});
				data.append("film",film);
				data.append("bd_msg_ctx",bd_msg_ctx);
				data.append("bd_prvt",bd_prvt);
				
				$.ajax({
		            type: "POST",
		            url: path+"/board/BoardActionCtrl?action=insert&bd_type=0&mem_no="+mem_no,
		            dataType:'text',
		            contentType: false,
		            processData: false, //��������B�z�A�u�W�ǭ�l���
		            data: data,
// 		            progress: function(e) {
// 		                //make sure we can compute the length
// 		                if(e.lengthComputable) {
// 		                	var intComplete = (e.loaded / e.total) * 100 | 0 ;                    
// 		                	upload_progress.html(intComplete + '%') ; // ����i�ױ�����ܼƦr�A�Ҧp65%
// 		                	upload_progress.css("width",intComplete + '%') ; // ����i�ױ�������                        
// 		                	upload_progress.attr('aria-valuenow', intComplete) ;
// 		                }
// 		                //this usually happens when Content-Length isn't set
// 		                else {
// 		                    console.warn('Content Length not reported!');
// 		                }
// 		            },
		            success: function(msg){
		            	
						if(msg.length!=0){	
// 							upload_progress.html(100 + '%') ; // ����i�ױ�����ܼƦr�A�Ҧp65%
// 		                	upload_progress.css("width",100 + '%') ; // ����i�ױ�������                        
// 		                	upload_progress.attr('aria-valuenow', 100) ;
			        		
			        		$('#picReset').trigger('click');
			        		alert('�W�ǧ���');		
// 			        		$('.progress').css('display','none');
// 			        		$('.progressCr').css('display','none');
// 		                	location.href ="PhotosShowCtrl?mem_no="+mem_no+"&al_no="+al_no+"&thisPage=1";
		             	}else{
		                	//������
		                	alert('�W�ǥ���');
		             	}
		            },

		             error:function(xhr, ajaxOptions, thrownError){ 
		                alert(xhr.status); 
		                alert(thrownError); 
		            }
		           
		        });
			}
			function setCmmtPrvt(bd_prvt){

				if(confirm("�T�w�n������p�]�w�ܡH")){

					/*$.ajax({
						url: path+"/board/MessageBoardCtrl?bd_msg_no="+bd_msg_no+"&bd_prvt="+bd_prvt;
						type: "POST",
						dataType: "text",
						success: function(msg){

						},
						error: function(xhr, ajaxOptions, thrownError){ 
			                    alert('��s����');
			            }

					});*/
					$(this).parents('ul').prev().find('img').attr('src','/BA102G4/front_end/board/images/cmmtPrvt'+bd_prvt+'.png');
					
				}else{

				}
			}
			function chooseCmmtPrvt(bd_prvt){
					$(this).parents('ul').prev().html($(this).text()+'<span class="caret"></span>');
					$(this).parents('ul').prev().val(bd_prvt);
					/*$.ajax({
						url: path+"/board/MessageBoardCtrl?bd_msg_no="+bd_msg_no+"&bd_prvt="+bd_prvt;
						type: "POST",
						dataType: "text",
						success: function(msg){

						},
						error: function(xhr, ajaxOptions, thrownError){ 
			                    alert('��s����');
			            }

					});*/
					
			}
			function showCmmt(board_msg_no,bd_cmmt_no){
				$('#b'+board_msg_no+'_commt'+bd_cmmt_no).toggle();
			}
			$(function(){
				$('#uploadTrigger').click(function(){
					$('#uploadPhoto').trigger('click');
				})
				$('#uploadFilmTrigger').click(function(){
					$('#uploadFilm').trigger('click');
				})
				
				Preview.file_change();
				ShowFilm.file_change();
			})
			var film;
			var fileList =[];
			var count = 0;
			Preview = new function(){
				var fileInput = $('#uploadPhoto');
				this.file_change = function(){
					$('#uploadPhoto').on('change',function(){
						show(this);
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
					$.each(files,function(index,file){
						if (!file.type.match('image')){
			    			alert('�o�S���O�Ϥ�..');
			    			return;
			    		}
			    		var reader  = new FileReader();			    		
			    		var img = new Image();
			    		img.onload = function(){
			    			fileList[count] = [file,count];		    		
			    			var pic="<div class='col-xs-12 col-sm-2 pic'>"+
							"<div class='list-group'><div class='list-group-item imgDiv'>"+
							"<img src='/BA102G4/front_end/board/images/cross1.png' id='"+(count++)+"' class='delete' onclick='Preview.removePic.call(this);'/>"+
							"<div align='center'><img alumb='true' class='pics' style='width:100%;' height=100  src='"+img.src+"'>"+"</div></div></div></div>";
							$("#media").append(pic);
							$(".imgDiv").mouseenter(function () {
            			 	$(this).find(".delete").show();

		        				});   
		            
	        				$(".imgDiv").mouseleave(function () {
	            				$(this).find(".delete").hide();	            				
	        				});		

			    		};
			    		reader.onload = function(){
			    			img.src = reader.result;
			    		}
			    		if(file){
								reader.readAsDataURL(file);
						}
					});
				}

			}

ShowFilm = new function(){
		var fileInput = $('#uploadFilm');
		this.file_change = function(){

			$('#uploadFilm').on('change',function(){
				show(this);
			});
		}
		var show = function(input){
			if(input.files && input.files[0]){
				each_img(input.files);
			}
		}
		this.removeFilm = function (){
			$(this).parent().parent().parent().remove();
			film = [];
		}
		var each_img = function(files){
			$.each(files,function(index,file){
				if (!file.type.match('video')){
					alert('�o�S���O�v��..');
					return;
				}
				var reader  = new FileReader();	
				if (file.type.match('video')){
					film = [];
	    						
		    		reader.onload = function(){		    			
		    			var video="<div class='col-xs-12 col-sm-12'>"+
						"<div class='list-group text-center'><div class='list-group-item imgDiv'>"+
						"<img class='delete' src='/BA102G4/front_end/board/images/cross1.png' "+
						"onclick='ShowFilm.removeFilm.call(this);'/>"+
						"<video style='height:250px; width:100%;' controls='conrtols'><source src="+
						reader.result+" type='video/mp4'></video></div></div></div>";	
						alert(video);			
		    			$("#filmContainer").append(video);
		    			$(".imgDiv").mouseenter(function () {
					 	$(this).find(".delete").show();

		    				});   
		        
						$(".imgDiv").mouseleave(function () {
		    				$(this).find(".delete").hide();	            				
						});		
		    			film = file;

		    		}
		    		if(file){
							reader.readAsDataURL(file);
					}			
	    			return;
    			}
    		});
    		
		}
		

	}
	function dragHandler(e){
	    e.preventDefault() ; //�����s��������w�]�ʧ@
	    $('#showBorder').addClass('showBorder');
	}
	leave_image
	function leave_image(e){
	    e.preventDefault() ; //�����s��������w�]�ʧ@
	    $('#showBorder').removeClass('showBorder');
	}
	function drop_image(e){
	    e.preventDefault() ; //�����s��������w�]�ʧ@
	    $('#showBorder').removeClass('showBorder');
	    var files  = e.dataTransfer.files ; //�^���즲���ɮ�
	    for(var i =0 ; i < files.length ; i++){

	    	$.each(files, function(index,file){
	    		if (file.type.match('video')){
	    			var reader  = new FileReader();
					film = [];	    						
		    		reader.onload = function(){		    			
		    			var video="<div class='col-xs-12 col-sm-12'>"+
						"<div class='list-group text-center'><div class='list-group-item imgDiv'>"+
						"<img class='delete' src='/BA102G4/front_end/board/images/cross1.png' "+
						"onclick='ShowFilm.removeFilm.call(this);'/>"+
						"<video controls='conrtols'><source src="+
						reader.result+" type='video/mp4'></video></div></div></div>";	
						alert(video);			
		    			$("#filmContainer").append(video);
		    			$(".imgDiv").mouseenter(function () {
					 	$(this).find(".delete").show();

		    				});   
		        
						$(".imgDiv").mouseleave(function () {
		    				$(this).find(".delete").hide();	            				
						});		
		    			film = file;

		    		}
		    		if(file){
							reader.readAsDataURL(file);
					}			
	    			return;
    			}    
    			if (file.type.match('image')){
			    	var reader  = new FileReader();			    		
			    		var img = new Image();
			    		img.onload = function(){
			    			fileList[count] = [file,count];		    		
			    			var pic="<div class='col-xs-12 col-sm-2 pic'>"+
							"<div class='list-group'><div class='list-group-item imgDiv'>"+
							"<img src='/BA102G4/front_end/board/images/cross1.png' id='"+(count++)+"' class='delete' onclick='Preview.removePic.call(this);'/>"+
							"<div align='center'><img alumb='true' class='pics' style='width:100%;' height=100  src='"+img.src+"'>"+"</div></div></div>";
							$("#media").append(pic);
							$(".imgDiv").mouseenter(function () {
            			 	$(this).find(".delete").show();

		        				});   
		            
	        				$(".imgDiv").mouseleave(function () {
	            				$(this).find(".delete").hide();	            				
	        				});		

			    		};
			    		reader.onload = function(){
			    			img.src = reader.result;
			    		}
			    		if(file){
								reader.readAsDataURL(file);
						}
			    			return;
			    		}		
			    alert('�o�O����榡..?');
			    			
				});
	    	}
	    }	
		</script>
	</body>
</html>