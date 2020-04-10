<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/sidebar.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/plugins/sweetalert/sweetalert2.min.css" />

<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
<style type="text/css">
.table-top {
	border-top: 1.9px solid #cccccc;
}

.breadcrumb>li+li:before {
	content: "> \00a0" !important;
}

.breadcrumb {
	background-color: #ffffff;
}

.table>tbody {
	border: 1px solid #cccccc;;
}

#btn1, #btn2, #btn3 {
	margin: 5px;
	padding: 8px 22px;
}

.title {
	color: white;
	font-size: 36px;
	text-shadow: 0 1px #000;
}

.content {
	color: white;
	font-size: 18px;
	text-shadow: 0 1px #000;
}
</style>
<title>헛둘헛둘!</title>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>
	<div class="container">
		<div class="path_board">
			<ol class="breadcrumb text-right">
				<li><a href="<%=request.getContextPath()%>/mainPage.jsp"
					class="home">HOME</a></li>
				<li class="active">Q &amp; A</li>
			</ol>
		</div>
		<h1>
			&emsp;<strong>Q&amp;A</strong>
		</h1>
		<hr style="border: solid 1px #eeeeee;">
		<table class="table" border="1">
			<tbody>
				<tr>
					<th class="active text-center" style="width: 15%">제목</th>
					<td colspan="5">고양이 데려가도 되나요?</td>
				</tr>
				<tr>
					<th class="active text-center" style="width: 15%">작성자</th>
					<td>애 묘 인</td>
					<th class="active text-center" style="width: 15%">작성일</th>
					<td>2019-12-09</td>
				</tr>
				<tr>
					<td colspan="6"><textarea class="form-control" rows="20"
							id="comment">
고양이랑 같이 운동 하고 싶은데 데려가도 되나요?


================================================

안녕하세요. 홈페이지 관리자 입니다.
현재 모든 공공체육센터는 애완 동물의 출입을 금지 하고 있습니다.

자세한 문의는 해당 시설에 전화 바랍니다.
 </textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="text-right">
			<button id="btn1" name="btn1" class="btn btn-primary" type="button"
				onclick="location.href='qna_list.jsp' ">목록</button>
		</div>
		<br />
	</div>
	<%@ include file="../inc/footer.jsp"%>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>

</body>
</html>