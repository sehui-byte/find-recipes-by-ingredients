<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 테스트</title>
<!-- socketJS -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<div id="msgStack"></div>
	<script>
		// 전역변수 설정
		var socket = null;
		$(document).ready(function() {
			// 웹소켓 연결
			sock = new SockJS("<c:url value="/echo"/>");
			socket = sock;
			// 데이터를 전달 받았을때 
			sock.onmessage = onMessage; // toast 생성
		});

		// toast생성 및 추가
		function onMessage(evt) {
			var data = evt.data;
			// toast
			let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
			toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
			toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
			toast += "<span aria-hidden='true'>&times;</span></button>";
			toast += "</div> <div class='toast-body'>" + data + "</div></div>";
			$("#msgStack").append(toast); // msgStack div에 생성한 toast 추가
			$(".toast").toast({
				"animation" : true,
				"autohide" : false
			});
			$('.toast').toast('show');
		};
	</script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>