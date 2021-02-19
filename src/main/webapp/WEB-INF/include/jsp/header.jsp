<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- java 파일 정의 --%>
<%@ page import="java.util.List" %>
<%@ page import="com.jns.member.vo.MemberVO" %>
<%@ page import="com.jns.common.vo.BoardVO" %>
<%@ page import="com.jns.recipeboard.vo.RecipeBoardVO" %>
<%@ page import="com.jns.reply.vo.ReplyVO" %>

<%-- jstl 태그 정의 --%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>

<%-- 현재 로그인한 회원의 정보 파악 --%>

<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	String mnick = "";
	String mno = "";
	if(principal != null && principal instanceof MemberVO){
		mnick = ((MemberVO)principal).getMnick();	
		mno = ((MemberVO)principal).getMno();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){

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