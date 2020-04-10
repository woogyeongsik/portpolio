<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>헛둘헛둘!</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
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

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: middle !important;
	border-top: 1px solid #ddd;
}

#btn1, #btn2 {
	padding: 8px 20px;
	margin: 5px;
}
</style>
</head>


<body>
	<%@ include file="../inc/header.jsp"%>
	<div class="container">
		<!--  현재 페이지 위치 -->
		<div class="path_board">
			<ol class="breadcrumb text-right">
				<li><a href="<%=request.getContextPath()%>/mainPage.jsp"
					class="home">HOME</a></li>
				<li class="active">게시판정보</li>
			</ol>
		</div>
		<h1>
			&emsp;<strong>게시판 생성</strong>
		</h1>
		<hr style="border: solid 1px #eeeeee;">
		<!--  입력폼 -->
		<form method="post" id="addForm"
			action="${pageContext.request.contextPath }>board/manage_add_ok.do">
			<table class="table" border="1">
				<tbody>
					<tr>
						<th class="active text-center" style="width: 15%">게시판명</th>
						<td><input  type="text" class="form-control"
							name="brd_name" id="brd_name" /></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">게시판 설명</th>
						<td><textarea class="form-control"
							name="brd_desc" id="brd_desc" rows="3"></textarea></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">게시판 유형</th>
						<td ><select name="brd_type"
							id="brd_type" class="form-control">
								<option value="일반 게시판">일반 게시판</option>
								<option value="공지사항">공지사항</option>
								<option value="Q&A">Q&amp;A</option>
						</select></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">비밀글 사용여부</th>
						<td><label for="secret">사용&nbsp;</label> <input
							type="radio" name="secret" value="Y">&emsp;&emsp;<label
							for="secret">사용안함&nbsp;</label><input type="radio" name="secret"
							value="N" checked="checked"></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">읽기 권한</th>
						<td ><select name="read_allow"
							id="read_allow" class="form-control">
								<option value="all">모두</option>
								<option value="login">로그인 후</option>
								<option value="admin">관리자</option>
						</select></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">쓰기 권한</th>
						<td ><select name="write_allow"
							id="write_allow" class="form-control">
								<option value="all">모두</option>
								<option value="login">로그인 후</option>
								<option value="admin">관리자</option>
						</select></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">댓글 쓰기 권한</th>
						<td ><select name="reply_allow"
							id="reply_allow" class="form-control">
								<option value="all">모두</option>
								<option value="login">로그인 후</option>
								<option value="admin">관리자</option>
						</select></td>
					</tr>
						<tr>
						<th class="active text-center" style="width: 15%">삭제 여부</th>
						<td ><label for="delete">삭제&nbsp;</label> <input
							type="radio" name="delete" value="Y">&emsp;&emsp;<label
							for="delete">사용&nbsp;</label><input type="radio" name="delete"
							value="N" checked="checked"></td>
					</tr>

				</tbody>
			</table>
			<div class=" button_group text-right">
				<button id="btn1" class="btn btn-primary" type="submit">등록</button>
				<button id="btn2" class="btn btn-primary" type="button">목록</button>
			</div>
		</form>
		<br />
	</div>
	<%@ include file="../inc/footer.jsp"%>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ include file="../inc/sidebar3.jsp"%>
	<!--  validate 플러그인 참조 -->
	<script
		src="${pageContext.request.contextPath }/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/plugins/validate/additional-methods.min.js"></script>
	<!--  sweetalert 플러그인 참조  -->
	<script
		src="${pageContext.request.contextPath }/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<!--Google CDN 서버로부터 jQuery 참조 -->

	<script type="text/javascript">
		$(function() {
			/** 플러그인의 기본 설정 옵션 추가 */
			jQuery.validator.setDefaults({
				onkeyup : false,
				onclick : false,
				onfocusout : false,
				showErrors : function(errorMap, errorList) {

					if (this.numberOfInvalids()) {

						swal({
							title : "에러",
							text : errorList[0].message,
							type : "error"
						}).then(function(result) {
							setTimeout(function() {
								$(errorList[0].element).val('');
								$(errorList[0].element).focus();
							}, 100);
						});
					}
				}
			});
			/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
			$("#add_form").validate({
				debug : true,
				rules : {
					brd_name : {
						required : true,
						maxlength : 50
					},
					brd_desc : {
						required : false,
					},
					brd_type : {
						required : true,
					},
					read_allow : {
						required : true,
					},
					write_allow : {
					required : true,
					},
					reply_allow : {
						required : true
					}
				},

				messages : {
					brd_name : {
						required : "게시판명을 입력하세요."
					},
					brd_type : {
						required : "게시판 유형을 선택하세요."
					},
					read_allow: {
						required : "읽기 권한을 선택하세요."
					},
					write_allow : {
						required : "쓰기 권한을 선택하세요."
					},
					reply_allow : {
						required : "댓글 쓰기 권한을 선택하세요."
					}
				}
			});
		});
		$("#btn1").click(function() {
			swal({
				title : "완료",
				text : "게시판 등록이 완료되었습니다.",
				type : 'success',
				confirmButtonText : "확인",
			}).then(function(result) {
				if (result.value) {
					window.location = "manage_add_ok.do";
				}
			});
		});
		$(function() {
			$("#btn2").click(function() {
				swal({
					title : "사이트에서 나가시겠습니까?",
					text : "게시판이 생성되지 않습니다.",
					type : 'warning',
					confirmButtonText : "예",
					showCancelButton : true,
					cancelButtonText : "아니오",
				}).then(function(result) {
					if (result.value) {
						window.history.back();
					}
				});
			});
		});

		/** textarea 바이트 표시 */
		$(function() {
			$('#brd_desc').keyup(function(e) {
				var content = $(this).val();
				$('#brd_desc').html(content.length + '/4000');
			});
			$('#brd_desc').keyup();
		});
	</script>
</body>
</html>