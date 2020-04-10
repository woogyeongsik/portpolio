<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>헛둘헛둘!</title>
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
				<li class="active">Q &amp; A</li>
			</ol>
		</div>
		<h1>
			&emsp;<strong>Q&amp;A</strong>
		</h1>
		<hr style="border: solid 1px #eeeeee;">
		<!--  입력폼 -->
		<form method="post" id="add_form"
			action="<%=request.getContextPath()%>qna/qna_add_ok.jsp">
			<table class="table" border="1">
				<tbody>
					<tr>
						<th class="active text-center" style="width: 15%">제목</th>
						<td colspan="4 col-xs-4"><input class="form-control "
							name="subject" id="subject" type="text" /></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">작성자</th>
						<td colspan="2 col-xs-2"><input class="form-control "
							name="id" id="id" type="text" value="애묘인" /></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">공개여부</th>
						<td colspan="4"><label for="unlock">공개&nbsp;</label><input
							id="unlock" name="lock" type="radio" value="Y" />&emsp;&emsp;<label
							for="lock">비공개&nbsp;</label><input id=lock name=lock type="radio"
							value="N" checked /></td>
					</tr>
					<tr>
						<th class="active text-center" style="width: 15%">비밀번호</th>
						<td colspan="2 col-xs-2"><input class="form-control "
							name="password" id="password" type="password" maxlength="8" /></td>
					</tr>
					<tr>
						<th class="active text-center" valign="middle" style="width: 15%">내용</th>
						<td colspan="6"><textarea style="width: 100%;" id="content"
								name="content" rows="20" maxlength="4000"></textarea> <span
							id="counter">###</span></td>
					</tr>
				</tbody>
			</table>
			<div class=" button_group text-right">
				<button id="btn1" class="btn btn-primary" type="submit">등록</button>
				<button id="btn2" class="btn btn-primary" type="button">취소</button>
			</div>
		</form>
		<br />
	</div>
	<%@ include file="../inc/footer.jsp"%>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
	<!--  validate 플러그인 참조 -->
	<script
		src="<%=request.getContextPath()%>/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/plugins/validate/additional-methods.min.js"></script>
	<!--  sweetalert 플러그인 참조  -->
	<script
		src="<%=request.getContextPath()%>/plugins/sweetalert/sweetalert2.all.min.js"></script>
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
					subject : {
						required : true,
						maxlength : 50
					},
					password : {
						required : true,
						minlength : 4,
						maxlength : 8
					},
					contents : {
						required : true
					}
				},
				messages : {
					subject : {
						required : "제목을 입력하세요."
					},
					password : {
						required : "비밀번호를 입력하세요.",
						minlength : "비밀번호는 4글자 이상 최대 8글자 입력하셔야 합니다."
					},
					contents : {
						required : "내용을 입력하세요."
					}
				}
			});
		});
		$("#btn1").click(function() {
			swal({
				title : "완료",
				text : "글 등록이 완료되었습니다.",
				type : 'success',
				confirmButtonText : "확인",
			}).then(function(result) {
				if (result.value) {
					window.location = "qna_add_ok.jsp";
				}
			});
		});
		$(function() {
			$("#btn2").click(function() {
				swal({
					title : "사이트에서 나가시겠습니까?",
					text : "작성한 글이 사라집니다.",
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
		      $('#content').keyup(function (e){
		          var content = $(this).val();
		          $('#counter').html(content.length + '/4000');
		      });
		      $('#content').keyup();
		});

	</script>
</body>
</html>