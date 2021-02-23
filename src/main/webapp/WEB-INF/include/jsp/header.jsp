<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- java 파일 정의 --%>
<%@ page import="java.util.List"%>
<%@ page import="com.jns.member.vo.MemberVO"%>
<%@ page import="com.jns.board.vo.BoardVO"%>
<%@ page import="com.jns.recipe.vo.RecipeVO"%>
<%@ page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@ page import="com.jns.reply.vo.ReplyVO"%>

<%-- fileUpload 정의 --%>
<%@ page import="com.jns.common.FileLoadUtil" %>

<%-- jstl 태그 정의 --%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>

<%-- 현재 로그인한 회원의 정보 파악 --%>

<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
Object principal = auth.getPrincipal();
String mnick = "";
String mno = "";
String mid = "";
String mlevel = "";

if (principal != null && principal instanceof MemberVO) {
	mnick = ((MemberVO) principal).getMnick();
	mno = ((MemberVO) principal).getMno();
	mid = ((MemberVO) principal).getMid();
	mlevel = ((MemberVO) principal).getMlevel();

	// 로그인시 session key값 생성
	if (session.getAttribute(mid) != null){
		String loginSession = (String) session.getAttribute("mid");
	}else{
		session.setAttribute("mid", mid);
		String loginSession = (String) session.getAttribute("mid");
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		// Spring Scurity logout >> post 요청만 가능
		$("#logoutbtn").click(function() {
			$("#logoutForm").attr("action","<c:url value='/j_spring_security_logout' />");
			$("#logoutForm").attr("method","POST");
			$("#logoutForm").attr("enctype","application/x-www-form-urlencoded");
			$("#logoutForm").submit();
		})
	})
</script>
<!-- bootstrap css-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="main.do">전냉시</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="main.do">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="레시피 검색" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
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
		<s:authorize access="hasRole('ROLE_U')">
			<a href="/kosmoJns/myinfo.do">일반 회원 페이지로</a>
		</s:authorize>
	</div>
	<!-- bootstrap js -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>