<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<%int allPageCount=Integer.parseInt(request.getAttribute("allPageCount").toString());
  int thisPage = Integer.parseInt(request.getAttribute("thisPage").toString());
  %>
  <div style="width: 465px ; height: 50px" align="right">
	<table>
	<tr><td colspan='5' style='text-align: center'>
	<%if(thisPage>1){ %>
	<a href='${pageContext.request.contextPath}/forum/${queryStr}&thisPage=${thisPage-1}'>上一頁</a>
	<%} %>
	<% for(int i = thisPage-3; i<thisPage+3;i++){
		if(i>0&&i<allPageCount+1){%>	
	<a href='${pageContext.request.contextPath}/forum/${queryStr}&thisPage=<%=i%>'> <%=i %> </a>
	<%}} %>
	<%if(thisPage<allPageCount){ %>
	<a href='${pageContext.request.contextPath}/forum/${queryStr}&thisPage=${thisPage+1}'>下一頁</a>
	<%} %>	
	</td>
	</tr>
	<tr><td colspan='5' style='text-align: center'>
	現在頁數 ${thisPage}/${allPageCount}
	</td></tr>	
	</table>
</div>
</body>
</html>