<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<%@ include file="/WEB-INF/include/jsp/adminSide.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 유입 현황</title>
<script>
	function openNav() {
		document.getElementById('adminsidenav').style.width = '250px';
	}
	function closeNav() {
		document.getElementById('adminsidenav').style.width = '10px';
	}
</script>
</head>
<body>
<div id ="wrapper">
<div class="jumbotron">
<!-- admin 페이지 메인 부분에다가 회원 유입 현황 그래프  -->
		<img src="http://localhost:5000/static/signupInc/signupInc.png">
		 <p>회원 유입 현황 및 그래프 설명</p>	
</div>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>