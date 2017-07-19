<%@ page language="java" import="com.forum.domain.*,java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta content="Expires" content="-1">
<meta content="Catch-Control" content="no-cache">
<meta content="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">



<script type="Text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/ArticleDisplay.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/lang/zh-TW.js"></script>
<title>Insert title here</title>
</head>
<body>
><a href="${pageContext.request.contextPath}/forum/ForumCtrl">討論大廳</a>><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }">${forum_name }</a>
<c:if test="${thisPage==1}">
<table border='1'>
<tr>	
	<td rowspan='3' width='100' style='text-align: center' valign="top"><img width=80 src='${pageContext.request.contextPath}/forum/OutputPic?mem_no=${articles.mem_no.mem_no}&mem_rank=${articles.mem_no.mem_rank}'><br>
	<a href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=${articles.mem_no.mem_no}'>${articles.mem_no.mem_nickname}</a><br>
	<c:if test="${articles.mem_no.mem_rank=='0'}">健身者</c:if><c:if test="${articles.mem_no.mem_rank=='1'}">教練</c:if><c:if test="${articles.mem_no.mem_rank=='2'}">健身房</c:if></td>
	<td colspan='2'>${articles.art_name}</td>
</tr>
<tr><td width='600' height='100' valign="top" colspan='3'>${articles.art_ctx}</td></tr>
<tr><td width='600' height='20' align="left">
	<c:if test="${(articles.mem_no.mem_no==user.mem_no)||user.mem_rank=='3'||user.mem_rank=='4'}">
	<a href="${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=goUpdatePage&forum_no=${param.forum_no }&art_no=${articles.art_no}">修改</a>&nbsp
	<a href="${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=delete&forum_no=${param.forum_no }&art_no=${articles.art_no}" onclick="return confirm('確定要刪除文章?')">刪除</a>&nbsp
	</c:if>
	<c:if test="${articles.mem_no.mem_no==user.mem_no&&! empty user}">
	<a class='inline' href="#inline_content">檢舉</a>	</c:if>
	</td></tr>	
</table>
</div>
</c:if>
<c:forEach var='comments' items='${article_comments }'>
<div>
<table border='1'>
<tr>	
	<td rowspan='3' width='100' style='text-align: center' valign="top"><img width=80 src='${pageContext.request.contextPath}/forum/OutputPic?mem_no=${comments.mem_no.mem_no}&mem_rank=${comments.mem_no.mem_rank}'><br><a href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=${comments.mem_no.mem_no}'>${comments.mem_no.mem_nickname}</a><br>
<c:if test="${comments.mem_no.mem_rank=='0'}">健身者</c:if><c:if test="${comments.mem_no.mem_rank=='1'}">教練</c:if><c:if test="${comments.mem_no.mem_rank=='2'}">健身房</c:if></td>
</tr>
<tr>
	<td width='600' height='100' valign="top">${comments.art_cmt_ctx }</td>
</tr>
<tr>
<td width='600' height='20' align="left">
<c:if test="${(articles.mem_no==user.mem_no)||user.mem_rank=='3'||user.mem_rank=='4'}">
<a href="${pageContext.request.contextPath}/forum/ArtCmtActionCtrl?action=delete&forum_no=${param.forum_no }&art_no=${articles.art_no}&art_cmt_no=${comments.art_cmt_no}" onclick="return confirm('確定要刪除留言?')">刪除</a>
	</c:if>
	</td></tr>
</table>
</div>
</c:forEach>


<jsp:include page="/front_end/forum/ChangePage.jsp"/>
<c:if test="${! empty user }">
<div>
<table border='1'>
<form action="${pageContext.request.contextPath}/forum/ArtCmtActionCtrl?forum_no=${param.forum_no}&art_no=${articles.art_no}&action=create" method="post" enctype='multipart/form-data' onsubmit='return getContent()'>
<tr>
<td rowspan='2' width='100' align="center"">留言</td>
<td width='600' height='100' align="top">
<div contentEditable="true" id='ctx' name='content' style='width:592px; height:250px '></div>
<textarea id="my-textarea" name='art_cmt_ctx' style="display:none"></textarea>    
<input type="file" id='file' name='file' style="display:none"/>
</div>

</td>	
</tr>
<tr><td  align="center" ><input type='submit' name="getHtml"  value='送出'><input type='reset' value='重填'></td></tr>

</form>
</table>
</div>
</c:if>
<c:if test="${ empty user }">
<div>
<table border='1'>
<tr>
<td width='100' align="center">留言</td>
<td width='600' height='100' align="center"><a href="${pageContext.request.contextPath}/forum/LoginCtrl">請先登入</a></td>	
</tr>
</table>

</div>
</c:if>
<div style="display: none">
			<div id='inline_content' style='padding:10px; background:#fff;font-size: 30px;'>
			<form action="#" method="post">
			<h3>文章檢舉</h3>
			<label >類型</label>
			<select name="rpt_type" id='rpt_type' style='font-size: 30px;' >
				<option value="0">涉及歧視</option>				
				<option value="1">含十八禁</option>
				<option value="2">人身攻擊</option>
				<option value="3">政治問題</option>
				<option value="4">其他</option>
			</select>
			<label >檢舉原因</label>
			<input type="text" style='font-size: 30px;' name="rpt_ctx" id='rpt_ctx' maxlength="50">

			
			<input type='button' value="送出" onclick="report('${pageContext.request.contextPath}',${param.art_no });">
			<input type='reset' value="重填">
			</form>
		</div>
		</div>
<div id='tips'></div>
<script src="${pageContext.request.contextPath}/front_end/forum/js/jquery.colorbox.js"></script>
<script type="Text/JavaScript" src="${pageContext.request.contextPath}/front_end/forum/js/ArticleDisplay.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/colorbox.css" />

</body>
</html>