<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<%
	String loginFailMsg = (String)request.getAttribute("loginFailMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	$(document).ready(function(){
		alert("<%= loginFailMsg %> 계정 정보를 다시 확인해주시기 바랍니다.");
		history.go(-1);
		})
</script>
</body>
</html>