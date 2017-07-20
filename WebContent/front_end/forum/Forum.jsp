<%@ page language="java" import="java.util.*,com.forum.domain.*,java.text.SimpleDateFormat" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="Expires" content="-1">
<meta content="Catch-Control" content="no-cache">
<meta content="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>

<body>
><a href="${pageContext.request.contextPath}/forum/ForumCtrl">討論大廳</a>>${forum_name }<br>
<c:if test="${! empty user }">
<a href='${pageContext.request.contextPath}/forum/ArticlesActionCtrl?action=goCreatePage&forum_no=${param.forum_no }'>新增文章</a>
</c:if>
<c:if test="${mem_no==user.mem_no&&!empty user.mem_no }">
<a href="${pageContext.request.contextPath}/forum/ForumActionCtrl?action=goUpdate&forum_no=${param.forum_no}">編輯論壇</a>
<a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no}">管理檢舉</a>
</c:if>
<div>
<table border='1'>
<tr>
<td><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }">全部</a></td>

<c:forEach var="art_types" items="${art_types}" varStatus="loop">
<td><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }&art_type_no=${art_types.art_type_no}"><c:out value="${art_types.art_type_name }"/></a></td>
</c:forEach>
</tr>
</table>
</div>
<div>
<table border=1>
<tr><th>文章類型</th><th>文章標題</th><th>發文者</th><th>發文時間</th><th>瀏覽次數</th></tr>
<c:forEach var="art" items="${articles }" > 
	<tr>		
		<td>${art.art_type}</td>
		<td><a href="${pageContext.request.contextPath}/forum/ArticleShowCtrl?forum_no=${param.forum_no }&art_no=${art.art_no}">${art.art_name}</a></td>
		<td><a href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=${art.mem_no.mem_no}'>${art.mem_no.mem_nickname}</a></td>		
		<td><fmt:setLocale value="en_US"/><fmt:formatDate value="${art.art_add_date}" pattern="yyyy-MM-d HH:mm"/></td>
		<td align="right">${art.art_views}</td>
	</tr>
</c:forEach>
	<c:if test="${empty articles}"><tr><td colspan='5'>目前尚無文章</td></tr></c:if>

	</table>
<jsp:include page="/front_end/forum/ChangePage.jsp"/>




</body>
</html>