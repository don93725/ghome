<%@ page language="java" import="java.util.List,java.util.ArrayList,com.forum.domain.Forums" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="Expires" content="-1">
<meta content="Catch-Control" content="no-cache">
<meta content="Pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% List<Forums> list=(List<Forums>)request.getAttribute("forums"); %>
<h1>討論區</h1>
<table border='1'>
<tr><td>名次</td><td>板塊名稱</td><td>月點擊次數</td><td>總點擊次數</td></tr>
<c:forEach begin="0" end="${fn:length(rankList)}" varStatus="loop">
<tr>
<td><c:out value="${loop.count}"/></td>
<td><c:out value="${rankList[loop.count].forum_name }"/></td>
<td><c:out value="${rankList[loop.count].forum_views }"/></td>
<td><c:out value="${rankList[loop.count].forum_mviews }"/></td>
</tr>
</c:forEach>
</table>
<table border='1'>
<tr><td>名次</td><td>板塊名稱</td><td>月點擊次數</td><td>總點擊次數</td></tr>
<c:forEach begin="0" end="${fn:length(articlesRankList)}" varStatus="loop2">
<tr>
<td><c:out value="${loop2.count}"/></td>
<td><c:out value="${articlesRankList[loop2.count].art_name }"/></td>
<td><c:out value="${articlesRankList[loop2.count].art_views }"/></td>
<td><c:out value="${articlesRankList[loop2.count].art_mviews }"/></td>
</tr>
</c:forEach>
</table>
<table border=1>
<tr>
<th>編號</th><th>論壇</th><th>介紹</th><th>點擊次數</th></tr>
<%for(int i =0;i<list.size();i++){
	Forums f = list.get(i);%>
<tr>
	<td><%=f.getForum_no()%></td>
	<td><a href='${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=<%= f.getForum_no()%>'><%= f.getForum_name()%></a></td>
	<td><%=f.getForum_desc()%></td>
	<td><%=f.getForum_views()%></td>
</tr>                 
<% } %>
</table>	

</body>
</html>