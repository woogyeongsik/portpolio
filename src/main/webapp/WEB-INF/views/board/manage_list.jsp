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
	href="${pageContext.request.contextPath }/assets/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/assets/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/assets/css/sidebar.css" />

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
				<li><a href="${pageContext.request.contextPath }>/mainPage.jsp"
					class="home">HOME</a></li>
				<li class="active">게시판정보</li>
			</ol>
			<!--  페이지 제목  -->
			<h2>
				&emsp;<strong>게시판 정보</strong>
			</h2>
			<hr style="border: solid 1px #eeeeee;">
			<form method="get"
			action="${pageContext.request.contextPath }/board/manage_list.do">
			<!--  검색폼  -->
			<div id="search" class="col-sm-12 well">
				<div class="col-sm-8 ">
					<div class="input-group">
						<span class="input-group-btn"> <select
							class="form-control" style="width: auto; margin-right: -1px">
								<option>--선택하세요--</option>
								<option>게시판명</option>
								<option>게시판유형</option>
						</select>
						</span> <input id="keyword" name="keyword" type="search"
							class="form-control" placeholder="게시판 이름 및 게시판 유형 검색" value="${keyword}"/> <span
							class="input-group-btn">
							<button class="btn btn-primary" type="submit">검색</button>
						</span>
					</div>
				</div>
			</div>
			</form>
			<!-- 조회결과  목록 -->
			<table class=" table">
				<thead class="table-top">
					<tr>
						<th class="text-center" width="15%">번호</th>
						<th class="text-center" width="30%">게시판 명</th>
						<th class="text-center" width="20%">게시판 유형</th>
						<th class="text-center" width="20%">생성일</th>
						<th class="text-center" width="15%">삭제 여부</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:choose>
				<%--조회결과가 없는 경우 --%>
				<c:when test="${output==null || fn:length(output) == 0 }">
					<tr>
						<td colspan="9" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>
				<%--조회결과가 있는 경우  --%>
				<c:otherwise>
					<%-- 조회 결과에 따른 반복 처리 --%>
					<c:forEach var="item" items="${output}" varStatus="status">

						<%--출력을 위해 준비한 학과이름과 위치 --%>
						<c:set var="board_name" value="${item.board_name}" />
						<c:set var="board_type" value="${item.board_type}" />


						<%--검색어가 있다면 --%>
						<c:if test="${keyword !=''}">
							<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<%--출력을 위해 주니한 학과이름과 위치에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
							<c:set var="board_name" value="${fn:replace(board_name, keyword, mark)}" />

						</c:if>

						<%--상세 페이지로 이동하기 위한 URL --%>
						<c:url value="/board/manage_view.do" var="viewUrl">
							<c:param name="brd_id" value="${item.brd_id}" />
						</c:url>

						<tr>
							<td align="center">${item.board_id}</td>
							<td align="center"><a href="${viewUrl}">${board_name}</a></td>
							<td align="center">${item.board_type}</td>
							<td align="center">${item.reg_date}</td>
							<td align="center">${item.board_del}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
				</tbody>
	<!--  페이지 번호  -->
			<tfoot>
				<tr>
					<td class="text-center" colspan="5">
						<ul class="pagination">

							<!-- 페이지 번호 구현 -->
							<%-- 이전 그룹에 대한 링크 --%>
							<c:choose>
								<%-- 이전 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.prevPage > 0 }">
									<%--이동할 URL 생성 --%>
									<c:url value="/board/manage_list.do" var="prevPageUrl">
										<c:param name="page" value="${pageData.prevPage }" />
										<c:param name="keyword" value="${keyword}" />
									</c:url>
									<li><a href="${prevPageUrl}">&laquo;</a></li>
								</c:when>
								<c:otherwise>
								&laquo;
								</c:otherwise>
							</c:choose>



							<%-- 페이지 번호(시작 페이지 부터 끝 페이지까지 반복 --%>
							<c:forEach var="i" begin="${pageData.startPage}"
								end="${pageData.endPage}" varStatus="status">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/board/manage_list.do" var="pageUrl">
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
								</c:url>
								<%-- 페이지 번호 출력 --%>
								<c:choose>
									<%--현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
									<c:when test="${pageData.nowPage == i }">
										<strong>[${i}]</strong>
									</c:when>
									<%--나머지 페이지의 경우 링크 적용함 --%>
									<c:otherwise>
										<a href="${pageUrl}">[${i}]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>


							<%-- 다음 그룹에 대한 링크 --%>
							<c:choose>
								<%-- 다음 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.nextPage > 0 }">
									<%--이동할 URL 생성 --%>
									<c:url value="/board/manage_list.do" var="nextPageUrl">
										<c:param name="page" value="${pageData.nextPage }" />
										<c:param name="keyword" value="${keyword}" />
									</c:url>
									<li><a href="${nextPageUrl}">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									&raquo;
								</c:otherwise>
							</c:choose>

						</ul>
					</td>
					<td class="text-right">
						<button id=btn2 class="btn btn-primary" type="button"
							onclick="location.href='manage_add.do' ">등록</button>
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