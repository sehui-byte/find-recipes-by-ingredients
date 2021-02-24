<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- java 파일 정의 --%>
<%@ page import="java.util.List"%>
<%@ page import="com.jns.member.vo.MemberVO"%>
<%@ page import="com.jns.board.vo.BoardVO"%>
<%@ page import="com.jns.recipe.vo.RecipeVO"%>
<%@ page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@ page import="com.jns.reply.vo.ReplyVO"%>

<%-- fileUpload 정의 --%>
<%@ page import="com.jns.common.FileLoadUtil"%>

<%-- jstl 태그 정의 --%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<!-- socketJS -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
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
	if (session.getAttribute(mid) != null){
		String loginSession = (String) session.getAttribute("mid");
	}else{
		session.setAttribute("mid", mid);
		String loginSession = (String) session.getAttribute("mid");
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		// Spring Scurity logout >> post 요청만 가능
		$("#logoutbtn").click(function() {
			$("#logoutForm").attr("action","<c:url value='/j_spring_security_logout' />");
			$("#logoutForm").attr("method","POST");
			$("#logoutForm").attr("enctype","application/x-www-form-urlencoded");
			$("#logoutForm").submit();
		})
	})
</script>
<!-- bootstrap css-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.do">전냉시</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="main.do">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">레시피 일반</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">셰프 게시판</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">식재료 구매</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							공지 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">공지사항</a></li>
							<li><a class="dropdown-item" href="#">Q&A</a></li>
						</ul></li>
				</ul>
				<!-- 웹소켓 알림 띄워줄 곳 (위치 이동시킬 수 있음)-->
				<div id="socketAlarm"></div>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="레시피 검색"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<span>main header</span>
	<div class="loginInfo" style='text-align: right;'>
		<s:authorize access="isAnonymous()">
			<a href="/kosmoJns/login.do">로그인</a>
		</s:authorize>
		<s:authorize access="isAuthenticated()">
			<%=mnick%>님 반갑습니다.<br />
			<form id="logoutForm">
				<input type="button" id="logoutbtn" name="logoutbtn" value="로그아웃하기" />
				<s:csrfInput />
			</form>
			<br>
		</s:authorize>
		<s:authorize access="hasRole('ROLE_A')">
			<a href="/kosmoJns/admin/main.do">admin 접속</a>
			<br>
		</s:authorize>
		<s:authorize access="hasRole('ROLE_U')">
			<a href="/kosmoJns/myinfo.do">일반 회원 페이지로</a>
		</s:authorize>
	</div>

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

	//evt파라미터는 웹소켓이 보내준 데이터 의미
	function onMessage(evt) {
		console.log("메세지 받음");
		var arriveTime = new Date();
		var data = evt.data;
		console.log(data);
		var toast = '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">';
		toast +='<div class="toast-header"><class="rounded me-2">';
	    toast += '<strong class="me-auto">Bootstrap</strong>';
	    toast += '<small class="sub"></small>';
	    toast += '<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>';
	    toast += '</div><div class="toast-body">';
	  	toast += data;
	  	toast += '</div></div>';
		$("#socketAlarm").append(toast);
		 $(".toast").toast({"animation": true, "autohide": false});
		$('.toast').toast('show');
		sock.close();//소켓연결종료
		
		function timeBefore(){
			 //현재시간
			  var now = new Date(); 
			 //기준시간 
			 var writeDay = arriveTime;
			 var minus;
			 var time = '';
			 if(now.getFullYear() > writeDay.getFullYear()){
			    minus= now.getFullYear()-writeDay.getFullYear();
			    time += minus+"년 ";
			 }
			if(now.getMonth() > writeDay.getMonth()){
			   minus= now.getMonth()-writeDay.getMonth();
			   time += minus+"달 ";
			}
			if(now.getDate() > writeDay.getDate()){
			    minus= now.getDate()-writeDay.getDate();
			   time +=  minus+"일 ";
			}

			 if(now.getHours() > writeDay.getHours()){
			     minus = now.getHours() - writeDay.getHours();
			    time +=  minus+"시간 ";
			   }
			  
			 else if(now.getMinutes() > writeDay.getMinutes()){
			     minus = now.getMinutes() - writeDay.getMinutes();
			   time += minus+"분 ";
			   }
			  
			 else if(now.getSeconds() > writeDay.getSeconds()){
			     minus = now.getSeconds() - writeDay.getSeconds();
			     time += "방금";
			   }
			  
			   time += "전          ";
			  document.getElementsByClassName("sub")[0].innerHTML = time;
			    }
			  setInterval(timeBefore,1000);
	}
	 
</script>
	<!-- bootstrap js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>