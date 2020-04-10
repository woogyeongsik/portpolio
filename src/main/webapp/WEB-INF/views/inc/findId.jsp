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
  	<title>아이디 찾기</title>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

  <div class="card align-middle" style="width:20rem; border-radius:20px; margin:auto;">
    <div class="card-title" style="margin-top:30px;">
      <h2 class="card-title text-center" style="color:#113366;">아이디찾기</h2>
    </div>
    <div class="card-body">
      <form class="form-signin" method="POST" onSubmit="logincall();return false">
        <label for="inputName" class="sr-only">이름: </label>
        <input type="text" id="inputName" class="form-control" placeholder="이름" required autofocus>
        <br>
        <div class="eamil-div">
          <label for="email" class="sr-only">이메일: </label>
          <input type="email" id="email" class="form-control" placeholder="이메일" required>
          <button class="getCheckNum" style="font-size:10px; position:absolute; left:213px; bottom:162px">인증번호 받기</button>
        </div>

        <br>
        <label for="checkedNum" class="sr-only">인증번호: </label>
        <input formaction="" type="password" name="checkedNum" class="form-control" id="checkedNum" placeholder="인증번호(숫자 6개)" required>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script type="text/javascript">

  </script>


</body>

</html>