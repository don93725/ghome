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
			.msgPanel{
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
						  	</ul>
						  
					  <!-- List group -->
					   <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active pre-scrollable msgPanel" id="message">
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
									    		<div class='row'>
									    		<div class="col-xs-12 col-sm-9">${newMsg.msg_ctx }</div>
									    		<div class="col-xs-12 col-sm-2">
									    		<span class="badge">${newMsg.nr }</span></div>
									    		</div>
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
					    <div role="tabpanel" class="tab-pane pre-scrollable msgPanel" id="firendList">
					    	<ul class="list-group">
					    		<c:forEach var='friend' items='${friendList }'>
							    <li class="list-group-item text-center fdList" onclick='show("${pageContext.request.contextPath }","${(user_no!=friend.mem_no)? friend.fd_no:friend.mem_no }","${(user_no!=friend.mem_no)? friend.fd_nickname:friend.mem_nickname }");'>${(user_no!=friend.mem_no)? friend.fd_nickname:friend.mem_nickname }</li>
							    </c:forEach>
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
							  			<button class="btn btn-default btn-xs" id='moreMsg' onclick='showMore("${pageContext.request.contextPath }");'>載入更多</button>
							  			<input type='hidden' id='thisPage'>
							  		</div>
					  			</div>	
					  		</div>
					  <!-- List group -->
							  <div class="panel-body msgContent pre-scrollable msgPanel" id='msgContent'>
							    <div class="col-xs-12 col-sm-12">
								    <div class="row" id='msgContent'>
								    	
								    </div>
							    </div>
							  </div>
							  <div class="panel-footer msgInput" style='display:none;background-color: transparent;'>
							    <div class="row">
							    	<div class="col-lg-12">
							    	<div class="col-xs-12 col-sm-10">
										<div class='row'>
											<div id='sendInput' class='form-group pre-scrollable' contenteditable='true' style='margin-bottom:0px;padding:5px;background-color: white;height:80px; width:100%;' ></div>
										</div>
							    	</div>
							    	<div class="col-xs-12 col-sm-1" style='margin-top:45px;'>
								      <div class='row'>
								      	<div class="input-group-btn">
								        <button type="button" class="btn btn-default dropdown-toggle" style='height:37px;width: 50px;' data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="caret"></span></button>
								        <ul class="dropdown-menu">
								          <li><a href="#" id='uplBtn'><span class="glyphicon glyphicon-folder-open"></span>&nbsp傳檔</a></li>
								          <li><a href="#"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp視訊</a></li>
								        </ul>
								      </div><!-- /btn-group -->
								      <div class="input-group-btn">
								        <button type="button" class="btn btn-primary" onclick="send(${user.mem_no});"><span class="glyphicon glyphicon-share-alt"></span>&nbspSend</button>
								        <input type='hidden' id='sendWho'>
								        <input type='file' id='uplInput' style='display:none;' mutiple>
								      </div>
								      </div>
							    	</div>
								  </div><!-- /.col-lg-6 -->
							    </div>
							  </div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		<input type='hidden' id='pastUser_no' value='${user.mem_no }'>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function show(path,post_no,mem_nickname){
			$('.msgInput').show();
			$('#msgContent').empty();
			$('#sendWho').val(post_no);
			$('#thisPage').val(1);
			$('#msgName').text(mem_nickname);
			$('#moreMsg').removeClass('disabled').removeAttr('disabled');
			$('#sendInput').empty();
			refresh();
			load(path,post_no);
		}
		function refresh(){
			$.ajax({
				type : "POST",
				url : webCtx + "/message/MessageCtrl",
				dataType : 'text',
				data: {
					"action" : "refresh"
				},
				success : function(msg) {					
					if (msg.length != 0) {
						$('#message').empty();
						$('#message').append(msg);
						
						
						
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
		function showMore(path){
			var num = parseInt($('#thisPage').val(),10);
			if(num+1<=$('#oneNum').val()){
				$('#thisPage').val(num+1);
				load(path,$('#sendWho').val());
			}
			
		}
		function send(user_no){
			var rcv_no = $('#sendWho').val();
			var msg_ctx = $('#sendInput').html();
			$('#sendInput').empty();
			
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
					
					if (msg.length != 0) {
						$('#msgContent').prepend(msg);
						if($('#thisPage').val()==1){
							var $div = $('#msgContent');  
							$div.scrollTop($div[0].scrollHeight); 
						}
						if($('#oneNum').val()==$('#thisPage').val()){
							$('#moreMsg').addClass('disabled').attr('disabled',"");
						}
						
						
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
	    var webCtx ;
		$(function(){
			connect($('#pastUser_no').val());
			Preview.file_change();
			$("#sendInput").keypress(function(e){
				  code = (e.keyCode ? e.keyCode : e.which);
				  if (code == 13)
				  {
				      send();
				  }
			});
			var path = window.location.pathname;
		    webCtx = path.substring(0, path.indexOf('/', 1));
			$('#uplBtn').click(function(){
				$('#uplInput').trigger('click');
			});
			$.each($('.fdList'),function(){
				$(this).hover(function(){
					$(this).addClass('active');
				},function(){
					$(this).removeClass('active');
				})
			});
			$.each($('.hover'),function(){
				$(this).hover(function(){
					$(this).addClass('active');
				},function(){
					$(this).removeClass('active');
				})
			});
		})
		Preview = new function() {
			var fileInput = $('#uplInput');
			this.file_change = function() {
				$('#uplInput').on('change', function() {
					show(this);
				});
			}
			var show = function(input) {
				if (input.files && input.files[0]) {
					each_img(input.files);
				}
			}			
			var each_img = function(files) {
				$.each(files,function(index, file) {
						if (file.type.match('image')) {
							var reader = new FileReader();
							var img = new Image();
							img.onload = function() {
								
								var pic ="<img style='width:200px;' height=100  src='"
										+ img.src
										+ "'>";
								$("#sendInput").append(pic);								

							};
							reader.onload = function() {
								img.src = reader.result;
							}
							if (file) {
								reader.readAsDataURL(file);
							}
						}
						if (file.type.match('video')) {
							film = null;
							var reader = new FileReader();
							reader.onload = function() {
								var video = "<video style='height:50px; width:20%;' controls='conrtols'><source src="+
										reader.result+" type='video/mp4'></video>";
								$("#sendInput").append(video);							
								

							}
							if (file) {
								reader.readAsDataURL(file);
							}
							return;
						}
					});
			}

		}
	    var MyPoint = "/MyWebSocketServer/";
	    var host = window.location.host;
	    var path = window.location.pathname;
	    var webCtx = path.substring(0, path.indexOf('/', 1));
	    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
		var statusOutput = document.getElementById("statusOutput");
		var webSocket;
		
		function connect(user_no) {
			// 建立 websocket 物件
			webSocket = new WebSocket(endPointURL+user_no);			
			webSocket.onopen = function(event){
				
			};

			webSocket.onmessage = function(event) {
		        var obj = JSON.parse(event.data);
		        var user_no = $('#pastUser_no').val();
		        var text = '<div class="col-xs-12 col-sm-12">';
		        if(obj.post_no.mem_no!=user_no ){
		        	text += '<div class="col-xs-12 col-sm-2"><div class="row"><img class="img-circle msgPic" title="'+obj.post_no.mem_nickname+
		        	'" src="'+webCtx+'/util/OutputPic?mem_no='+obj.post_no.mem_no+'&mem_rank='+obj.post_no.mem_rank+'"></div><div class="col-xs-12 col-sm-8">'+
			        '<div class="row well"></div>'+obj.msg_ctx +'</div></div><div class="col-xs-12 col-sm-2">'+obj.date+
			        ' </div>';
		        }
		        if(obj.post_no.mem_no==user_no ){
		        	text += '<div class="col-xs-12 col-sm-2">'+obj.date+
		        	'</div><div class="col-xs-12 col-sm-8 "><div class="row well">'+obj.msg_ctx+
		         	'</div></div><div class="col-xs-12 col-sm-2"><div class="row"><img class="img-circle msgPic" '+
		         	' title="'+obj.post_no.mem_nickname+'" src="'+webCtx+'/util/OutputPic?mem_no='+obj.post_no.mem_no+
		         	'&mem_rank='+obj.post_no.mem_rank+'"></div></div></div>';

		        
				}		
		        $('#msgContent').append(text);
		        refresh();
		         
		        
		        	
			};

			webSocket.onclose = function(event) {
			};
		}		
		
		var inputUserName = $('#sendInput');
		inputUserName.focus();
		
		function send() {
		    var inputMessage = $('#sendInput');
		    var message = inputMessage.html();
		    
		    if (message === ""){
		        alert ("訊息請勿空白!");
		        inputMessage.focus();	
		    }else{
		    	var user_no =$('#pastUser_no').val();
		    	var rcv_no = $('#sendWho').val();
				var msg_ctx = $('#sendInput').html();
		        var jsonObj = {"post_no" : user_no,"rcv_no": rcv_no, "msg_ctx" : msg_ctx};
		        webSocket.send(JSON.stringify(jsonObj));
		        $('#sendInput').empty();
		        inputMessage.focus();
		    }
		}

		
		function disconnect () {
			webSocket.close();			
		}

		

		</script>
	</body>
</html>