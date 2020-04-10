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
					<td>애묘인</td>
					<th class="active text-center" style="width: 15%">작성일</th>
					<td>2019-12-09</td>
				</tr>
				<tr>
					<td colspan="6"><textarea class="form-control" rows="20"
							id="comment">고양이랑 같이 운동하고 싶은데 데려가도 되나요?</textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="text-right">
			<button id="btn1" name="btn1" class="btn btn-primary" type="button"
				onclick="location.href='qna_list.jsp' ">목록</button>

			<button id="btn2" name="btn2" class="btn btn-primary" type="button"
				onclick="location.href='qna_edit.jsp' ">수정</button>

			<button id="btn3" name="btn3" class="btn btn-primary" type="button">
				삭제</button>
		</div>
		<br />
	</div>
	<%@ include file="../inc/footer.jsp"%>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
	<script
		src="<%=request.getContextPath()%>/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script>
		$(function() {
			$("#btn3").click(function() {
				swal({
					title : '확인',
					text : '작성하신 글을 정말로 삭제하시겠습니까?',
					type : 'warning',
					confirmButtonText : '예',
					showCancelButton : true,
					cancelButtonText : '아니오',
				}).then(function(result) {
					if (result.value) {
						swal('삭제', '삭제 완료되었습니다.', 'success');
						window.location = "qna_delete_ok.jsp";
					}
				});
			});
		});
	</script>
</body>
</html>