<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>

<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	String mnick = "";
	String mno = "";
	String mid = "";
if (auth != null){
	Object principal = auth.getPrincipal();

	if (principal != null && principal instanceof MemberVO) {
		mnick = ((MemberVO) principal).getMnick();
		mno = ((MemberVO) principal).getMno();
		mid = ((MemberVO) principal).getMid();

		// 로그인시 session key값 생성
		if (session.getAttribute(mid) != null){
			String loginSession = (String) session.getAttribute("mid");
		}else{
			session.setAttribute("mid", mid);
			String loginSession = (String) session.getAttribute("mid");
		}
		
	}
}else{

	}
%>

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
		<s:authorize access="hasAnyRole('ROLE_U', 'ROLE_C')">
			<a href="/kosmoJns/myinfo.do?mno=<%=mno%>">MyPage</a>
		</s:authorize>
	</div>
