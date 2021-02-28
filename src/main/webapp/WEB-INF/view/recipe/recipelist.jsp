<%@page import="com.jns.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
</head>
<style>
#searchRecipeForm{
	width: 400px;
	margin-top: 50px;
	margin-left: 40%;
}
</style>
<body>
	<!--  검색창 -->
	<form class="d-flex" method="get" action="searchRecipe.do" id="searchRecipeForm">
		<input id="keyword" name="keyword" class="form-control me-2"
			type="search" placeholder="레시피 검색" aria-label="Search">
		<button class="btn btn-outline-success" type="submit">Search</button>
	</form>
	<table border="1" style="margin: auto;">
		<tr>
			<td>레시피 번호</td>
			<td>레시피 이름</td>
			<td>썸네일</td>
		</tr>
		<%
				List<RecipeVO> list = (List<RecipeVO>)request.getAttribute("list");
				
				for(int i=0; i<list.size(); i++)
				{
			%>
		<tr>
			<td style="text-align: center;"><%=list.get(i).getRcp_seq()%></td>
			<td><a
				href="recipedetail.do?rcp_seq=<%=list.get(i).getRcp_seq()%>"><%=list.get(i).getRcp_nm()%></a></td>
			<td><img alt="" src="<%=list.get(i).getAtt_file_no_mk()%>"
				width="60" height="60"></td>
		</tr>
		<%
				}
				
			%>
	</table>
</body>
</html>