<%@ page language="java" import="com.forum.domain.*,java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-ch-en">
<head>

<meta content="Expires" content="-1">
<meta content="Catch-Control" content="no-cache">
<meta content="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">		
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/ArticleDisplay.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/colorbox.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front_end/comm/css/sweetalert.css">
<title>Insert title here</title>
</head>
<body>
><a href="${pageContext.request.contextPath}/forum/ForumCtrl">討論大廳</a>><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }">${forum_name }</a>

<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12" >
		<c:if test="${thisPage==1}">

		    	<div class="row">
		    		
		    	<div class="col-xs-12 col-sm-12" style="padding-left: 0px;">						    		
					  <div class="panel panel-default" style="margin-bottom: 0px;">
						  <table class="table table-bordered">
						  <tbody>
						  		<tr>	
									<td rowspan='3' width='100' style='text-align: center' valign="top"><img width=80 src='${pageContext.request.contextPath}/util/OutputPic?mem_no=${articles.mem_no.mem_no}&mem_rank=${articles.mem_no.mem_rank}'><br>
									<a href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=${articles.mem_no.mem_no}'>${articles.mem_no.mem_nickname}</a><br>
									<c:if test="${articles.mem_no.mem_rank=='0'}">健身者</c:if><c:if test="${articles.mem_no.mem_rank=='1'}">教練</c:if><c:if test="${articles.mem_no.mem_rank=='2'}">健身房</c:if></td>
									<td colspan='2'>${articles.art_name}</td>
								</tr>
								<tr><td valign="top">${articles.art_ctx}</td></tr>
								<tr><td>
									<c:if test="${(articles.mem_no.mem_no==user.mem_no)||user.mem_rank=='3'||user.mem_rank=='4'}">
									<a href="${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=goUpdatePage&forum_no=${param.forum_no }&art_no=${articles.art_no}"><button class='btn btn-info'><span class='glyphicon glyphicon-pencil'></span>&nbsp編輯</button></a>&nbsp
									<a href="${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=delete&forum_no=${param.forum_no }&art_no=${articles.art_no}" onclick="return del.call(this);"><button class='btn btn-danger'><span class='glyphicon glyphicon-trash'></span>&nbsp刪除</button></a>&nbsp
									</c:if>
									<c:if test="${articles.mem_no.mem_no!=user.mem_no&&! empty user}">
									<a class='inline' href="#inline_content"><button class='btn btn-warning'><span class='glyphicon glyphicon-exclamation-sign'></span>&nbsp檢舉</button></a>	</c:if>
									</td></tr>	
						  </tbody>
						  </table>
					
		    		</div>	
		  					
		</c:if>
						    		
<c:forEach var='comments' items='${article_comments }'>
				<div class="panel panel-default" style="margin-top:10px; margin-bottom: 0px;">
						<table class="table table-bordered">
							<tbody>
								<tr>	
									<td rowspan='3' width='100' style='text-align: center' valign="top"><img width=80 src='${pageContext.request.contextPath}/util/OutputPic?mem_no=${comments.mem_no.mem_no}&mem_rank=${comments.mem_no.mem_rank}'><br><a href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=${comments.mem_no.mem_no}'>${comments.mem_no.mem_nickname}</a><br>
								<c:if test="${comments.mem_no.mem_rank=='0'}">健身者</c:if><c:if test="${comments.mem_no.mem_rank=='1'}">教練</c:if><c:if test="${comments.mem_no.mem_rank=='2'}">健身房</c:if></td>
								
								<td valign="top">${comments.art_cmt_ctx }</td>
								</tr>
								<c:if test="${(articles.mem_no==user.mem_no)||user.mem_rank=='3'||user.mem_rank=='4'}">
								<tr>
								<td>
										<a href="${pageContext.request.contextPath}/forum/ArtCmtActionCtrl?action=delete&forum_no=${param.forum_no }&art_no=${articles.art_no}&art_cmt_no=${comments.art_cmt_no}" onclick="return delCmt.call(this);"><button class='btn btn-danger'><span class='glyphicon glyphicon-trash'></span>&nbsp刪除</button></a>
								</td>
								</tr>
								</c:if>
							</tbody>
						</table>
					</div>
</c:forEach>

<div class="col-xs-12 col-sm-12 text-center">	
<jsp:include page="/front_end/forum/ChangePage.jsp"/>
</div>
<c:if test="${! empty user }">
<div class="col-xs-12 col-sm-12" style="padding-left: 0px;">	
	<div class="panel panel-default" style="margin-top:10px; margin-bottom: 0px; padding: 0px;">
		<form id='cmmtForm' action="${pageContext.request.contextPath}/forum/ArtCmtActionCtrl?forum_no=${param.forum_no}&art_no=${articles.art_no}&action=create" method="post" enctype='multipart/form-data'>
				<table class="table table-bordered" style=" margin-bottom: 0px;">
				<tbody>
					<tr>
						<td rowspan='2' width='100' align="center"">留言</td>
						<td align="top" style='padding: 0px;'>
						<div contentEditable="true" id='ctx' name='content' style='width:100%; height:250px;;'></div>
						<textarea id="my-textarea" name='art_cmt_ctx' style="display:none"></textarea>    
						<input type="file" id='file' name='file' style="display:none"/>
						</td>	
					</tr>
					<tr><td  align="center" ><input class='btn btn-primary btn-lg' type='button' name="getHtml"  value='送出'><input class='btn btn-default btn-lg' type='reset' value='重填'></td></tr>
				</tbody>
			</table>
		</form>	
	</div>
</div>
</c:if>
<c:if test="${ empty user }">
<div class="col-xs-12 col-sm-12" style="padding-left: 0px;">	
	<div class="panel panel-default" style="margin-top:10px; margin-bottom: 0px;">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td width='100' align="center">留言</td>
					<td width='600' height='100' align="center"><a href="${pageContext.request.contextPath}/LoginCtrl">請先登入</a></td>	
				</tr>
			</tbody>
		</table>
	</div>
</div>
</c:if>

				</div>
			</div>
		</div>
	</div>
</div>



<div style="display: none">
			<div id='inline_content' style='padding:10px; background:#fff;font-size: 30px;'>
			<form action="#" method="post">
			<table class="table">
						
						<thead><caption>文章檢舉</caption></thead>
						<tbody>
						<tr><td>
						<label >類型</label>
						<select name="rpt_type" id='rpt_type' style='font-size: 30px;border-radius:10px;' >
							<option value="0">涉及歧視</option>				
							<option value="1">含十八禁</option>
							<option value="2">人身攻擊</option>
							<option value="3">政治問題</option>
							<option value="4">其他</option>
						</select>
						<label >檢舉原因</label>
						<input type="text" style='font-size: 30px;border-radius:10px; width:55%;' name="rpt_ctx" id='rpt_ctx' maxlength="80">
						</td></tr>
						<tr class='text-center'><td>
						<input type='button' class='btn btn-primary btn-lg' value="送出" onclick="report('${pageContext.request.contextPath}',${param.art_no });">
						<input type='reset' class='btn btn-default btn-lg' value="重填">
						</td></tr>
						</tbody>
						</table>
			
			</form>
			</div>
		</div>

<div id='tips'></div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/front_end/forum/js/jquery.colorbox.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/lang/zh-TW.js"></script>
<script src='${pageContext.request.contextPath}/front_end/comm/js/sweetalert.min.js'></script>	
<script type="Text/JavaScript" src="${pageContext.request.contextPath}/front_end/forum/js/ArticleDisplay.js"></script>
<script type="text/javascript">
function del(){
	var res = $(this).prop('href');
		swal({
			  title: "確定要刪除文章？",
			  text: "刪除後將無法回復，請三思而後行",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "刪掉",
			  cancelButtonText: "算了",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
			  if (isConfirm) {
				  location.href= res;
			  } else {
				  swal.close();
			  }
			});
	return false;
}
function delCmt(){
	var res = $(this).prop('href');
		swal({
			  title: "確定要刪除留言？",
			  text: "刪除後將無法回復，請三思而後行",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "刪掉",
			  cancelButtonText: "算了",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
			  if (isConfirm) {
				  location.href= res;
			  } else {
				  swal.close();
			  }
			});
	return false;
}
</script>
</body>
</html>