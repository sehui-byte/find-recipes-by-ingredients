<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<%@ page import="com.jns.member.vo.MemberVO" %>

<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	Object principal = auth.getPrincipal();
	String mnick = "";
	if(principal != null && principal instanceof MemberVO){
		mnick = ((MemberVO)principal).getMnick();	
	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginbtn").click(function(){
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
	
		// Spring Scurity logout >> post 요청만 가능
		$("#logoutbtn").click(function(){
			$("#logoutForm").attr("action", "<c:url value='/j_spring_security_logout' />");
			$("#logoutForm").attr("method", "POST");
			$("#logoutForm").attr("enctype", "application/x-www-form-urlencoded");
			$("#logoutForm").submit();
			
		})
	})
</script>
</head>
<body>
<h3>main 페이지</h3>
------------page 분류 예시, test 용도<br>
누구나 가는 익명 페이지<br>
관리자 페이지 - 관리자만 이용 가능<br>
셰프 관련 페이지 - 셰프만 이용 가능<br>
그 외 페이지 전부 익명으로 만들어 놓을 예정<br>
다만, 조회를 제외한 모든 기능은 회원만 가능<br>
<div>
	<s:authorize access="isAnonymous()">
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
	</s:authorize>
	<s:authorize access="isAuthenticated()">
		<%= mnick %>님 반갑습니다.<br/>	
		<form id="logoutForm">
			<input type="button"id="logoutbtn" name="logoutbtn" value="로그아웃하기"/>	
			<s:csrfInput/>
		</form><br>
	</s:authorize>
	<s:authorize access="hasRole('ROLE_A')">
		<a href="/kosmoJns/admin/main.do">admin 접속</a><br>
	</s:authorize>
	<s:authorize access="hasRole('ROLE_U')">
		 <a href="/kosmoJns/myinfo.do">일반 회원 페이지로</a>
	</s:authorize>
</div>

</body>
</html>