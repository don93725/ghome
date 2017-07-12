<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%int allPageCount=Integer.parseInt(request.getAttribute("allPageCount").toString());
  int thisPage = Integer.parseInt(request.getAttribute("thisPage").toString());
  %>
  <div style="width: 465px ; margin-bottom:1em;height: 50px" align="right">
	
	<ul class="pagination">  
	<%if(thisPage>1){ %>
	<li><a href="${pageContext.request.contextPath}/forum/${queryStr}&thisPage=${thisPage-1}">&laquo;</a></li>
		
	<%}for(int i = thisPage-3; i<thisPage+3;i++){
		if(i>0&&i<allPageCount+1){
			if(i==thisPage){ %>
	   		<li class="active"><a href="${pageContext.request.contextPath}/forum/${queryStr}&thisPage=<%=i%>"><%=i %></a></li>
	   <%}else{ %>
			<li><a href="${pageContext.request.contextPath}/forum/${queryStr}&thisPage=<%=i%>"><%=i %></a></li>	   
	   <%}%>
	<%}} %>
	<%if(thisPage<allPageCount){ %>
	<li><a href="${pageContext.request.contextPath}/forum/${queryStr}&thisPage=${thisPage+1}">&raquo;</a></li>
	<%}%>
		</ul>
	
</div>
</body>
</html>