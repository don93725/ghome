<%@ page language="java" contentType="text/html; charset=utf-8"
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
<a href="${pageContext.request.contextPath }/forum/Login">登入</a><br>
<a href="${pageContext.request.contextPath }/forum/ForumCtrl">討論區</a><br>
<a href="${pageContext.request.contextPath }/album/AlbumsShowCtrl?mem_no=1">相簿</a><br>
<a href="${pageContext.request.contextPath }/board/BoardShowCtrl?mem_no=1">動態</a><br>
<a href="${pageContext.request.contextPath }/message/MessageCtrl">訊息管理</a><br>


</body>
</html>