<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

	<script>const ROOT_URL = "${pageContext.request.contextPath}";</script>
    <title>Hello JSP</title>
    <style type="text/css">

     table {width:1150px; }

    .hide {display:none;}


    .item .title {cursor:pointer;}

    .recruit a:hover {text-decoration: none; cursor:pointer; }

    div.col-md-8 {
    	right : 35px !important;
    }

    .recruit .show { display:table-row !important; } /** 애니메이션효과 추가하기(01-20 pm 04:23) */

    </style>
</head>

<body>

	<!-- 상단 현재위치 표시 -->
	<div class="container" style="margin-right:50px;">
	<br />
	<div class="location_wrap">
			<div class="location_cont text-right">
				<a href="${pageContext.request.contextPath}/" class="local_home">HOME</a> <a href="${pageContext.request.contextPath}/commonMyPage.do" > 마이 페이지</a>> 내가 쓴 리뷰
			</div>
		</div>
		<!-- 테이블 시작 -->
		<table class="table recruit" >
			<thead>
				<tr class="">
					<th scope="col" class="active text-center">번호</th>
					<th scope="col" class="active text-center" style="width:300px;">리뷰제목</th>
					<th scope="col" class="active text-center" style="width:250px;">평점들어갈예정</th>
					<th scope="col" class="active text-center">등록일</th>
				</tr>
			</thead>
			<!-- 테이블별 장소 -->
			<tbody class="text-center">
				<tr class="item">
					<td>4</td>
					<td><span class='title'>상암월드컵경기장</span></td>
					<td>평점</td>
					<td>2019-12-09</td>
				</tr>
				<!-- 아코디언효과를 넣은 리뷰내용 -->
            <tr class="hide">
                <td colspan="4">
						<p>
							<a>
								상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
								작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
								이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가
								전해져 마음속을 두근거리게 만든다.
							</a>
						</p>
					</td>
				</tr>
				<tr class="item">
					<td>3</td>
					<td><span class='title'>잠실종합운동장</span></td>
					<td></td>
					<td>2019-12-09</td>
				</tr>
				<tr class="hide">
				    <!-- 아코디언효과를 넣은 리뷰내용 -->
					<td colspan="4">
						<p>
							<a>
								상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
								작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
								이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가
								전해져 마음속을 두근거리게 만든다.
							</a>
						</p>
					</td>
				</tr>
				<tr class="item">
					<td>2</td>
					<td><span class='title'>올림픽공원</span></td>
					<td></td>
					<td>2019-12-08</td>
				</tr>
				<tr class="hide">
				<!-- 아코디언효과를 넣은 리뷰내용 -->
					<td colspan="4">
						<p>
							<a>
								상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
								작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
								이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가
								전해져 마음속을 두근거리게 만든다.
							</a>
						</p>
					</td>
				</tr>
				<tr class="item">
					<td>1</td>
					<td><span class='title'>경복궁</span></td>
					<td></td>
					<td>2019-12-08</td>
				</tr>
				<tr class="hide">
				<!-- 아코디언효과를 넣은 리뷰내용 -->
					<td colspan="4">
						<p>
							<a>
								상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
								작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
								이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가
								전해져 마음속을 두근거리게 만든다.
							</a>
						</p>
					</td>
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

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		<!-- show와 hide 클래스를 추가한 아코디언 효과 jquey -->
        $(function(){

            var article = (".recruit .show");

            $(".recruit .item .title").click(function() {

                var myArticle =$(this).parents().next("tr");

                if($(myArticle).hasClass('hide')) {

                    $(article).removeClass('show').addClass('hide');

                    $(myArticle).removeClass('hide').addClass('show');

                }

                else {

                    $(myArticle).addClass('hide').removeClass('show');

                }

            });

        });

    </script>

</body>

</html>