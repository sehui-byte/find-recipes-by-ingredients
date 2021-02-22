<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chef.vo.ChefVO" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 내 구독 리스트
		$(document).on("click", "#mySub", function(){
			console.log("mySub >>> : ");
			$("#s_list").attr({
				"method": "POST",
				"action": "/kosmoJns/subscribe/mysublist.do"
			});
			$("#s_list").submit();
		});
		
	});

</script>
</head>
<body>
<form id="s_list">
	<h3>내 구독 리스트 조회</h3>
	<input type="button" id="mySub" value="조회">
	<input type="hidden" name="mno" id="mno" value="<%=mno%>">
</form>

</body>
</html>