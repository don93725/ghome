<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn-en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<meta content="Expires" content="-1">
		<meta content="Catch-Control" content="no-cache">
		<meta content="Pragma" content="no-cache">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front_end/comm/css/sweetalert.css">

		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			div.album img{
				height: 150px;
				width: 100%;
			}
			div.addAlbum{
				background-color: gray;
			}

		</style>
	</head>

	<body>		
		<div class="container">
			<div class="row">
			<div class="panel panel-default">

				<div class ="panel-heading">
				<div class="row">
				<div class="col-xs-12 col-sm-8">
					<input type="button" class="btn btn-inverse btn-lg" id='allCheck' value="全選">
					<input type="button" class="btn btn-inverse btn-lg" id='chooseAlbum' value="選取">
					<input type="button" class="btn btn-primary btn-lg" id='createAlbum'  data-toggle="modal" data-target="#myModal"  value="新增相簿">
					<input type="button" id='editAlbum' style="display: none;" class="btn btn-primary btn-lg" onclick="editAlbum()" value="編輯相簿" >

					<input type="button" id='deleteAlbum' style="display: none;" class="btn btn-danger btn-lg " onclick="return deleteAlbum('${pageContext.request.contextPath}','${param.mem_no }','${thisPage }')" value="刪除相簿" >
				</div>
				<div class="col-xs-12 col-sm-4 text-right" style="vertical-align: middle;">
				<button type="button" class="btn btn-default btn-lg" aria-label="Left Align" onclick="four();">
				<span class="glyphicon glyphicon-th-large"></span></button>
				<button type="button" class="btn btn-default btn-lg" aria-label="Left Align" onclick="six();">
				<span class="glyphicon glyphicon-th"></span>
				</div>
				</div>

					
		
				
				
				</div>
				
				
				<div class ="panel-body">
				<c:forEach var="album" items="${albums }"> 
						<div class="col-xs-12 col-sm-3 album">						
						<div class="list-group">
						<a href="${pageContext.request.contextPath}/album/PhotosShowCtrl?mem_no=${param.mem_no }&al_no=${album.al_no }" class="thumbnail">
						<div class="list-group-item">
						<img style='height:250px ; width:100%' src="${pageContext.request.contextPath}/util/OutputPic?al_no=${album.al_no }&num=<c:out value="${photosNum[album.al_no] }" default="0"/>">
						</div>
						<div class="list-group-item list-group-item-danger text-center">
						<input type="checkbox" name="al_no" value='${album.al_no }' hidden><span>${album.al_name }</span>
						<input type="checkbox" name="al_private" value='${album.al_prvt }' hidden>
						</div>
						<div class="list-group-item list-group-item-warning text-center">
						<c:out value="${photosNum[album.al_no] }" default="0"/> 張相片
						</div>
						</a>						
						</div>
						</div>
						</c:forEach>

				
						<div class="col-xs-12 col-sm-12 text-center">
				
	<jsp:include page="/front_end/comm/ChangePage.jsp"></jsp:include>
				 
  				</div>
					</div>


				
			
			
			
				
			</div>
		</div>
		




		<!-- Button trigger modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">建立相簿</h4>
      </div>
      <form role='form'>
      <div class="modal-body">
				
					<div class="form-group">
					<label for="al_name">相簿名稱：</label>
					<input type="text" id='al_name' name="al_name">
					<div class="alert alert-dnager" style="display: none; color:red;"  role='alert'  id='alert_al_name'></div>
				</div>
						<input type='text' id='action' value='insert' style="display:none;">
				<label for="inlineRadioOptions">開放狀態：
				
					<label class="radio-inline">
						<input type="radio" id='inlineRadioOptions' name="al_prvt" value="0"> 開放
					</label>
					<label class="radio-inline">
						<input type="radio" id='inlineRadioOptions' name="al_prvt" value="1"> 不開放
					</label>
					</label>

				

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">離開</button>
        <button type="button" id='updateBtn' class="btn btn-primary" onclick="updateData('${pageContext.request.contextPath}','${param.mem_no  }','${thisPage }');">完成建立</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- Modal -->


		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src='${pageContext.request.contextPath}/front_end/comm/js/sweetalert.min.js'></script>	
		<script type="text/javascript">
				function four(){
					$('.album').removeClass('col-sm-2');
					$('.album').addClass('col-sm-3');	
					$('.album img').css("height","250px");
				}
				function six(){
					$('.album').removeClass('col-sm-3');
					$('.album').addClass('col-sm-2');
					$('.album img').css("height","150px");
				}
				$(function (){
						var flag = 1;
						$('#chooseAlbum').click(function(){
							
								$('input[name=al_no]').toggle();
								$('#editAlbum').toggle();
								$('#deleteAlbum').toggle();											
						})
						$('#allCheck').click(function(){						
							if(flag==1){
								$('input[name=al_no]').prop('checked',true);
								flag=0;
							}else{
								$('input[name=al_no]').prop('checked',false);	
								flag=1;	
							}
						
						})
						$('#createAlbum').on('click',function(event,param){
							if(param!='stop'){
								$('#al_name').val('');
								$('input[name=al_prvt]:eq(0)').attr('checked','');
								$('#action').val("insert");
								$('#myModalLabel').text('建立相簿');
								$('#updateBtn').text('完成建立')
							}
							});

					

				})
				
							
						
				
				function editAlbum(){
					if($('input[name=al_no]:checked').length>1){
						swal({
							  title: "請不要選擇多個",
							  text: "一次只能編輯一個相簿",
							  timer: 1000,
							  type: "error",
							  showConfirmButton: false
							});
						return false;
					}else if($('input[name=al_no]:checked').length==0){
						swal({
							  title: "請至少選擇一個",
							  text: "請先選擇相簿再來後續動作。",
							  timer: 1000,
							  type: "error",
							  showConfirmButton: false
							});
						return false;
					}else{
						
						var txt =$('input[name=al_no]:checked').parent().text().trim();
						$('#al_name').val(txt);	
						var eq =$('input[name=al_no]:checked').next().next().val();
						$('input[name=al_prvt]:eq('+eq+')').attr('checked','');
						$('#createAlbum').trigger('click',['stop']);	
						$('#action').val("update");
						$('#myModalLabel').text('編輯相簿');
						$('#updateBtn').text('完成編輯')
						
					}
				}
				function updateData(path,mem_no,thisPage){
					$('#alert_al_name').css('display','none');
					  $.ajax({
			                url: path+"/album/AlbumsActionCtrl",
			                data: "action="+$('#action').val()+"&al_no="+$('input[name=al_no]:checked').val()+"&al_name="+$('#al_name').val()+"&al_prvt="+
									$('input[name=al_prvt]:checked').val()+"&mem_no="+mem_no ,
			                type:"POST",
			                dataType:'text',

			                success: function(msg){
			                    if(msg.length==0){
			                    	if($('#action').val()=='insert'){
			                    		swal({
			  							  title: "成功",
			  							  text: "已成功新增相簿",
			  							  timer: 1000,
			  							  type: "success",
			  							  showConfirmButton: false
			  							},function(){
					                    	location.href =path + "/album/AlbumsShowCtrl?mem_no="+mem_no+"&thisPage=1";
			  							});
			                    	}else{
			                    		swal({
				  							  title: "成功",
				  							  text: "已成功修改相簿",
				  							  timer: 1000,
				  							  type: "success",
				  							  showConfirmButton: false
				  							},function(){
				  								location.href =path + "/album/AlbumsShowCtrl?mem_no="+mem_no+"&thisPage="+thisPage;	
				  						});
			                    			                    		
			                    	}
			                    	
			                    }else{			                    	
			                    	$.each(JSON.parse(msg),function(v,i){
			                    		$('#alert_'+v).css('display',"block");
			                    		$('#alert_'+v).text(i);								
			                    		
			                    	})
			                    }
			                },

			                 error:function(xhr, ajaxOptions, thrownError){ 
			                    alert(xhr.status); 
			                    alert(thrownError); 
			                 }
			            });
				}
				function deleteAlbum(path,mem_no,thisPage){					
					
					var queryStr = "" ;				  	
				  	var al = $('input[name=al_no]:checked');
				  	for(var i =0 ;i<al.length  ;i++ ){
				  		queryStr = queryStr +"al_no="+ al[i].value +"&";

				  	}
				  	queryStr = "?action=delete&mem_no="+mem_no+"&"+queryStr.substring(0,queryStr.length-1);
				  	swal({
						  title: "確定要刪除相簿及相片!?",
					 	  text: "此舉會永久刪除這些檔案，請三思而後行。",
						  type: "warning",
						  showCancelButton: true,
						  confirmButtonColor: "#DD6B55",
						  cancelButtonText: "算了",
						  confirmButtonText: "是的",
						  closeOnConfirm: false
					},function(){
						 $.ajax({		              						  	
							  	
							  	url: path+"/album/AlbumsActionCtrl"+queryStr,			                
				                type:"POST",
				                dataType:'text',

				                success: function(msg){
				                    if(msg.length==0){
				                    	swal({
											  title: "成功",
											  text: "已成功發布動態",
											  timer: 1000,
											  type: "success",
											  showConfirmButton: false
										},function(){
					                    	location.href =path + "/album/AlbumsShowCtrl?mem_no="+mem_no+"&thisPage="+thisPage;
										});
				                    }else{
				                    	//報錯啊
				                    	$.each(JSON.parse(msg),function(v,i){
				        					swal({
				        					  title: "輸入錯誤",
				        					  text: i,
				        					  timer: 1000,
				        					  type: "error",
				        					  showConfirmButton: false
				        					});
				        				});
				                    }
				                },

				                 error:function(xhr, ajaxOptions, thrownError){ 
				                	 swal({
				   					  title: "輸入錯誤",
				   					  text: "請稍後再嘗試。",
				   					  timer: 1000,
				   					  type: "error",
				   					  showConfirmButton: false
				   					});
				                 }
				            }); 
					 });
				}

		</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>