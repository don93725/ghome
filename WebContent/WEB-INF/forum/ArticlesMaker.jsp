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
<script type="Text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<link rel="stylesheet" href="/Forum/forum/css/ArticleDisplay.css">
<link rel="stylesheet" href="/Forum/forum/js/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="/Forum/forum/js/kindeditor/kindeditor-all2.js"></script>
<script charset="utf-8" src="/Forum/forum/js/kindeditor/lang/zh-TW.js"></script>
<script type="Text/JavaScript" src="/Forum/forum/js/ArticlesMaker.js"></script>

</head>
<body>
<c:if test="${param.action=='goCreatePage'}">
<table>
<form action="${pageContext.request.contextPath}/forum/ArticlesActionCtrl" method='post' enctype='multipart/form-data'>
<tr>
	<td>標題</td>
	<td>
		<select name='art_type_name'>		
		<c:forEach begin="0" end="${fn:length(art_types)-1 }" varStatus="loop2">
		<option value='${art_types[loop2.count-1].art_type_name}'>${art_types[loop2.count-1].art_type_name}</option>		
		</c:forEach>		
		</select></td>
	<td><input type='text' name='art_name'  ><input type='hidden' name='forum_no' value='${param.forum_no }'><input type='hidden' name='action' value='create'></td>
</tr>
<tr>
<td>內文</td><td colspan='2'>
<div contentEditable="true" id='ctx' name='content' style='width:600px; height:300px '></div>
<textarea id="my-textarea" name='art_ctx' style="display:none"></textarea>
<input type="text" id='order' name='order' />       
<input type="file" id='file0' name='file' style="display:none"/> 
<input type="file" id='file1' name='file' style="display:none"/>
<input type="file" id='file2' name='file' style="display:none"/>
<input type="file" id='file3' name='file' style="display:none"/>
<input type="file" id='file4' name='file' style="display:none"/></td></tr>
<tr><td style='text-align: center' colspan='3'><input type='submit' name="getHtml" value='送出'/><button type='reset'>清除</button></td></tr>
</form>
</table>
</c:if>
<c:if test="${param.action=='goUpdatePage'}">
<table>
<form action="${pageContext.request.contextPath}/forum/ArticlesActionCtrl" method='post' enctype='multipart/form-data'>
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
<tr><td>內文</td>
<td colspan='2'>
<div contentEditable="true" id='ctx' name='content' style='width:600px; height:300px '>${articles.art_ctx}</div>
<textarea id="my-textarea" name='art_ctx' style="display:none"></textarea> 
<input type="text" id='updateInfo' name='updateInfo' />   
<input type="text" id='order' name='order' />   
<input type="text" id='deleteInfo' name='deleteInfo' />  
<input type="file" id='file0' name='file' /> 
<input type="file" id='file1' name='file' />
<input type="file" id='file2' name='file' />
<input type="file" id='file3' name='file' />
<input type="file" id='file4' name='file' />
</td></tr>
<tr><td style='text-align: center' colspan='3'><input type='submit' name="getHtml" value='更新'><button type='reset'>清除</button></td></tr>
</form>
</table>
</c:if>
<a href='${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }'>返回板塊區</a>
</body>
</html>