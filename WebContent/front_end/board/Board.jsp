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
			<div class="col-xs-12 col-sm-10">
				<div class="panel panel-default opcityDiv" id='showBorder'
					ondrop="javascript: drop_image(event);">
					<div class="panel-heading">
						<h3 class="panel-title">新增動態</h3>
					</div>
					<div class="panel-body">
						<textarea class="form-control scrollable" id='bd_msg_ctx'
							style="resize: none; background-color: transparent;" rows="8"
							placeholder="李宗霖，在想些什麼呢？"></textarea>
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

				<c:forEach var="message_board" items="${message_board}">
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
													<li><a href="#" onclick="setCmmtPrvt.call(this,'0');">朋友</a></li>
													<li><a href="#" onclick="setCmmtPrvt.call(this,'1');">公開</a></li>
													<li><a href="#" onclick="setCmmtPrvt.call(this,'2');">本人</a></li>
												</ul>

											</div>

										</div>


									</div>
									<div class="col-xs-12 col-sm-2 boardEdit">
										<button class="btn btn-info" onclick='edit.call(this);'>
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
										<button class="btn btn-danger"
											onclick="deleteBoard.call('號碼');">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
										</c:if>
									</div>
								</div>

							</h3>
						</div>
						<div class="panel-body">
							<div class='content'>${message_board.bd_msg_ctx}</div>
						</div>
						<c:if
							test="${message_board.bd_type==1 || message_board.bd_type==3 }">
							<div class="panel-body">
								<!-- 如果有照片  -->
								<div class="well">
									<div id="myCarousel" class="carousel fdi-Carousel slide">
										<!-- Carousel items -->
										<div class="carousel fdi-Carousel slide"
											id="eventCarousel${message_board.bd_msg_no }"
											data-interval="0">
											<div class="carousel-inner onebyone-carosel">
												<c:forEach var="bd_photo"
													items="${message_board.board_photo }" varStatus="loop">
													<div class="item ${(loop.index==0)? 'active':'' }">
														<div class="col-sm-4">
															<figure>
																<a
																	href="${pageContext.request.contextPath}/util/OutputPic?photo_no=${bd_photo}&type=big"
																	class='try'
																	data-fancybox="group${message_board.bd_msg_no }"> <img
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
										<div class="col-xs-12 col-sm-12">
											<video controls="controls">
												<source
													src="${pageContext.request.contextPath}/util/OutputPic?bd_msg_no=${message_board.bd_msg_no}">
											</video>
										</div>
									</div>
								</div>
								<!--well -->
							</div>
							<!--panel-body -->
						</c:if>
						<div class="panel-body updatTime">
							<div class="col-xs-12 col-sm-4 col-sm-offset-8">
								<fmt:setLocale value="en_US" />
								<fmt:formatDate value="${message_board.bd_upd_time}"
									pattern="最後更新於 yyyy-MM-dd HH:mm" />
							</div>

						</div>
						<div class="panel panel-default" style="margin-bottom: 0px;">
							<div class="panel-heading">
								<ul class="nav nav-pills">
									<li role="presentation"><a href="#"
										onclick="return false;"> <span
											class="glyphicon glyphicon-thumbs-up">&nbsp讚</span>
									</a></li>
									<li role="presentation"><a href="#"
										onclick="return showCmmt('1','1');"> <span class="badage">10</span>
											<span class="glyphicon glyphicon-comment">&nbsp留言</span>
									</a></li>
									<li role="presentation"><a href="#"
										onclick="return false;"> <span
											class="glyphicon glyphicon-share-alt">&nbsp分享</span>
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



	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/front_end/album/js/jquery.fancybox.js"></script>
	<script type="text/javascript">
		var count = 0;
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
												$(this)
														.children(':last-child')
														.children()
														.children()
														.prop("href", "#")
														.removeAttr(
																"data-fancybox")
														.click(
																function(event) {
																	event
																			.preventDefault();
																	next
																			.children(
																					':first-child')
																			.children()
																			.children()
																			.trigger(
																					'click');
																});

												if (sibNum > 1) {
													if (next.next().length > 0) {
														next
																.next()
																.children(
																		':first-child')
																.clone()
																.appendTo(
																		$(this));
														$(this)
																.children(
																		':last-child')
																.children()
																.children()
																.prop("href",
																		"#")
																.removeAttr(
																		"data-fancybox")
																.click(
																		function(
																				event) {
																			event
																					.preventDefault();
																			next
																					.next()
																					.children(
																							':first-child')
																					.children()
																					.children()
																					.trigger(
																							'click');
																		});
													} else {
														$(this)
																.siblings(
																		':first')
																.children(
																		':first-child')
																.clone()
																.appendTo(
																		$(this));
														$(this)
																.children(
																		':last-child')
																.children()
																.children()
																.prop("href",
																		"#")
																.removeAttr(
																		"data-fancybox")
																.click(
																		function(
																				event) {
																			event
																					.preventDefault();
																			$(
																					this)
																					.siblings(
																							':first')
																					.children(
																							':first-child')
																					.children()
																					.children()
																					.trigger(
																							'click');
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
						});
		function deleteBoard(mem_no, bd_msg_no) {
			if (confirm('將會把照片及內文完全刪除，確定不會捨不得，執意還要刪除？')) {
// 				$.ajax({
// 					type : "POST",
// 					url : path + "/board/BoardActionCtrl?action=delete&mem_no="+mem_no+"&bd_msg_no=bd_msg_no="
// 							+ bd_type + "&mem_no=" + mem_no,
// 					dataType : 'text',
// 					contentType : false,
// 					processData : false, //不做任何處理，只上傳原始資料
// 					data : data,
// 					// 		            progress: function(e) {
// 					// 		                //make sure we can compute the length
// 					// 		                if(e.lengthComputable) {
// 					// 		                	var intComplete = (e.loaded / e.total) * 100 | 0 ;                    
// 					// 		                	upload_progress.html(intComplete + '%') ; // 控制進度條的顯示數字，例如65%
// 					// 		                	upload_progress.css("width",intComplete + '%') ; // 控制進度條的長度                        
// 					// 		                	upload_progress.attr('aria-valuenow', intComplete) ;
// 					// 		                }
// 					// 		                //this usually happens when Content-Length isn't set
// 					// 		                else {
// 					// 		                    console.warn('Content Length not reported!');
// 					// 		                }
// 					// 		            },
// 					success : function(msg) {

// 						if (msg.length != 0) {
// 							// 							upload_progress.html(100 + '%') ; // 控制進度條的顯示數字，例如65%
// 							// 		                	upload_progress.css("width",100 + '%') ; // 控制進度條的長度                        
// 							// 		                	upload_progress.attr('aria-valuenow', 100) ;

// 							$('#picReset').trigger('click');
// 							alert('上傳完成');
// 							// 			        		$('.progress').css('display','none');
// 							// 			        		$('.progressCr').css('display','none');
// 							// 		                	location.href ="PhotosShowCtrl?mem_no="+mem_no+"&al_no="+al_no+"&thisPage=1";
// 						} else {
// 							//報錯啊
// 							alert('上傳失敗');
// 						}
// 					},

// 					error : function(xhr, ajaxOptions, thrownError) {
// 						alert(xhr.status);
// 						alert(thrownError);
// 					}

// 				});
			}
		}
		function edit() {
			var btn = $(this);
			var btnSpan = $(this).children();
			var spanClass = $(this).children().attr('class');
			var content = $(this).parents(".panel-default").find(".content");
			var originText = content.text();
			if (spanClass == "glyphicon glyphicon-pencil") {
				btn.removeClass('btn-info');
				btn.addClass('btn-success');
				btnSpan.removeClass(spanClass);
				btnSpan.addClass('glyphicon glyphicon-ok');
				content.attr("contenteditable", "true");
				content.focus();
				setCursorToEnd(content.get(0));
			} else {
				btn.removeClass('btn-success');
				btn.addClass('btn-info');
				btnSpan.removeClass(spanClass);
				btnSpan.addClass('glyphicon glyphicon-pencil');
				content.attr("contenteditable", "false");
				//ajax
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
		function submit(path, mem_no) {
			var bd_prvt = $('#dropdownMenu1').val()
			var bd_msg_ctx = $('#bd_msg_ctx').val()
			var num = 0;
			var data = new FormData();
			var bd_type = 0;
			alert(film);

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
				// 		            progress: function(e) {
				// 		                //make sure we can compute the length
				// 		                if(e.lengthComputable) {
				// 		                	var intComplete = (e.loaded / e.total) * 100 | 0 ;                    
				// 		                	upload_progress.html(intComplete + '%') ; // 控制進度條的顯示數字，例如65%
				// 		                	upload_progress.css("width",intComplete + '%') ; // 控制進度條的長度                        
				// 		                	upload_progress.attr('aria-valuenow', intComplete) ;
				// 		                }
				// 		                //this usually happens when Content-Length isn't set
				// 		                else {
				// 		                    console.warn('Content Length not reported!');
				// 		                }
				// 		            },
				success : function(msg) {

					if (msg.length != 0) {
						// 							upload_progress.html(100 + '%') ; // 控制進度條的顯示數字，例如65%
						// 		                	upload_progress.css("width",100 + '%') ; // 控制進度條的長度                        
						// 		                	upload_progress.attr('aria-valuenow', 100) ;

						$('#picReset').trigger('click');
						alert('上傳完成');
						// 			        		$('.progress').css('display','none');
						// 			        		$('.progressCr').css('display','none');
						// 		                	location.href ="PhotosShowCtrl?mem_no="+mem_no+"&al_no="+al_no+"&thisPage=1";
					} else {
						//報錯啊
						alert('上傳失敗');
					}
				},

				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status);
					alert(thrownError);
				}

			});
		}
		function setCmmtPrvt(bd_prvt) {

			if (confirm("確定要更改隱私設定嗎？")) {

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
				$(this).parents('ul').prev().find('img').attr(
						'src',
						'/BA102G4/front_end/board/images/cmmtPrvt' + bd_prvt
								+ '.png');

			} else {

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
		$(function() {
			$('#uploadTrigger').click(function() {
				$('#uploadPhoto').trigger('click');
			})
			$('#uploadFilmTrigger').click(function() {
				$('#uploadFilm').trigger('click');
			})

			Preview.file_change();
			ShowFilm.file_change();
		})
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
										fileList[count] = [ file, count ];
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
											alert(video);
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
											alert(video);
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
											fileList[count] = [ file, count ];
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
	</script>
</body>
</html>