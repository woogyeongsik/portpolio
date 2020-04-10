<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</div>
<div class="col-md-2 col-sm-2">
            <div class="clearfix pad">
                <div class="pinned pull-left sidebar">
                    <div class="widget">
                        <p>날씨위젯</p>
                    </div>
                    <c:choose>
                    <c:when test="${login_info == null}">
                    <div class="cont">
                        <div class="count">
                            <button class="btn btn-link btn-lg zzimbt" id="zzimbt">
                                <span class="glyphicon glyphicon-heart second"></span>
                            </button>
                            <span class="badge bdg">0</span>
                        </div>
                        <p>내가 찜한 장소 수</p>                        
                    </div>
                    </c:when>
                    <c:otherwise>
                    	<div class="cont">
                        <div class="count">
                            <button class="btn btn-link btn-lg zzimbt" id="zzimbt_lg">
                                <span class="glyphicon glyphicon-heart second"></span>
                            </button>
                            <span class="badge bdg">0</span>
                        </div>
                        <p>내가 찜한 장소 수</p>                        
                    </div>
                    </c:otherwise>
                    </c:choose>
                    <div class="place">
                        <div class="one">최근 본 장소</div>
                        <div class="none">최근 본 장소가<br>없습니다.</div>
                        <div>
                            <ul class="ari">
                                <li>
                                    <a href="#" class="thumb">
                                        <img src="http://via.placeholder.com/90x75.png" alt="최근 본 장소" title="장소이름">
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="thumb">
                                        <img src="http://via.placeholder.com/90x75.png" alt="최근 본 장소" title="장소이름">
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="thumb">
                                        <img src="http://via.placeholder.com/90x75.png" alt="최근 본 장소" title="장소이름">
                                    </a>
                                </li>
                            </ul>
                        </div>                        
                    </div>
                </div>
            </div>
            <div id="scrolltotop_parent" class="scrolltotop_hide_onload">
                <div tabindex="0" id="scrolltotop_arrow">
                </div>
            </div>
        </div>
    </div>

<footer>
	<div class="foot">
		<div class="con-cell">
			<p>서울특별시 서초구 서초대로 77길 54 서초 W타워 14층 T. 02-1234-5678</p>
			<address>Copyright &copy; TeamFive All Rights Reserved.</address>
		</div>
	</div>
</footer>
