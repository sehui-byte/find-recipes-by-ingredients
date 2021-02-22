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
		
		//전체 조회
		$(document).on("click", "#S", function(){
			console.log("S >>> : ");
			location.href="/kosmoJns/chef/chefselectall.do";
		});
		
		//등록
		$(document).on("click", "#I", function(){
			console.log("I >>> : ");
			$("#c_insertForm").attr({
				"method": "POST",
				"action": "/kosmoJns/chef/chefinsert.do"
			});
			$("#c_insertForm").submit();
		});
		
		//삭제
		$(document).on("click", "#D", function(){
			console.log("D >>> : ");
			$("#c_deleteForm").attr({
				"method": "POST",
				"action": "/kosmoJns/chef/chefdelete.do"
			});
			$("#c_deleteForm").submit();
		});
		
	});
</script>
</head>
<body>

<form id="c_insertForm">
	<h3>세프 등록(MLEVEL이 'C'인 회원만 가능)</h3>
	<input type="text" id="mno" name="mno" value="<%=mno%>" placeholder="회원번호">
	<input type="button" id="I" value="등록">
</form>

<br>
<hr>

<h3>세프 전체 조회</h3>
<input type="button" id="S" value="조회">

<br>
<hr>

<form id="c_deleteForm">
	<h3>세프 삭제</h3>
	<input type="text" id="ino" name="ino" placeholder="세프번호">
	<input type="button" id="D" value="삭제">
</form>

<br>
<hr>
</body>
</html>