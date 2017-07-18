<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<td><label >版塊名字</label></td><td><input type="text" name='forum_name' value='${forums.forum_name }' ${(empty forums)?'':'disabled' }> </td>			
		</tr>
		<tr >
			<td valign="top"><label>文章類型</label></td>
			<c:set var="size" value="${fn:length(art_types)}" />
			<td>
			<c:forEach begin="0" end="4" varStatus="loop">		
			<input type="text" name='art_type_name' style="display: none;" ${(loop.index>size-1)? "":"value='" }${(loop.index>size-1)? "":art_types[loop.index+1].art_type_name }${(loop.index>size-1)? "":"'" }>
			<input type="button" class='xbtn' value='X' style="display: none;">
			</c:forEach>			
			<input type="button" id='btn' value='+'>
			</td>
			
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