<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

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
	
	// memberInsert btn click
	$("#memberInsertBtn").click(function(){
		alert("회원가입 페이지로 이동합니다 >>> ");
		location.href="/kosmoJns/memberForm.do";
	})
	
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
</head>
<body>
	<div>
		<form id="loginForm" name="loginForm">
			<table border="1" style="text-align:center;">
				<tr>
					<td>아이디</td>	
					<td>
						<input type="text" id="mid" name="mid" value=""
						onkeydown="return captureReturnKey(event)" onkeyup="enterKey()">
					</td>	
				</tr>	
				<tr>
					<td>비밀번호</td>	
					<td>
						<input type="password" id="mpw" name="mpw" value=""
						onkeydown="return captureReturnKey(event)" onkeyup="enterKey();">
					</td>	
				</tr>	
				<tr>
					<td colspan="3">
						<input type="button" id="loginbtn" value="Login">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" id="memberInsertBtn" name="memberInsertBtn" value="회원가입 하러 가기">
						<input type="button" id="findidpw" name="findidpw" value="아이디/비밀번호 찾기">
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" id="snsLogin_naver" name="snsLogin_naver" value="네이버 아이디로 로그인">	
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" id="snsLogin_kakao" name="snsLogin_kakao" value="카카오 아이디로 로그인">	
					</td>	
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" id="snsLogin_google" name="snsLogin_google" value="구글 아이디로 로그인">	
					</td>	
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" id="snsLogin_facebook" name="snsLogin_facebook" value="페이스북 아이디로 로그인">	
					</td>	
				</tr>
			</table>	
		</form>
	</div>
</body>
</html>