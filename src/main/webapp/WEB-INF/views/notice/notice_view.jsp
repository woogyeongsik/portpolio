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
				<li><a href="<%=request.getContextPath()%>/mainPage.jsp"
					class="home">HOME</a></li>
				<li class="active">공지사항</li>
			</ol>
		</div>
		<h2>
			&emsp;<strong>공지사항</strong>
		</h2>
		<hr style="border: solid 1px #eeeeee;">
		<!-- 공지사항 상세조회 -->
		<table class="table">
			<tbody>
				<tr>
					<th class="active text-center" style="width: 15%">제목</th>
					<td colspan="5">신규가입 관련 공지 입니다.</td>
				</tr>
				<tr>
					<th class="active text-center" style="width: 15%">작성자</th>
					<td>관리자</td>
					<th class="active text-center" style="width: 15%">작성일</th>
					<td>2018-11-28</td>
					<th class="active text-center" style="width: 15%">조회</th>
					<td>2443</td>
				</tr>
				<tr>
					<td colspan="6"><textarea class="form-control" rows="25"
							id="comment">공지사항 내용 입니다.</textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="text-right">
			<button class="btn btn-primary" id="btn1" type="button"
				onclick="location.href='notice_list.jsp' ">목록</button>
		</div>
		<br />
		<!-- 	댓글 작성 -->
		<div class=" reply_wirte col-sm-12 well">
			<h4>
				<strong>Comment</strong>
			</h4>
		<hr style="border: solid 2px #d3d3d3;">
			<form class="form-inline">
				<div class="form-group">
					<label for="reg_id">작성자: </label> <input type="text"
						class="form-control" id="reg_id" placeholder="아이디">
				</div>
				&emsp;
				<div class="form-group">
					<label for="reg_pw">비밀번호: </label> <input type="password"
						class="form-control" id="reg_pw" placeholder="비밀번호">
				</div>
				<div>
					<br />
					<div class="replycontent">
						<textarea class="form-control" style="width: 100%;"
							id="comment_text" rows="3" placeholder="댓글을 입력하세요."></textarea>
					</div>
					<br />
					<div class="text-right">
						<button type="submit" class="btn btn-info  ">등록</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 댓글 리스트-->
<div></div>
		<div class="panel panel-default">
			<div class="panel-heading"><h5>Comment List</h5></div>
			<div class="panel-body">
				<ol class="replyList">
					<li><span><strong> 애묘인</strong></span><span id="reg_date">2019-12-28</span>
				<span id="cmt_btn" class="text-right">
					<button type="button" class="replyUpdateBtn btn btn-success btn-xs">수정</button>
					<button type="button" class="replyDeleteBtn btn btn-warning btn-xs">삭제</button>
				</span>
						<hr />
						<p>댓글입니다.
					</p>
					</li>
				</ol>
			</div>
		</div>
	</div>
	<%@ include file="../inc/footer.jsp"%>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
</body>
</html>