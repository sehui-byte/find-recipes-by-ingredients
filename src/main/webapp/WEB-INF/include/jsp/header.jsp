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
}

.fas {
	margin-top: 9px;
	margin-right: 8px;
	color: white;
}

.fas:hover {
	color: #F9A781;
}

/*마이페이지, 로그아웃버튼, 미확인 알림 수평정렬*/
.userInfo {
	display: flex;
	margin: 10px auto;
	width: 90%;
	margin-right: 50px;
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
	color: white;
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
	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-dark bg-dark shadow-sm">
		<div class="container-fluid">
			<!-- 사이트 아이콘 넣기 -->
			<a class="navbar-brand" href="http://localhost:8080/kosmoJns"> <img
				src="/kosmoJns/resources/img/jns_logo.png" alt="" width="40"
				height="40"> 전지적 냉장고 시점
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="http://localhost:8080/kosmoJns">Home</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="http://localhost:8080/kosmoJns/recipeboard.do">레시피 일반</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="http://localhost:8080/kosmoJns/chefboard/boardselectall.do">셰프
							게시판</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="http://localhost:8080/kosmoJns/searchPage.do">식재료 구매</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="true"> 공지 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="http://localhost:8080/kosmoJns/noticeSelectAllPage.do">공지사항</a></li>
							<li><a class="dropdown-item"
								href="http://localhost:8080/kosmoJns/qnaSelectAllPage.do">Q&A</a></li>
						</ul></li>
				</ul>


				<!-- 레시피 검색 -->
				<!-- 
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="레시피 검색"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				 -->
			</div>

			<!-- 로그인 버튼 -->
			<div class="loginInfo" style='text-align: right;'>
				<s:authorize access="isAnonymous()">
					<a href="/kosmoJns/login.do">로그인</a>
				</s:authorize>
				<div class="userInfo">
					<div class="dropdown">
						<s:authorize access="hasAnyRole('ROLE_U', 'ROLE_C')">
							<!-- 마이페이지 -->
							<a data-toggle="dropdown"><i class="fas fa-user-circle fa-lg"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/kosmoJns/myinfo.do?mno=<%=mno%>">마이페이지</a>
								<a class="dropdown-item" href="#">나의 레시피</a> <a
									class="dropdown-item" href="#">나의 Q&A</a>
									<a class="dropdown-item" href="likeProduct.do">나의 관심상품</a> 
								<div class="dropdown-divider"></div>
								<s:authorize access="isAuthenticated()">
									<!-- 로그아웃 버튼 -->
									<a class="dropdown-item" style="cursor:pointer;"onclick="sendLogout();">로그아웃</a>
									<form id="logoutForm">
										<input type="hidden" id="logoutbtn" name="logoutbtn" value="로그아웃"
											style="color: white; font-family: FontAwesome; border: none; background: transparent;" />
									</form>
								</s:authorize>
							</div>
						</s:authorize>
					</div>
					<s:authorize access="isAuthenticated()">
						<!-- mnick 님 반갑습니다.<br /> -->
						<!-- 알람 모양 아이콘 -->
						<button type="button" class="icon-button" onclick="location.href='alarmList.do'">
							<span class="material-icons">notifications</span> <span
								class="icon-button__badge" id="msgCount">0</span>
						</button>

						<br>
					</s:authorize>
					<s:authorize access="hasRole('ROLE_A')">
						<a href="/kosmoJns/admin/main.do">admin 접속</a>
						<br>
					</s:authorize>

				</div>
			</div>
		</div>
	</nav>
	
	
	<!-- 웹소켓 알림 띄워줄 곳 (위치 이동시킬 수 있음)-->
	<div id="socketAlarm"></div>
	
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
		var toast = '';
		function onMessage(evt) {//evt파라미터는 웹소켓이 보내준 데이터 의미
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
				toast += '<strong class="me-auto">Bootstrap</strong>';
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
				
				function timeBefore() {
					//현재시간
					var now = new Date();
					//기준시간 
					var writeDay = arriveTime;
					var minus;
					var time = '';
					if (now.getFullYear() > writeDay.getFullYear()) {
						minus = now.getFullYear() - writeDay.getFullYear();
						time += minus + "년 ";
					}
					if (now.getMonth() > writeDay.getMonth()) {
						minus = now.getMonth() - writeDay.getMonth();
						time += minus + "달 ";
					}
					if (now.getDate() > writeDay.getDate()) {
						minus = now.getDate() - writeDay.getDate();
						time += minus + "일 ";
					}

					if (now.getHours() > writeDay.getHours()) {
						minus = now.getHours() - writeDay.getHours();
						time += minus + "시간 ";
					}

					else if (now.getMinutes() > writeDay.getMinutes()) {
						minus = now.getMinutes() - writeDay.getMinutes();
						time += minus + "분 ";
					}

					else if (now.getSeconds() > writeDay.getSeconds()) {
						minus = now.getSeconds() - writeDay.getSeconds();
						time += "방금";
					}

					time += "전          ";
					document.getElementsByClassName("sub")[0].innerHTML = time;
				}
				setInterval(timeBefore, 1000);
			}
		}
	</script>
	<script>
		function sendLogout(){
				socket.close();
				sock.close();
				$("#logoutForm")
						.attr("action",
								"<c:url value='/j_spring_security_logout' />");
				$("#logoutForm").attr("method",
						"POST");
				$("#logoutForm")
						.attr("enctype",
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