<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="java.util.List" %> 
<%@ page import="com.jns.recipe.vo.RecipeVO" %>

<%
	// data 정상적으로 들어옴 현재 1개 리턴
	// 일반 유저 게시판이라 VO는 나중에 수정해야 할듯.
	Object obj = request.getAttribute("myRecipeList");
	List<RecipeVO> list = (List)obj;
	int nCnt = list.size();
	RecipeVO rvo = list.get(0);
	out.println(rvo.getRcp_nm());
	out.println(rvo.getManual01());
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Recipe List</title>
<script type="text/javascript">
	$(document).ready(function(){
		

		})


</script>
</head>
<body>
나의 레시피 리스트 체크하기
</body>
</html>