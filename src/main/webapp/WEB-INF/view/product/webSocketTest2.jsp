<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
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
	보낸사람id , 받는사람id , 유형(댓글,구독)<br>
	댓글 : reply <br>
	구독 : subscribe
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"
		onclick="sendMessage()" />
	<div id="data"></div>

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

		function sendMessage() {
			//웹소켓으로 메세지 전달
			sock.send($("#message").val());
			console.log("메세지 전달");
		}

		//evt파라미터는 웹소켓이 보내준 데이터 의미
		function onMessage(evt) {
			console.log("메세지 받음");
			var data = evt.data;
			console.log(data);
			$("#data").append(data + "<br>");
			sock.close();//소켓연결종료
		}
	</script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>