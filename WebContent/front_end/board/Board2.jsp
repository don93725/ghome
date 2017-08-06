<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


				
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
									<li role="presentation"><a href="#"
										onclick="addLikes.call(this,event,'${pageContext.request.contextPath}','${param.mem_no }','${message_board.bd_msg_no}')"> <span
											class="glyphicon glyphicon-thumbs-up">&nbsp讚</span>
									</a></li>
									<li role="presentation"><a href="#"
										onclick="return showCmmt('1','1');"> <span class="badage">10</span>
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
