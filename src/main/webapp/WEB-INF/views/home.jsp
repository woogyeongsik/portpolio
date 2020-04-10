<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="javax.naming.*,java.sql.*,java.io.*,java.lang.*,java.text.*,java.util.*"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>헛둘헛둘!</title>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mainpage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
<link rel="stylesheet" type="text/css" href="assets/plugins/ajax/ajax_helper.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/assets/js/zzim.js"></script>
</head>

<body>

	<%@ include file="inc/header.jsp"%>
	<div class="container">
		<div class="page-header">
			<h2>TOP5</h2>
		</div>


		<div id="carousel-id" class="carousel slide" data-ride="carousel">
			<!-- 중앙 하단부 동그라미들 -->
			<ol class="carousel-indicators circle">
				<li data-target="#carousel-id" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-id" data-slide-to="1" class=""></li>
				<li data-target="#carousel-id" data-slide-to="2" class=""></li>
				<li data-target="#carousel-id" data-slide-to="3" class=""></li>
				<li data-target="#carousel-id" data-slide-to="4" class=""></li>
			</ol>
			<!-- 이미지 슬라이드 -->
			<div class="carousel-inner">
				<div class="item active">
					<img alt="이미지슬라이드1" src="${pageContext.request.contextPath}/assets/img/${output[0].nm}.jpg" class="img">
					<div class="container">
						<div class="carousel-caption d-none d-md-block">
							<h3>First Image</h3>
							<p>This is one of the picture</p>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="이미지슬라이드1" src="${pageContext.request.contextPath}/assets/img/${output[1].nm}.jpg" class="img">
					<div class="container">
						<div class="carousel-caption d-none d-md-block">
							<h3>First Image</h3>
							<p>This is two of the picture</p>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="이미지슬라이드1" src="${pageContext.request.contextPath}/assets/img/${output[2].nm}.jpg" class="img">
					<div class="container">
						<div class="carousel-caption d-none d-md-block">
							<h3>First Image</h3>
							<p>This is three of the picture</p>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="이미지슬라이드1" src="${pageContext.request.contextPath}/assets/img/${output[3].nm}.jpg" class="img">
					<div class="container">
						<div class="carousel-caption d-none d-md-block">
							<h3>First Image</h3>
							<p>This is four of the picture</p>
						</div>
					</div>
				</div>
				<div class="item">
					<img alt="이미지슬라이드1" src="${pageContext.request.contextPath}/assets/img/${output[4].nm}.jpg" class="img">
					<div class="container">
						<div class="carousel-caption d-none d-md-block">
							<h3>First Image</h3>
							<p>This is five of the picture</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 이전,다음 버튼 -->
			<a class="left carousel-control" href="#carousel-id"
				data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			<a class="right carousel-control" href="#carousel-id"
				data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>

	<!-- 연령대 항목 -->
	<div class="ten-age clearfix">
		<h1 style="margin-top: 60px; font-size: 30px;">연령대별 TOP5</h1>
		<hr style="margin-left: 10px; width: 970px;">
		<div class="clearfix">
		<span class="age_left" style="float: left; width: 44%; text-align: right; padding-top: 2px; padding-right:15px; margin-left: 30px"><i class="age_left_arrow fas fa-angle-left fa-3x"></i></span>


		<div id="ageLike" style="width: 60px; height: 50px; float: left; overflow: hidden;">
		<ul style="list-style: none; height: 40px; width: 380px;" class="clearfix selectAge" >
			<li style="float: left;" class="ten">10대</li>
			<li style="float: left;" class="twenty">20대</li>
			<li style="float: left;" class="thirty">30대</li>
			<li style="float: left;" class="forty">40대</li>
			<li style="float: left;" class="fifty">50대</li>
			<li style="float: left;" class="sixty">60대</li>
		</ul>
		</div>
		<span class="age_right" style="float: left; width: 44%; padding-top: 2px; padding-left: 18px;" ><i class="age_right_arrow fas fa-angle-right fa-3x"></i></span>
		</div>


		<!-- 사진나열 -->
		<div class="ten-age clearfix location-listing" style="height: 500px; position: relative;">
		<a class="location-title ageTitleName1" id="change_href_age1" href="${pageContext.request.contextPath}/page.do?nm=${output1[0].nm}" style="width: 970px; margin-left: 10px;">
				${output1[0].nm}
		</a>

		<a href="#" class="location-image">
			<img id="ageTop1" src="${pageContext.request.contextPath}/assets/img/${output1[0].nm}.jpg"
				style="width: 97%; height: 100%; margin-left: 10px; margin-bottom: 20px;"
				alt="연령별 탑1 이미지">
			</a>
		</div>

		<div class="sub-img clearfix" style="height: auto; width: 1000px; margin-top: 30px;">
			<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output1[1].nm}" class="location-title ageTitleName2" id="change_href_age2">
				${output1[1].nm}
			</a>
			<a class="location-image">
				<img id="ageTop2" src="${pageContext.request.contextPath}/assets/img/${output1[1].nm}.jpg" alt="연령별 탑2 이미지">
				</a>
			</div>


			<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output1[2].nm}" class="location-title ageTitleName3" id="change_href_age3">
				${output1[2].nm}
			</a>
			<a class="location-image">
				<img id="ageTop3" src="${pageContext.request.contextPath}/assets/img/${output1[2].nm}.jpg" alt="연령별 탑3 이미지">
				</a>
			</div>


			<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output1[3].nm}" class="location-title ageTitleName4" id="change_href_age4">
				${output1[3].nm}
			</a>
			<a class="location-image">
				<img id="ageTop4" src="${pageContext.request.contextPath}/assets/img/${output1[3].nm}.jpg" alt="연령별 탑4 이미지">
				</a>
			</div>


			<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output1[4].nm}" class="location-title ageTitleName5" id="change_href_age5">
				${output1[4].nm}
			</a>
			<a class="location-image">
				<img id="ageTop5" src="${pageContext.request.contextPath}/assets/img/${output1[4].nm}.jpg" alt="연령별 탑5 이미지">
			</a>
			</div>
		</div>
	</div>

	<br>

	<div class="twenty-age clearfix">
		<h1 style="font-size: 30px;">성별 TOP5</h1>
		<hr style="margin-left: 10px; width: 970px;">
		<div class="clearfix">
		<span class="gendar_left" style="float: left; width: 44%; text-align: right; padding-top: 2px; padding-right:15px; margin-left: 30px"><i class="fas fa-angle-left fa-3x arrow"></i></span>
		<div id="gendarLike" style="width: 58px; float: left; overflow: hidden;">
		<ul style="list-style: none; height: 40px; width: 120px;" class="clearfix selectGendar" >
			<li style="float: left;" class="male">남자</li>
			<li style="float: left;" class="female">여자</li>
		</ul>
		</div>
		<span class="gendar_right" style="float: left; width: 44%; padding-top: 2px; padding-left: 15px; " ><i class="fas fa-angle-right fa-3x arrow"></i></span>
		</div>

		<div class="ten-age clearfix location-listing" style="height: 500px; position: relative;">
		<a class="location-title img_num1" href="${pageContext.request.contextPath}/page.do?nm=${output2[0].nm}" style="width: 970px; margin-left: 10px;" id="change_href_sex1">
				${output2[0].nm}
		</a>

		<a href="#" class="location-image">
			<img id="imgTop1" src="${pageContext.request.contextPath}/assets/img/${output2[0].nm}.jpg"
				style="width: 97%; height: 100%; margin-left: 10px; margin-bottom: 20px;"
				alt="탑1">
			</a>
		</div>


		<div class="sub-img clearfix" style="height: auto; width: 1000px">

		<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output2[1].nm}" class="location-title img_num2" id="change_href_sex2">
				${output2[1].nm }
			</a>
			<a class="location-image">
				<img id="imgTop2" src="${pageContext.request.contextPath}/assets/img/${output2[1].nm}.jpg" alt="탑2">
			</a>
			</div>

			<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output2[2].nm}" class="location-title img_num3" id="change_href_sex3">
				${output2[2].nm}
			</a>
			<a class="location-image">
				<img id="imgTop3" src="${pageContext.request.contextPath}/assets/img/${output2[2].nm}.jpg" alt="탑2">
				</a>
			</div>

			<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output2[3].nm}" class="location-title img_num4" id="change_href_sex4">
				${output2[3].nm}
			</a>
			<a class="location-image" href="#imgTop1">
				<img id="imgTop4" src="${pageContext.request.contextPath}/assets/img/${output2[3].nm}.jpg" alt="탑4">
				</a>
			</div>

			<div class="subtop-img location-listing">
			<a href="${pageContext.request.contextPath}/page.do?nm=${output2[4].nm}" class="location-title img_num5" id="change_href_sex5">
				${output2[4].nm}
			</a>
			<a class="location-image">
				<img id="imgTop5" src="${pageContext.request.contextPath}/assets/img/${output2[4].nm}.jpg" alt="탑4">
				</a>
			</div>
		</div>
	</div>
	<h2 style="margin-top: 20px; margin-bottom: 20px;"><i style="margin-right: 20px" class="fas fa-star-of-david spin"></i>서울시 주요 관광명소 위치<i style="margin-left: 20px" class="fas fa-star-of-david spin"></i></h2>
	<hr>
	<div id="map" style="width: 100%; height: 600px; background-color: #eee">

	</div>

	<%@ include file="inc/footer.jsp"%>


    	<!-- jQuery Ajax Form Plugin CDN  -->
		<%@ include file="inc/sidebar3.jsp"%>
    	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f83ee16168dc59d555b939815bd9da58"></script>  -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f83ee16168dc59d555b939815bd9da58&libraries=clusterer"></script>
		<script type="text/javascript">

	/** 슬라이드 이동시간 설정(6초) */
	$('.carousel').carousel({
		  interval: 6000
		});

	/** 현재 텍스트 내용 */
	let target = $('.selectGendar > li:nth-child(1)').text();



	/** 남자, 여자 성별 분류 */
    $(() => {
		$('.arrow').click(() => {
	/** 여자의 선호 장소 */
	if(target == "남자") {
		$('.selectGendar').css('transform', 'translate3d(-57px,0px,0px)');
		target = $('.selectGendar > li:nth-child(2)').text();
		$.ajax( {
			/** ajax 기본 옵션 */
			cache: false,			 // 캐쉬 사용 금지 처리
			url: '${pageContext.request.contextPath}/getgender/여',   // 읽어들일 파일의 경로
			method: 'get',			 // 통신방법 (get(기본값), post)
			data: {},				 // 접속대상에게 전달할 파라미터
			dataType: 'json',		 // 읽어올 내용 형식 (html,xml,json)
			timeout: 30000,			 // 타임아웃 (30초)
			// 통신 시작전 실행할 기능 (ex: 로딩바 표시)
			beforeSend: function() {
				// 현재 통신중인 대상 페이지를 로그로 출력함
				console.log(">> Ajax 통신 시작 >> " + this.url);
			},
			// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
			success: function(req) {
				console.log(">> 성공!!!! >> " + req);
				let urlImg1 = req.item[0].nm;
				let urlImg2 = req.item[1].nm;
				let urlImg3 = req.item[2].nm;
				let urlImg4 = req.item[3].nm;
				let urlImg5 = req.item[4].nm;


				console.log(urlImg1);
				console.log(urlImg2);
				console.log(urlImg3);
				console.log(urlImg4);
				console.log(urlImg5);


				// img태그 src 속성을 받아온 json 데이터 경로로 변환한다.

				var img1 = $('#imgTop1')
				var img2 = $('#imgTop2')
				var img3 = $('#imgTop3')
				var img4 = $('#imgTop4')
				var img5 = $('#imgTop5')


				img1.fadeOut('fast', () => {
					img1.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg1 + ".jpg");
					img1.fadeIn('fast');
				});
				img2.fadeOut('fast', () => {
					img2.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg2 + ".jpg");
					img2.fadeIn('fast');
				});
				img3.fadeOut('fast', () => {
					img3.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg3 + ".jpg");
					img3.fadeIn('fast');
				});
				img4.fadeOut('fast', () => {
					img4.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg4 + ".jpg");
					img4.fadeIn('fast');
				});
				img5.fadeOut('fast', () => {
					img5.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg5 + ".jpg");
					img5.fadeIn('fast');
				});

				$("#change_href_sex1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg1);
				$("#change_href_sex2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg2);
				$("#change_href_sex3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg3);
				$("#change_href_sex4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg4);
				$("#change_href_sex5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg5);


			 /*	$("#imgTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg1 + ".jpg");
				$("#imgTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg2 + ".jpg");
				$("#imgTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg3 + ".jpg");
				$("#imgTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg4 + ".jpg");
				$("#imgTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg5 + ".jpg"); */




				// img 내부에 마우스호버효과 시 장소명도 변경한다.
				let title_name1 = urlImg1;
				title_name1 = title_name1.substr(0, title_name1.length);

				let title_name2 = urlImg2;
				title_name2 = title_name2.substr(0, title_name2.length);

				let title_name3 = urlImg3;
				title_name3 = title_name3.substr(0, title_name3.length);

				let title_name4 = urlImg4;
				title_name4 = title_name4.substr(0, title_name4.length);

				let title_name5 = urlImg5;
				title_name5 = title_name5.substr(0, title_name5.length);


				$(".img_num1").html(title_name1);
				$(".img_num2").html(title_name2);
				$(".img_num3").html(title_name3);
				$(".img_num4").html(title_name4);
				$(".img_num5").html(title_name5);


			},
			// 통신 실패시 호출될 함수 (파라미터는 에러내용)
			error: (error) => {
				// 404 -> Page Not Found
				// 50x -> Server Error(웹 프로그램 에러)
				// 200, 0 -> 내용의 형식 에러(JSON,XML)
				console.log(">> 에러!!!! >> " + error.status);

			},
			// 성공,실패에 상관 없이 맨 마지막에 무조건 호출됨 ex) 로딩바 닫기
			complete: () => {
				console.log(">> Ajax 통신 종료!!!!");
			}

	    });

	<!-- 남자의 선호 장소 -->
	} else if(target !== "남자") {
	// target.innerHTML = "여자"

	$('.selectGendar').css('transform', 'translate3d(0px,0px,0px)');
	target = $('.selectGendar > li:nth-child(1)').text();
	$.ajax( {

		/** ajax 기본 옵션 */
		cache: false,			 // 캐쉬 사용 금지 처리
		url: '${pageContext.request.contextPath}/getgender/남',			 // 읽어들일 파일의 경로
		method: 'get',			 // 통신방법 (get(기본값), post)
		data: {},				 // 접속대상에게 전달할 파라미터
		dataType: 'json',		 // 읽어올 내용 형식 (html,xml,json)
		timeout: 30000,			 // 타임아웃 (30초)

		// 통신 시작전 실행할 기능 (ex: 로딩바 표시)
		beforeSend: function() {
			// 현재 통신중인 대상 페이지를 로그로 출력함
			console.log(">> Ajax 통신 시작 >> " + this.url);

		},


		// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
		success: function(req) {
			console.log(">> 성공!!!! >> " + req);
			let urlImg1 = req.item[0].nm;
			let urlImg2 = req.item[1].nm;
			let urlImg3 = req.item[2].nm;
			let urlImg4 = req.item[3].nm;
			let urlImg5 = req.item[4].nm;

			console.log(urlImg1)
			console.log(urlImg2)
			console.log(urlImg3)
			console.log(urlImg4)
			console.log(urlImg5)

				var img1 = $('#imgTop1')
				var img2 = $('#imgTop2')
				var img3 = $('#imgTop3')
				var img4 = $('#imgTop4')
				var img5 = $('#imgTop5')


				img1.fadeOut('fast', () => {
					img1.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg1 + ".jpg");
					img1.fadeIn('fast');

				});
				img2.fadeOut('fast', () => {
					img2.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg2 + ".jpg");
					img2.fadeIn('fast');

				});
				img3.fadeOut('fast', () => {
					img3.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg3 + ".jpg");
					img3.fadeIn('fast');

				});
				img4.fadeOut('fast', () => {
					img4.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg4 + ".jpg");
					img4.fadeIn('fast');

				});
				img5.fadeOut('fast', () => {
					img5.attr('src', "${pageContext.request.contextPath}/assets/img/"+ urlImg5 + ".jpg");
					img5.fadeIn('fast');

				});

				$("#change_href_sex1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg1);
				$("#change_href_sex2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg2);
				$("#change_href_sex3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg3);
				$("#change_href_sex4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg4);
				$("#change_href_sex5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+urlImg5);


			// img태그 src 속성을 받아온 json 데이터 경로로 변환한다.

			/* $("#imgTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg1 + ".jpg");
			$("#imgTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg2 + ".jpg");
			$("#imgTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg3 + ".jpg");
			$("#imgTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg4 + ".jpg");
			$("#imgTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+urlImg5 + ".jpg"); */


			// Ajax 통신에 성공하여 결과값이 바뀌면 해당이미지 장소이름과 동일한 이름이  마우스 호버효과 시 표현된다.
			let title_name1 = urlImg1;
			title_name1 = title_name1.substr(0, title_name1.length);

			let title_name2 = urlImg2;
			title_name2 = title_name2.substr(0, title_name2.length);

			let title_name3 = urlImg3;
			title_name3 = title_name3.substr(0, title_name3.length);

			let title_name4 = urlImg4;
			title_name4 = title_name4.substr(0, title_name4.length);

			let title_name5 = urlImg5;
			title_name5 = title_name5.substr(0, title_name5.length);


			$(".img_num1").html(title_name1);
			$(".img_num2").html(title_name2);
			$(".img_num3").html(title_name3);
			$(".img_num4").html(title_name4);
			$(".img_num5").html(title_name5);
		},


		// 통신 실패시 호출될 함수 (파라미터는 에러내용)
		error: function(error) {
			// 404 -> Page Not Found
			// 50x -> Server Error(웹 프로그램 에러)
			// 200, 0 -> 내용의 형식 에러(JSON,XML)
			console.log(">> 에러!!!! >> " + error.status);
		},

		// 성공,실패에 상관 없이 맨 마지막에 무조건 호출됨 ex) 로딩바 닫기
		complete: function() {
			console.log(">> Ajax 통신 종료!!!!");
		}

			   });
			}
		});
    });


	let age_target = $('.selectAge > li:nth-child(1)').text();
	<!-- 연령대별 페이지 이동 1) 오른쪽 이동 -->
	$(() => {
		$('.age_right_arrow').click(() => {

		if(age_target == "10대") {

				$('.selectAge').css('transform', 'translate3d(-62px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(2)').text();

				$.get("${pageContext.request.contextPath}/getage/20,30", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);


					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});

			} else if(age_target == "20대") {

				$('.selectAge').css('transform', 'translate3d(-125px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(3)').text();

				$.get("${pageContext.request.contextPath}/getage/30,40", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);


					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});

			} else if(age_target == "30대") {
				$('.selectAge').css('transform', 'translate3d(-187px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(4)').text();

				$.get("${pageContext.request.contextPath}/getage/40,50", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);


					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});


			} else if(age_target == "40대") {
				$('.selectAge').css('transform', 'translate3d(-250px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(5)').text();

				$.get("${pageContext.request.contextPath}/getage/50,60", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});

			} else if(age_target == "50대") {

				$('.selectAge').css('transform', 'translate3d(-312px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(6)').text();

				$.get("${pageContext.request.contextPath}/getage/60,70", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");



					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});

			} else {

				$('.selectAge').css('transform', 'translate3d(0px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(1)').text();

				$.get("${pageContext.request.contextPath}/getage/10,20", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");



					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});


				}
			});
		});


	<!-- 연령대별 페이지 이동 2) 왼쪽 이동 -->
	$(() => {
		$('.age_left_arrow').click(() => {

			if(age_target == "10대") {
				$('.selectAge').css('transform', 'translate3d(-312px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(6)').text();

				$.get("${pageContext.request.contextPath}/getage/60,70", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");



					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});


				} else if(age_target == "20대") {
				$('.selectAge').css('transform', 'translate3d(0px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(1)').text();

				$.get("${pageContext.request.contextPath}/getage/10,20", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});


				} else if(age_target == "30대") {
				$('.selectAge').css('transform', 'translate3d(-62px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(2)').text();

				$.get("${pageContext.request.contextPath}/getage/20,30", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});


				} else if(age_target == "40대") {
				$('.selectAge').css('transform', 'translate3d(-125px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(3)').text();

				$.get("${pageContext.request.contextPath}/getage/30,40", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});

				} else if(age_target == "50대") {
				$('.selectAge').css('transform', 'translate3d(-187px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(4)').text();

				$.get("${pageContext.request.contextPath}/getage/40,50", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");

					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);
				});


				} else if (age_target == "60대") {
				$('.selectAge').css('transform', 'translate3d(-250px,0px,0px)');
				age_target = $('.selectAge > li:nth-child(5)').text();

				$.get("${pageContext.request.contextPath}/getage/50,60", {
				}, (rs) => {


					imgUrl1 = rs.item[0].nm;
					imgUrl2 = rs.item[1].nm;
					imgUrl3 = rs.item[2].nm;
					imgUrl4 = rs.item[3].nm;
					imgUrl5 = rs.item[4].nm;

					console.log(imgUrl1);
					console.log(imgUrl2);
					console.log(imgUrl3);
					console.log(imgUrl4);
					console.log(imgUrl5);


					$("#ageTop1").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl1 + ".jpg");
					$("#ageTop2").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl2 + ".jpg");
					$("#ageTop3").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl3 + ".jpg");
					$("#ageTop4").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl4 + ".jpg");
					$("#ageTop5").attr("src", "${pageContext.request.contextPath}/assets/img/"+imgUrl5 + ".jpg");


					$("#change_href_age1").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl1);
					$("#change_href_age2").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl2);
					$("#change_href_age3").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl3);
					$("#change_href_age4").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl4);
					$("#change_href_age5").attr("href", "${pageContext.request.contextPath}/page.do?nm="+imgUrl5);



					// img 내부에 마우스호버효과 시 장소명도 변경한다.
					let title_name1 = imgUrl1;
					title_name1 = title_name1.substr(0, title_name1.length);

					let title_name2 = imgUrl2;
					title_name2 = title_name2.substr(0, title_name2.length);

					let title_name3 = imgUrl3;
					title_name3 = title_name3.substr(0, title_name3.length);

					let title_name4 = imgUrl4;
					title_name4 = title_name4.substr(0, title_name4.length);

					let title_name5 = imgUrl5;
					title_name5 = title_name5.substr(0, title_name5.length);



					$(".ageTitleName1").html(title_name1);
					$(".ageTitleName2").html(title_name2);
					$(".ageTitleName3").html(title_name3);
					$(".ageTitleName4").html(title_name4);
					$(".ageTitleName5").html(title_name5);

					});
				  }
				});
			});

	/** Kakao Map API */
	/** 지도 표시 */
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(37.552715718040865, 126.98623862188596), // 지도의 중심좌표
        level : 9 // 지도의 확대 레벨
    });

    // 마커 클러스터러를 생성합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 5 // 클러스터 할 최소 지도 레벨
    });

    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("${pageContext.request.contextPath}/assets/plugins/ajax/lat.json", function(data) {
		for (let i = 0; i < data.data.length; i++) {
			displaymarker(data.data[i])
		}
	});

	// var over_close = null;
	function displaymarker(lat_lng) {
		var	marker = new kakao.maps.Marker({
                map : map,
				position : new kakao.maps.LatLng(lat_lng.lat, lat_lng.lng)

            });

            var content = document.createElement('div');
            content.className = 'overlay';
            content.innerHTML = '<div class="wrap">' +
            '    <div class="info">' +
            '        <div class="title">' +
                       lat_lng.nm  +
            '            <div class="close" id="doclose" title="닫기"></div>' +
            '        </div>' +
            '        <div class="body">' +
            '            <div class="img">' +
            '                <img src="${pageContext.request.contextPath}/assets/img/' + lat_lng.nm +'.jpg"'+'width="73" height="70">' +
            '           </div>' +
            '            <div class="desc">' +
            '                <div class="ellipsis">'+'<p>' + lat_lng.addr  + '</p>' + '</div>' +
            '            </div>' +
            '        </div>' +
            '    </div>' +
            '</div>';


		var overlay = new kakao.maps.CustomOverlay({
					content: content,
					position: marker.getPosition()
			});

		// over_close = overlay;

		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
                overlay.setMap(map);
        });

        clusterer.addMarker(marker);

        content.addEventListener('click', function () {
                overlay.setMap(null);
        });
    };

	</script>


</body>

</html>