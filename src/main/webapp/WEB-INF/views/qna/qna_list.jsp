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

#btn2 {
	margin: 8px;
	padding: 8px 20px;
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
			&emsp;<strong>Q&amp;A</strong></h1>
			<hr style="border: solid 1px #eeeeee;">
		<!--  검색 폼 -->
		<form method="get"
			action="<%=request.getContextPath()%>/qna/qna_list.jsp">
			<div id="search" class="col-sm-12 well">
				<div class="col-sm-8 ">
					<div class="input-group">
						<span class="input-group-btn"> <select class="form-control"
							style="width: auto; margin-right: -1px">
								<option>제목</option>
								<option>내용</option>
								<option selected>제목+내용</option>
								<option>작성자</option>
						</select>
						</span> <input type="search" class="form-control" name="keyword"
							id="keyword" placeholder="Search"> <span
							class="input-group-btn">
							<button id=btn1 class="btn btn-primary" type="submit">검색</button>
						</span>
					</div>
				</div>
			</div>
		</form>
		<div>&nbsp; 총 119건</div>
		<!--  목록  -->
		<table class=" table">
			<thead class="table-top">
				<tr class="active">
					<th class="text-center" width="10%">번호</th>
					<th class="text-center" width="55%">제목</th>
					<th class="text-center" width="10%">작성자</th>
					<th class="text-center" width="15%">작성일</th>
					<th class="text-center" width="10%">조회</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<tr>
					<td>119</td>
					<td><a href="qna_view.jsp">고양이 데려가도 되나요? <span
							class="label label-danger"> New</span></a></td>
					<td>애묘인</td>
					<td>2019-12-09</td>
					<td>1</td>
				<tr>
				<tr>
					<td>118</td>
					<td><a href="qna_reply_view.jsp">[RE] 고양이 데려가도 되나요? </a><span
						class="label label-danger"> New</span></td>
					<td>관리자</td>
					<td>2019-12-09</td>
					<td>1</td>

				</tr>
				<tr>
					<td>117</td>
					<td><a href="#">추천하는 장소 더 자세히 보고 싶으면 어떻게 해야하나요?</a></td>
					<td>회원5</td>
					<td>2019-11-30</td>
					<td>1</td>
				</tr>
				<tr>
					<td>116</td>
					<td><a href="#">[RE] 추천하는 장소 더 자세히 보고 싶으면 어떻게 해야하나요?</a></td>
					<td>관리자</td>
					<td>2019-11-28</td>
					<td>0</td>
				</tr>
				<tr>
					<td>115</td>
					<td><a href="#"> 이 곳에서 시설 예약도 가능한가요?</a></td>
					<td>회원4</td>
					<td>2019-10-14</td>
					<td>2</td>
				</tr>
				<tr>
					<td>114</td>
					<td><a href="#">[RE] 이 곳에서 시설 예약도 가능한가요?</a></td>
					<td>관리자</td>
					<td>2019-12-09</td>
					<td>2</td>
				</tr>
				<tr>
					<td>113</td>
					<td><a href="#">[비공개] 장소 업데이트는 계속 되고 있는거죠?</a></td>
					<td>회원3</td>
					<td>2019-12-09</td>
					<td>4</td>
				</tr>
				<tr>
					<td>112</td>
					<td><a href="#">[RE][비공개] 장소 업데이트는 계속 되고 있는거죠?</a></td>
					<td>관리자</td>
					<td>2019-12-10</td>
					<td>6</td>
				</tr>
				<tr>
					<td>111</td>
					<td><a href="#"> 내가 찜한 장소 목록이 안 보여요.</a></td>
					<td>회원2</td>
					<td>2019-12-08</td>
					<td>12</td>
				</tr>
				<tr>
					<td>110</td>
					<td><a href="#">[RE] 내가 찜한 장소 목록이 안 보여요.</a></td>
					<td>관리자</td>
					<td>2019-12-09</td>
					<td>7</td>
				</tr>
				<tr>
					<td>109</td>
					<td><a href="#">[비공개] 종로에 있는 체육시설을 추천받고 싶어요. </a></td>
					<td>회원1</td>
					<td>2019-12-08</td>
					<td>2</td>
				</tr>
				<tr>
					<td>108</td>
					<td><a href="#">[RE][ 비공개] 종로에 있는 체육시설을 추천받고 싶어요. </a></td>
					<td>관리자</td>
					<td>2019-12-09</td>
					<td>1</td>
				</tr>
			</tbody>
			<!--  페이지 번호 -->
			<tfoot>
				<tr>
					<td class="text-center" colspan="4">
						<ul class="pagination">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">»</a></li>
						</ul>
					</td>
					<td class="text-right">
						<button id=btn2 class="btn btn-primary" type="button"
							onclick="location.href='qna_add.jsp' ">글쓰기</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<%@ include file="../inc/footer.jsp"%>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../inc/sidebar3.jsp"%>
</body>
</html>