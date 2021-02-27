<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전냉시 로그인 페이지</title>
<script type="text/javascript">
$(document).ready(function(){
	// login btn click
	$("#loginbtn").click(function(){
		alert("click");
		if($("#mid").val() == ""){
			alert("로그인 아이디를 입력해주세요");
		}else if($("#mpw").val() == ""){
			alert("로그인 비밀번호를 입력해주세요");
		}else{
			$("#loginForm").attr("action", "<c:url value='/j_spring_security_check' />");
			$("#loginForm").attr("method", "POST");
			$("#loginForm").attr("enctype", "application/x-www-form-urlencoded");
			$("#loginForm").submit();
		}
	});
	
	/* // memberInsert btn click
	$("#memberInsertBtn").click(function(){
		alert("회원가입 페이지로 이동합니다 >>> ");
		location.href="/kosmoJns/memberForm.do";
	})
	 */
	// findidpw btn click
	$('#findidpw').click(function(){
		alert("아이디/비밀번호 찾기 페이지로 이동합니다 >>> ")
		var url = "/kosmoJns/memberFindIDnPW.do";
		var title = "아이디/비밀번호 찾기";
		var _width = "500";
		var _height = "300";
		
		var popupX = (document.body.offsetWidth /2) - (_width/2);		
		var popupY = (window.screen.height /2) - (_height/2);		
		
		// 가운데로 구하고 싶은데 잘 안된다.
		//var _left = Math.ceil((window.screen.width - _width)/2);
		//var _top = Math.ceil((window.screen.width - _height)/2);
		var option = "width ="+_width+", height ="+_height+", top ="+popupX+", left ="+popupY;//+", location = no";
		window.open(url, title, option)	
	})
	
})

	//enter키 눌렀을 때 페이지 재로딩 되는 것 방지
	function captureReturnKey(e) {
		if (e.keyCode == 13 && e.srcElement.type != 'textarea')
			return false;
	}
	
	//input에서 엔터키 눌렀을 때도 검색 실행
	function enterKey(){
		if(window.event.keyCode == 13){
			if($("#mid").val() == ""){
				alert("로그인 아이디를 입력해주세요");
			}else if($("#mpw").val() == ""){
				alert("로그인 비밀번호를 입력해주세요");
			}else{
				$("#loginForm").attr("action", "<c:url value='/j_spring_security_check' />");
				$("#loginForm").attr("method", "POST");
				$("#loginForm").attr("enctype", "application/x-www-form-urlencoded");
				$("#loginForm").submit();	
			}	
		}
	}

</script>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	text-transform: uppercase;
	outline: 0;
	background: #F9A781;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #F9A781;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #F9A781;
	text-decoration: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}


body {
	background: #F9A781; /*배경 컬러*/
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
</head>
<body>
	<div class="login-page">
		<h1>Welcome</h1>
		<div class="form">
			<form class="login-form" id="loginForm" name="loginForm">

				<input type="text" id="mid" name="mid" value="" placeholder="아이디"
					onkeydown="return captureReturnKey(event)" onkeyup="enterKey()">

				<input type="password" id="mpw" name="mpw" value=""
					placeholder="비밀번호" onkeydown="return captureReturnKey(event)"
					onkeyup="enterKey();"> 
					
					<button id="loginbtn">LOGIN</button>
					
					<!-- <input
					type="button" id="findidpw" name="findidpw" value="아이디/비밀번호 찾기"> -->
					<p class="message">
					Forget? <a href="memberFindIDnPw.do">Find ID/PW</a>
				</p>
				<p class="message">
					Not registered? <a href="memberForm.do">Create an account</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>