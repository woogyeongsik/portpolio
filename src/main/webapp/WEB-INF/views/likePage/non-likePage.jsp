	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>헛둘헛둘</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/sidebar.css" />

	<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
	<style>
	@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

	.breadcrumb>li+li:before {
	content: "> \00a0" !important;
	}
	.breadcrumb {
	background-color: #ffffff;
	}

	.animation {
	margin: auto;
	width: 7%;
	line-height: 25;
	}

	body {
	 overflow: hidden;
	}
	</style>
</head>

<body>
	<%@ include file="../inc/header.jsp" %>
		<div class="path_board">
			<ol class="breadcrumb text-right">
				<li><a href="${pageContext.request.contextPath}/"
					class="home">HOME	</a></li>
				<li class="active">마이페이지 > 찜 목록</li>
			</ol>
		</div>
		<div class="animation" style="height:220px;">
		<i class="fa fa-spinner fa-pulse fa-5x"></i>
		</div>

			<form action="${pageContext.request.contextPath}/recommendPlace.do" style="margin: auto; width: 520px;">
			<div class="btn-group" role="group" aria-label="...">
			<p style="font:1.8em Nanum Gothic; line-height: 48px;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;찜 목록이 없습니다. <br> 회원님이 좋아하실만한 장소를 추천해 드립니다.</p>
  			<button type="submit" class="btn btn-default" style="margin: auto; left: 165px; top: 10px;">추천 장소페이지 이동</button>
  		</div>
			</form>

		<%@ include file="../inc/footer.jsp"%>
		<%@ include file="../inc/sidebar3.jsp" %>

</body>

</html>