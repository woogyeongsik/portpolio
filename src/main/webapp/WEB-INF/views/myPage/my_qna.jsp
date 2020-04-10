<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/sidebar.css"/>


<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
</head>

<body>

	<div class="container">
	<br />
	<div class="location_wrap">
			<div class="location_cont text-right">
				<a href="${pageContext.request.contextPath}/" class="home">HOME</a> <a href="${pageContext.request.contextPath}/commonMyPage.do" > 마이 페이지</a>> 문의/답변
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th class="active text-center">번호</th>
					<th class="active text-center">제목</th>
					<th class="active text-center">작성자</th>
					<th class="active text-center">작성일</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<tr>
					<td>3</td>
					<td>무료인 곳만 따로 모아둔 곳 있나요?</td>
					<td>java123</td>
					<td>2019-12-09</td>
				</tr>
				<tr>
					<td></td>
					<td>[RE] 무료인 곳만 따로 모아둔 곳 있나요?</td>
					<td>관리자</td>
					<td>2019-12-10</td>
				</tr>
				<tr>
					<td>2</td>
					<td>와이파이 터지나요?</td>
					<td>java123</td>
					<td>2019-12-09</td>
				</tr>
				<tr>
					<td></td>
					<td>[RE] 와이파이 터지나요?</td>
					<td>관리자</td>
					<td>2019-12-10</td>
				</tr>
				<tr>
					<td>1</td>
					<td>[비공개] 후기 작성하면 선물 주나요?</td>
					<td>java123</td>
					<td>2019-12-08</td>
				</tr>
				<tr>
					<td></td>
					<td>[RE][비공개] 후기 작성하면 선물 주나요?</td>
					<td>관리자</td>
					<td>2019-12-09</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="text-center" colspan="4">
						<ul class="pagination">
							<li><a href="#"> &lt;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<%@ include file="../inc/footer.jsp"%>
		<%@ include file="../inc/sidebar3.jsp"%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>