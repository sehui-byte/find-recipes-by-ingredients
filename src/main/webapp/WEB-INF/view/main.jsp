<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<%@ page import="com.jns.member.vo.MemberVO" %>


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
<h3>main 페이지</h3>
------------page 분류 예시, test 용도<br>
누구나 가는 익명 페이지<br>
관리자 페이지 - 관리자만 이용 가능<br>
셰프 관련 페이지 - 셰프만 이용 가능<br>
그 외 페이지 전부 익명으로 만들어 놓을 예정<br>
다만, 조회를 제외한 모든 기능은 회원만 가능<br>
<div>
</div>

</body>
</html>