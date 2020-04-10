<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>헛둘헛둘!</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/sidebar.css">

<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
<style>

.p {
	text-align: center;
	font-size: 15px;
}

</style>
</head>

<body>
	<%@ include file="../inc/header.jsp"%>

	<div class="container">

		<!-- 검색결과 : 공지사항 -->
		<div>
			<div class="page-header">
				<h3>
					공지사항 검색 결과 <span>0건</span>
				</h3>

			</div>
			<div id="notice_nav_search" class="notice_nav_search">
			<br />
			<br />
				<p class="p"><strong>'<span>센터</span>'</strong>와/과 일치하는 검색 결과가 없습니다.</p>
			</div>
		</div>

	</div>

	<%@ include file="../inc/footer.jsp"%>

	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>

</body>

</html>