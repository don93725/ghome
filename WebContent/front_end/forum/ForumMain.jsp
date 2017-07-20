<%@ page language="java" import="java.util.List,java.util.ArrayList,com.forum.domain.Forums" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="Expires" content="-1">
<meta content="Catch-Control" content="no-cache">
<meta content="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/forum.css">
</head>
<body>
<h1>討論區</h1>



<c:if test="${not empty user }">
<div>
<a href='${pageContext.request.contextPath }/forum/ForumActionCtrl?action=wantCreate'>申請板塊</a>
</div>
</c:if>
<div>
<div class='rank'>
<table border='1'>
<tr><td>名次</td><td>板塊名稱</td><td>月點擊/總點擊</td></tr>
<c:forEach var='rankList' items="${rankList}" varStatus="loop">
<tr>
<td><c:out value="${loop.count}"/></td>
<td><a href='${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=<c:out value='${rankList.forum_no}'/>'><c:out value='${rankList.forum_name }'/></a></td>
<td align="center"><c:out value="${rankList.forum_views }"/>/<c:out value="${rankList.forum_mviews }"/></td>
</tr>
</c:forEach>
</table>
</div>
<div class='rank'>
<table border='1'>
<tr><td>名次</td><td>文章名稱</td><td>月點擊/總點擊</td></tr>

<c:forEach var="rankArticles" items="${articlesRankList}" varStatus="loop2">
<tr>
<td><c:out value="${loop2.count}"/></td>
<td><a href='${pageContext.request.contextPath}/forum/ArticleShowCtrl?forum_no=<c:out value="${rankArticles.forum_no}"/>&art_no=<c:out value="${rankArticles.art_no}"/>'><c:out value="${rankArticles.art_name }"/></a></td>
<td><c:out value="${rankArticles.art_views }"/>/<c:out value="${rankArticles.art_mviews }"/></td>
</tr>
</c:forEach>
<c:if test="${empty articlesRankList}"><tr rowspan='5'><td colspan='3'>目前尚無排行</td></tr></c:if>
</table>
</div>
</div>
<div >
<table border='1'>
<tr><td>名次</td><td>最新文章</td><td>發表時間</td></tr>

<c:forEach var="newestRankList" items="${newestRankList}" varStatus="loop3">
<tr>
<td><c:out value="${loop3.count}"/></td>
<td><a href='${pageContext.request.contextPath}/forum/ArticleShowCtrl?forum_no=<c:out value="${newestRankList.forum_no}"/>&art_no=<c:out value="${newestRankList.art_no}"/>'><c:out value="${newestRankList.art_name }"/></a></td>
<td><fmt:setLocale value="en_US"/><fmt:formatDate value="${newestRankList.art_add_date}" pattern="yyyy-MM-d HH:mm"/></td>
</tr>
</c:forEach>
<c:if test="${empty newestRankList}"><tr rowspan='5'><td colspan='3'>目前尚最新文章</td></tr></c:if>
</table>
</div>
</div>
<div class='rank'>
<table border=1>
<tr>
<th>編號</th><th>論壇</th><th>文章數</th><th>介紹</th><th>點擊次數</th></tr>


	<c:forEach var='f' items='${ forums}'>
	<tr>
	<td>${f.forum_no }</td>
	<td><a href='${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${f.forum_no }'>${f.forum_name }</a></td>
	<td><c:out value="${countArticles[f.forum_no ] }" default="0"/></td>
	<td>${f.forum_desc }</td>
	<td>${f.forum_views }</td>
	</tr>
	</c:forEach>
                 

</table>	
</div>
</body>
</html>