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

.padding {
	padding-bottom: 50px;
}

.more a {
	display: block;
	position: absolute;
	right: 15px;
	top: -22px;
	font-size: 13px;
	text-decoration: none;
	color: black;
}

.parent {
	position: relative;
}
</style>
</head>

<body>
	<%@ include file="../inc/header.jsp"%>
	<br />
	<div class="container con">
		<div>
			<h2>
				'<span>센터</span>'에 대한 검색결과 <span>3건</span>
			</h2>
		</div>
		<!-- 검색결과: 시설 -->
		<div>
			<div class="page-header">
				<h4>
					시설 검색 결과 <span>3건</span>
				</h4>
				<div class="parent">
					<p class="more">
						<a href="${pageContext.request.contextPath}/nav_search_place.do" title="더보기">더보기 +</a>
					</p>
				</div>
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
		<!-- 검색결과 : 공지사항 -->
		<div>
			<div class="page-header">
				<h4>
					공지사항 검색 결과 <span>0건</span>
				</h4>
				<div class="parent">
					<p class="more">
						<a href="${pageContext.request.contextPath}/nav_search_notice.do" title="더보기">더보기 +</a>
					</p>
				</div>
			</div>
			<div id="notice_nav_search">
				<p>검색 결과가 없습니다.</p>
			</div>
		</div>
		<!-- 검색결과: QnA -->
		<div class="padding">
			<div class="page-header">
				<h4>
					Q&amp;A 검색 결과 <span>0건</span>
				</h4>
				<div class="parent">
					<p class="more">
						<a href="${pageContext.request.contextPath}/nav_search_qna.do" title="더보기">더보기 +</a>
					</p>
				</div>
			</div>
			<div id="qna_nav_search">
				<p>검색 결과가 없습니다.</p>
			</div>
		</div>
	</div>

	<%@ include file="../inc/footer.jsp"%>

	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>

</body>

</html>