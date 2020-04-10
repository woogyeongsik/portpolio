<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>헛둘헛둘!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/sidebar.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/commonMypage.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/assets/js/zzim.js"></script>
<style type="text/css">
.fouc {
display: none;
}

</style>

<head>
    <meta charset="UTF-8" />
    <title>Hello JSP</title>

</head>

<body>
	<%@ include file="../inc/header.jsp" %>
	<div role="tabpanel">

	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs menu" role="tablist" id="myTab">
	    <li role="presentation" class="active nav-item"><a href="#myreview" aria-controls="home" role="tab" data-toggle="tab" >내가 쓴 리뷰</a></li>
	    <li role="presentation" class="nav-item"><a href="#like-list" aria-controls="profile" role="tab" data-toggle="tab">찜 목록</a></li>
	    <li role="presentation" class="nav-item"><a href="#qna-answer" aria-controls="profile" role="tab" data-toggle="tab">문의 / 답변</a></li>
	    <li role="presentation" class="nav-item"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">회원정보 수정</a></li>
	    <li role="presentation" class="nav-item"><a href="#quit-member" aria-controls="settings" role="tab" style="left:2px;" data-toggle="tab">회원탈퇴</a></li>
	  </ul>

	  <!-- Tab panes -->
	  <div class="tab-content fouc">
	    <div role="tabpanel" class="tab-pane active" id="myreview">
	    	<!-- 내가 쓴 리뷰 -->
	    		<!-- 상단 현재위치 표시 -->
	<div class="container" style="margin-right:50px;">
	<br />
	<div class="path_board">
			<ol class="breadcrumb text-right">
				<li><a href="${pageContext.request.contextPath}/" class="home">HOME</a></li>
				<li class="" style="margin-top: 20px;">마이페이지&emsp;>&emsp;내가 쓴 리뷰</li>
			</ol>
		</div>
		<!-- 테이블 시작 -->
		<table class="table recruit" >
				<tr class="">
					<th scope="col" class="text-center">번호</th>
					<th scope="col" class="text-center" style="width:300px;">장소명</th>
					<th scope="col" class="text-center" style="width:250px;">평점</th>
					<th scope="col" class="text-center">등록일</th>
				</tr>
			<!-- 테이블별 장소 -->
			<tbody>
			<c:choose>
				<c:when test="${output == null || fn:length(output) == 0 }">
				<tr>
					<td colspan="4" align="center">조회결과가 없습니다.</td>
				</tr>
				</c:when>
				<%-- 조회 결과가 있는 경우 --%>
				<c:otherwise>
				<%-- 조회결과에 따른 반복 처리 --%>
				<c:forEach var="item" items="${output }" varStatus="status" >
				<tr>
					<td>${(pageData.nowPage-1) * 5 + status.count }</td>
					<td><a class='showmore'>${item.nm }</a></td>
					<td>
						<div class="star_info">
                           <div class="grade_star size_s">
                              <span class="ico_star star_rate">
                                <span class="ico_star inner_star" style="width:${item.score*20}%"></span>
                            </span>
                           </div>
                        </div>
                    </td>
					<td>${fn:substring(item.edit_date,0,10) }</td>
				</tr>
				<!-- 아코디언효과를 넣은 리뷰내용 -->
            <tr class="detail">
                <td colspan="4" >
						<div>
							<p>
								<a data-toggle="modal" data-target="#myModal" data-nm= "${item.nm}"
								class="contentChange${status.index } contentChange" id="point${status.index }">
									${item.comment }
								</a>
							</p>
						</div>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>

<!-- 페이지 번호 구현 -->
	<tfoot>
		<tr>
			<td class="text-center" colspan="4">
				<ul class="pagination">
    <%-- 이전 그룹에 대한 링크 --%>
    <c:choose>
        <%-- 이전 그룹으로 이동 가능하다면? --%>
        <c:when test="${pageData.prevPage > 0}">
            <%-- 이동할 URL 생성 --%>
            <c:url value="/commonMyPage.do" var="prevPageUrl">
                <c:param name="pages" value="${pageData.prevPage}" />
            </c:url>
            <c:if test="${output != null || fn:length(output) != 0 }">
           			<li><a href=${prevPageUrl }>«</a></li>
           	</c:if>
        </c:when>
        <c:otherwise>
       		<c:if test="${output != null || fn:length(output) != 0 }">
            		<li><a class="hover_hide">«</a></li>
           	</c:if>
        </c:otherwise>
    </c:choose>


    <%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
    <c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
        <%-- 이동할 URL 생성 --%>
        <c:url value="/commonMyPage.do" var="pageUrl">
            <c:param name="pages" value="${i}" />
        </c:url>

        <%-- 페이지 번호 출력 --%>
        <c:choose>
            <%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
            <c:when test="${pageData.nowPage == i}">
            	<c:if test="${output != null || fn:length(output) != 0 }">
					<li><a class="click hide_hover" >${i }</a></li>
				</c:if>
            </c:when>
            <%-- 나머지 페이지의 경우 링크 적용함 --%>
            <c:otherwise>
				<c:if test="${output != null || fn:length(output) != 0 }">
					<li><a href="${pageUrl }">${i }</a></li>
				</c:if>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <%-- 다음 그룹에 대한 링크 --%>
    <c:choose>
        <%-- 다음 그룹으로 이동 가능하다면? --%>
        <c:when test="${pageData.nextPage > 0}">
            <%-- 이동할 URL 생성 --%>
            <c:url value="/commonMyPage.do" var="nextPageUrl">
                <c:param name="pages" value="${pageData.nextPage}" />
            </c:url>
				<c:if test="${output != null || fn:length(output) != 0 }">
            		<li><a href="${nextPageUrl}">»</a></li>
            	</c:if>
        				</c:when>
        					<c:otherwise>
				<c:if test="${output != null || fn:length(output) != 0 }">
            		<li><a class="hover_hide">»</a></li>
            	</c:if>
        					</c:otherwise>
    					</c:choose>
    				</ul>
	    		</td>
    		</tr>
		</tfoot>
	</table>
</div>

			<!-- Modal 기능을 활용한 리뷰 수정 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
  			<div class="modal-dialog" role="document">
			    <div class="modal-content">
     				 <div class="modal-header">
    	    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3>리뷰 수정 및 삭제</h3>
      </div>
	        <div class="modal-body" style="position: relative;">
        <form id="update_review">
          <div class="form-group">
            <label for="message-text" class="control-label">리뷰내용</label>
            <span style="display: inline-block; margin-left: 300px"><strong>리뷰평점:</strong></span>
            	<textarea class="form-control" id="message-text" style="height:120px;"></textarea>
            <div class="star_info" style="position:absolute; 0px; right: 55px; bottom: 0px; top: 15px;">
				<div class="grade_star size_s" id="change_position" style="width: 100px; height: 20px;">
                    <span class="ico_star inner_star change_star change_position1" data-value='1' style=""></span>
                    <span class="ico_star inner_star change_star change_position2" data-value='2' style="margin-left: 18px;"></span>
                    <span class="ico_star inner_star change_star change_position3" data-value='3' style="margin-left: 37px;"></span>
                    <span class="ico_star inner_star change_star change_position4" data-value='4' style="margin-left: 55px;"></span>
                    <span class="ico_star inner_star change_star change_position5" data-value='5' style="margin-left: 73px;"></span>
				</div>
			</div>
          </div>
        </form>
			</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-primary adj" id="complet" style="padding-left: 12px; ">완료</button>
        	<button type="button" class="btn btn-danger" id="delete" style="padding-left: 12px; ">삭제</button>
        	<button type="button" class="btn btn-default" id="close"  data-dismiss="modal" style="padding-left: 12px; ">취소</button>
      		</div>
    			</div>
  					</div>
				</div>
	    	</div>



	    <div role="tabpanel" class="tab-pane" id="like-list">
	    	<!-- 찜 목록(경식) -->
	   <div class="container">
        <div class="page-header">
            <h2 style="display: inline;">내 찜 목록</h2>
			<ol class="breadcrumb text-right clear" style="float: right;">
				<li><a href="${pageContext.request.contextPath}/" class="home">HOME</a></li>
				<li class="">마이페이지&emsp;>&emsp;내 찜 목록</li>
			</ol>
        </div>
        <div id="pattern" class="pattern">
      <ul class="list img-list">
        <c:choose>
        	<c:when test="${output2 == null || fn:length(output2) == 0 }">
        <li>
			<h1 style="text-align: center;"> 찜 한 목록이 없습니다. </h1>
        </li>
            </c:when>
            <%-- 조회 결과가 있는 경우 --%>
            <c:otherwise>
            <!-- 조회결과에 따른 반복 처리 -->
            <c:forEach var="zzim_list" items="${output2 }" varStatus="stats">
        <li>
            <a href="${pageContext.request.contextPath}/page.do?nm=${zzim_list.nm}" class="inner">
                <div class="li-img">
                    <img src="${pageContext.request.contextPath}/assets/img/${zzim_list.nm }.jpg" alt="Image Alt Text" />
                </div>
                <div class="li-text">
                    <h4 class="li-head">${zzim_list.nm }</h4>
                    <p class="li-sub">${zzim_list.addr }</p>
                </div>
            </a>
        </li>
            </c:forEach>
	</c:otherwise>
 </c:choose>
</ul>
 <div class="adjusting_text" style="text-align: center;" >
			<ul class="pagination">
                <%-- 이전 그룹에 대한 링크 --%>
    <c:choose>
        <%-- 이전 그룹으로 이동 가능하다면? --%>
        <c:when test="${pageData2.prevPage > 0}">
            <%-- 이동할 URL 생성 --%>
            <c:url value="/commonMyPage.do" var="prevPageUrl2">
                <c:param name="page" value="${pageData2.prevPage}" />
            </c:url>
            <c:if test="${output2 != null || fn:length(output2) != 0 }">
           			<li><a href=${prevPageUrl2 }>«</a></li>
           	</c:if>
        </c:when>
        <c:otherwise>
       		<c:if test="${output2 != null || fn:length(output2) != 0 }">
            		<li><a class="hover_hide">«</a></li>
           	</c:if>
        </c:otherwise>
    </c:choose>


    <%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
    <c:forEach var="i" begin="${pageData2.startPage}" end="${pageData2.endPage}" varStatus="status">
        <%-- 이동할 URL 생성 --%>
        <c:url value="/commonMyPage.do" var="pageUrl2">
            <c:param name="page" value="${i}" />
        </c:url>

        <%-- 페이지 번호 출력 --%>
        <c:choose>
            <%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
            <c:when test="${pageData2.nowPage == i}">
            	<c:if test="${output2 != null || fn:length(output2) != 0 }">
					<li><a class="click hide_hover" >${i }</a></li>
				</c:if>
            </c:when>
            <%-- 나머지 페이지의 경우 링크 적용함 --%>
            <c:otherwise>
				<c:if test="${output2 != null || fn:length(output2) != 0 }">
					<li><a href="${pageUrl2 }">${i }</a></li>
				</c:if>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <%-- 다음 그룹에 대한 링크 --%>
    <c:choose>
        <%-- 다음 그룹으로 이동 가능하다면? --%>
        <c:when test="${pageData2.nextPage > 0}">
            <%-- 이동할 URL 생성 --%>
            <c:url value="/commonMyPage.do" var="nextPageUrl2">
                <c:param name="page" value="${pageData2.nextPage}" />
            </c:url>
			<c:if test="${output2 != null || fn:length(output2) != 0 }">
            	<li><a href="${nextPageUrl2}">»</a></li>
            </c:if>
        </c:when>
        		<c:otherwise>
					<c:if test="${output2 != null || fn:length(output2) != 0 }">
            			<li><a class="hover_hide">»</a></li>
            		</c:if>
        		</c:otherwise>
    			</c:choose>
            </ul>
            </div>
        </div>
	</div>
</div>


<div role="tabpanel" class="tab-pane" id="qna-answer">
	    	<!-- 문의 및 답변 -->
	<div class="container">
	    	<br />
	<div class="path_board">
			<ol class="breadcrumb text-right">
				<li><a href="${pageContext.request.contextPath}/"
					class="home">HOME</a></li>
					<li><a href="${pageContext.request.contextPath}/commonMyPage.do"
					class="my_page">마이페이지</a></li>
				<li class=""> 문의 / 답변</li>
			</ol>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
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
	</div>
</div>


		<!-- 회원정보 수정 탭 -->
	    <div role="tabpanel" class="tab-pane" id="settings">
	    <!-- 회원정보 수정 -->
		<fieldset>
			<div class="form-group form-group1">
				<div class="text-center ab">회원님의 정보를 수정하시려면<br/>비밀번호를 다시 입력해주세요.</div>
				<form onsubmit="return false;">
				<div class="input-group y">
					<div class="input-group-addon" style="border: none;" ><span class="glyphicon glyphicon-ok"></span></div>
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="password" style="border: none !important;" required/>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-default btn-sm" id="submit">확인</button>
				</div>
				</form>
			</div>
		</fieldset>
	    	    </div>



	    <div role="tabpanel" class="tab-pane" id="quit-member">
	    	<!-- 회원 탈퇴 -->
				<div class="delete-main">
					<div class="deleteInfo" style="height: 360px; margin-top:50px; text-align:center;">

						<div >
							<h2>탈퇴 안내</h2>
							<p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.</p>
						</div>

						<div class="" style="margin: 50px;">
							<p>비밀번호 확인 후 아이디는 즉시 탈퇴됩니다.</p>
							<P>탈퇴 후에는 동일 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없으니 신중하게 선택해
								주세요.</P>
						</div>
						<hr />


							<div class="password-button"
								style="margin: 30px; width: 480px; margin: auto;">
								<h3>비밀번호를 입력해주세요.</h3>

								<form>7
									<div class="pass-group" >
											<label for="Inputpassword">비밀번호 </label> <input
												type="password" class="form-control" id="Inputpassword"
												placeholder="비밀번호 입력">
										</div>
									</form>
									<a class="btn btn-primary" id="delmember" style="margin-top:20px;">비밀번호
										확인</a>
							<!-- modal창 구현 부분 (대체로 <body> 끝나기 전에 모아놓는다.) -->
						</div>
					</div>
				</div>
		    </div>
	    </div>
	</div>

 <%@ include file="../inc/footer.jsp"%>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
 <script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.js"></script>



 <%@ include file="../inc/sidebar3.jsp" %>
 <script>

/** -----------------------------------------------------------------리뷰리스트 시작--------------------------------------------------------------------*/

		/** 리스트 목록 장소명 클릭시 슬라이드 효과 */
		let nm = null;
		  $('a.showmore').click(function(e) {
		    e.preventDefault();
		    // We break and store the result so we can use it to hide
		    // the row after the slideToggle is closed
		    var targetrow = $(this).closest('tr').next('.detail');
		    targetrow.show().find('div').slideToggle('slow', function(){
		      if (!$(this).is(':visible')) {
		        targetrow.hide();
		      }
		    });
		  });


    /** AF 사용시 this 사용 불가 */
    /** 모달창 로딩시 DB에 저장된 코멘트 로딩 */
    let now_score = 0;
    let onStar = 0;
    
    let output_nm = '${output[0].nm}';
    let output_nm2 = '${output2[0].nm}';
    $(() => {
    	if (output_nm ==='' || output_nm2 ==='') {
    		$(".fouc").removeClass('fouc');
    	
		} else {
			var hash = window.location.hash;  // ex) /create#func
			if(hash=='' || hash==null){
				window.location = "#myreview";
				hash = window.location.hash;
			}
			console.log(hash);
			$(".nav-item > a").click(function(){
				window.location.hash = $(this).attr("href").substr(1);	
			});
			$('#myTab a[href="'+hash+'"]').tab('show');
			$(".fouc").show();
		}
    	
            $('.contentChange').on('click', (e) => {
                var str = $(e.currentTarget).html().trim();
                $('#message-text').val(str);
                let place_nm = $(e.currentTarget).data("nm");
                for (var i = 0; i < 5; i++) {
                    if (array_nm[i] == place_nm) {
                        now_score = score[i];
                        onStar = now_score;
                        console.log("클릭한 장소 이름 : " + place_nm)
                        console.log("클릭한 장소 점수 : " + now_score);
                /** 모달창 로딩시 스코어값 반영 */
                if (now_score == 1) {
                    $('.change_position1').addClass('change_position');
                    $('.change_position2').removeClass('change_position');
                    $('.change_position3').removeClass('change_position');
                    $('.change_position4').removeClass('change_position');
                    $('.change_position5').removeClass('change_position');
                } else if(now_score == 2) {
                    $('.change_position1').addClass('change_position');
                    $('.change_position2').addClass('change_position');
                    $('.change_position3').removeClass('change_position');
                    $('.change_position4').removeClass('change_position');
                    $('.change_position5').removeClass('change_position');
                } else if(now_score == 3) {
                    $('.change_position1').addClass('change_position');
                    $('.change_position2').addClass('change_position');
                    $('.change_position3').addClass('change_position');
                    $('.change_position4').removeClass('change_position');
                    $('.change_position5').removeClass('change_position');
                } else if(now_score == 4) {
                    $('.change_position1').addClass('change_position');
                    $('.change_position2').addClass('change_position');
                    $('.change_position3').addClass('change_position');
                    $('.change_position4').addClass('change_position');
                    $('.change_position5').removeClass('change_position');
                } else {
                    $('.change_position1').addClass('change_position');
                    $('.change_position2').addClass('change_position');
                    $('.change_position3').addClass('change_position');
                    $('.change_position4').addClass('change_position');
                    $('.change_position5').addClass('change_position');
                        }
                    }
                }
            });
        });



    /** Modal 창 내의 리뷰 표현 */
    let array_nm = new Array();
    let score = new Array();
    let sco_no = new Array();


    /** 장소 목록 */
 	array_nm[0] = "${output[0].nm}"
 		array_nm[1] = "${output[1].nm}"
 			array_nm[2] = "${output[2].nm}"
 				array_nm[3] = "${output[3].nm}"
 					array_nm[4] = "${output[4].nm}"


    /** 점수 목록 */
 	score[0] = "${output[0].score}"
 		score[1] = "${output[1].score}"
 			score[2] = "${output[2].score}"
 				score[3] = "${output[3].score}"
 					score[4] = "${output[4].score}"

    /** 코멘트 번호 */
 	sco_no[0] = Number("${output[0].sco_no}");
 		sco_no[1] = Number("${output[1].sco_no}")
 			sco_no[2] = Number("${output[2].sco_no}")
 				sco_no[3] = Number("${output[3].sco_no}")
 					sco_no[4] = Number("${output[4].sco_no}")


 	for (var i = 0; i < 5; i++) {
		 		console.log(array_nm[i])
		 		console.log(score[i])
		 		console.log(sco_no[i])
	}
    /** 장소명을 클릭했을시 파라미터 값 획득 */
	$('.showmore').click(function(){
		let nm = $(this).text();
		let int_score = 0;
		console.log(nm);
		for (var i = 0; i < 5; i++) {
			if (array_nm[i] == nm) {
				int_score = Number(score[i])
				int_sco_no = Number(sco_no[i]);
			}
		}


		/** 모달 창 리뷰평점 */
		$('.ico_star ').on('mouseover', function() {
			onStar1 = parseInt($(this).data('value'), 10);
			console.log(onStar1)

	        $(this).parent().children('span.change_star').each(function(e) {
            let stars = $(this).parent().children('span.change_star');
	            if (e < onStar1) {
	                $(this).addClass('hover');
                    for (i = 0; i < stars.length; i++) {
                        $(stars[i]).removeClass('change_position');
                    }
	            } else {
	                $(this).removeClass('hover');
	            }
	        });
	      });

		$('#change_position').on('mouseout', function() {
            /** 모달창 로딩시 스코어값 반영 */
            if (onStar == 1) {
                $('.change_position1').addClass('change_position');
                $('.change_position2').removeClass('change_position');
                $('.change_position3').removeClass('change_position');
                $('.change_position4').removeClass('change_position');
                $('.change_position5').removeClass('change_position');
            } else if(onStar == 2) {
                $('.change_position1').addClass('change_position');
                $('.change_position2').addClass('change_position');
                $('.change_position3').removeClass('change_position');
                $('.change_position4').removeClass('change_position');
                $('.change_position5').removeClass('change_position');
            } else if(onStar == 3) {
                $('.change_position1').addClass('change_position');
                $('.change_position2').addClass('change_position');
                $('.change_position3').addClass('change_position');
                $('.change_position4').removeClass('change_position');
                $('.change_position5').removeClass('change_position');
            } else if(onStar == 4) {
                $('.change_position1').addClass('change_position');
                $('.change_position2').addClass('change_position');
                $('.change_position3').addClass('change_position');
                $('.change_position4').addClass('change_position');
                $('.change_position5').removeClass('change_position');
            } else {
                $('.change_position1').addClass('change_position');
                $('.change_position2').addClass('change_position');
                $('.change_position3').addClass('change_position');
                $('.change_position4').addClass('change_position');
                $('.change_position5').addClass('change_position');
            }
		});


		$('.ico_star').on('mouseout', function() {
			$(this).parent().children('span.change_star').each(function(e) {
	            $(this).removeClass('hover');
	        });
		});


	    /** 별점 클릭 이벤트 */
	    $('.ico_star').on('click', function(){
	      onStar = parseInt($(this).data('value'), 10);
	      console.log("클릭한 점수 : " + onStar);
	      // The star currently selected
	      let stars = $(this).parent().children('span.change_star');

	      for (i = 0; i < stars.length; i++) {
	        $(stars[i]).removeClass('selected');
	      }

	      for (i = 0; i < onStar; i++) {
	        $(stars[i]).addClass('selected');
	      }
        /** 취소나 닫기 버튼 누를시 .selected 클래스 제거 */
        $('.close, #close').click(() => {
            for (i = 0; i < stars.length; i++) {
                $(stars[i]).removeClass('selected');
                onStar = now_score;
            }
        });
	});


/** 데이터 수정 로직 */
$('#complet').click(function() {
        swal({
            title : '확인',
            text : '수정하시겠습니까?',
            type : 'warning',
            confirmButtonText : '예',
            showCancelButton : true,
            cancelButtonText : '아니오',
        }).then(function(result) {
            if (result.value) {
            let text_message = $('#message-text').val();
            let text_message1 = text_message.trim();
            if (text_message == '' || text_message1 == '') {
				alert("리뷰내용을 입력해주세요.")
			} else {
            $.put("${pageContext.request.contextPath}/page/", {
                    "sco_no"  : int_sco_no,
                    "comment" : text_message,
                    "score"   : onStar
                }, function(json) {
                  if (json.rt == "OK") {
                        swal('수정이 완료되었습니다.','','success').then(function(result) {
                            if (result.value) {
                                window.location = "${pageContext.request.contextPath}/commonMyPage.do?page=" + ${pageData.nowPage}
                        }
                    });
                  }
              });
			}
                } else {
                swal('취소하였습니다.','','error');
            }
        });
    });


/** 데이터 삭제 로직 */
$('#delete').click(function() {
			swal({
				title : '확인',
				text : '정말로 삭제 하시겠습니까?',
				type : 'warning',
				confirmButtonText : '예',
				showCancelButton : true,
				cancelButtonText : '아니오',
			}).then(function(result) {
				if (result.value) {
				$.delete("${pageContext.request.contextPath}/page/", {
					"sco_no" : int_sco_no
				}, function(json) {
				  if (json.rt == "OK") {
						swal('삭제가 완료되었습니다.','','success').then(function(result) {
							if (result.value) {
								window.location = "${pageContext.request.contextPath}/commonMyPage.do?page=" + ${pageData.nowPage}
						  }
					    });
					  }
				    });
				  } else {
					swal('취소하였습니다.','','error');
				}
			});
    	});
	});




</script>	

<script>
/** -----------------------------------------------------------------리뷰리스트 종료--------------------------------------------------------------------*/

/** -----------------------------------------------------------------회원탈퇴 시작--------------------------------------------------------------------*/


    $(function() {
        $("#delmember").click(function() {
            swal({
                title : '확인',
                text : '정말로 탈퇴 하시겠습니까.?',
                type : 'warning',
                confirmButtonText : '예',
                showCancelButton : true,
                cancelButtonText : '아니오',
            }).then(function(result) {
                if (result.value) {
                    swal('탈퇴','탈퇴 완료되었습니다.','success');
                    window.location = "${pageContext.request.contextPath}/";
                }
            });
        });
    });

































/**-----------------------------------------------------------------회원탈퇴 종료--------------------------------------------------------------------*/


  </script>

<!----------------------------------------------------------------회원정보 수정 시작---------------------------------------------------------------------->

  <script>
	/** 회원정보수정 비밀번호 확인 */

	$(function() {
		/* 확인버튼 클릭시 */
		$("#submit").click(function() {
			// 입력값을 취득하고, 내용의 존재여부를 검사한다.
			var check = $("#user_pw").val();

			// 입력되지 않았다면?
			if(!check) {
				alert("비밀번호를 입력하세요.");
				$("#user_pw").focus();		// 커서를 강제로 넣기
				return false;				// 실행 중단
			}

			$.post("${pageContext.request.contextPath}/pwCheck", {user_pw: check},
					function(json) {
					if (json.pwCheck == 1) {
							window.location = "${pageContext.request.contextPath}/join_edit.do";
						} else {
							alert("비밀번호가 일치하지 않습니다.");
							$("#user_pw").val("");
							$("#user_pw").focus();
							return false;
						}
			}); // end $.ajax
		}); // end click

	});

/**-----------------------------------------------------------------회원정보 수정 끝--------------------------------------------------------------------*/


























  </script>
</body>

</html>