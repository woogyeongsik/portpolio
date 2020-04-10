<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="${pageContext.request.contextPath }/assets/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/assets/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/assets/css/sidebar.css" />

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

#btn1 {
	padding: 8px 25px;
}

.cmt_input {
	display: inline;
}

h4 {
	margin-top: 0;
}

.replycontent {display ="inline-block; "

}
.replyUpdateBtn{margin: 0 5px;}
#cmt_btn{ text-align: right;
}
#reg_date{padding: 50px;}
</style>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>

	<div class="container">
		<!-- 현재 페이지 위치 -->
		<div class="path_board">
			<ol class="breadcrumb text-right">
				<li><a href="${pageContext.request.contextPath }/mainPage.jsp"
					class="home">HOME</a></li>
				<li class="active">게시판정보</li>
			</ol>
		</div>
		<h2>
			&emsp;<strong>게시판 정보</strong>
		</h2>
		<hr style="border: solid 1px #eeeeee;">
		<!-- 공지사항 상세조회 -->
		<table class="table">
			<tr>
							<td align="center">게시판 일련번호</td><td>${item.board_id}</td>
			</tr>
			<tr>
							<td align="center">게시판명</td><td><a href="${viewUrl}">${board_name}</a></td>
			</tr>
			<tr>
							<td align="center">게시판 설명</td><td>${item.board_desc}</td>
			</tr>
			<tr>
							<td align="center">비밀글 허용 여부</td><td>${item.secret}</td>
			</tr>
			<tr>
							<td align="center">읽기 권한</td><td>${item.read_allow}</td>
			</tr>
			<tr>
							<td align="center">쓰기 권한</td><td>${item.write_allow}</td>
			</tr>
			<tr>
							<td align="center">댓글 쓰기 권한</td><td>${item.reply_allow}</td>
			</tr>
			<tr>
							<td align="center">생성일</td><td>${item.reg_date}</td>
			</tr>
			<tr>
							<td align="center">수정일</td><td>${item.edit_date}</td>
			</tr>
			<tr>
							<td align="center">삭제 여부</td><td>${item.board_del}</td>
			</tr>
</tbody>
		</table>

		<div class="text-right">
			<button class="btn btn-primary" id="btn1" type="button"
				onclick="location.href='${pageContext.request.contextPath}/board/manage_list.do' ">목록</button>
		</div>
		<div class="text-right">
			<button class="btn btn-primary" id="btn2" type="button"
				onclick="location.href='${pageContext.request.contextPath}/board/manage_add.do' ">등록</button>
		</div>
		<div class="text-right">
			<button class="btn btn-primary" id="btn3" type="button"
				onclick="location.href='${pageContext.request.contextPath}/board/manage_edit.do?board_id=${output.board_id}' ">수정</button>
		</div>
		</div>
		<div class="text-right">
			<button class="btn btn-primary" id="btn4" type="button"
				onclick="location.href='${pageContext.request.contextPath}/board/board_delete_ok.do?board_id=${output.board_id}' ">삭제</button>
		</div>
		<br />

<%@ include file="../inc/sidebar3.jsp"%>

	<%@ include file="../inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



</body>
</html>
