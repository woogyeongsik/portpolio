
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/sidebar.css">
<style>
.login-form {
	width: 400px;
	margin: 100px auto;
}

.form-group {
	margin-left: 30px;
	margin-top: 10px;
}

.logo {
	margin: auto;
	margin-left: 100px;
}

.lg {
	padding: 30px 0;
	width: 70px;
	height: 85px;
	margin-top: -33px;
	margin-left: 13px;
	text-align: center;
	vertical-align: middle;
}

.btn-sm {
	margin: auto;
	width: 150px;
	height: 28px;
	/*margin-top: 20px;*/
	/*margin-left: 25px;*/
	text-align: center;
	vertical-align: middle;
}

.f {
	margin-left: 20px;
	margin-top: 10px;
}

.find {
	width: 150px;
	height: 28px;
	margin-top: 15px;
	background-color: #337ab7;
	border: 1px solid #2e6da4;
	border-radius: 3px;
	text-align: center;
	color: #fff;
	margin-right: 10px;
	margin-left: 32px;
}

.fi {
	padding: 5px 0px;
	font-size: 12px;
	margin: auto;
	color: #fff;
}

.fi:hover {
	color: #fff;
}

.btn-link:active {
	color: #fff;
}

.fi:focus {
	outline: none;
}

.fi:visited {
	color: #fff;
	text-decoration: none;
}

.fl {
	float: left;
}

.bt:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

.jo {
	margin-top: 15px;
	margin-left: 16px;
}
</style>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>
	<div class="login-form">
		<form onsubmit="return false;" class="form-inline">

			<div class="logo">
				<img src="${pageContext.request.contextPath}/assets/img/logo.jpg"
					width="150" />
			</div>

			<!-- 입력 요소 하나를 구성하는 단위 -->
			<div class="form-group">
				<label for="user_name"><span
					class="glyphicon glyphicon-user" aria-hidden="true"></span></label> <input
					type="text" class="form-control f" id="user_id" name="user_id"
					placeholder="id" />
			</div>
			<div class="form-group">
				<label for="user_pw"><span class="glyphicon glyphicon-ok"
					aria-hidden="true"></span></label> <input type="password"
					class="form-control f" id="user_pw" name="user_pw"
					placeholder="password" />
			</div>
			<button type="submit" class="btn btn-primary btn-lg lg" id="login">Login</button>
			<div class="bt">
				<div class="find full-left fl">
					<a href="" class="btn btn-link fi" role="button"
						data-toggle="modal" data-target="#findId">아이디</a> / <a href="#"
						onclick="findId();" class="btn btn-link fi" role="button">비밀번호
						찾기</a>
					<!-- <a href="" onclick="findId();" class="btn btn-link fi"
						role="button" data-toggle="modal" data-target="#findId">아이디</a> / <a href="#" onclick="findId();"
						class="btn btn-link fi" role="button">비밀번호 찾기</a> -->
					<!-- <button type="button" onclick="findId();" class="btn btn-link fi">아이디</button> / <button type="button" onclick="findId();" class="btn btn-link fi">비밀번호 찾기</button> -->
				</div>
				<div class="fl jo">
					<a href="${pageContext.request.contextPath}/join.do"
						class="btn btn-primary btn-sm">회원가입</a>
				</div>
			</div>
		</form>
	</div>

	<!-- 아이디 찾기 Modal 1 -->
	<div class="modal fade" id="findId" tabindex="-1">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
				</div>
				<div class="modal-body">
					<form id="idFind" onSubmit="return false;">
					<div>
						<label for="inputName" class="sr-only">이름: </label>
						<input type="text" id="name" name="name" class="form-control" placeholder="이름" autofocus>
					</div>
							<br>
						<div>
							<label for="email" class="sr-only">이메일: </label>
							<input type="email" id="email" name="email" class="form-control" placeholder="이메일">
							<button class="getCheckNum" id="getNum"
								style="font-size: 10px; position: absolute; left: 209px; bottom: 97px">인증번호
								받기</button>
							<p style="font-size: 11px; color: #777777; margin-left: 3px;">
								(회원가입시 입력한 이메일 주소와 <br>동일한 이메일 주소를 입력하셔야 합니다.)
							</p>
						</div>
						<div>
						<label for="checkedNum" class="sr-only">인증번호: </label>
						<input type="text" name="emailAuth" class="form-control"
							id="emailAuth" placeholder="인증번호(숫자 6자리)">
							<button type="button" class="getCheckNum" id="check"
								style="font-size: 10px; position: absolute; left: 252px; bottom: 23px">확인</button>						
						</div>
						</form>
						</div>
						
					<div class="modal-footer">
        		<button id="btn-Yes" class="btn btn-lg btn-primary btn-block"
							type="button" style="white-space: pre;">확 인</button>
     				 </div>				
				</div>
			</div>
			</div>
		
		<!-- id 찾기 결과 modal -->
		<div class="modal fade" id="findId2" tabindex="-1">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
				</div>
				<div class="modal-body">
					<ul id="result">						
					</ul>						
				</div>						
					<div class="modal-footer">
        		<button id="okok" class="btn btn-lg btn-primary btn-block"
							type="button" style="white-space: pre;">확 인</button>
     				 </div>				
				</div>
			</div>
			</div>	


	<%@ include file="../inc/footer.jsp"%>

	<script src="https://code.jquery.com/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
	<script>
		/**
		function findId() {
			var features = 'width=380, height=380, scrollbars=no, toolbar=no, left=550, top=250';
			window.open('/setspring/findId.do', '아이디찾기', features);
		}*/

		$(function() {
			$("#login").click(
					function() {
						// 입력값을 취득하고, 내용의 존재여부를 검사한다.
						var id = $("#user_id").val();
						var pw = $("#user_pw").val();

						// 입력되지 않았다면?
						if (!id) {
							alert("아이디를 입력해주세요.");
							$("#user_id").focus(); // 커서를 강제로 넣기
							return false; // 실행 중단
						}

						if (!pw) {
							alert("비밀번호를 입력해주세요.");
							$("#user_pw").focus(); // 커서를 강제로 넣기
							return false; // 실행 중단
						}

						$.post("${pageContext.request.contextPath}/login", {
							user_id : id,
							user_pw : pw
						}, function(json) {
							if (json.rt == "OK") {
								// 이전 페이지가 실행페이지가 아닌 경우에 한해서 이전 페이지로 이동
								if (json.referer != null
										&& (json.referer).indexOf("_") == -1) {
									window.location = json.referer;
								} else {
									location.href = json.directUrl;
								}
							}
						}); // end $.ajax
					}); // end click
		});
	/**---------------------------------------------------------------------*/	
		
		/** id 찾기 모달창 */
		$(function() {
			/** 모달 창이 닫히는 경우의 이벤트 */
			$('.modal').on('hidden.bs.modal', function() {
				// 모달창 내의 내용을 강제로 지움.
				console.log('modal close');					
				$('.modal-body input').val("");
			});			
			
			var mail = false;
			var ok = false;
			
			/* 인증번호 발송 ajax */
			//var mail = false;
			$('#getNum').on('click', function() {
				var email = $("#email").val();
				
				if(!email) {
					alert("이메일을 입력하세요");
					$("#email").focus();
					return false;
				}
				
				if (!regex.email('#email', "올바른 이메일 형식이 아닙니다.")) {
					return false;
				}				
				
				$.post("${pageContext.request.contextPath}/sendAuth", {email: email},
						function(json) {						
							if (json.rt == "OK") {
								alert("메일이 발송되었습니다.");
								mail = true;
							} else {
								alert("메일 발송에 실패하였습니다.");
								mail = false;
							}				
				}); // end 인증번호 ajax
			});
			
			/** 이메일 인증번호 확인 */
			//var ok = false;			
			$("#check").on('click', function() {
					// 입력값을 취득하고, 내용의 존재여부를 검사한다.
					var checkAuth = $("#emailAuth").val();			
					
					// 입력되지 않았다면?
					if(!checkAuth) {
						alert("인증번호를 입력하세요.");
						$("#emailAuth").focus();	// 커서를 강제로 넣기
						return false;				// 실행 중단
					}
					
					$.post("${pageContext.request.contextPath}/checkAuth", {emailAuth: checkAuth},
							function(json) {
							if (mail && json.authCheck == null) {
								alert("인증 시간이 만료되었습니다. 인증번호를 다시 받아주세요.");
								ok = false;							
							} else if (json.authCheck == checkAuth) {
									alert("인증이 완료되었습니다.");
									ok = true;
								} else {
									alert("인증번호가 일치하지 않습니다.");
									$("#checkedNum").val("");
									$("#checkedNum").focus();
									ok = false;
								}				
					}); // end $.ajax			
				}); // end click
			
				
			/** id 찾기 ajax */				
			$("#btn-Yes").on('click', function(e) {				
				e.preventDefault();
				
				var name = $("#name").val();
				var email = $("#email").val();
				var checkedNum = $("#emailAuth").val();						
				
				if(!name) {
					alert("이름을 입력하세요.");
					$("#name").focus();
					return false;
				}
				
				if(!email) {
					alert("이메일을 입력하세요");
					$("#email").focus();
					return false;
				}
				
				if (!regex.email('#email', "올바른 이메일 형식이 아닙니다.")) {
					return false;
				}
				
				if(!checkedNum) {
					alert("인증번호를 입력하세요.");
					$("#checkedNum").focus();
					return false;
				}
				
				/** 인증번호 인증 확인 */
				if (ok == false) {
					alert("인증번호 확인을 하셔야 합니다.");
					return false;						
				}							
		
			$.post("${pageContext.request.contextPath}/findId", {name: name, email: email},
				function(json) {
					if (json.item == null || (json.item).length == 0) {
						alert("해당하는 회원정보를 찾을 수 없습니다.");
						$("#name").val("");
						$("#email").val("");
						$("#emailAuth").val("");
					} else {
						
						$('#findId').modal('hide');
						
						$('#findId2').modal('show');
						
						var idid = "";
						var date = "";
						for (var i = 0; i < json.item.length; i++) {
							idid = json.item[i].userId;
							date = json.item[i].regDate;
							
							var a = "<li>아이디: " + idid + " / 가입일자: " + date + "</li>";
							
							$("#result").append(a);								
						}						
							
					}
						
				});
			});	
				
			$("#okok").on('click', function(e) {
				$("#findId2").modal('hide');
			});
			
			/* input 값이 변화되는 경우 재인증 받도록 하기. */
			$('#email').on('change keyup paste', function() {					
				mail = false;
				ok = false;
			});
				
			
			
		});
				
			
			
			
			
			
			
			/** ajax에 의해서 로드되는 폼에 대한 submit 이벤트 */	
			/**
			$("#idFind").on('submit', function(e) {				
				e.preventDefault();
				
				var name = $("#name").val();
				var email = $("#email").val();
				var checkedNum = $("#checkedNum").val();
				
				
				if(!name) {
					alert("이름을 입력하세요.");
					$("#name").focus();
					return false;
				}
				
				if(!email) {
					alert("이메일을 입력하세요");
					$("#email").focus();
					return false;
				}
				
				if (!regex.email('#email', "올바른 이메일 형식이 아닙니다.")) {
					return false;
				}
				
				if(!checkedNum) {
					alert("인증번호를 입력하세요.");
					$("#checkedNum").focus();
					return false;
				}
				
				/** 인증번호 인증 확인 */
				/*if (ok == false) {
					alert("인증번호 확인을 하셔야 합니다.");
					return false;						
				}*				
				
		
			$.post("${pageContext.request.contextPath}/findId", {name: name, email: email},
				function(json) {
				if (json.rt == "OK") {
					$.each(json.item, function(key, value) {
						console.log('value' + value);
					})
					//alert(fid);
				} else {
					alert("해당되는 회원정보를 찾을 수 없습니다.");
					$("#name").val("");
					$("#email").val("");
					$("#checkedNum").val("");
				}
			});				
				
			});*/
			
			/* 인증번호 발송 ajax */
			//var mail = false;
			/*$('#getNum').on('click', function() {
				$.post("${pageContext.request.contextPath}/sendAuth", {email: email},
						function(json) {						
							if (json.rt == "OK") {
								alert("메일이 발송되었습니다.");
								mail = true;
							} else {
								alert("메일 발송에 실패하였습니다.");							
							}				
				}); // end 인증번호 ajax
			});*/
			
			/** 이메일 인증번호 확인 */
			//var ok = false;
			/*
			$(document).on('click', '#check', function() {
					// 입력값을 취득하고, 내용의 존재여부를 검사한다.
					var checkAuth = $("#checkedNum").val();			
					
					// 입력되지 않았다면?
					if(!checkAuth) {
						alert("인증번호를 입력하세요.");
						$("#checkedNum").focus();	// 커서를 강제로 넣기
						return false;				// 실행 중단
					}
					
					$.post("${pageContext.request.contextPath}/checkAuth", {checkedNum: checkAuth},
							function(json) {
							if (mail && json.authCheck == null) {
								alert("인증 시간이 만료되었습니다. 인증번호를 다시 받아주세요.");
								ok = false;							
							} else if (json.authCheck == checkAuth) {
									alert("인증이 완료되었습니다.");
									ok = true;
								} else {
									alert("인증번호가 일치하지 않습니다.");
									$("#checkedNum").val("");
									$("#checkedNum").focus();
								}				
					}); // end $.ajax			
				}); // end click*/
					
	
	</script>	

</body>
</html>