<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}	
</style>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		//아이디 찾기 버튼
		$(document).on("click", "#findId", function(){
			console.log("findId >>> : ");
			location.href="/kosmoJns/memberFindID";
		});
		
		//임시 비밀번호 버튼
		$(document).on("click", "#tempPw", function(){
			console.log("tempPw >>> : ");
			location.href="/kosmoJns/memberTempPW";
		});
	});
</script>
</head>
<body>
<br><br><br>
<div class="d-grid gap-2 col-6 mx-auto">
	<input type="button" class="btn btn-orange" value="아이디 찾기" id="findId"><br>
	<input type="button" class="btn btn-orange" value="임시 비밀번호 발급받기" id="tempPw">
</div>
</body>
</html>