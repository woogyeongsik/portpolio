<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>헛둘, 헛둘!</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- ajax-helper -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/sidebar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/ranking.css">


<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
</head>

<body>
	<%@ include file="../inc/header.jsp"%>
	<div class="middle-body">
		<div class="container">
			<div class="page-header">
				<h2>랭킹 Best</h2>
			</div>
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button"
					id="dropdownMenu1" data-toggle="dropdown">
					20대<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="${pageContext.request.contextPath}/totalRank.do">전체</a></li>
					<li role="separator" class="divider"></li>
					<li class="dropdown-header">연령대</li>
					<li><a href="${pageContext.request.contextPath}/rankBest-10.do">10대</a></li>
					<li><a href="${pageContext.request.contextPath}/rankBest-20.do">20대</a></li>
					<li><a href="${pageContext.request.contextPath}/rankBest-30.do">30대</a></li>
					<li><a href="${pageContext.request.contextPath}/rankBest-40.do">40대</a></li>
					<li><a href="${pageContext.request.contextPath}/rankBest-50.do">50대</a></li>
					<li><a href="${pageContext.request.contextPath}/rankBest-60.do">60대 이상</a></li>
					<li role="separator" class="divider"></li>
					<li class="dropdown-header">성별</li>
					<li><a href="${pageContext.request.contextPath}/rankBest-F.do">여성</a></li>
					<li><a href="${pageContext.request.contextPath}/rankBest-M.do">남성</a></li>
					</li>
				</ul>
			</div>
			<div class="row">
				<!-- 조회 목록 -->
				<c:choose>
					<%--조회결과가 없는 경우 --%>
					<c:when test="${output==null || fn:length(output) == 0 }">
						<tr>
							<td colspan="10" align="center">조회결과가 없습니다.</td>
						</tr>
					</c:when>
					<%-- 조회 결과가 있는 경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" varStatus="status">
							<div class="col-md-4">
								<!-- .thumbnail은 박스에 회색 테두리를 쳐준다. -->
								<a href="${pageContext.request.contextPath}/page.do?nm=${item.nm}"
									class="thumbnail">
									<div class="img">
										<img src="${pageContext.request.contextPath}/assets/img/${item.nm}.jpg"
											class="img-responsive" />
									</div>
									<div class="rank">
										<p>${status.count}</p>
									</div>
									<p>${item.nm_gu}</p>
									<h4>
										<strong>${item.nm}</strong>
									</h4>
									<p class="text-right text-muted">
										<small>평점 ${item.scoreAvg}/5</small> <small>리뷰수:${item.countReview}개</small>
									</p>
								</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@ include file="../inc/footer.jsp"%>
	<%@ include file="../inc/sidebar3.jsp"%>
</body>

</html>