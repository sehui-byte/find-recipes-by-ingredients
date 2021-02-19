<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.member.vo.MemberVO" %>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	String mnick = "";
	if(principal != null && principal instanceof MemberVO)
	{
		mnick = ((MemberVO)principal).getMnick();	
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>main header</span>
	<div class="loginInfo" style='text-align:right;'>
		<s:authorize access="isAnonymous()">
				<a href="/kosmoJns/login.do">로그인</a>
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