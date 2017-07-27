<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			div.album img{
				width: 100%;
			}
			div.addAlbum{
				background-color: gray;
			}
			.test{
				height: 200px;
			}
		</style>
	</head>

	<body>		
		<div class="container">
			<div class="row">
			<div class="panel panel-default">
				<div class ="panel-heading">
				<span class="text-left" align='left' style="margin-left: 30px;">
					<input type="button" class="btn btn-default btn-lg" id='allCheck' value="全選">
					<input type="button" class="btn btn-default btn-lg" id='chooseAlbum' value="選取">
					<input type="button" class="btn btn-primary btn-lg" id='createAlbum'  data-toggle="modal" data-target="#myModal"  value="新增相簿">
					<input type="button" id='editAlbum' style="display: none;" class="btn btn-primary btn-lg" onclick="editAlbum()" value="編輯相簿" >
					<input type="button" id='deleteAlbum' style="display: none;" class="btn btn-primary btn-lg" onclick="return deleteAlbum()" value="刪除相簿" >
				</span>

					
		
				
				
				</div>
				
				
				<div class ="panel-body">
				<c:forEach var="album" items="${albums }"> 
						<div class="col-xs-12 col-sm-3 album">						
						<a href="${pageContext.request.contextPath}/album/PhotosActionCtrl?al_no=${album.al_no }" class="thumbnail">
						<div class="list-group">
						<div class="list-group-item">
						<img src="${pageContext.request.contextPath}/util/OutputPic?al_no=${album.al_no }">
						</div>
						<div class="list-group-item list-group-item-danger text-center">
						<input type="checkbox" name="al_no" value='${album.al_no }' hidden><span>${album.al_name }</span>
						<input type="checkbox" name="al_private" value='${album.al_prvt }' hidden>
						</div>
						</div>
						</a>						
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
				</div>
						<input type='text' id='action' value='insert' style='display:none;'>
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
        <button type="button" class="btn btn-primary" onclick='updateData()'>建立相簿</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- Modal -->


		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script type="text/javascript">
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
							}
							});

					

				})
				
							
						
				
				function editAlbum(){
					if($('input[name=al_no]:checked').length>1){
						alert('請不要選擇多個');
						return false;
					}else if($('input[name=al_no]:checked').length==0){
						alert('請至少選擇一個');
						return false;
					}else{
						
						var txt =$('input[name=al_no]:checked').parent().text().trim();
						$('#al_name').val(txt);	
						var eq =$('input[name=al_no]:checked').next('input[name=al_private]').val();
						$('input[name=al_prvt]:eq('+eq+')').attr('checked','');
						$('#createAlbum').trigger('click',['stop']);	
						$('#action').val("update");
						
					}
				}
				function updateData(path){
					  $.ajax({
			                url: path+"/album/AlbumsActionCtrl" ,
			                data: {
			                	al_name : $('#al_name').val(),
			                	al_prvt : $('input[name=al_prvt]:checked').val(),
			                	action : $('#action').val() },
			                type:"POST",
			                dataType:'text',

			                success: function(msg){
			                    if(msg.length!=0){
			                    	location.href =path + "/album/AlbumsActionCtrl";
			                    }else{
			                    	//報錯啊
			                    }
			                },

			                 error:function(xhr, ajaxOptions, thrownError){ 
			                    alert(xhr.status); 
			                    alert(thrownError); 
			                 }
			            });
				}
				function deleteAlbum(path){
					var queryStr = "" ;
				  	
				  	var al = $('input[name=al_no]:checked');
				  	for(count in al ){
				  		queryStr = queryStr +"al_no="+ al[count] +",";
				  	}
					  $.ajax({		              						  	
						  	
						  	url: path+"/album/AlbumsActionCtrl",
			                data: "action=delete&"+queryStr.substring(0,queryStr.length-1) ,
			                type:"POST",
			                dataType:'text',

			                success: function(msg){
			                    if(msg.length!=0){
			                    	location.href =path + "/album/AlbumsActionCtrl";
			                    }else{
			                    	//報錯啊
			                    }
			                },

			                 error:function(xhr, ajaxOptions, thrownError){ 
			                    alert(xhr.status); 
			                    alert(thrownError); 
			                 }
			            });
				}

		</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	</body>
</html>