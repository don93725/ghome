<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<tr>
	<th>�s��</th>
	<th>�׾�</th>
	<th>����</th>
	<th>�ӽЭ�]</th>
	<th>�f�֪��A</th>
	<th>�f�֨M�w</th>
	
</tr>
<c:forEach var="forum" items="${forums }">
<tr>
	<td>${forum.forum_no }</td>
	<td><a
		href='${pageContext.request.contextPath}/forum/ForumShowCtrl?forum_no=${forum.forum_no }'>${forum.forum_name }</a></td>
	<td>${forum.forum_desc }</td>
	<td>${forum.forum_note}</td>
	<td>${forum.forum_stat }</td>
	<td>
	<a href='${pageContext.request.contextPath}//forum/ForumsManagerCtrl?action=confirm&forum_no=${forum.forum_no }&forum_stat=1&thisPage=${thisPage }'><button>�q�L</button></a>
	<a href='${pageContext.request.contextPath}//forum/ForumsManagerCtrl?action=confirm&forum_no=${forum.forum_no }&forum_stat=2&thisPage=${thisPage }'><button>���q�L</button></a>
	</td>
	
</tr>

</c:forEach>
</table>
<jsp:include page="/back_end/forum/ChangePage.jsp"></jsp:include>
</body>
</html>