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

/** nav-search CSS */
.nav_search_list li a {
	display: block;
	width: auto;
	padding: 10px;
	color: #222;
	text-decoration: none;
	position: relative;
}

.nav_search_list li a .thumb {
	width: 85px;
	height: 85px;
	display: block;
}

.nav_search_list .thumb img {
	width: 100%;
	height: 100%;
}

.nav_search_list .text {
	display: block;
	width: auto;
	position: absolute;
	left: 110px;
	top: 20px;
}

.nav_search_list .text span {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.nav_search_list .text .name {
	font-weight: bold;
}

.nav_search_list .text .desc {
	font-size: 0.9em;
	line-height: 50px;
}

.page {
	margin-top: 20px;
}


</style>
</head>

<body>
	<%@ include file="../inc/header.jsp"%>

	<div class="container">

		<!-- 검색결과: 시설 -->
		<div>
			<div class="page-header">
				<h3>
					시설 검색 결과 <span>3건</span>
				</h3>

			</div>
			<div id="gym_nav_search">
				<ul class="nav_search_list">
					<li><a href="#"> <span class="thumb"><img
								src="http://via.placeholder.com/85x85.png" alt="이미지1"></span> <span
							class="text"> <span class="name">은평구민체육<mark>센터</mark></span>
								<span class="desc">서울특별시 은평구 진관외동 위치, 유아스포츠단, 구립축구장 운영,
									스포츠 강좌 안내</span>
						</span>
					</a></li>
					<li><a href="#"> <span class="thumb"><img
								src="http://via.placeholder.com/85x85.png" alt="이미지1"></span> <span
							class="text"> <span class="name">은평구민체육<mark>센터</mark></span>
								<span class="desc">서울특별시 은평구 진관외동 위치, 유아스포츠단, 구립축구장 운영,
									스포츠 강좌 안내</span>
						</span>
					</a></li>
					<li><a href="#"> <span class="thumb"><img
								src="http://via.placeholder.com/85x85.png" alt="이미지1"></span> <span
							class="text"> <span class="name">은평구민체육<mark>센터</mark></span>
								<span class="desc">서울특별시 은평구 진관외동 위치, 유아스포츠단, 구립축구장 운영,
									스포츠 강좌 안내</span>
						</span>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="text-center page">
			<ul class="pagination">
				<li><a> <span>&laquo;</span>
				</a></li>
				<li><a>1</a></li>
				<li><a> <span>&raquo;</span>
				</a></li>
			</ul>
		</div>

	</div>

	<%@ include file="../inc/footer.jsp"%>

	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>

</body>

</html>