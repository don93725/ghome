<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-ch-en">
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
			.profilePic{
				width: 80%;
				height: auto;
				margin: 10px;
			}
			.msgPic{
				width: 80%;
				height: auto;
				margin: 10px;
				margin-top: 0px; 
			}
			.msgTime{
				color: lightgray;
			}
			.msgInput{
				padding: 0px;
			}
			.pre-scrollable{
				height: 30000px;
			}
		</style>
	</head>
	<body>
		
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="row">
						<div class="panel panel-default">
					  <!-- Default panel contents -->					  		 
					  		<ul class="nav nav-tabs" role="tablist">
							    <li role="presentation" class="active"><a href="#message" aria-controls="message" role="tab" data-toggle="tab">最新訊息</a></li>
							    <li role="presentation"><a href="#firendList" aria-controls="firendList" role="tab" data-toggle="tab">朋友列表</a></li>
							    <li role="presentation"><a href="#stranger" aria-controls="stranger" role="tab" data-toggle="tab">陌生人</a></li>
						  	</ul>
						  
					  <!-- List group -->
					   <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active pre-scrollable" id="message">
					    	<ul class="list-group">
					    		<c:forEach var="newMsg" items="${lastestMsg }">
							    <li class="list-group-item hover" onclick='show("${pageContext.request.contextPath }","${(newMsg.post_no.mem_no==user.mem_no)? newMsg.rcv_no.mem_no :newMsg.post_no.mem_no}","${(newMsg.post_no.mem_no==user.mem_no)? newMsg.rcv_no.mem_nickname :newMsg.post_no.mem_nickname}");'>
								    <div class="row">								    	
								    	<div class="col-xs-12 col-sm-12">
								    		<div class="row">								    			
								    		<div class="col-xs-12 col-sm-12">
								    			${(newMsg.post_no.mem_no==user.mem_no)? newMsg.rcv_no.mem_nickname :newMsg.post_no.mem_nickname }
								    		</div>
								    		
								    	
									    <div class="col-xs-12 col-sm-10 col-sm-offset-2">
									    		${newMsg.msg_ctx }
									    </div>
									    <div class="col-xs-12 col-sm-8 col-sm-offset-4 msgTime">
									    	<fmt:setLocale value="en_US" />
											<fmt:formatDate value="${newMsg.send_time}"
												pattern="yyyy-MM-dd HH:mm" />
									    </div>
									    </div>
								    </div>
							    </li>
							    </c:forEach>							    
							  </ul>
					    </div>
					    <div role="tabpanel" class="tab-pane pre-scrollable" id="firendList">
					    	<ul class="list-group">
							    <li class="list-group-item">XXX</li>
							    <li class="list-group-item">XXX</li>
							    <li class="list-group-item">XXX</li>
							    <li class="list-group-item">XXX</li>
							  </ul>
					    </div>
					    <div role="tabpanel" class="tab-pane pre-scrollable" id="stranger">
					    	<ul class="list-group">
								<li class="list-group-item">
								    <div class="row">
								    	
								    	<div class="col-xs-12 col-sm-12">
								    		<div class="row">
								    			
								    		<div class="col-xs-12 col-sm-12">
								    			王小名
								    		</div>
								    		
								    	
									    <div class="col-xs-12 col-sm-10 col-sm-offset-2">
									    	你在幹嘛?
									    </div>
									    <div class="col-xs-12 col-sm-8 col-sm-offset-4 msgTime">
									    	yyyy-MM-dd HH:mm
									    </div>
									    </div>
								    </div>
							    </li>
							    <li class="list-group-item">Dapibus ac facilisis in</li>
							    <li class="list-group-item">Morbi leo risus</li>
							    <li class="list-group-item">Porta ac consectetur ac</li>
							    <li class="list-group-item">Vestibulum at eros</li>
							  </ul>
					    </div>
					   
					  </div>
							  


							</div>
						</div>
					</div>
				<div class="col-xs-12 col-sm-9">
					<div class="row">
						<div class="panel panel-default">
					  <!-- Default panel contents -->
					  		<div class="panel-heading">
					  			<div class="row">
					  				<div class="col-xs-12 col-sm-10" id='msgName'>
							  			
							  		</div>
							  		<div class="col-xs-12 col-sm-2">
							  			<button class="btn btn-default"><span class="glyphicon glyphicon-triangle-left"></span></button>
							  			<span id='thisPage'></span>/<span id='allPage'></span>
							  			<button class="btn btn-default"><span class="glyphicon glyphicon-triangle-right"></span></button>
							  		</div>
					  			</div>	
					  		</div>
					  <!-- List group -->
							  <div class="panel-body msgContent pre-scrollable">
							    <div class="col-xs-12 col-sm-12">
								    <div class="row" id='msgContent'>
								    	
								    </div>
							    </div>
							  </div>
							  <div class="panel-footer msgInput">
							    <div class="row">
							    	<div class="col-lg-12">
								    <div class="input-group">								      
								      <input type="text" id='sendInput' class="form-control" aria-label="...">
								      <div class="input-group-btn">
								        <button type="button" class="btn btn-default dropdown-toggle" style='height:37px;' data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="caret"></span></button>
								        <ul class="dropdown-menu">
								          <li><a href="#" id='uplBtn'><span class="glyphicon glyphicon-folder-open"></span>&nbsp傳檔</a></li>
								          <li><a href="#"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp視訊</a></li>
								        </ul>
								      </div><!-- /btn-group -->
								      <div class="input-group-btn">
								        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-share-alt"></span>&nbspSend</button>
								        <input type='hidden' id='sendWho'>
								        <input type='file' id='uplInput' style='display:none;'>
								      </div>
								    </div><!-- /input-group -->
								  </div><!-- /.col-lg-6 -->
							    </div>
							  </div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function show(path,post_no,mem_nickname){
			$('#msgContent').empty();
			$('#sendWho').val(post_no);
			$('#thisPage').text(1);
			$('#msgName').text(mem_nickname);
			load(path,post_no);
		}
		function send(){
			
		}
		function load(path,post_no){
			$.ajax({
				type : "POST",
				url : path + "/message/MessageCtrl",
				dataType : 'text',
				data: {
					"action" : "getOne",					
					"post_no":post_no
				},
				success : function(msg) {
					
					$('#msgContent').append(msg);
					$('#allPage').text($('#oneNum').val());
					if (msg.length == 0) {
						swal({
							  title: "成功",
							  text: "已成功發布動態",
							  timer: 1000,
							  type: "success",
							  showConfirmButton: false
							},function(){
								$('.fancybox-close-small').click();
								location.reload();
							});
						
						
					} else {						
						
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
				error : function(xhr, ajaxOptions, thrownError) {
					swal({
						  title: "發生錯誤",
						  text: "請再嘗試看看",
						  timer: 1000,
						  type: "error",
						  showConfirmButton: false
					});
				}

			});
		}
		$(function(){
			$("#sendInput").keypress(function(e){
				  code = (e.keyCode ? e.keyCode : e.which);
				  if (code == 13)
				  {
				      alert($(this).val());
				  }
			});
			$('#uplBtn').click(function(){
				$('#uplInput').trigger('click');
			});
			$.each($('.hover'),function(){
				$(this).hover(function(){
					$(this).addClass('active');
				},function(){
					$(this).removeClass('active');
				})
			});
		})
		</script>
	</body>
</html>