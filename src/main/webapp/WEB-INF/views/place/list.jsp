<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<head>
<meta charset="utf-8" />
<title>Hello JSP</title>

<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>

</head>

<body>
	<h1>학점 관리</h1>
	<a href="${pageContext.request.contextPath}/place/add.do">[학과추가]</a>



	<!-- 조회 결과 목록 -->
	<table border="1">
		<thead>
			<tr>
				<th width="100" align="center">장소타입</th>
				<th width="50" align="center">번호</th>
				<th width="300" align="center">위치</th>
				<th width="300" align="center">구</th>
				<th width="100" align="center">주소</th>
				<th width="300" align="center">신주소</th>
				<th width="100" align="center">전화번호</th>
				<th width="300" align="center">태그</th>
				<th width="100" align="center">위도</th>
				<th width="100" align="center">경도</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<%--조회결과가 없는 경우 --%>
				<c:when test="${output==null || fn:length(output) == 0 }">
					<tr>
						<td colspan="10" align="center">조회결과가 없습니다.</td>
					</tr>
				</c:when>
				<%--조회결과가 있는 경우  --%>
				<c:otherwise>
					<%-- 조회 결과에 따른 반복 처리 --%>
					<c:forEach var="item" items="${output}" varStatus="status">



						<%--상세 페이지로 이동하기 위한 URL --%>
						<c:url value="/page.do" var="viewUrl">
							<c:param name="nm" value="${item.nm}" />
						</c:url>

						<tr>
							<td align="center">${item.type_nm}</td>
							<td align="center">${item.pla_no}</td>
							<td align="center"><a href="${viewUrl}">${item.nm}</a></td>
							<td align="center">${item.nm_gu}</td>
							<td align="center">${item.addr}</td>
							<td align="center">${item.newAddr}</td>
							<td align="center">${item.phone}</td>
							<td align="center">${item.tag}</td>
							<td align="center">${item.lati}</td>
							<td align="center">${item.longi}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<!-- 페이지 번호 구현 -->
	<%-- 이전 그룹에 대한 링크 --%>
	<c:choose>
		<%-- 이전 그룹으로 이동 가능하다면? --%>
		<c:when test="${pageData.prevPage > 0 }">
			<%--이동할 URL 생성 --%>
			<c:url value="/place/list.do" var="prevPageUrl">
				<c:param name="page" value="${pageData.prevPage }" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${prevPageUrl}">[이전]</a>
		</c:when>
		<c:otherwise>
		[이전]
		</c:otherwise>
	</c:choose>

	<%-- 페이지 번호(시작 페이지 부터 끝 페이지까지 반복 --%>
	<c:forEach var="i" begin="${pageData.startPage}"
		end="${pageData.endPage}" varStatus="status">
		<%-- 이동할 URL 생성 --%>
		<c:url value="/place/list.do" var="pageUrl">
			<c:param name="page" value="${i}" />

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
			<c:url value="/place/list.do" var="nextPageUrl">
				<c:param name="page" value="${pageData.nextPage }" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>
			<a href="${nextPageUrl}">[다음]</a>
		</c:when>
		<c:otherwise>
		[다음]
		</c:otherwise>
	</c:choose>
</body>

</html>