<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<script type="Text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/ArticlesReport.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/ArticleDisplay.css">
</head>
<body>
><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?&forum_no=${param.forum_no }">${forum_name }</a>>編輯論壇
<div>
<table border='1'>
<tr>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }">全部</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=0">涉及歧視</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=1">含十八禁</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=2">人身攻擊</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=3">政治問題</a></td>
<td><a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=4">其他	</a></td>
</tr></table>
</div>

<div>
	<table border="1">
		<tr>
			<th>被檢舉文章</th>
			<th>檢舉人</th>
			<th>檢舉類型</th>
			<th>檢舉原因</th>
			<th>檢舉時間</th>
			<th>處理</th>
		</tr>
		<c:forEach var="article_report" items='${article_report }' varStatus="loop">
		<tr class="art_rpt">
			<td><a target="_blank" href="${pageContext.request.contextPath}/forum/ArticleShowCtrl?forum_no=${article_report.art_no.forum_no }&art_no=${article_report.art_no.art_no}">${article_report.art_no.art_name}</a></td>
			<td><a target="_blank" href='${pageContext.request.contextPath}/forum/PersonalPageCtrl?mem_no=${article_report.rpt_mem_no.mem_no}'>${article_report.rpt_mem_no.mem_nickname}</a></td>
			<td>
			<c:if test="${article_report.rpt_type==0}">涉及歧視</c:if>
			<c:if test="${article_report.rpt_type==1}">含十八禁</c:if>
			<c:if test="${article_report.rpt_type==2}">人身攻擊</c:if>
			<c:if test="${article_report.rpt_type==3}">政治問題</c:if>
			<c:if test="${article_report.rpt_type==4}">其他</c:if>					
			</td>
			<td>${article_report.rpt_ctx}</td>
			<td><fmt:setLocale value="en_US"/><fmt:formatDate value="${article_report.rpt_time}" pattern="yyyy-MM-d HH:mm"/></td>
			<td>
			<button class='delRpt' value='${article_report.art_no.art_no }'>刪除</button>
			<button class='fininshRpt' value='${article_report.art_rpt_no }'>完成</button>
			</td>
		</tr>
		<tr style="display: none;">
			<td colspan="6" >${article_report.art_no.art_ctx}</td>			
		</tr>
		</c:forEach>
	</table>
	</div>
	<jsp:include page="/front_end/forum/ChangePage.jsp"/>
	<div id='tips'></div>
</body>
</html>