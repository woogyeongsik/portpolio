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
</style>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>
		<div class="container">
			<!--  상단 현재 페이지 위치 -->
			<ol class="breadcrumb text-right">
				<li><a href="<%=request.getContextPath()%>/mainPage.jsp"
					class="home">HOME</a></li>
				<li class="active">공지사항</li>
			</ol>
			<!--  페이지 제목  -->
			<h2>
				&emsp;<strong>공지사항</strong>
			</h2>
			<hr style="border: solid 1px #eeeeee;">
			<form method="get"
			action="<%=request.getContextPath()%>/notice/notice_list.jsp">
			<!--  검색폼  -->
			<div id="search" class="col-sm-12 well">
				<div class="col-sm-8 ">
					<div class="input-group">
						<span class="input-group-btn"> <select
							class="form-control" style="width: auto; margin-right: -1px">
								<option>제목</option>
								<option>내용</option>
						</select>
						</span> <input id="keyword" name="keyword" type="search"
							class="form-control" placeholder="Search"> <span
							class="input-group-btn">
							<button class="btn btn-primary" type="submit">검색</button>
						</span>
					</div>
				</div>
			</div>
			</form>
			<div>&nbsp; 총 52건</div>
			<!--  목록 -->
			<table class=" table">
				<thead class="table-top">
					<tr>
						<th class="text-center" width="10%">번호</th>
						<th class="text-center" width="55%">제목</th>
						<th class="text-center" width="10%">작성자</th>
						<th class="text-center" width="15%">작성일</th>
						<th class="text-center" width="10%">조회</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr class="active">
						<td>공지</td>
						<td><a
							href="<%=request.getContextPath()%>/notice/notice_view.jsp">##공지사항
								입니다.##</a></td>
						<td>관리자</td>
						<td>2019-12-08</td>
						<td>241</td>
					<tr>
					<tr class="active">
						<td>공지</td>
						<td><a href="#">##공지사항 입니다.##</a></td>
						<td>관리자</td>
						<td>2019-12-04</td>
						<td>483</td>
					</tr>
					<tr>
						<td>50</td>
						<td><a href="#">50번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-11-30</td>
						<td>755</td>
					</tr>
					<tr>
						<td>49</td>
						<td><a href="#">49번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-11-28</td>
						<td>822</td>
					</tr>
					<tr>
						<td>48</td>
						<td><a href="#">48번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-10-14</td>
						<td>779</td>
					</tr>
					<tr>
						<td>47</td>
						<td><a href="#">47번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-08-11</td>
						<td>585</td>
					</tr>
					<tr>
						<td>46</td>
						<td><a href="#">46번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-07-18</td>
						<td>963</td>
					</tr>
					<tr>
						<td>45</td>
						<td><a href="#">45번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-05-05</td>
						<td>2445</td>
					</tr>
					<tr>
						<td>44</td>
						<td><a href="#">44번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-04-28</td>
						<td>1406</td>
					</tr>
					<tr>
						<td>43</td>
						<td><a href="#">43번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-03-04</td>
						<td>1965</td>
					</tr>
					<tr>
						<td>42</td>
						<td><a href="#">42번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-01-28</td>
						<td>2354</td>
					</tr>
					<tr>
						<td>41</td>
						<td><a href="#">41번째 공지사항 입니다.</a></td>
						<td>관리자</td>
						<td>2019-01-01</td>
						<td>2482</td>
					</tr>
				</tbody>
				<!--  페이지 번호  -->
				<tfoot>
					<tr>
						<td class="text-center" colspan="5">
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
					</tr>
				</tfoot>
			</table>
	<%@ include file="../inc/sidebar3.jsp"%>
		</div>
	<%@ include file="../inc/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>