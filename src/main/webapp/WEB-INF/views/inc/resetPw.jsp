<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
  	<title>비밀번호 재설정</title>
  	<style type="text/css">


  	    /* 에러가 발생한 <input>태그 */
        input.error {
            background-color: #ffff00;
        }

        /* 에러 메시지에 대한 글자 색상 */
        .error {
            color: red;
        }

  	</style>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

  <div class="card align-middle" style="width:20rem; border-radius:20px; margin:auto;">
    <div class="card-title" style="margin-top:30px;">
      <h2 class="card-title text-center" style="color:#113366;">비밀번호 재설정</h2>
    </div>
    <div class="card-body">
      <form class="form-signin" id="set_pw" name="set_pw" method="POST" onSubmit="return validate();" action="resetPw.jsp">
      <div class="form-group">
        <input type="password" id="user_pw" class="form-control" placeholder="새로운 비밀번호" required autofocus >
        </div>
        <br>
        <div class="form-group">
        <input type="password" id="user_pw_re" class="form-control" placeholder="비밀번호 확인" required autofocus>
        </div>
        <br>
        <div class="checkbox">
        </div>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" style="white-space:pre;">확 인</button>
      </form>

    </div>
  </div>

  <div class="modal">
  </div>
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script type="text/javascript">

   validate = () => {
	  var re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	  var pw = document.getElementById("user_pw");

      if(!check(re,pw,"패스워드는 8자이상, 최소 하나 이상의 문자,숫자,특수 문자를 포함해야 합니다.")) {
          return false;
      }

      if(set_pw.user_pw.value != set_pw.user_pw_re.value) {
          alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
          set_pw.user_pw_re.value = "";
          set_pw.user_pw_re.focus();
          return false;
      }

      function check(re, what, message) {
          if(re.test(what.value)) {
              return true;
          }
          alert(message);
          what.value = "";
          what.focus();
          //return false;
      }
  }

  </script>
</body>

</html>