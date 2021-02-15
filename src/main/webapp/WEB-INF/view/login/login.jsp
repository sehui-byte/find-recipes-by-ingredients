<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전냉시 로그인 페이지</title>
<script type="text/javascript">
$(document).ready(function(){
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
})
</script>
</head>
<body>
	<form id="loginForm" name="loginForm">
		<table border="1">
			<tr>
				<td>아이디</td>	
				<td>
					<input type="text" id="mid" name="mid" value="">	
				</td>	
			</tr>	
			<tr>
				<td>비밀번호</td>	
				<td>
					<input type="text" id="mpw" name="mpw" value="">	
				</td>	
			</tr>	
			<tr>
				<td colspan="2">
					<input type="button" id="loginbtn" value="Login">	
				</td>
			</tr>
		</table>	
		<s:csrfInput/>
	</form>
</body>
</html>