<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<script
	src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/sidebar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/searchPlace.css">

<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
</head>

<body>
	<%@ include file="../inc/header.jsp"%>
	<div class="middle-body">
		<div class="container">
			<div class="page-header">
				<h2>시설검색</h2>
			</div>
			<div class="row">
				<div class="navbar navbar-default">
					<div class="category-box">
						<div class="col-md-2" id="category-text">
							<h4>
								<strong>지역 선택</strong>
							</h4>
						</div>
						<div class="col-md-10">
							<form class="check-area">
								<label><input type='checkbox' value='jongro'>종로구</label>
								<label><input type='checkbox' value='joong'>중구</label> <label><input
									type='checkbox' value='yongsan'>용산구</label> <label><input
									type='checkbox' value='seongdong'> 성동구</label> <label><input
									type='checkbox' value='gwangjin'>광진구</label> <label><input
									type='checkbox' value='dondaemoon'>동대문구</label> <label><input
									type='checkbox' value='joongrang'>중랑구</label> <label><input
									type='checkbox' value='seongbook'>성북구</label> <label><input
									type='checkbox' value='gangbook'>강북구</label> <label><input
									type='checkbox' value='dobong'>도봉구</label> <label><input
									type='checkbox' value='nowon'>노원구</label> <label><input
									type='checkbox' value='eunpyeong'>은평구</label> <label><input
									type='checkbox' value='seodaemoon'>서대문구</label> <label><input
									type='checkbox' value='mapo'>마포구</label> <label><input
									type='checkbox' value='yangcheon'>양천구</label> <label><input
									type='checkbox' value='gangseo'>강서구</label> <label><input
									type='checkbox' value='guro'>구로구</label> <label><input
									type='checkbox' value='geumcheon'>금천구</label> <label><input
									type='checkbox' value='yeondeungpo'>영등포구</label> <label><input
									type='checkbox' value='dongjak'>동작구</label> <label><input
									type='checkbox' value='gwanak'>관악구</label> <label><input
									type='checkbox' value='seocho'>서초구</label> <label><input
									type='checkbox' value='gangnam'>강남구</label> <label><input
									type='checkbox' value='songpa'>송파구</label> <label><input
									type='checkbox' value='gangdong'>강동구</label>
							</form>
						</div>
					</div>
				</div>
				<div class="btn-group" role="group">
					<button type="submit" class="btn btn-default">검색</button>
				</div>
			</div>
			<div class="page-header">
				<span id="search">검색결과</span> <span>&nbsp;&nbsp;${item.totalCount}</span>
			</div>
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
						<div class="media-list">
							<div class="media">
								<a class="pull-left"
									href="${pageContext.request.contextPath}/detailpage.do"> <img
									class="media-object"
									src="${pageContext.request.contextPath}/assets/img/${item.nm}.jpg"
									alt="Image">
								</a>
								<div class="media-body">
									<h4 class="media-heading">
										<strong>${item.nm}</strong>
									</h4>
									<p class="tag">${item.tag}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<nav aria-label="Page navigation">
				<!-- 페이지 번호 구현 -->
				<ul class="pagination">
					<%-- 이전 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 이전 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/commonMyPage.do" var="prevPageUrl">
								<c:param name="page" value="${pageData.prevPage}" />
							</c:url>
							<c:if test="${output != null || fn:length(output) != 0 }">
								<li><a href=${prevPageUrl }>«</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${output != null || fn:length(output) != 0 }">
								<li><a class="hover_hide">«</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>


					<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
					<c:forEach var="i" begin="${pageData.startPage}"
						end="${pageData.endPage}" varStatus="status">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/commonMyPage.do" var="pageUrl">
							<c:param name="page" value="${i}" />
						</c:url>

						<%-- 페이지 번호 출력 --%>
						<c:choose>
							<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
							<c:when test="${pageData.nowPage == i}">
								<c:if test="${output != null || fn:length(output) != 0 }">
									<li><a class="click hide_hover">${i }</a></li>
								</c:if>
							</c:when>
							<%-- 나머지 페이지의 경우 링크 적용함 --%>
							<c:otherwise>
								<c:if test="${output != null || fn:length(output) != 0 }">
									<li><a href="${pageUrl }">${i }</a></li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%-- 다음 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 다음 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.nextPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/commonMyPage.do" var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
							</c:url>
							<c:if test="${output != null || fn:length(output) != 0 }">
								<li><a href="${nextPageUrl}">»</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${output != null || fn:length(output) != 0 }">
								<li><a class="hover_hide">»</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>

	<%@ include file="../inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
</body>

</html>