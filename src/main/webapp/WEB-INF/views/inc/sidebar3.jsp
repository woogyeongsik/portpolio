<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script src="${pageContext.request.contextPath}/assets/plugins/pin/zebra_pin.min.js"></script>
<script>
	new $.Zebra_Pin($('.pinned'), {
		top_spacing : 20
	});
</script>
<script src="${pageContext.request.contextPath}/assets/plugins/scrollTopArrow/js/scrolltotop_arrow_code.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script>
		$("#zzimbt").click(function() {
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
		});
	});
</script>
