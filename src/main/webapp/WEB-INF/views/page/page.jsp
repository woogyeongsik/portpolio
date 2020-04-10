<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/sidebar.css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/detailpage.css" />

<style>
<!--
슬라이드 -->.carousel-inner .active.left {
	left: -33%;
}

.carousel-inner .next {
	left: 33%;
}

.carousel-inner .prev {
	left: -33%;
}

.carousel-control.left, .carousel-control.right {
	background-image: none;
}

.carousel-multi .carousel-inner>.item {
	transition: 500ms ease-in-out left;
}

.carousel-multi .carousel-inner>.item>.media-card {
	/*   background: #f33; */
	border-right: 10px solid #fff;
	display: table-cell;
	width: 1%;
}

.carousel-multi .carousel-inner>.item>.media-card:last-of-type {
	/*   border-right: none; */
	border-right: 10px solid #fff;
}

.carousel-multi .carousel-inner .active {
	display: table;
}

.carousel-multi .carousel-inner .active.left {
	left: -33%;
}

.carousel-multi .carousel-inner .active.right {
	left: 33%;
}

.carousel-multi .carousel-inner .next {
	left: 33%;
}

.carousel-multi .carousel-inner .prev {
	left: -33%;
}

@media all and (transform-3d) , ( -webkit-transform-3d ) {
	.carousel-multi .carousel-inner>.item {
		transition: 500ms ease-in-out all;
		backface-visibility: visible;
		transform: none !important;
	}
}

.carousel-indicators .active {
	margin: 0 5px;
}

.carousel-indicators li {
	margin: 0 5px;
}

.success-box {
	margin: 10px 0;
	padding: 10px 10px;
	border: 1px solid #eee;
	background: #f9f9f9;
	width: 350px;
}

.success-box img {
	margin-right: 10px;
	display: inline-block;
	vertical-align: top;
}

.success-box>div {
	vertical-align: top;
	display: inline-block;
	color: #888;
}

/* Rating Star Widgets Style */
.rating-stars {
	margin-left: 100px;
}

.rating-stars ul {
	list-style-type: none;
	margin-top: 20px;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
	padding: 0;
}

.rating-stars ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.rating-stars ul>li.star>i.fa {
	font-size: 2.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul>li.star.hover>i.fa {
	color: #dc143c;
}

/* Selected state of the stars */
.rating-stars ul>li.star.selected>i.fa {
	color: #dc143c;
}

.num_letter txt_len_warp {
	float: right;
	margin: 80px 0 0 10px;
	height: 15px;
	padding: 13px 1px 0 0;
	font-size: 13px;
	font-family: Arial, sans-serif;
	line-height: 15px;
	letter-spacing: 0;
}



</style>
</head>
<body>
	<%@ include file="../inc/header.jsp"%>


	<div id="detailPage">



		<div class="container" role="main">

			<div id="carousel-example-multi"
				class="carousel carousel-multi slide">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-multi" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-multi" data-slide-to="1"></li>
					<li data-target="#carousel-example-multi" data-slide-to="2"></li>
					<li data-target="#carousel-example-multi" data-slide-to="3"></li>
					<li data-target="#carousel-example-multi" data-slide-to="4"></li>
					<li data-target="#carousel-example-multi" data-slide-to="5"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="media media-card">
							<a href="#x"><img src="http://placehold.it/500x500"
								alt="Image" class="img-responsive"></a>
						</div>
					</div>
					<div class="item ">
						<div class="media media-card">
							<a href="#x"><img src="http://placehold.it/500x500"
								alt="Image" class="img-responsive"></a>
						</div>
					</div>
					<div class="item ">
						<div class="media media-card">
							<a href="#x"><img src="http://placehold.it/500x500"
								alt="Image" class="img-responsive"></a>
						</div>
					</div>
					<div class="item ">
						<div class="media media-card">
							<a href="#x"><img src="http://placehold.it/500x500"
								alt="Image" class="img-responsive"></a>
						</div>
					</div>
					<div class="item ">
						<div class="media media-card">
							<a href="#x"><img src="http://placehold.it/500x500"
								alt="Image" class="img-responsive"></a>
						</div>
					</div>
					<div class="item ">
						<div class="media media-card">
							<a href="#x"><img src="http://placehold.it/500x500"
								alt="Image" class="img-responsive"></a>
						</div>
					</div>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-multi"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-multi"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div id="content" class="content">
				<div class="ct_box_area">
					<div class="biz_name_area"
						style="padding: 29px 156px 18px; text-align: center;">
						<i id="bookmark" class="fas fa-heart fa-3x" style="color: #ccc; font-size: 2em;
						  margin-right: 10px; line-height: 45px;"></i>
						<strong id="nm" data-nm = "${placeotp.nm}" class="name">${placeotp.nm}</strong><span class="category">${placeotp.type_nm}</span>

						<div class="info">
							<div class="info_inner">
								<div class="link_evaluation" data-cnt="24" data-target="comment"
									data-logtarget="" data-logevent="info_pannel,point">
									평점 <span class="color_b">${totalAvg}<span class="screen_out">점</span></span>
									<span class="color_g">(${totalCount})
								</div>
							</div>



							<div class="grade_star" style="margin-top: 5px;">
								<span class="ico_star star_rate" style="margin: auto;"><span
									class="ico_star inner_star" style="width: ${totalAvg*20}%;"></span></span>
							</div>

						</div>









						</a>
					</div>

				</div>
				<div class="ct_box_area">

					<div class="bizinfo_area">
						<div class="list_bizinfo">

							<div class="list_item list_item_biztel" style="margin-top: 10px;">
								<span class="tit" aria-label="전화" role="img"> <i
									class="fas fa-phone-alt"></i>
								</span>
								<div class="txt">${placeotp.phone}</div>
							</div>

							<div class="list_item list_item_address">
								<span class="tit" aria-label="도로명주소" role="img">
								<i class="fas fa-road"></i></span>
								<div class="txt">
									<ul class="list_address">
										<li><span class="newaddr">${placeotp.newAddr}</span></li>

									</ul>
								</div>
							</div>

							<div class="list_item list_item_time">
								<span class="tit" aria-label="지번주소" role="img"> <i
									class="fas fa-map-marker-alt"></i></span>
								<div class="txt">
									<ul class="list_address">
										<li><span class="label_address">지번</span>
										<span class="addr">${placeotp.addr}</span></li>
									</ul>
								</div>
							</div>

							<div class="list_item list_item_pay">
								<span class="tit" aria-label="입장료" role="img">
								<i class="fas fa-tags"></i></span>
								<div class="txt">
									<span class="pay">${placeotp.tag} </span>
								</div>
							</div>





							<div class="list_item list_item_homepage">
								<span class="tit" aria-label="지도" role="img"><i class="fas fa-map"></i></span>
								<div class="txt">
									<span class="mapbtn">
										<a class="link" href="http://v4.map.naver.com/?mapmode=0&amp;lat=${placeotp.lati}&amp;lng=${placeotp.longi}&amp;dlevel=11&amp;enc=b64&amp;pinType=site">지도보기</a></span>
								</div>
							</div>

						</div>
					</div>

				</div>



				<div class="cont_evaluation" style="margin-top: 30px;">



					<div class="evaluation_sorting">
						<span class="tit_subject"> 전체 <span class="color_b">(${totalCount})</span>
						</span>
					</div>







					<div class="evaluation_review" id="evaluation_review" style="margin-top: 10px;">
						<ul class="list_evaluation">



							<table border="1">

								<tbody id = "list">
									<c:choose>
										<%--조회결과가 없는 경우 --%>
										<c:when test="${output==null || fn:length(output) == 0 || totalCount == 0 || totalAvg == null}">
											<tr>
												<td align="center" style="width:1500px">	처음으로 이 장소에 대해 평가해주세요.</td>
											</tr>
										</c:when>
										<%--조회결과가 있는 경우  --%>
										<c:otherwise>
											<%-- 조회 결과에 따른 반복 처리 --%>
											<c:forEach var="item" items="${output}" varStatus="status">



												<%--상세 페이지로 이동하기 위한 URL --%>
												<c:url value="/admin/view.do" var="viewUrl">
													<c:param name="pla_no" value="${item.pla_no}" />
												</c:url>

												<tr >
													<li data-sco_no="${item.sco_no}" id="appendform" data-is-block="false">

								<div class="star_info">
									<div class="grade_star size_s">
										<span class="ico_star star_rate"><span
											class="ico_star inner_star" style="width: ${item.score*20}%;"></span></span> <em
											class="num_rate">${item.score }<span class="screen_out">점</span></em>
									</div>
								</div>

								<div class="comment_info">
									<p class="txt_comment ">
										<span>${item.comment}</span>

									</p>

									<div class="append_item">
										<span class="bg_bar"></span> <em class="screen_out">작성자: </em>
										<span class="link_user"  id="userid"
										data-userid="${item.user_id}">${item.user_id}</span>

										<span class="bg_bar"></span> <em class="screen_out">작성일 :
										</em><span class="time_write">${item.edit_date}</span>
										<span class="bg_bar"></span>

										<c:if test = "${login_info.userId == item.user_id}">
										<a href="#none" data-id="updateBtn" class="link_function"
										id="updateBtn" data-sco_no="${item.sco_no}" data-score="${item.score}"
										data-comment="${item.comment}" data-user_id="${item.user_id}"
										> 수정 </a>
										<spanclass="bg_bar"></span>

										<a href="#none" data-id="deleteBtn" class="link_function"
										id="deleteBtn" data-sco_no="${item.sco_no}"
										 > 삭제 </a>
										</c:if>

									</div>
								</div>

							</li>

												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>

							<!-- 페이지 번호 구현 -->
							<%-- 이전 그룹에 대한 링크 --%>
							<div align="center">
								<c:choose>
									<%-- 이전 그룹으로 이동 가능하다면? --%>
									<c:when test="${pageData.prevPage > 0 }">
										<%--이동할 URL 생성 --%>
										<c:url value="/page.do?nm=${placeotp.nm}" var="prevPageUrl">
											<c:param name="page" value="${pageData.prevPage }" />

										</c:url>
										<a id="prevPage" href="${prevPageUrl}">[이전]</a>
									</c:when>
									<c:otherwise>[이전]</c:otherwise>
								</c:choose>

								<%-- 페이지 번호(시작 페이지 부터 끝 페이지까지 반복 --%>
								<c:forEach var="i" begin="${pageData.startPage}"
									end="${pageData.endPage}" varStatus="status">
									<%-- 이동할 URL 생성 --%>
									<c:url value="/page.do?nm=${placeotp.nm}" var="pageUrl">
										<c:param name="page" value="${i}" />

									</c:url>
									<%-- 페이지 번호 출력 --%>
									<c:choose>
										<%--현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
										<c:when test="${pageData.nowPage == i }">
											<strong id="num">${i}</strong>
										</c:when>
										<%--나머지 페이지의 경우 링크 적용함 --%>
										<c:otherwise>
											<a id="movePage" href="${pageUrl}">[${i}]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<%-- 다음 그룹에 대한 링크 --%>
								<c:choose>
									<%-- 다음 그룹으로 이동 가능하다면? --%>
									<c:when test="${pageData.nextPage > 0 }">
										<%--이동할 URL 생성 --%>
										<c:url value="/page.do?nm=${placeotp.nm}" var="nextPageUrl">
											<c:param name="page" value="${pageData.nextPage }" />

										</c:url>
										<a id="nextPage" href="${nextPageUrl}">[다음]</a>
									</c:when>
									<c:otherwise>[다음]</c:otherwise>
								</c:choose>
							</div> <!--페이지 번호구현 종료-->


						</ul>
					</div>


					<!-- Handlebar 탬플릿 코드 -->
	<script id="prof-list-tmpl" type="text/x-handlebars-template">
		{{#each item}}
		<tr>
			<li data-id="${item.sco_no}" class="  " data-is-block="false">
				<div class="star_info">
					<div class="grade_star size_s">
						<span class="ico_star star_rate">
							<span class="ico_star inner_star" style="width: ${item.score*20}%;">
							</span></span>


							<em class="num_rate">${item.score }<span class="screen_out">점</span></em>
					</div>
			</div>

			<div class="comment_info">
				<p class="txt_comment "><span>${item.comment }
				</span></p>

			<div class="append_item">
			<span class="bg_bar"></span> <em class="screen_out">작성자: </em>
			<a class="link_user" href="javascript:void(0);" data-ismy="false" data-userid="${item.user_id}"
			data-username="${item.user_id}" data-platform="kakaomap">"${item.user_id}"</a>

			<span class="bg_bar"></span> <em class="screen_out">작성일: </em>
			<span class="time_write">${item.edit_date}</span>
			<span class="bg_bar"></span>

					</div>
				</div>

			</li>
		</tr>
	{{/each}}
	</script>





					<div class="evaluation_place" style="margin-bottom: 30px;">


						<form id="commentUpdateForm" method="post" >
							<fieldset>
							<input type="hidden" id="user_id" name="user_id" data-user_id="${login_info.userId}" value="${login_info.userId}" />
							<input type="hidden" id="pla_no"  name="pla_no" value="${placeotp.pla_no}" />
							<input type="hidden" id="score"  name="score" />


								<textarea class="form-control" rows="4" id="comment"
									name="comment" placeholder="이 장소에 대해 평가해주세요"
									 maxlength="300"></textarea>

								<!-- Rating Stars Box -->

								<div class='rating-stars text-center'
									style="display: inline-block;">
									<ul id='stars'>
										<li class='star' title='Poor' data-value='1' name='score'><i
											class='fa fa-star fa-fw'></i></li>
										<li class='star' title='Fair' data-value='2' name='score'><i
											class='fa fa-star fa-fw'></i></li>
										<li class='star' title='Good' data-value='3' name='score'><i
											class='fa fa-star fa-fw'></i></li>
										<li class='star' title='Excellent' data-value='4' name='score'><i
											class='fa fa-star fa-fw'></i></li>
										<li class='star' title='WOW!!!' data-value='5' name='score'><i
											class='fa fa-star fa-fw'></i></li>
									</ul>
								</div>

								<div class='success-box' style="display: inline-block">
									<div class='clearfix'></div>
									<div class='text-message'></div>
									<div class='clearfix'></div>
								</div>

								<div style="float: right; display: inline-block; margin: 10px;">
									<span class="num_letter txt_len_warp" style="">
									<span class="screen_out">등록한 글자수: </span>
									<span id="counter">(0  / 최대 300자)</span>
									</span>

									<button class="btn btn-primary" type="submit" id ="formbtn"
										style="width: 65px; height: 48px; padding: 1px; color: #fff;"
										>전송</button>
								</div>
							</fieldset>
						</form>








					</div>



				</div>
			</div>
		</div>
	</div>


	<%@ include file="../inc/footer.jsp"%>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

		<!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/assets/js/zzim.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bookmark.js"></script>

	<%@ include file="../inc/sidebar3.jsp"%>
	<script>
	var nm = $("#nm").data("nm");
	var deleteSco = $("#deleteBtn").data('sco_no');

	$(function() {
			$("#deleteBtn").click(function(e) {

				swal({
					title: "확인",
					text: "평가를 삭제 하시겠습니까?",
					type: 'warning',
					confirmButtonText: '삭제',
					showCancelButton: true,
					cancelButtonText: '취소',
				}).then(function(result) {
					if (result.value) {

						$.delete("/setspring/page",{
							"sco_no": deleteSco
						}, function(json) {
							console.log(json)

							if(json.rt == "OK"){
			    				alert("장소에 대한 평가가 삭제 되었습니다.");
			    				window.location = "${pageContext.request.contextPath}/page.do?nm=" + nm;
							}
						});
					}
				})
			});
		});

    </script>




	<script type="text/javascript">
	var nm = $("#nm").data("nm");
	var session_id = $("#user_id").data("user_id");
	var append_id = $("#updateBtn").data("user_id")

	var updateSco = $("#updateBtn").data('sco_no');
	var updateCmt = $("#updateBtn").data('comment');
	var score = $("#updateBtn").data('score');


	</script>


    <script>
    var login_check = ($("#user_id").data('user_id')? true:false);

    $('#formbtn').click (function(){
		if(!login_check) {
    		alert('로그인해주세요.');
    		window.location = "${pageContext.request.contextPath}/login.do";
    		event.preventDefault()
    	}
    });

    </script>

	<!-- 장소에 대한 평가 입력 -->
	<script>
	var login_check = ($("#user_id").data('user_id')? true:false);

	$('#stars li').on('click', function(){
		if(!login_check) {
    		alert('로그인해주세요.');
    		window.location = "${pageContext.request.contextPath}/login.do";
    	} else {

		var nm = $("#nm").data("nm");
		var score = parseInt($(this).data('value'), 10);
    	$("#score").val(score);
    	}
	});




    	$ ("#commentUpdateForm").ajaxForm({
    		// 전송 메서드 지정
    		url:"${pageContext.request.contextPath}/page",
    		method:"POST",

    		// 서버에서 200 응답을 전달할 경우 실행됨
    		success: function(json) {

    			console.log(json);

    			// json에 포함됨 데이터를 활용하여 상세페이지로 이동한다.
    			if(json.rt == "OK"){
    				alert("장소에 대한 평가가 등록 되었습니다.");
    				window.location = "${pageContext.request.contextPath}/page.do?nm=" + nm;
    			}

    		}
    	});




   </script>

    <script type="text/javascript">
	$(function() {



        /* 1. Visualizing things on Hover - See next part for action on click */
        $('#stars li').on('mouseover', function() {
                    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on

                    // Now highlight all the stars that's not after the current hovered star
                    $(this).parent().children('li.star').each(function(e) {
                        if (e < onStar) {
                            $(this).addClass('hover');
                        } else {
                            $(this).removeClass('hover');
                        }
                    });
                    })
            $('#stars li').on('mouseout', function() {
            $(this).parent().children('li.star').each(function(e) {
                $(this).removeClass('hover');
            });
        });

        /* 별점 클릭 이벤트 */
        $('#stars li').on('click', function(){
          var onStar = parseInt($(this).data('value'), 10);
          // The star currently selected
          var stars = $(this).parent().children('li.star');

          for (i = 0; i < stars.length; i++) {
            $(stars[i]).removeClass('selected');
          }

          for (i = 0; i < onStar; i++) {
            $(stars[i]).addClass('selected');
          }

          // 점수에 따른 메시지 변경
          var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
          var msg = "";
          if (ratingValue > 1) {
              msg = "감사합니다. 당신의 점수는  " + ratingValue + " 점 입니다.";
          }
          else {
              msg = "노력하겠습니다. 당신의 점수는 " + ratingValue + " 점 입니다.";
          }

          responseMessage(msg);

        });


      });


      function responseMessage(msg) {
        $('.success-box').fadeIn(200);
        $('.success-box div.text-message').html("<span>" + msg + "</span>");
      }
	</script>

	<script type="text/javascript">
		// 한 페이지당 3개의 사진 노출
		$('.carousel.carousel-multi .item').each(function() {
			var next = $(this).next();

			if (!next.length) {
				next = $(this).siblings(':first');
					} next.children(':first-child').clone().attr("aria-hidden","true").appendTo($(this));

					if (next.next().length > 0) {
						next.next().children(':first-child').clone().attr("aria-hidden", "true").appendTo($(this));
					} else {
						$(this).siblings(':first').children(':first-child').clone().appendTo($(this));
					}
		});
	</script>



	<!-- 글자수 및 제한 -->
	<script type="text/javascript">
		//textarea counter
		var login_check = ($("#user_id").data('user_id')? true:false);

	$("#comment").click(function() {

		if(!login_check) {
			alert('로그인해주세요.');
			window.location = "${pageContext.request.contextPath}/login.do";
		} else {

		$('#comment').keyup(function(e) {
			var content = $(this).val().replace(/ /gi, '');
			$('#counter').html("(" + content.length + " / 최대 300자)"); //글자수 실시간 카운팅

			if (content.length > 300 ) {
				alert("최대 300자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 300));
				$('#counter').html("(300 / 최대 300자)");
			}

			});



		}
	});

	</script>

	<script>

	var login_check = ($("#user_id").data('user_id')? true:false);

	$("#bookmark").click(function() {

		if(!login_check) {

			swal({
				title: "확인",
				text: "로그인이 필요합니다. 로그인 하시겠습니까?",
				type: 'warning',
				confirmButtonText: '확인',
				showCancelButton: true,
				cancelButtonText: '취소',
			}).then(function(result) {
				if (result.value) {
					location.href="${pageContext.request.contextPath}/login.do";
			}
		})

		} else {


		};

	});

</script>


</body>
</html>