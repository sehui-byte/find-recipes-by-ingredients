<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- java 파일 정의 --%>
<%@ page import="java.util.List"%>
<%@ page import="com.jns.member.vo.MemberVO"%>
<%@ page import="com.jns.board.vo.BoardVO"%>
<%@ page import="com.jns.recipe.vo.RecipeVO"%>
<%@ page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@ page import="com.jns.reply.vo.ReplyVO"%>
<%@ page import="com.jns.alarm.vo.AlarmVO"%>
<%-- fileUpload 정의 --%>
<%@ page import="com.jns.common.FileLoadUtil"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>

<%-- 현재 로그인한 회원의 정보 파악 --%>
<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
Object principal = auth.getPrincipal();
String mnick = "";
String mno = "";
String mid = "";
String mlevel = "";

if (principal != null && principal instanceof MemberVO) {
	mnick = ((MemberVO) principal).getMnick();
	mno = ((MemberVO) principal).getMno();
	mid = ((MemberVO) principal).getMid();
	mlevel = ((MemberVO) principal).getMlevel();

	// 로그인시 session key값 생성
	if (session.getAttribute(mid) != null) {
		String loginSession = (String) session.getAttribute("mid");
	} else {
		session.setAttribute("mid", mid);
		String loginSession = (String) session.getAttribute("mid");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="shortcut icon" href="/kosmoJns/resources/img/favicon.ico">
<link rel="icon" href="/kosmoJns/resources/img/favicon.ico">
<!-- socketJS -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- font awewome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
/*google 웹폰트 */
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap')
	;

/*font 적용*/
div, h1, h2, h3, h4, h5, h6, p {
	font-family: 'Noto Serif KR', serif;
}

/*콘텐츠 가운데 정렬*/
#wrapper {
	max-width: 1020px;
	margin: 0 auto;
	margin-top: 50px;
}

/*navbar 일부 가운데 정렬*/
#navbarSupportedContent {
	max-width: 1020px;
	margin: 0 auto;
}

/*소켓 알림 오른쪽에 고정*/
#socketAlarm {
	position: fixed;
	right: 40px;
	top: 100px;
	/*가려지지 않게 맨 위로 배치*/
	z-index: 1;
}

.fas {
	margin-top: 9px;
	margin-right: 8px;
	color: black;
}

.fas:hover {
	color: #F9A781;
}

/*마이페이지, 로그아웃버튼, 미확인 알림 수평정렬*/
.userInfo {
	display: flex;
	margin: 10px auto;
	width: 90%;
	margin-right: 80px;
}

/*알림 버튼 */
.icon-button {
	margin-top: -1px;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
	color: black;
	background: none;
	border: none;
	outline: none;
	border-radius: 50%;
}

.icon-button:hover {
	color: #F9A781;
	cursor: pointer;
}

.icon-button:active {
	background: black;
}

.icon-button__badge {
	position: absolute;
	top: -8px;
	right: -5px;
	width: 20px;
	height: 20px;
	background: red;
	color: #ffffff;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
}
</style>
</head>
<body>

	<!-- web socket 부분 -->
	<script>
		// 전역변수 설정
		var socket = null;
		$(document).ready(function() {
		});

		// 웹소켓 연결
		sock = new SockJS("<c:url value="/echo"/>");
		socket = sock;
		console.log("웹소켓 연결");
		//웹소켓 서버에서 메세지를 보내면 자동으로 실행된다
		socket.onmessage = onMessage;
		var mid = "<%=mid%>";
		console.log("mid >> " + mid);

		var count = 0;//로그아웃시 왔던 메세지 개수
		
		function onMessage(evt) {//evt파라미터는 웹소켓이 보내준 데이터 의미
			var toast = '';
			console.log("서버로부터 메세지 받음");
			var arriveTime = new Date();
			var data = evt.data;
			var dataArr = data.split(",");
			console.log("dataArr[2]>> " + dataArr[2]);
			//type이 count이면 
			if (dataArr[2].substring(0, 5) == 'count') {
				count = dataArr[2].substring(5, 6);
				$("#msgCount").text(count);
				console.log("count >> " + count);
				var alert = '<div class="alert alert-primary" role="alert">미확인 알람이 있습니다!</div>';
				$("#socketAlarm").append(alert);

			} else {
				toast += '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">';
				toast += '<div class="toast-header"><class="rounded me-2">';
				toast += '<strong class="me-auto">알림</strong>';
				toast += '<small class="sub"></small>';
				toast += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
				toast += '</div><div class="toast-body">';
				toast += dataArr[2];
				toast += '</div></div>';
				$("#socketAlarm").append(toast);
				$(".toast").toast({
					"animation" : true,
					"autohide" : false
				});
				$('.toast').toast('show');

			}
		}
	</script>
	<script>
		function sendLogout() {
			socket.close();
			sock.close();
			$("#logoutForm").attr("action",
					"<c:url value='/j_spring_security_logout' />");
			$("#logoutForm").attr("method", "POST");
			$("#logoutForm").attr("enctype",
					"application/x-www-form-urlencoded");
			$("#logoutForm").submit();
		}
	</script>
	<!-- bootstrap js -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>