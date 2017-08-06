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
<title>健貨 - GYMHome</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/front_end/album/css/jquery.fancybox.css">
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
.shareContent {
	margin-top: 2em;
}

.cmt {
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

.cmtInfo {
	margin-top: 10px;
}

.cmtTime {
	color: gray;
}

.cmtPrvt {
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

.row-fluid .col-sm-2 img {
	border: 2px height: 150px;
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

.showBorder {
	border: 5px dotted yellow;
	background-image:
		url('http://gb.cri.cn/mmsource/images/2015/05/12/24/6068039622117627944.jpg');
	background-size: cover;
	background-position: 0% 55%;
	background-repeat: no-repeat;
	opacity: 0.5;
}

.boardEdit {
	margin-top: 15px;
}

.carousel-inner.onebyone-carosel {
	margin: auto;
	width: 90%;
}

.onebyone-carosel .active.left {
	left: -33.33%;
}

.onebyone-carosel .active.right {
	left: 33.33%;
}

.onebyone-carosel .next {
	left: 33.33%;
}

.onebyone-carosel .prev {
	left: -33.33%;
}

.pht_cmt {
	position: fixed;
	z-index: 99999;
}

#pht_cmt {
	position: fixed;
	top: 50%;
	width: 27%;
	margin-right: 30px;
	background-color: white;
	z-index: 1000000;
	border-top-color: white;
}
.pic img.delete {
	position: absolute;
	top: 0%;
	right: 5%;
	width: 90%;
	height: 90%;
	display:none;
}
.filmDel img.check {
	position: absolute;
	top: 2.5%;
	right: 5%;
	width: 90%;
	height: 95%;
	display:none;
}
.filmDel img.delete {
	position: absolute;
	top: -5%;
	right: 0%;
	width: 100%;
	height: 110%;
	display:none;
}
.pic img.check {
	position: absolute;
	top: 5%;
	right: 10%;
	width: 80%;
	height: 80%;
	display:none;
}
.addPic{
	margin-left:5px;
	width: 50px;
	height: 50px;
}
.picAndFilm{
	display:none;
}
.picAndFilm .showAddFilmCtrl {
	display:none;
}
.picAndFilm .showAddPicCtrl {
	display:none;
}
.progressCr{
	position: absolute;
	height: 235px;
	width:97%;
	background-color:gray;
	-webkit-filter:blur(80px);
	opacity :0.8;
	z-index: 1;
	display:none;
}
.progress {
	position: absolute;
	top: 115px;
	width:95%;
	z-index: 2;
	display:none;
}
</style>
</head>
<body ondragover="javascript: dragHandler(event);"
	ondragleave="javascript: leave_image(event);">

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">Panel content</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-10" id="boardContainer">
				<div class="panel panel-default opcityDiv" id='showBorder'
					ondrop="javascript: drop_image(event);">
					<div class="panel-heading">
						<h3 class="panel-title">新增動態</h3>
					</div>
					<div class="panel-body">
					 		<div class='progressCr' >
</div>
<div class="progress text-center">
<div id="upload_progress" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100">
</div>
</div>  
  
						<textarea class="form-control scrollable" id='bd_msg_ctx'
							style="resize: none; background-color: transparent;" rows="8"
							placeholder="${user.mem_nickname }，在想些什麼呢？"></textarea>
					</div>
					<div class="row-fluid" id='media'></div>
					<div class="row-fluid" id='filmContainer'></div>
					<div class="panel panel-default"
						style="margin-bottom: 0px; background-color: transparent;">
						<div class="row">
							<div class="col-xs-12 col-sm-8">
								<div class="panel-heading">
									<button class="btn btn-default" id='uploadTrigger'>
										<span class="glyphicon glyphicon-picture"> 新增照片</span>
									</button>
									<input type="file" style="display: none;" id="uploadPhoto"
										multiple>
									<button class="btn btn-default" id='uploadFilmTrigger'>
										<span class="glyphicon glyphicon-facetime-video"> 新增影片</span>
									</button>
									<input type="file" style="display: none;" id="uploadFilm">
								</div>
							</div>


							<div class="col-xs-12 col-sm-2">
								<div class="row" style="padding-left: 100px;">
									<div class="panel-heading">
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button"
												id="dropdownMenu1" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="true" value="0">
												隱私設定 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
												<li><a href="#"
													onclick="chooseCmmtPrvt.call(this,'0');">朋友&nbsp</a></li>
												<li><a href="#"
													onclick="chooseCmmtPrvt.call(this,'1');">公開&nbsp</a></li>
												<li><a href="#"
													onclick="chooseCmmtPrvt.call(this,'2');">本人&nbsp</a></li>
											</ul>
										</div>

									</div>

								</div>

							</div>



							<div class="col-xs-12 col-sm-1" style="margin-left: 35px;">

								<div class="row">

									<div class="panel-heading" style="padding-left:">

										<button class="btn btn-primary"
											onclick="submit.call(this,'${pageContext.request.contextPath}','${param.mem_no }');">
											&nbsp&nbsp&nbsp送出&nbsp&nbsp&nbsp</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<c:forEach var="message_board" items="${message_board}" varStatus="number">
					<div class="panel panel-default panel<fmt:formatNumber type="number" value="${number.count/8 }" maxFractionDigits="0" var="num" />${num}">
						<div class="panel-heading">
							<h3 class="panel-title">
								<div class="row">
									<div class="col-xs-12 col-sm-1">

										<img
											src="http://www.imageshop.com.tw/pic/shop/home/img1-01.jpg"
											class="img-circle cmt_mem_pic">

									</div>
									</a>
									<div class="col-xs-12 col-sm-9">
										<div class="col-xs-12 col-sm-12 cmtInfo">
											<a href="#">${message_board.mem_no.mem_nickname }${message_board.mem_no.mem_rank }</a>
										</div>
										<div class="col-xs-12 col-sm-12 cmtInfo cmtTime">
											<fmt:setLocale value="en_US" />
											<fmt:formatDate value="${message_board.bd_msg_time}"
												pattern="yyyy-MM-dd HH:mm" />
											<div class="btn-group cmtPrvt">
												<div data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<img
														src="${pageContext.request.contextPath}/front_end/board/images/cmmtPrvt${message_board.bd_prvt }.png">
													<c:if test="${param.mem_no==user.mem_no }">
														<span class="caret"></span>
												</div>

												<ul class="dropdown-menu" id='cmtPrvt'>
													<li><a href="#">隱私設定</a></li>
													<li role="separator" class="divider"></li>
													<li><a href="#" onclick="setCmmtPrvt.call(this,'${pageContext.request.contextPath}','${param.mem_no }','${message_board.bd_msg_no }','0');">朋友</a></li>
													<li><a href="#" onclick="setCmmtPrvt.call(this,'${pageContext.request.contextPath}','${param.mem_no }','${message_board.bd_msg_no }','1');">公開</a></li>
													<li><a href="#" onclick="setCmmtPrvt.call(this,'${pageContext.request.contextPath}','${param.mem_no }','${message_board.bd_msg_no }','2');">本人</a></li>
												</ul>

											</div>

										</div>


									</div>
									<div class="col-xs-12 col-sm-2 boardEdit">
										<button class="btn btn-info" onclick='edit.call(this,"${pageContext.request.contextPath}","${message_board.bd_msg_no }","${param.mem_no }","${message_board.bd_type }");'>
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
										<button class="btn btn-danger"
											onclick="deleteBoard.call(this,'${pageContext.request.contextPath}','${user.mem_no }','${message_board.bd_msg_no }');">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
										</c:if>
									</div>
								</div>

							</h3>
						</div>
						<div class="panel-body">
							<div id='bd_msg_ctx${message_board.bd_msg_no }' class='content'>${message_board.bd_msg_ctx}</div>
						</div>
						<c:if
							test="${message_board.bd_type==1 || message_board.bd_type==3 }">
							<div class="panel-body">
								<!-- 如果有照片  -->
								<div class="well">			
								<div <c:if	test="${list!= null || fn:length(message_board.board_photo) > 3}">id="myCarousel"</c:if> class="carousel fdi-Carousel slide">	
										<!-- Carousel items -->
										<div class="carousel fdi-Carousel slide"
											id="eventCarousel${message_board.bd_msg_no }"											
											data-interval="0">
											<div class="carousel-inner onebyone-carosel">
												<c:forEach var="bd_photo"
													items="${message_board.board_photo }" varStatus="loop">
													
													<div class="item ${(loop.index==0)? 'active':''  }">
														<div class="col-sm-4 pic">
															<figure>
															
																<a id='${bd_photo}'
																	href="${pageContext.request.contextPath}/util/OutputPic?photo_no=${bd_photo}&type=big"
																	data-fancybox="group${message_board.bd_msg_no }" class='aLink'> 
																	<img src='/BA102G4/front_end/board/images/cancel.png' class='check checkGroup${bd_photo}'/>
																	<img src='/BA102G4/front_end/board/images/select.png' class='delete delete${message_board.bd_msg_no } delGroup${message_board.bd_msg_no }' onclick="del('${bd_photo}');"/>
																	
																	<img
																	style='height: 250px; width: 100%;'
																	src="${pageContext.request.contextPath}/util/OutputPic?photo_no=${bd_photo}"
																	class="img-responsive center-block">
																	
																	<div class="text-center">${loop.count }/${fn:length(message_board.board_photo) }</div>
																	<figcaption style='display: none;' class='dialog'>
																		<div class="panel panel-default">
																			<div class="panel-heading">留言${bd_photo}</div>
																			<div class="panel-body">
																				<p>Photo_desc</p>
																			</div>
																			<ul class="list-group">
																				<li class="list-group-item">Cras justo odio</li>
																				<li class="list-group-item">Dapibus ac
																					facilisis in</li>
																				<li class="list-group-item">Morbi leo risus</li>
																				<li class="list-group-item">Porta ac
																					consectetur ac</li>
																				<li class="list-group-item">Vestibulum at eros</li>
																			</ul>
																		</div>
																	</figcaption>
																</a>
															</figure>
															<input type="checkbox" id='del${bd_photo }' name='delPhoto_no${message_board.bd_msg_no }' value='${bd_photo }' hidden/>
														</div>
													</div>
												</c:forEach>

											</div>
											<c:if
												test="${list!= null || fn:length(message_board.board_photo) > 3}">
												<a class="left carousel-control"
													href="#eventCarousel${message_board.bd_msg_no }"
													data-slide="prev"></a>
												<a class="right carousel-control"
													href="#eventCarousel${message_board.bd_msg_no }"
													data-slide="next"></a>
											</c:if>

										</div>
										<!--/carousel-inner-->
									</div>
									<!--/myCarousel-->
								</div>
								<!--/well-->

							</div>
							<!--/panel-body  -->
						</c:if>
						
						<!-- 如果有影片  -->
						<c:if
							test="${message_board.bd_type==2 || message_board.bd_type==3 }">
							<div class="panel-body text-center">
								<div class="well">
									<div class="row">
										<div class="col-xs-12 col-sm-12 filmDel">
										<img src='/BA102G4/front_end/board/images/cancel.png' class='check' id='checkFilm${message_board.bd_msg_no }'/>
										<img src='/BA102G4/front_end/board/images/select.png' class='delete delete${message_board.bd_msg_no }' id='deleteFilm${message_board.bd_msg_no }' onclick="delFilm('${message_board.bd_msg_no }');"/>
											<video controls="controls">
												<source
													src="${pageContext.request.contextPath}/util/OutputPic?bd_msg_no=${message_board.bd_msg_no}">
											</video>
										</div>
									</div>
								</div>
								<!--well -->
								<input type="checkbox" id='delFilm${message_board.bd_msg_no }' name='delFilm' hidden/>
							</div>
							
							<!--panel-body -->
						</c:if>
						<div class='panel panel-default picAndFilm'>
						<div class="panel-heading text-center">
						<h4>新增圖影專區
								<img src='/BA102G4/front_end/board/images/plus.png' class='addPic' onclick="addPic('${message_board.bd_msg_no}','${message_board.bd_type }');"/>
						
									<input style='display:none' type="file" class='addPicInput' id="addPicInput${message_board.bd_msg_no}_${message_board.bd_type }" multiple ></h4></div>
						<div class="panel-body">
								
							
							<div class="panel-body text-center showAddPicCtrl">
							<div class="well">
									<div class="row">
								<div class="col-xs-12 col-sm-12">
									<div class="row row-fluid" id='addBdPic${message_board.bd_msg_no}'>									
								</div>
								<button class="btn btn-danger" onclick='BdPreview.removeAllPic.call(this);'>
								清除所有新增圖片
									</button>
									</div>
									</div>
									</div>
									</div>
							<div class="panel-body text-center showAddFilmCtrl">
								<div class="well">
									<div class="row">
									
									<div class="col-xs-12 col-sm-12 text-center">
									<div class="row" id='addBdFilm${message_board.bd_msg_no}'>
									</div>
									</div>
									</div></div></div>
									
							
								</div>
							</div>
								
						<div class="panel-body updatTime">
						<div class="col-xs-12 col-sm-4">
						<span id='likes${message_board.bd_msg_no}'>${message_board.bd_likes}</span>&nbsp個讚
						</div>
							<div class="col-xs-12 col-sm-4 col-sm-offset-4">
								<fmt:setLocale value="en_US" />
								<fmt:formatDate value="${message_board.bd_upd_time}"
									pattern="最後更新於 yyyy-MM-dd HH:mm" />
									
							</div>
								
						</div>
						<div class="panel panel-default" style="margin-bottom: 0px;">
						
							<div class="panel-heading">
							
								<ul class="nav nav-pills">
									<li role="presentation" ${(message_board.ifClick)? 'class="disabled"':''}>
									<a href="#"
										<c:if test='${!message_board.ifClick }' >onclick="addLikes.call(this,event,'${pageContext.request.contextPath}','${param.mem_no }','${message_board.bd_msg_no}')"</c:if>>
									 
									 <span
											class="glyphicon glyphicon-thumbs-up">&nbsp讚</span>
									</a></li>
									<li role="presentation"><a href="#"
										onclick="return showCmmt('1','1');">
										<c:if test="${not empty message_board.comments }"> <span class="badage">${fn:length(message_board.comments)}</span></c:if>
											<span class="glyphicon glyphicon-comment">&nbsp留言</span>
									</a></li>
									<li role="presentation"><a href="#"
										onclick="share.call(this,event);"> <span
											class="glyphicon glyphicon-share-alt">&nbsp分享</span>
									</a></li>
								</ul>
							</div>
						</div>

						<ul id='b1_commt1' class="list-group" style="display: none;">
						<c:forEach var="comment" items="${message_board.comments }" varStatus="cmt">
						
						<li class="list-group-item comments key_${message_board.bd_msg_no}_<fmt:formatNumber type="number" value="${(cmt.index-cmt.index%5)/5 }" />" ${(cmt.count>5)? 'style="display:none"':'' }>
							<div class="row">
								<div class="container">
									<a href="#">
										<div class="col-xs-12 col-sm-1">

											<img
												src="http://www.imageshop.com.tw/pic/shop/home/img1-01.jpg"
												class="img-circle cmt_mem_pic" alt="你好" style='z-index: 10;'>

										</div>
									</a>
									<div class="col-xs-12 col-sm-8 cmt" >
										<span class='a' style='padding:30px; padding-right: 0px;'>${comment.bd_cmt_ctx }</span>
										<input type='text' class='b' value='${comment.bd_cmt_ctx }' style='display:none;' onfocus='this.value = this.value;'/>
										<span class='c' ><a href="#" style='margin-left: 3px'>讚 &nbsp ${(comment.cmt_likes>0)? comment.cmt_likes:''  }</a></span>

									</div>
									<div class="col-xs-12 col-sm-3 cmt">
									<a href='#' onclick='editCmmt.call(this,event,"${pageContext.request.contextPath}","${comment.bd_cmt_no }");' style='color:black'>
										<span class='glyphicon glyphicon-pencil'></span></a>
										&nbsp&nbsp&nbsp&nbsp&nbsp
									<a href='#' onclick='delCmmt.call(this,event,"${pageContext.request.contextPath}","${comment.bd_cmt_no }");' style='color:black'>
										<span class='glyphicon glyphicon-remove'></span></a>
									</div>
								</div>
							</div>	
							</li>
							</c:forEach>						
							<li class="list-group-item"><a href="#"
								onclick="showMore.call(this,event,'${message_board.bd_msg_no}');">顯示更多</a>
								<input type='hidden' id='count${message_board.bd_msg_no}' value=1>
								</li>
							<li class="list-group-item">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="留些什麼吧">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" onclick='sendComments.call(this,"${pageContext.request.contextPath}","${user.mem_no }","${message_board.bd_msg_no}");'>送出</button>
									</span>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>





				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<div class="row">
								<div class="col-xs-12 col-sm-1">

									<img
										src="http://www.imageshop.com.tw/pic/shop/home/img1-01.jpg"
										class="img-circle cmt_mem_pic">

								</div>
								</a>
								<div class="col-xs-12 col-sm-11">
									<div class="col-xs-12 col-sm-12 cmtInfo">
										<a href="#">李宗霖</a>
									</div>
									<div class="col-xs-12 col-sm- cmtInfo cmtTime">
										yyyy/MM/dd HH:mm
										<div class="btn-group cmtPrvt">
											<div data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<img
													src="${pageContext.request.contextPath}/front_end/board/images/cmmtPrvt1.png">
												<span class="caret"></span>
											</div>
											<ul class="dropdown-menu" id='cmtPrvt'>
												<li><a href="#">隱私設定</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="#" onclick="setCmmtPrvt.call(this,'0');">朋友</a></li>
												<li><a href="#" onclick="setCmmtPrvt.call(this,'1');">公開</a></li>
												<li><a href="#" onclick="setCmmtPrvt.call(this,'2');">本人</a></li>
											</ul>
										</div>
									</div>


								</div>
							</div>

						</h3>
					</div>
					<div class="panel-body">
						動態內容
						<div class="panel panel-default shareContent">
							<div class="panel-heading">
								<h3 class="panel-title">Panel title</h3>
							</div>

							<div class="panel-body">分享內容</div>
						</div>
					</div>
					<div class="panel-body updatTime">
						<div class="col-xs-12 col-sm-4 col-sm-offset-8">最後更新於
							yyyy/MM/dd HH:mm</div>

					</div>
					<div class="panel panel-default" style="margin-bottom: 0px;">
						<div class="panel-heading">
							<ul class="nav nav-pills">
								<li role="presentation"><a href="#" onclick="return false;">
										<span class="glyphicon glyphicon-thumbs-up">&nbsp讚</span>
								</a></li>
								<li role="presentation"><a href="#"
									onclick="return showCmmt('1','1');"> <span class="badage">10</span>
										<span class="glyphicon glyphicon-comment">&nbsp留言</span>
								</a></li>
								<li role="presentation"><a href="#" onclick="return false;">
										<span class="glyphicon glyphicon-share-alt">&nbsp分享</span>
								</a></li>
							</ul>
						</div>
					</div>

					<ul id='b1_commt1' class="list-group" style="display: none;">
						<div class="row">
							<div class="container">
								<a href="#">
									<div class="col-xs-12 col-sm-1">

										<img
											src="http://www.imageshop.com.tw/pic/shop/home/img1-01.jpg"
											class="img-circle cmt_mem_pic">

									</div>
								</a>
								<div class="col-xs-12 col-sm-11 cmt">
									<div>hahaha</div>

								</div>

							</div>
						</div>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item"><a href="#"
							onclick="return false;">顯示更多</a></li>
						<li class="list-group-item">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="留些什麼吧">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">送出</button>
								</span>
							</div>
						</li>
					</ul>
				</div>

			</div>
		</div>
	</div>
	<input type='text' id='thisPage' value='${thisPage }'>
	<input type='text' id='allPageCount' value='${allPageCount }'>
	<button onclick='del();'>123</button>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src='${pageContext.request.contextPath}/front_end/album/js/jquery.ajax-progress.js'></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/front_end/album/js/jquery.fancybox.js"></script>
	<script type="text/javascript">
	function delCmmt(event,path,bd_cmt_no){
		event.preventDefault();
		if(confirm('你確定要很獨裁的刪除此筆留言嗎？')){
			
		}
	}
	function editCmmt(event,path,bd_cmt_no){
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
			$(this).children().removeClass();
			$(this).children().addClass('glyphicon glyphicon-pencil');
			$(this).children().css("color","black");
			content.find('.a').css("display", "");
			content.find('.b').css("display","none");
			content.find('.a').text(content.find('.b').val());
		}
	}
	function cursor2last() { 
		var r = event.srcElement.createTextRange(); 
		r.collapse(false); 
		r.select(); 
	} 
	function showMore(event,bd_msg_no){
		event.preventDefault();
		var cmt = $(this).parent().parent().children(".comments");
		var count = $(this).next();
		$(".key_"+bd_msg_no+"_"+count.val()).css('display','block');
		$(this).next().val(parseInt(count.val(),10)+1);
	}
	function sendComments(path, mem_no, bd_msg_no){
		var val = $(this).parent().prev().val();		 
		$.ajax({
			type : "POST",
			url : path + "/board/CommentsCtrl?action=insert&mem_no="+mem_no,
			dataType : 'text',
			data: "cmt_type=0&org_no="+bd_msg_no+"&bd_cmt_ctx="+val,
			success : function(msg) {

				if (msg.length != 0) {
					alert('去檢查吧');
				} else {						
					
					
					
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
			}

		});
	}
	function share(e){
		e.preventDefault();
		document.location.reload();
	}
	function addLikes(e,path,mem_no,bd_msg_no){
		var likesBtn = $(this);
		e.preventDefault();
		if(likesBtn.parent().attr('disabled')!='disabled'){
			$.ajax({
				type : "POST",
				url : path + "/board/BoardActionCtrl?action=addLikes&mem_no="+mem_no+"&bd_msg_no="+bd_msg_no,
				dataType : 'text',
				contentType : false,
				success : function(msg) {

					if (msg.length != 0) {
						likesBtn.parent().addClass('disabled');
						likesBtn.parent().attr('disabled','');
						var likes = $('#likes'+bd_msg_no).text();
						$('#likes'+bd_msg_no).text(parseInt(likes,10)+1);
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
	function addPic(bd_msg_no,bd_type){
		$('#addPicInput'+bd_msg_no+"_"+bd_type).trigger('click');
	}

	
	
	function del(photo_no){
		if($('.checkGroup'+photo_no).css('display')=='none'){
			$('.checkGroup'+photo_no).css('display',"block");
			$('#del'+photo_no).prop('checked','true');
		}else{
			$('.checkGroup'+photo_no).css('display',"none");
			$('#del'+photo_no).removeAttr('checked');
		}
		
	}
	function delFilm(bd_msg_no){
		if($('#checkFilm'+bd_msg_no).css('display')=='none'){
			$('#checkFilm'+bd_msg_no).css('display',"block");
			$('#delFilm'+bd_msg_no).prop('checked','true');
		}else{
			$('#checkFilm'+bd_msg_no).css('display',"none");
			$('#delFilm'+bd_msg_no).removeAttr('checked');
		}
		
	}
	var countBdPic = 0;
	var bdPicList =[];
	var bdFilm = null;
	var isEditOpen = false;
	BdPreview = new function() {
		var fileInput = $('.addPicInput');
		this.file_change = function() {
			$('.addPicInput').each(function(){
				$(this).on('change', function() {
					var len = $(this).attr('id').length;
					var tempStr = $(this).attr('id').substring(11,len).split("_");
					show(this,tempStr[0],tempStr[1]);					
				});
			});
		}
		var show = function(input,bd_msg_no,bd_type) {
			if (input.files && input.files[0]) {
				each_img(input.files,bd_msg_no,bd_type);
			}
		}
		this.removePic = function(bd_msg_no) {
			var id = $(this).attr('id');
			$(this).parent().parent().parent().remove();
			delete bdPicList[id];
			var res = false;
			for(var count in bdPicList){
				res = true;
				break;	
			}
			if(!res){
				$('#addBdPic'+bd_msg_no).parents('.showAddPicCtrl').css('display','none');					
			}
		}
		this.removeFilm = function(bd_msg_no,bd_type) {
			$(this).parent().parent().parent().remove();
			bdFilm = null;
			$('#addBdFilm'+bd_msg_no).parents('.showAddFilmCtrl').css('display','none');
			if(bd_type==2||bd_type==3){
				if($('#checkFilm'+bd_msg_no).css('display')=='none'){
					
				}else{
					$('#checkFilm'+bd_msg_no).css('display',"none");
					$('#delFilm'+bd_msg_no).removeAttr('checked');
				}
			}
			
		}
		this.removeAllPic = function(){
			$(this).prev().empty();
			bdPicList =[];
			$(this).parents('.showAddPicCtrl').css('display','none');
			
			
		}
		var each_img = function(files,bd_msg_no,bd_type) {
			$.each(
					files,
					function(index, file) {
						if (file.type.match('video')) {
							var reader = new FileReader();
							bdFilm = null;
							reader.onload = function() {
								var video = "<div class='col-xs-12 col-sm-12'>"
										+ "<div class='list-group text-center'><div class='list-group-item imgDiv'>"
										+ "<img class='delete' src='/BA102G4/front_end/board/images/cross1.png' "
										+ "onclick='BdPreview.removeFilm.call(this,"+bd_msg_no+","+bd_type+");'/>"
										+ "<video controls='conrtols'><source src="+
										reader.result+" type='video/mp4'></video></div></div></div>";
								$('#addBdFilm'+bd_msg_no).append(video);
								$(".imgDiv").mouseenter(function() {
									$(this).find(".delete").show();

								});

								$(".imgDiv").mouseleave(function() {
									$(this).find(".delete").hide();
								});
								bdFilm = file;
								if(bdFilm!=null){
									$('#addBdFilm'+bd_msg_no).parents('.showAddFilmCtrl').css('display','block');
									if(bd_type==2||bd_type==3){
										if($('#checkFilm'+bd_msg_no).css('display')=='none'){
											$('#checkFilm'+bd_msg_no).css('display',"block");
											$('#delFilm'+bd_msg_no).prop('checked','true');
										}else{
											
										}
									}
								}
							}
							if (file) {
								reader.readAsDataURL(file);
							}
							return;
						}
						if (file.type.match('image')) {
							var reader = new FileReader();
							var img = new Image();
							img.onload = function() {
								bdPicList[countBdPic] = [file,countBdPic];
								if(bdPicList.length>0){
									$('#addBdPic'+bd_msg_no).parents('.showAddPicCtrl').css('display','block');
								}
								var pic = "<div class='col-xs-12 col-sm-2 pic'>"
										+ "<div class='list-group'><div class='list-group-item imgDiv'>"
										+ "<img src='/BA102G4/front_end/board/images/cross1.png' id='"
										+ (countBdPic++)
										+ "' class='delete' onclick='BdPreview.removePic.call(this,\""+bd_msg_no+"\");'/>"
										+ "<div align='center'><img alumb='true' class='pics' style='width:100%;' height=100  src='"
										+ img.src
										+ "'>"
										+ "</div></div></div>";
								$("#addBdPic"+bd_msg_no).append(pic);
								$(".imgDiv").mouseenter(function() {
									$(this).find(".delete").show();

								});

								$(".imgDiv").mouseleave(function() {
									$(this).find(".delete").hide();
								});

							};
							reader.onload = function() {
								img.src = reader.result;
							}
							if (file) {
								reader.readAsDataURL(file);
							}
							return;
						}
						alert('這是什麼格式..?');
					});
					
					
		}

	}
		$(document)
				.ready(
						
						function() {							
							$('#myCarousel').carousel({
								interval : 5000
							});
							$('.fdi-Carousel .item')
									.each(
											function() {
												var sibNum = $(this).siblings().length;
												var next = $(this).next();
												if (!next.length) {
													next = $(this).siblings(
															':first');
												}
												next.children(':first-child')
														.clone().appendTo(
																$(this));
												var num = $(this).children(':last-child').children().children().attr('id');
												
												$(this)	.children(':last-child')
														.children()
														.children()
														.prop("href", "#")
														.removeAttr("data-fancybox")
														.click(function(event) {
																	event.preventDefault();
																	next.children(':first-child')
																		.children()
																		.children()
																		.trigger('click');
																});

												if (sibNum > 1) {
													if (next.next().length > 0) {
														next.next()
															.children(':first-child')
															.clone()
															.appendTo($(this));
														$(this).children(':last-child')
																.children()
																.children()
																.prop("href","#")
																.removeAttr("data-fancybox")
																.click(function(event) {
																			event.preventDefault();
																			next.next()
																				.children(':first-child')
																				.children()
																				.children()
																				.trigger('click');
																		});
													} else {
														$(this).siblings(':first')
																.children(':first-child')
																.clone()
																.appendTo($(this));
														$(this).children(':last-child')
																.children()
																.children()
																.prop("href","#")
																.removeAttr("data-fancybox")
																.click(function(event) {
																			event.preventDefault();
																			$(this).siblings(':first')
																					.children(':first-child')
																					.children()
																					.children()
																					.trigger('click');
																		});
													}
						 						}

											});

							$('[data-fancybox]').fancybox({

								clickSlide : false,
								caption : function(instance, item) {
									return $(this).find('figcaption').html();
								}
							});
							$('#uploadTrigger').click(function() {
								$('#uploadPhoto').trigger('click');
							})
							$('#uploadFilmTrigger').click(function() {
								$('#uploadFilm').trigger('click');
							})
							thisPage = $('#thisPage').val();
							allPageCount = $('#allPageCount').val();							
							BdPreview.file_change();
							Preview.file_change();
							ShowFilm.file_change();
							$(window).scroll(function(){
								  var window_height = $( window ).height();								  
								  var window_scrollTop = $(window).scrollTop();								 
								  var document_height = $( document ).height();
								  
								  if(!ifLoad&&(parseInt(thisPage,10)+1<allPageCount)){									  
									  if(window_height + window_scrollTop > (document_height-100)){
										  ifLoad=true;
										  loadContent();
										     
										}
									 
								  }
								   

								});
						});
		var thisPage,allPageCount ;		
		var ifLoad = false;;
		function loadContent(){
			var mem_no = QueryString("mem_no");
			ifLoad=true;
			thisPage = parseInt(thisPage,10)+1;	
			$.ajax({
				type : "POST",
				url : "/BA102G4/board/BoardShowCtrl?type=json&mem_no="+mem_no+"&thisPage="+(thisPage+1),
				dataType : 'text',
				contentType : false,
				success : function(msg) {
					alert(msg);
					alert(thisPage);
					if (msg.length != 0) {
						ifLoad=false;
						$('#boardContainer').append(msg);
						reload();
					} else {
						//報錯啊
						alert('刪除失敗');
					}
				},

				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status);
					alert(thrownError);
				}

			});
		}
		function QueryString(name) {
			var AllVars = window.location.search.substring(1);
			var Vars = AllVars.split("&");
			for (i = 0; i < Vars.length; i++)
			{
				var Var = Vars[i].split("=");
				if (Var[0] == name) return Var[1];
			}
			return "";
		}
		function deleteBoard(path ,mem_no, bd_msg_no) {
			alert( path + "/board/BoardActionCtrl?action=delete&mem_no="+mem_no+"&bd_msg_no="+bd_msg_no);
			if (confirm('將會把照片及內文完全刪除，確定不會捨不得，執意還要刪除？')) {
				$.ajax({
					type : "POST",
					url : path + "/board/BoardActionCtrl?action=delete&mem_no="+mem_no+"&bd_msg_no="+bd_msg_no,
					dataType : 'text',
					contentType : false,
					processData : false, //不做任何處理，只上傳原始資料					
					success : function(msg) {
	
						if (msg.length != 0) {
							// 							upload_progress.html(100 + '%') ; // 控制進度條的顯示數字，例如65%
							// 		                	upload_progress.css("width",100 + '%') ; // 控制進度條的長度                        
							// 		                	upload_progress.attr('aria-valuenow', 100) ;

							alert('刪除成功');
							// 			        		$('.progress').css('display','none');
							// 			        		$('.progressCr').css('display','none');
							location.reload();
						} else {
							//報錯啊
							alert('刪除失敗');
						}
					},

					error : function(xhr, ajaxOptions, thrownError) {
						alert(xhr.status);
						alert(thrownError);
					}

				});
			}
		}
		
		function edit(path,bd_msg_no,mem_no,bd_type) {
			var btn = $(this);
			var btnSpan = $(this).children();
			var spanClass = $(this).children().attr('class');
			var createArea = $(this).parents(".panel-default").children('.picAndFilm');
			var content = $(this).parents(".panel-default").find(".content");
			var originText = content.text();
			if (spanClass == "glyphicon glyphicon-pencil") {
				if(!isEditOpen){					
					$('.aLink').each(function() {					
						var a = $(this).attr('href',"#").removeAttr("data-fancybox").unbind('click').click(function(event){
							event.preventDefault();
						});
					});
					$('.delete'+bd_msg_no).each(function(){
						$(this).css('display','block');
					});
					createArea.css('display','block');
					btn.removeClass('btn-info');
					btn.addClass('btn-success');
					btnSpan.removeClass(spanClass);
					btnSpan.addClass('glyphicon glyphicon-ok');
					content.attr("contenteditable", "true");
					content.focus();
					isEditOpen=true;
					setCursorToEnd(content.get(0));
					
				}
			} else {
				if(isEditOpen){	
					if(confirm('此舉將會完成編輯，可能會改動貼問內容，很危險低，確定要繼續？')){						
						if(submitBd(path,bd_msg_no,mem_no,bd_type)){
							$('.fdi-Carousel .item').each(function() {
								var id = $(this).children(':first-child').children().children().attr('id');
								$(this).children(':first-child').children().children().attr('href',"/BA102G4/util/OutputPic?photo_no="+id+"&type=big");
								$(this).children(':first-child').children().children().attr("data-fancybox","group"+id);
								$('[data-fancybox]').fancybox({
			
									clickSlide : false,
									caption : function(instance, item) {
										return $(this).find('figcaption').html();
									}
								});
								var it = $(this).children(':first-child');
								var next  = $(this).next();
								var next2 = $(this).next().next();
								
								if(next2.length==0&&next.length==0){
									next = $(this).siblings(':first').children(':first-child').children().children();
									next2 =  $(this).siblings(':first').next().children(':first-child').children().children();
									it.next().children().children().click(function(){
										next.trigger('click');
									})
									it.next().next().children().children().click(function(){
										next2.trigger('click');
									})
									
								}else if(next2.length==0){
									next = next.children(':first-child').children().children();
									next2 = $(this).siblings(':first').children(':first-child').children().children();
									it.next().children().children().click(function(){
										next.trigger('click');
									})
									it.next().next().children().children().click(function(){
										next2.trigger('click');
									})
									
								}else{
									next = next.children(':first-child').children().children();
									next2 = next2.children(':first-child').children().children();
									it.next().children().children().click(function(){
										next.trigger('click');
									})
									it.next().next().children().children().click(function(){
										next2.trigger('click');
									})
								}
							});
							$('.delete'+bd_msg_no).each(function(){
								$(this).css('display','none');
							});
							createArea.css('display','none');
							btn.removeClass('btn-success');
							btn.addClass('btn-info');
							btnSpan.removeClass(spanClass);
							btnSpan.addClass('glyphicon glyphicon-pencil');
							content.attr("contenteditable", "false");
							isEditOpen=false;
						}
						
					}
				}
			}
			

		}
		function setCursorToEnd(ele) {
			
			var range = document.createRange();
			var sel = window.getSelection();
			range.setStart(ele, 1);
			range.collapse(true);
			sel.removeAllRanges();
			sel.addRange(range);
			ele.focus();
		}
		function submitBd(path,bd_msg_no,mem_no,bd_type){
			
			var data = new FormData();
			var bd_msg_ctx = $('#bd_msg_ctx'+bd_msg_no).text();
			data.append("bd_msg_ctx",bd_msg_ctx);
			$.each($('input[name=delPhoto_no'+bd_msg_no+"]:checked"),function(){
				data.append('delPhoto_no',$(this).val());
			});		
			var ifDelFilm =$('input[name=delFilm]:checked').length;
			
			$.each(bdPicList, function() {
				data.append("image", $(this)[0]);
			});
			var delStat;
			if(bdFilm!=null&&bdFilm.length!=0){
				delStat=1;
				data.append("film", bdFilm);				
			}else if(ifDelFilm==1){
				delStat=4;
			}else if(ifDelFilm==0&&bd_type==2){
				delStat=2;
			}else if(ifDelFilm==0&&bd_type==3){
				delStat=3;
			}else if(ifDelFilm==0&&bd_type==0){
				delStat=0;
			}else if(ifDelFilm==0&&bd_type==1){
				delStat=0;
			}else{
				alert('怎麼可能有意外');
			}
			$.ajax({
				type : "POST",
				url : path+"/board/BoardActionCtrl?action=update&bd_msg_no="+bd_msg_no+"&mem_no="+mem_no+"&delStat="+delStat,
				dataType : 'text',
				contentType : false,
				processData : false, //不做任何處理，只上傳原始資料	
				data : data,
				success : function(msg) {

					if (msg.length != 0) {
						// 							upload_progress.html(100 + '%') ; // 控制進度條的顯示數字，例如65%
						// 		                	upload_progress.css("width",100 + '%') ; // 控制進度條的長度                        
						// 		                	upload_progress.attr('aria-valuenow', 100) ;

						alert('刪除成功');
						// 			        		$('.progress').css('display','none');
						// 			        		$('.progressCr').css('display','none');
// 						location.href =path+"/board/BoardShowCtrl?mem_no="+mem_no+"&thisPage=1";
						location.reload();
					} else {
						//報錯啊
						alert('刪除失敗');
					}
				},

				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status);
					alert(thrownError);
				}

			});
			
		}
		function submit(path, mem_no) {
			var upload_progress = $('#upload_progress');
			$('.progress').css('display','block');
			$('.progressCr').css('display','block');
			upload_progress.html('') ; 
	    	upload_progress.css("width",'') ;                 
	    	upload_progress.attr('aria-valuenow', '') ;
			var bd_prvt = $('#dropdownMenu1').val()
			var bd_msg_ctx = $('#bd_msg_ctx').val()
			var num = 0;
			var data = new FormData();
			var bd_type = 0;
			if (!fileList.length == 0 && film != undefined) {
				bd_type = 3;
			} else if (film != undefined) {
				bd_type = 2;
			} else if (!fileList.length == 0) {
				bd_type = 1;
			}
			$.each(fileList, function() {

				data.append("image", $(this)[0]);

			});
			data.append("film", film);
			data.append("bd_msg_ctx", bd_msg_ctx);
			data.append("bd_prvt", bd_prvt);

			$.ajax({
				type : "POST",
				url : path + "/board/BoardActionCtrl?action=insert&bd_type="
						+ bd_type + "&mem_no=" + mem_no,
				dataType : 'text',
				contentType : false,
				processData : false, //不做任何處理，只上傳原始資料
				data : data,
	            progress: function(e) {
	                //make sure we can compute the length
	                if(e.lengthComputable) {
	                	var intComplete = (e.loaded / e.total) * 100 | 0 ;  
	                	console.log(intComplete);
	                	upload_progress.html(intComplete + '%') ; // 控制進度條的顯示數字，例如65%
	                	upload_progress.css("width",intComplete + '%') ; // 控制進度條的長度                        
	                	upload_progress.attr('aria-valuenow', intComplete) ;
	                }
	                //this usually happens when Content-Length isn't set
	                else {
	                    console.warn('Content Length not reported!');
	                }
	            },
				success : function(msg) {

					if (msg.length != 0) {
						upload_progress.html(100 + '%') ; // 控制進度條的顯示數字，例如65%
	                	upload_progress.css("width",100 + '%') ; // 控制進度條的長度                        
	                	upload_progress.attr('aria-valuenow', 100) ;

						$('#picReset').trigger('click');
						alert('上傳完成');
		        		$('.progress').css('display','none');
		        		$('.progressCr').css('display','none');
						location.href =path+"/board/BoardShowCtrl?mem_no="+mem_no+"&thisPage=1";
					} else {
						//報錯啊
						alert('上傳失敗');
						$('.progress').css('display','none');
		        		$('.progressCr').css('display','none');
					}
				},

				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status);
					alert(thrownError);
				}

			});
		}
		function setCmmtPrvt(path,mem_no,bd_msg_no,bd_prvt) {

			if (confirm("確定要更改隱私設定嗎？")) {
				var option = $(this).parents('ul').prev().find('img');
				$.ajax({
					url: path+"/board/BoardActionCtrl?action=setPrvt&mem_no="+mem_no+"&bd_msg_no="+bd_msg_no+"&bd_prvt="+bd_prvt,
					type: "POST",
					dataType: "text",
					success: function(msg){
						option.attr('src','/BA102G4/front_end/board/images/cmmtPrvt' + bd_prvt + '.png');
					},
					error: function(xhr, ajaxOptions, thrownError){ 
				         alert('更新失敗');
				    }

				});
				
			} 
		}
		function chooseCmmtPrvt(bd_prvt) {
			$(this).parents('ul').prev().html(
					$(this).text() + '<span class="caret"></span>');
			$(this).parents('ul').prev().val(bd_prvt);
			/*$.ajax({
				url: path+"/board/MessageBoardCtrl?bd_msg_no="+bd_msg_no+"&bd_prvt="+bd_prvt;
				type: "POST",
				dataType: "text",
				success: function(msg){

				},
				error: function(xhr, ajaxOptions, thrownError){ 
			            alert('更新失敗');
			    }

			});*/

		}
		function showCmmt(board_msg_no, bd_cmmt_no) {
			$('#b' + board_msg_no + '_commt' + bd_cmmt_no).toggle();
		}

		var film;
		var fileList = [];
		var count = 0;
		Preview = new function() {
			var fileInput = $('#uploadPhoto');
			this.file_change = function() {
				$('#uploadPhoto').on('change', function() {
					show(this);
				});
			}
			var show = function(input) {
				if (input.files && input.files[0]) {
					each_img(input.files);
				}
			}
			this.removePic = function() {
				var id = $(this).attr('id');
				$(this).parent().parent().parent().remove();
				delete fileList[id];
			}
			var each_img = function(files) {
				$
						.each(
								files,
								function(index, file) {
									if (!file.type.match('image')) {
										alert('這又不是圖片..');
										return;
									}
									var reader = new FileReader();
									var img = new Image();
									img.onload = function() {
										fileList[count] = [file,count];
										var pic = "<div class='col-xs-12 col-sm-2 pic'>"
												+ "<div class='list-group'><div class='list-group-item imgDiv'>"
												+ "<img src='/BA102G4/front_end/board/images/cross1.png' id='"
												+ (count++)
												+ "' class='delete' onclick='Preview.removePic.call(this);'/>"
												+ "<div align='center'><img alumb='true' class='pics' style='width:100%;' height=100  src='"
												+ img.src
												+ "'>"
												+ "</div></div></div></div>";
										$("#media").append(pic);
										$(".imgDiv").mouseenter(function() {
											$(this).find(".delete").show();

										});

										$(".imgDiv").mouseleave(function() {
											$(this).find(".delete").hide();
										});

									};
									reader.onload = function() {
										img.src = reader.result;
									}
									if (file) {
										reader.readAsDataURL(file);
									}
								});
			}

		}


		ShowFilm = new function() {
			var fileInput = $('#uploadFilm');
			this.file_change = function() {

				$('#uploadFilm').on('change', function() {
					show(this);
				});
			}
			var show = function(input) {
				if (input.files && input.files[0]) {
					each_img(input.files);
				}
			}
			this.removeFilm = function() {
				$(this).parent().parent().parent().remove();
				film = null;
			}
			var each_img = function(files) {
				$
						.each(
								files,
								function(index, file) {
									if (!file.type.match('video')) {
										alert('這又不是影片..');
										return;
									}
									var reader = new FileReader();
									if (file.type.match('video')) {
										film = null;

										reader.onload = function() {
											var video = "<div class='col-xs-12 col-sm-12'>"
													+ "<div class='list-group text-center'><div class='list-group-item imgDiv'>"
													+ "<img class='delete' src='/BA102G4/front_end/board/images/cross1.png' "
													+ "onclick='ShowFilm.removeFilm.call(this);'/>"
													+ "<video style='height:250px; width:100%;' controls='conrtols'><source src="+
						reader.result+" type='video/mp4'></video></div></div></div>";
											$("#filmContainer").append(video);
											$(".imgDiv").mouseenter(function() {
												$(this).find(".delete").show();

											});

											$(".imgDiv").mouseleave(function() {
												$(this).find(".delete").hide();
											});
											film = file;

										}
										if (file) {
											reader.readAsDataURL(file);
										}
										return;
									}
								});

			}

		}
		function dragHandler(e) {
			e.preventDefault(); //防止瀏覽器執行預設動作
			$('#showBorder').addClass('showBorder');
		}
		leave_image
		function leave_image(e) {
			e.preventDefault(); //防止瀏覽器執行預設動作
			$('#showBorder').removeClass('showBorder');
		}
		function drop_image(e) {
			e.preventDefault(); //防止瀏覽器執行預設動作
			$('#showBorder').removeClass('showBorder');
			var files = e.dataTransfer.files; //擷取拖曳的檔案
			for (var i = 0; i < files.length; i++) {

				$
						.each(
								files,
								function(index, file) {
									if (file.type.match('video')) {
										var reader = new FileReader();
										film = null;
										reader.onload = function() {
											var video = "<div class='col-xs-12 col-sm-12'>"
													+ "<div class='list-group text-center'><div class='list-group-item imgDiv'>"
													+ "<img class='delete' src='/BA102G4/front_end/board/images/cross1.png' "
													+ "onclick='ShowFilm.removeFilm.call(this);'/>"
													+ "<video controls='conrtols'><source src="+
						reader.result+" type='video/mp4'></video></div></div></div>";
											$("#filmContainer").append(video);
											$(".imgDiv").mouseenter(function() {
												$(this).find(".delete").show();

											});

											$(".imgDiv").mouseleave(function() {
												$(this).find(".delete").hide();
											});
											film = file;

										}
										if (file) {
											reader.readAsDataURL(file);
										}
										return;
									}
									if (file.type.match('image')) {
										var reader = new FileReader();
										var img = new Image();
										img.onload = function() {
											fileList[count] = [file,count];
											var pic = "<div class='col-xs-12 col-sm-2 pic'>"
													+ "<div class='list-group'><div class='list-group-item imgDiv'>"
													+ "<img src='/BA102G4/front_end/board/images/cross1.png' id='"
													+ (count++)
													+ "' class='delete' onclick='Preview.removePic.call(this);'/>"
													+ "<div align='center'><img alumb='true' class='pics' style='width:100%;' height=100  src='"
													+ img.src
													+ "'>"
													+ "</div></div></div>";
											$("#media").append(pic);
											$(".imgDiv").mouseenter(function() {
												$(this).find(".delete").show();

											});

											$(".imgDiv").mouseleave(function() {
												$(this).find(".delete").hide();
											});

										};
										reader.onload = function() {
											img.src = reader.result;
										}
										if (file) {
											reader.readAsDataURL(file);
										}
										return;
									}
									alert('這是什麼格式..?');
								});
			}
		}
		function reload(){
			$('#myCarousel').carousel({
				interval : 5000
			});
			$('.fdi-Carousel .item').each(function(){
				var img = $(this).children(':first-child');
				img.next().remove();
				img.next().remove();
			})	
			$('.fdi-Carousel .item').each(function() {
								var sibNum = $(this).siblings().length;
								var next = $(this).next();
								if (!next.length) {
									next = $(this).siblings(':first');
								}
								next.children(':first-child').clone().appendTo($(this));
								var num = $(this).children(':last-child').children().children().attr('id');
								$(this)	.children(':last-child')
										.children()
										.children()
										.prop("href", "#")
										.removeAttr("data-fancybox")
										.click(function(event) {
													event.preventDefault();
													next.children(':first-child')
														.children()
														.children()
														.trigger('click');
												});
								if (sibNum > 1) {
									if (next.next().length > 0) {
										next.next()
											.children(':first-child')
											.clone()
											.appendTo($(this));
										$(this).children(':last-child')
												.children()
												.children()
												.prop("href","#")
												.removeAttr("data-fancybox")
												.click(function(event) {
															event.preventDefault();
															next.next()
																.children(':first-child')
																.children()
																.children()
																.trigger('click');
														});
									} else {
										$(this).siblings(':first')
												.children(':first-child')
												.clone()
												.appendTo($(this));
										$(this).children(':last-child')
												.children()
												.children()
												.prop("href","#")
												.removeAttr("data-fancybox")
												.click(function(event) {
															event.preventDefault();
															$(this).siblings(':first')
																	.children(':first-child')
																	.children()
																	.children()
																	.trigger('click');
														});
									}
		 						}

							});
	
			$('[data-fancybox]').fancybox({

				clickSlide : false,
				caption : function(instance, item) {
					return $(this).find('figcaption').html();
				}
			});
			BdPreview.file_change();
			Preview.file_change();
			ShowFilm.file_change();

		}
		
	</script>
</body>
</html>