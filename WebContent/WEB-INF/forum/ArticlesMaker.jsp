<%@ page language="java" import='com.forum.domain.*,java.util.*' contentType="text/html; charset=utf-8"
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
<title>增加文章</title>
</head>
<body>
<c:if test="${param.action=='goCreatePage'}">
<table>
<form action="${pageContext.request.contextPath}/forum/ArticlesActionCtrl" method='post'>
<tr>
	<td>標題</td>
	<td>
		<select name='art_type_name'>
		<c:forEach begin="0" end="${fn:length(art_types)-1 }" varStatus="loop2">
		<option value='[${art_types[loop2.count-1].art_type_name}]'>${art_types[loop2.count-1].art_type_name}</option>		
		</c:forEach>		
		</select></td>
	<td><input type='text' name='art_name'  ><input type='hidden' name='forum_no' value='${param.forum_no }'><input type='hidden' name='action' value='create'></td>
</tr>
<tr><td>內文</td><td colspan='2'><textarea name='art_ctx' cols='30' rows='20' ></textarea></td></tr>
<tr><td style='text-align: center' colspan='3'><button type='submit'>送出</button><button type='reset'>清除</button></td></tr>
</form>
</table>
</c:if>
<c:if test="${param.action=='goUpdatePage'}">
<table>
<form action="${pageContext.request.contextPath}/forum/ArticlesActionCtrl" method='post'>
<tr>
	<td>標題</td>
	<td>
		<select name='art_type_name'>
		<c:forEach begin="0" end="${fn:length(art_types)-1}" varStatus="loop">
		<c:set var="type" value="[${art_types[loop.count-1].art_type_name}]"/>
		<option value='<c:out value='${type }'/>' <c:if test='${type==articles.art_type}'>selected </c:if>><c:out value='${art_types[loop.count-1].art_type_name }'/></option>
		</c:forEach>		
		</select></td>
	<td><input type='text' name='art_name' value='${articles.art_name }' ><input type='hidden' name='forum_no' value='${param.forum_no }'><input type='hidden' name='art_no' value='${param.art_no }'><input type='hidden' name='action' value='update'></td>
</tr>
<tr><td>內文</td><td colspan='2'><textarea name='art_ctx' cols='30' rows='20' >${articles.art_ctx }</textarea></td></tr>
<tr><td style='text-align: center' colspan='3'><button type='submit'>更新</button><button type='reset'>清除</button></td></tr>
</form>
</table>
</c:if>
<a href='${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }'>返回板塊區</a>
</body>
</html>