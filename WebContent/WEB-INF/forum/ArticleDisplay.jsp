<%@ page language="java" import="com.forum.domain.*,java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%Articles articles=(Articles)request.getAttribute("articles");
	List<Article_comments> article_comments = (List<Article_comments>)request.getAttribute("article_comments");
	int allPageCount=Integer.parseInt(request.getAttribute("allPageCount").toString());
	int thisPage = Integer.parseInt(request.getAttribute("thisPage").toString());%>
<title>Insert title here</title>
</head>
<body>
><a href="${pageContext.request.contextPath}/forum/ForumCL">討論大廳</a>><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${param.forum_no }">${forum_name }</a>
<%if(thisPage==1){ %>
<div>
<table border='1'>
<tr>
	
	<td rowspan='3' width='100' style='text-align: center' valign="top">圖片<br><%=articles.getMem_no() %><br>名稱<br>身份</td>
	<td><%=articles.getArt_name() %></td>
</tr>
<tr><td width='600' height='100' valign="top"><%=articles.getArt_ctx() %></td></tr>
</table>
</div>
<%} %>
<%for(int i = 0 ; i < article_comments.size() ; i++){
	Article_comments comments=article_comments.get(i);%>
<div>
<table border='1'>
<tr>
	
	<td rowspan='3' width='100' style='text-align: center' valign="top">圖片<br><%=comments.getMem_no() %><br>名稱<br>身份</td>
	
</tr>
<tr><td width='600' height='100' valign="top"><%=comments.getArt_cmt_ctx() %></td></tr>
</table>
</div>
<%} %>
<jsp:include page="/WEB-INF/forum/ChangePage.jsp"/>
<%if(session.getAttribute("user")!=null){ %>
<div>
<table border='1'>
<form action="${pageContext.request.contextPath}/forum/ArtCmtMakerCtrl?forum_no=${param.forum_no}&art_no=${articles.art_no}" method="post">
<tr>
	<td rowspan='2' width='100' align="center"">留言</td>
	<td width='600' height='100' align="center"><textarea style="width:592px;height:120px" name='art_cmt_ctx'></textarea></td>	
</tr>
<tr><td  align="center" ><input type='submit' value='送出'><input type='submit' value='重填'></td></tr>
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