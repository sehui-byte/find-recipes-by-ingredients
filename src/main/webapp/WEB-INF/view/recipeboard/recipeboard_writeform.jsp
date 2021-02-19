<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 게시판 글쓰기</title>
		<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
		<%=mnick %>
		
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script type="text/javascript">
			$(document).ready(()=>
			{
				
			});
		</script>
	</head>
	
	<body>
		<table>
			<tr>
				<td colspan="2">글쓰기</td>
			</tr>
			<tr>
				<td>메뉴명</td>
				<td><input id="rbno" name="rbno" type="text" placeholder="메뉴명"></td>
			</tr>
			<tr>
				<td>조리방법</td>
				<td><input id="rcp_way2" name="rcp_way2" type="text" placeholder="조리방법"></td>
			</tr>
			<tr>
				<td>요리종류</td>
				<td><input id="rcp_way2" name="rcp_way2" type="text" placeholder="조리방법"></td>
			</tr>
		</table>
	</body>
</html>