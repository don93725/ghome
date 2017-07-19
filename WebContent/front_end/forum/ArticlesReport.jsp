<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

<div>
<table border='1'>
<tr>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }">����</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=0">�A�Ϊ[��</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=1">�t�Q�K�T</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=2">�H������</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=3">�F�v���D</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=4">��L	</a></td>
</tr></table>
</div>

<div>
	<table border="1">
		<tr>
			<th>�Q���|�峹</th>
			<th>���|�H</th>
			<th>���|����</th>
			<th>���|��]</th>
			<th>���|�ɶ�</th>
		</tr>
		<c:forEach var="article_report" items='${article_report }'>
		<tr>
			<td>${article_report.art_no.art_name}</td>
			<td>${article_report.rpt_mem_no}</td>
			<td>
			<c:if test="${article_report.rpt_type==0}">�A�Ϊ[��</c:if>
			<c:if test="${article_report.rpt_type==1}">�t�Q�K�T</c:if>
			<c:if test="${article_report.rpt_type==2}">�H������</c:if>
			<c:if test="${article_report.rpt_type==3}">�F�v���D</c:if>
			<c:if test="${article_report.rpt_type==4}">��L</c:if>					
			</td>
			<td>${article_report.rpt_ctx}</td>
			<td><fmt:setLocale value="en_US"/><fmt:formatDate value="${article_report.rpt_time}" pattern="yyyy-MM-d HH:mm"/></td>
		</tr>
		</c:forEach>
	</table>
	</div>
	<jsp:include page="/front_end/forum/ChangePage.jsp"/>
</body>
</html>