<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
	
	<!-- navbar -->
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
	
	<button type="button" class="btn btn-primary">
		Notifications <span class="badge bg-secondary">4</span>
	</button>
	
	보낸사람id , 받는사람id , 유형(댓글,구독)
	<br> 댓글 : reply
	<br> 구독 : subscribe
	<br>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"
		onclick="sendMessage()" />
	<div id="data"></div>
	
	<script>
		function sendMessage() {
			//웹소켓으로 메세지 전달
			console.log("전달 메세지 >> " + $("#message").val());
			sock.send($("#message").val());
			console.log("메세지 전달");
		} 

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
			$("#data").append(toast);
			 $(".toast").toast({"animation": true, "autohide": false});
			$('.toast').toast('show');
			timeBefore();
			//socket.close();//소켓연결종료
			
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
				  
				 else{
				     minus = now.getSeconds() - writeDay.getSeconds();
				     time += "방금";
				   }
				  
				  time += "전          ";
				  document.getElementsByClassName("sub").innerHTML = time;
				      
				        
				    }

				  setInterval(timeBefore,1000);
		}
		
		
	</script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>