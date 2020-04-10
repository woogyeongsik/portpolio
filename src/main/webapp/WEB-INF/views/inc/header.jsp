<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header>
	<div class="container head">
		<div class="container logoo">
			<a href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/assets/img/logo.jpg"
				alt="로고">
			</a>
		</div>
		<c:choose>
			<c:when test="${login_info == null}">
				<ul class="click">
					<li class="login"><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
					<li class="join"><a href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
				</ul>
			</c:when>

			<c:otherwise>
				<div class="welcome"><span class="size">${login_info.userId}</span>님 반갑습니다!</div>
				<ul class="click">
					<li class="logout"><a href="${pageContext.request.contextPath}/logout_ok.do">로그아웃</a></li>
					<li class="myPage"><a href="${pageContext.request.contextPath}/commonMyPage.do">마이페이지</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="navbar navbar-inverse border">
		<div class="container">
			<!-- 메뉴 항목 -->
			<div class="nav_menu">
				<ul class="nav navbar-nav margin">
					<li><a href="${pageContext.request.contextPath}/notice_list.do">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath}/totalRank.do">랭킹 베스트</a></li>
					<li><a href="${pageContext.request.contextPath}/recommendPlace.do">추천 장소</a></li>
					<li><a href="${pageContext.request.contextPath}/searchPlace.do">시설 검색</a></li>
					<li><a href="${pageContext.request.contextPath}/qna_list.do">Q&amp;A</a></li>
				</ul>
				<form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/nav_search.do">
					<div class="input-group loc">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-search"></span>
						</div>
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-btn">
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>
<div class="row">
<div class="col-md-8 col-md-offset-2 main">