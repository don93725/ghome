<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="Text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/front_end/forum/js/ForumApply.js'></script>
</head>
<body>
<h1>版塊申請</h1>
<form action="${pageContext.request.contextPath}/forum/ForumActionCtrl?action=${(empty forums)?'createApply':'update&forum_no=' }${(empty forums)?'':forums.forum_no }" method="post">
	<table>
		<tr>
			<td><label >版塊名字</label></td><td><input type="text" name='forum_name' value='${forums.forum_name }'> </td>			
		</tr>
		<tr>
			<td><label >版塊敘述</label></td><td><textarea rows="5" cols="20" name='forum_desc'>${forums.forum_desc }</textarea></td>			
		</tr>
		<tr>
			<td><label >申請原因</label></td><td> <textarea rows="5" cols="20" name='forum_note'>${forums.forum_note }</textarea> </td>			
		</tr>
		<tr align='center'>
			<td colspan="2" ><input type="submit" name="" value="送出"><input type="reset" name="" value="重填"></td>			
		</tr>
	</table>
</form>
<a href='${pageContext.request.contextPath}/forum/${(empty forums)?"ForumCtrl":"ForumShowCtrl?forum_no="}${(empty forums)?"":forums.forum_no}'>返回板塊區</a>
</body>
</html>