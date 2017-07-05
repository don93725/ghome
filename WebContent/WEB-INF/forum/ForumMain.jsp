<%@ page language="java" import="java.util.List,java.util.ArrayList,com.forum.domain.Forum" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
<% List<Forum> list=(List<Forum>)request.getAttribute("forums"); %>
<h1>討論區</h1>
<table border=1>
<tr>
<th>編號</th><th>論壇</th><th>介紹</th><th>點擊次數</th></tr>
<%for(int i =0;i<list.size();i++){
	Forum f = list.get(i);%>
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