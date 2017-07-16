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
<%Articles articles=(Articles)request.getAttribute("articles");
	List<Article_comments> article_comments = (List<Article_comments>)request.getAttribute("article_comments");
	int allPageCount=Integer.parseInt( request.getAttribute("allPageCount").toString());
	int thisPage = Integer.parseInt(request.getAttribute("thisPage").toString());%>

<script type="Text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/ArticleDisplay.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/kindeditor/lang/zh-TW.js"></script>
<script type="Text/JavaScript" src="${pageContext.request.contextPath}/front_end/forum/js/ArticleDisplay.js"></script>
<title>Insert title here</title>
</head>
<body>
><a href="${pageContext.request.contextPath}/forum/ForumCtrl">討論大廳</a>><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }">${forum_name }</a>
<c:if test="${thisPage==1}">
<table border='1'>
<tr>	
	<td rowspan='3' width='100' style='text-align: center' valign="top">圖片<br>
	<a href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=${articles.mem_no}'>名稱</a><br>身份</td>
	<td colspan='2'>${articles.art_name}</td>
</tr>
<tr><td width='600' height='100' valign="top" colspan='3'>${articles.art_ctx}</td></tr>
<tr><td width='600' height='20' align="left">
	<c:if test="${(articles.mem_no==user.mem_no)||user.mem_rank=='3'||user.mem_rank=='4'}">
	<a href="${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=goUpdatePage&forum_no=${param.forum_no }&art_no=${articles.art_no}">修改</a>&nbsp
	<a href="${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=delete&forum_no=${param.forum_no }&art_no=${articles.art_no}" onclick="return confirm('確定要刪除文章?')">刪除</a>&nbsp
	</c:if>
	<c:if test="${articles.mem_no!=user.mem_no}">
	<a href="${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=report&forum_no=${param.forum_no }&art_no=${articles.art_no}">檢舉</a></c:if>
	</td></tr>	
</table>
</div>
</c:if>
<%for(int i = 0 ; i < article_comments.size() ; i++){
	Article_comments comments=article_comments.get(i);%>
<div>
<table border='1'>
<tr>
	
	<td rowspan='3' width='100' style='text-align: center' valign="top">圖片<br><a href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=<%=comments.getMem_no()%>'>名稱</a><br>身份</td>
	
</tr>
<tr><td width='600' height='100' valign="top"><%=comments.getArt_cmt_ctx() %></td></tr>
<tr><td width='600' height='20' align="left">
	<c:if test="${(articles.mem_no==user.mem_no)||user.mem_rank=='3'||user.mem_rank=='4'}">
	<a href="${pageContext.request.contextPath}/forum/ArtCmtActionCtrl?action=delete&forum_no=${param.forum_no }&art_no=${articles.art_no}&art_cmt_no=<%=comments.getArt_cmt_no()%>" onclick="return confirm('確定要刪除留言?')">刪除</a>
	</c:if>
	</td></tr>
</table>
</div>
<%} %>
<jsp:include page="/front_end/forum/ChangePage.jsp"/>
<%if(session.getAttribute("user")!=null){ %>
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
<%}else{ %>
<div>
<table border='1'>
<tr>
	<td width='100' align="center"">留言</td>
	<td width='600' height='100' align="center"><a href="${pageContext.request.contextPath}/forum/LoginCtrl">請先登入</a></td>	
</tr>

</form>
</table>
</div>
<%} %>

</body>
</html>