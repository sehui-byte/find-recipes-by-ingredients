<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	$(document).ready(function(){
		alert("접근 권한이 없습니다. 메인 페이지로 이동합니다.");
		location.href="/kosmoJns/index.jsp";
	})
</script>

</body>
</html>