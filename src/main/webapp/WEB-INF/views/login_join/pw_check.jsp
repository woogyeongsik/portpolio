<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>pw_check</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">

<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
<style>
.form-group1 {
	width: 350px;
	height: 210px;
	margin: 100px auto;
	border: 2px solid #222;
    background-color: #dedede;
}
.y {
	width: 70%;
	margin: 10px auto;
	margin-top: 10px;
}
.j {
	width: 80%;
	padding: 5px 0;
	font-size: 12px;
	border: 1px solid #eee;
	margin: auto;
}
.btn-sm {
	margin: auto;
	margin-left: 130px;
	margin-top: 10px;
	background-color: gray;
	color: white;
	width:70px;

}
div.font1 {
	margin-top: 35px;
	margin-left: 70px;
	font-size: 1em;
}

body {
	overflow: hidden;
}

</style>
</head>
<body>
<%@ include file="../inc/header.jsp"%>
	<form action="">
		<fieldset>
			<div class="form-group">
			<div class="font1">회원님의 정보를 수정하시려면<br/>비밀번호를 다시 입력해주세요.</div>
			<br/>
			<div>
				<!-- <div class="input-group">
            <div class="input-group-addon"></div>
				<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder=" password" />
				</div> -->

				<div class="input-group y">
						<div class="input-group-addon"><span class="glyphicon glyphicon-ok"></span></div>
						<input style="margin-left: 10px; " type="password" class="form-control j" id="user_pw" name="user_pw" placeholder=" password" required="required"/>
						</div>
			<div>
				<a href="${pageContext.request.contextPath}/join_edit.do" class="btn btn-default btn-sm">확인</a>
				</div>

			</div>
		</div>
		</fieldset>
	</form>
	<%@ include file="../inc/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
</body>

</html>