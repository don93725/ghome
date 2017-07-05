<%@ page language="java" import="java.util.*,com.forum.domain.*,java.text.SimpleDateFormat" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<%List<Articles> list =(List<Articles>) request.getAttribute("articles");
	int allPageCount=Integer.parseInt(request.getAttribute("allPageCount").toString());
	int thisPage = Integer.parseInt(request.getAttribute("thisPage").toString());
	String forum_no = request.getParameter("forum_no").toString();
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy MMM d HH:mm   ",Locale.US);%>
<body>
><a href="${pageContext.request.contextPath}/forum/ForumCtrl">討論大廳</a><br>
<%if(session.getAttribute("user")!=null){ %>
<a href='${pageContext.request.contextPath}/forum/ArticlesMakerCtrl?action=new&forum_no=${param.forum_no }'>新增文章</a>
<%} %>
<table border=1>
<tr><th>文章類型</th><th>文章標題</th><th>發文者</th><th>發文時間</th><th>瀏覽次數</th></tr>
<%for(int i = 0 ;i<list.size();i++){
	Articles art =list.get(i);%>
	<tr>
		
		<td><%= art.getArt_type()%></td>
		<td><a href="${pageContext.request.contextPath}/forum/ArticleShowCtrl?forum_no=${param.forum_no }&art_no=<%=art.getArt_no()%>"><%=art.getArt_name() %></a></td>
		<td><%= art.getMem_no()%></td>
		<td><%=sdf.format(art.getArt_add_date())%></td>
		<td><%= art.getArt_view()%></td>
	</tr>
	<%} %>
	</table>
<jsp:include page="/WEB-INF/forum/ChangePage.jsp"/>




</body>
</html>