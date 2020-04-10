<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>헛둘,헛둘</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/datepicker/datepicker.min.css" />

<style>
.page-header {
	margin-bottom: 10px;	
}

.form-horizontal {
	width: 620px;
	margin: auto;	
}

.form-group:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

.form-group {
	padding-top: 5px;
	padding-bottom: 5px;
	border-bottom: 1px dotted #eee;	
}

.form-group:last-child {
	border-bottom: 0;
}

.f {
	width: 35%;
	display: block;
	float: left;
	font-size: 14px;	
	text-indent: 5px;
	margin-left: 7px;
}

.col-md-10 {
	width: 60%;
	display: block;
	float: left;
	margin: auto;
	/*margin-top: -5px;*/
	margin-left: -15px;	
}

.j {
	width: 60%;
	padding: 5px 0;
	font-size: 12px;
	border: 1px solid #eee;
	margin: 5px;	
	margin-top: -3px;
}

.text-center {
	text-align: center;
	margin: auto;
	width: 60%;
}

.identify {
	font-size: 14px;
	color: #f00;
}

.btn-xs {
	margin-left: 3px;
	margin-top: 3px;
}

/* 추가 */
.add {
	width: 110%;
}

/** focus 상태일 때 placeholder 지우는 방법 */
input:focus::-webkit-input-placeholder {
	color: transparent;
}

input:focus::-moz-placeholder {
	color: transparent;
}

/** id 중복검사 버튼 숨기기 */
.h {
	display: none;
}

#gender2 {
	margin-left: 20px;
}

select {
	height: 25px;
	margin-top: -8px;
	width: 80px;
}

.inter {
	margin: auto;
	width: 60%;
	display: inline-block;
	padding-left: 5px;	
}

.p {
	width: 45%;
}

.c {
	margin-bottom: 13px;	
}

.id {
	height: 40px;
}

.jo {
	width: 250px;
	margin: auto;
	margin-top: 10px;
}

</style>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>
	<!-- 가입폼 시작 -->
	<form method="post" action="${pageContext.request.contextPath}/join_ok.do" class="form-horizontal" name="join_form" id="join_form">
		<div class="page-header">
			<h2>회원가입</h2>
		</div>
		
		<!-- 회원 Id -->
		<div class="form-group">
			<label for='user_id' class="col-md-2 f id">아이디 <span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="text" name="user_id" id="user_id"
					class="form-control j" style="float: left;" placeholder="4~20자, 영어+숫자" maxlength="20" />
				
				<!-- id 중복확인 -->
				<button type="button" class="btn btn-default btn-xs h" id="id_uniq_check">중복체크</button>
			</div>
		</div>

		<!-- 비밀번호 -->
		<div class="form-group">
			<label for='user_pw' class="col-md-2 f">비밀번호 <span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="password" name="user_pw" id="user_pw"
					class="form-control j" placeholder="8~14자, 영어+숫자+특수문자" maxlength="14" />
			</div>
		</div>
		
		<!-- 비밀번호 확인 -->		
		<div class="form-group">
			<label for='user_pw_re' class="col-md-2 f">비밀번호 확인 <span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="password" name="user_pw_re" id="user_pw_re"
					class="form-control j" placeholder="비밀번호 확인" maxlength="14" />
			</div>
		</div>
		
		<!-- 이름 -->
		<div class="form-group">
			<label for='user_name' class="col-md-2 f">이름 <span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="text" name="name" id="user_name"
					class="form-control j" maxlength="10" />
			</div>
		</div>
		
		<!-- 성별 -->		
		<div class="form-group">
			<label for='gender1' class="col-md-2 f c">성별 <span
				class='identify'>*</span></label>
			<div class="col-md-10 inter">
				<label><input type='radio' name='gender' id='gender1'
					value='남'>남성</label>
				<label><input type='radio'
					name='gender' id='gender2' value='여'>여성</label>
			</div>
		</div>

		<!-- 생년월일 -->
		<div class="form-group">
			<label for='birthdate' class="col-md-2 f">생년월일 <span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="text" name="birthdate" id="birthdate"
					class="form-control j" style="background-color: transparent;" readonly />
			</div>
		</div>
		
		<!-- 전화번호 -->
		<div class="form-group">
			<label for='tel' class="col-md-2 f">연락처 <span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="tel" name="tel" id="tel" class="form-control j" placeholder='" - " 제외'/>
			</div>
		</div>
		
		<!-- 주소 -->
		<div class="form-group">
			<label for='address' class="col-md-2 f">주소 <span
				class='identify'>*</span></label>
			<div class="col-md-10">

				<input type="number" name="postcode" id="postcode"
					placeholder="우편번호" class="form-control j p" style="float: left; background-color: transparent;" readonly />

				<button type="button" onclick="execDaumPostcode()"
					class="btn btn-default btn-xs">우편번호 찾기</button>
				<input type="text" name="address1" id="address1"
					class="form-control j add" style="clear: both; float: none; background-color: transparent;"
					placeholder="기본주소" readonly />				
				<input type="text" name="address3" id="address3"
					class="form-control j add" placeholder="상세주소" />
			</div>			
		</div>						
		
		<!-- 이메일 -->
		<div class="form-group">
			<label for='email' class="col-md-2 f">이메일 <span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="email" name="email" id="email" class="form-control j"
					style="float: left" />
				<button type="button" class="btn btn-default btn-xs" id="sendAuth">인증번호
					받기</button>
			</div>
		</div>
		
		<!-- 이메일 인증 -->		
		<div class="form-group">
			<label for='emailAuth' class="col-md-2 f">이메일 인증<span
				class='identify'>*</span></label>
			<div class="col-md-10">
				<input type="text" name="emailAuth" id="emailAuth"
					class="form-control j" placeholder="인증번호(숫자 6자리)" maxlength="6"
					style="float: left;" />
				<button type="button" class="btn btn-default btn-xs" id="checkAuth">확인</button>
			</div>
		</div>		
				
		<!-- 관심지역 -->		
		<div class="form-group">
			<label for='area1' class="col-md-2 f c">관심지역 <span
				class='identify'>*</span></label>
				
			<div class="inter">
				<select name="area1" id="area1">
				<option value="">1순위</option>
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강서구">강서구</option>
				<option value="강북구">강북구</option>
				<option value="관악구">관악구</option>
				<option value="광진구">광진구</option>
				<option value="구로구">구로구</option>
				<option value="금천구">금천구</option>
				<option value="노원구">노원구</option>
				<option value="동대문구">동대문구</option>
				<option value="도봉구">도봉구</option>
				<option value="동작구">동작구</option>
				<option value="마포구">마포구</option>
				<option value="서대문구">서대문구</option>
				<option value="성동구">성동구</option>
				<option value="성북구">성북구</option>
				<option value="서초구">서초구</option>
				<option value="송파구">송파구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
				<option value="양천구">양천구</option>
				<option value="은평구">은평구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
				<option value="중랑구">중랑구</option>

			</select>
			
			<select name="area2" id="area2">
				<option value="">2순위</option>
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강서구">강서구</option>
				<option value="강북구">강북구</option>
				<option value="관악구">관악구</option>
				<option value="광진구">광진구</option>
				<option value="구로구">구로구</option>
				<option value="금천구">금천구</option>
				<option value="노원구">노원구</option>
				<option value="동대문구">동대문구</option>
				<option value="도봉구">도봉구</option>
				<option value="동작구">동작구</option>
				<option value="마포구">마포구</option>
				<option value="서대문구">서대문구</option>
				<option value="성동구">성동구</option>
				<option value="성북구">성북구</option>
				<option value="서초구">서초구</option>
				<option value="송파구">송파구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
				<option value="양천구">양천구</option>
				<option value="은평구">은평구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
				<option value="중랑구">중랑구</option>

			</select>
			
			<select name="area3" id="area3">
				<option value="">3순위</option>
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강서구">강서구</option>
				<option value="강북구">강북구</option>
				<option value="관악구">관악구</option>
				<option value="광진구">광진구</option>
				<option value="구로구">구로구</option>
				<option value="금천구">금천구</option>
				<option value="노원구">노원구</option>
				<option value="동대문구">동대문구</option>
				<option value="도봉구">도봉구</option>
				<option value="동작구">동작구</option>
				<option value="마포구">마포구</option>
				<option value="서대문구">서대문구</option>
				<option value="성동구">성동구</option>
				<option value="성북구">성북구</option>
				<option value="서초구">서초구</option>
				<option value="송파구">송파구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
				<option value="양천구">양천구</option>
				<option value="은평구">은평구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
				<option value="중랑구">중랑구</option>
			</select>
			</div>
		</div>

		<div class="form-group">
			<div class="text-center">
				<button type="button" class="btn btn-primary btn-block jo" id="log_btn">가입하기</button>
			</div>
		</div>
	</form>
	<%@ include file="../inc/footer.jsp"%>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
	<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<!-- 정규표현식 검사 객체를 참조한다. -->	
	<script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
	<script type="text/javascript">
	var mail = false;
	var ok = false;
		$(function() {
			/** 가입폼의 submit 이벤트 */
			$("#log_btn").click(
					function(e) {
						// 기본동작 수행 방식
						e.preventDefault();

						/** 아이디 검사 */
						if (!regex.value('#user_id', '아이디를 입력하세요.')) {
							return false;
						}
						if (!regex.eng_num('#user_id',
								"아이디는 영어, 숫자만 입력 가능합니다.")) {
							return false;
						}
						if (!regex.min_length('#user_id', 4,
								'아이디는 최소 4자 이상 입력 가능합니다.')) {
							return false;
						}
						if (!regex.max_length('#user_id', 20,
								'아이디는 최대 20자 까지만 입력 가능합니다.')) {
							return false;
						}

						/** 비밀번호 검사 */
						if (!regex.value('#user_pw', '비밀번호를 입력하세요.')) {
							return false;
						}
						if (!regex.min_length('#user_pw', 8,
								'비밀번호는 최소 8자 이상 입력 가능합니다.')) {
							return false;
						}
						if (!regex.max_length('#user_pw', 14,
								'비밀번호는 최대 14자 까지만 입력 가능합니다.')) {
							return false;
						}						
						if (!regex.qwe('#user_pw',
								'최소 하나 이상의 문자,숫자,특수 문자를 포함해야 합니다.')) {
							return false;
						}
						
						
						/** 비밀번호 확인 검사 */
						if (!regex.value('#user_pw_re', "비밀번호 확인값을 입력하세요.")) {
							return false;
						}
						if (!regex.compare_to('#user_pw', '#user_pw_re',
								'비밀번호 확인이 잘못되었습니다.')) {
							return false;
						}

						/** 이름 검사 */
						if (!regex.value('#user_name', '이름을 입력하세요.')) {
							return false;
						}
						if (!regex.kor('#user_name', '이름은 한글만 입력 가능합니다.')) {
							return false;
						}
						if (!regex.min_length('#user_name', 2,
								'이름은 최소 2자 이상 입력 가능합니다.')) {
							return false;
						}
						if (!regex.max_length('#user_name', 10,
								'이름은 최대 10자 까지만 입력 가능합니다.')) {
							return false;
						}

						/** 성별검사 */
						if (!regex.check('input[name=gender]', '성별을 선택하세요.')) {
							return false;
						}
						
						/** 생년월일 검사 */
						if (!regex.value('#birthdate', '생년월일을 입력하세요.')) {
							return false;
						}
						

						/** 연락처 검사 */
						if (!regex.value('#tel', '연락처를 입력하세요.')) {
							return false;
						}
						if (!regex.phone('#tel', '올바른 연락처의 형식이 아닙니다. ("-" 제외)')) {
							return false;
						}

						/** 주소 검사 */
						if (!regex.value('#postcode', "우편번호를 입력하세요.")) {
							return false;
						}
						if (!regex.value("#address3", "상세주소를 입력하세요.")) {
							return false;
						}

						/** 이메일 검사 */
						if (!regex.value('#email', '이메일을 입력하세요.')) {
							return false;
						}
						if (!regex.email('#email', "올바른 이메일 형식이 아닙니다.")) {
							return false;
						}						
						
						/** 인증번호 검사 */
						if (!regex.value('#emailAuth', '인증번호를 입력하세요.')) {
							return false;
						}
						
						/** 인증번호 인증 확인 */
						if (ok == false) {
							alert("인증번호 확인을 하셔야 합니다.");
							return false;						
						}
						
						/** 인증번호 제한시간 */

						/** 관심지역 검사 */
						if (!regex.value("#area1", '한 곳 이상의 관심지역을 선택해주세요.')) {
							return false;
						}

						// 처리 완료 (submit)
						document.getElementById("join_form").submit();						
					});
		});
		
		/** 아이디 중복검사 ajax */
		//var check = false;
		$(function() {			
			/** 버튼 클릭시 이벤트 */
			$("#id_uniq_check").click(function() {
				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				var user_id_val = $("#user_id").val();
				
				// 입력되지 않았다면?
				if(!user_id_val) {
					alert("아이디를 입력하세요.");
					$("#user_id").focus();		// 커서를 강제로 넣기
					return false;				// 실행 중단
				}				
				
				// 위의 if문을 무사히 통과했다면 내용이 존재한다는 의미이므로,
				// 입력된 내용을 Ajax를 사용해서 웹 프로그램에게 전달한다.
				$.post("${pageContext.request.contextPath}/idCheck", {user_id: user_id_val},
					function(req) {
						// 사용 가능한 아이디인 경우 --> req = {count: 0}
						// 사용 불가능한 아이디인 경우 --> req = {count: 1}
						if (req.count == 0) {
							alert("사용 가능한 아이디입니다.");
							//check = true;
						} else {
							alert("사용할 수 없는 아이디입니다.");
							$("#user_id").val("");
							$("#user_id").focus();
						}				
					}); // end $.ajax
				});	// end click
				
				/** id 입력값 변경시 강제 중복검사 */ 
				$("#user_id").change(function() {
					//check = false;				
					$("#id_uniq_check").trigger("click");
					
				}); // end change			
			});
		
		/** 이메일 인증번호 보내기 */
		//var mail = false;
		$(function() {
			/** 인증번호 받기 버튼 클릭시 */
			$("#sendAuth").click(function() {
				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				var to = $("#email").val();			
				
				// 입력되지 않았다면?
				if(!to) {
					alert("이메일 주소를 입력하세요.");
					$("#email").focus();		// 커서를 강제로 넣기
					return false;				// 실행 중단
				}
				
				// 이메일 형식 검사
				if (!regex.email('#email', "올바른 이메일 형식이 아닙니다.")) {
					return false;
				}	
				
				$.post("${pageContext.request.contextPath}/sendAuth", {email: to},
						function(json) {						
							if (json.rt == "OK") {
								alert("메일이 발송되었습니다.");
								mail = true;
							} else {
								alert("메일 발송에 실패하였습니다.");							
							}				
				}); // end $.ajax
			});	// end click
		});
		
		/** 이메일 인증번호 확인 */
		//var ok = false;
		$(function() {
			/* 확인버튼 클릭시 */
			$("#checkAuth").click(function() {
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
								$("#emailAuth").val("");
								$("#emailAuth").focus();
							}				
				}); // end $.ajax			
			}); // end click
		}); 
	</script>		
	
	<!-- 다음 우편번호 찾기 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("address2").value = extraAddr;
                
                } else {
                    //document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address1").value = addr + extraAddr;                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address3").focus();
            }
        }).open();
    }
</script>

<!-- datepicker -->
<script src="${pageContext.request.contextPath}/assets/plugins/datepicker/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/datepicker/i18n/datepicker.ko-KR.js"></script>
<script>
	$(function() {
		$("#birthdate").datepicker({
			autoHide: true,			// 날짜 선택 후 자동 숨김 (true/false)
			format: 'yyyy-mm-dd',	// 날짜 형식
			language: 'ko-KR',		// 언어
			weekStart: 0			// 시작요일 (0=일요일~6=토요일)
		});
	});
</script>
</body>
</html>