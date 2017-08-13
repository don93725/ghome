<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-ch-en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/front_end/forum/css/ArticleDisplay.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front_end/comm/css/sweetalert.css">

</head>
<body>
><a href="${pageContext.request.contextPath}/forum/ForumShowCtrl?&forum_no=${param.forum_no }">${forum_name }</a>>管理檢舉
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12">

<div class="col-xs-12 col-sm-12">

<a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }"><span class='label label-default' >全部</span></a>
<a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=0"><span class='label label-default' >涉及歧視</span></a>
<a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=1"><span class='label label-default' >含十八禁</span></a>
<a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=2"><span class='label label-default' >人身攻擊</span></a>
<a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=3"><span class='label label-default' >政治問題</span></a>
<a href="${pageContext.request.contextPath}/forum/ArticlesReportActionCtrl?action=select&forum_no=${param.forum_no }&rpt_type=4"><span class='label label-default' >其他</span></a>
</div>

<div class="col-xs-12 col-sm-12">
				<div class="panel panel-default">
	<table class="table table-hover">
		<thead>
			<tr class='active'>
				<th>被檢舉文章</th>
				<th>檢舉人</th>
				<th>檢舉類型</th>
				<th>檢舉原因</th>
				<th>檢舉時間</th>
				<th>處理</th>
			</tr>
		</thead>
		<tbody>
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
			<button class='btn btn-danger delRpt' value='${article_report.art_no.art_no }'>刪除</button>
			<button class='btn btn-default fininshRpt' value='${article_report.art_rpt_no }'>忽略</button>
			</td>
		</tr>
		<tr style="display: none;">
			<td colspan="6" >${article_report.art_no.art_ctx}</td>			
		</tr>
		</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="/front_end/forum/ChangePage.jsp"/>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src='${pageContext.request.contextPath}/front_end/comm/js/sweetalert.min.js'></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/front_end/forum/js/ArticlesReport.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>