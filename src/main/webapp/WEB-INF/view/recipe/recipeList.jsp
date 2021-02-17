<%@page import="com.jns.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 목록</title>
	</head>
	<body>
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
				<td><a href="recipeDetail.do?rcp_seq=<%=list.get(i).getRcp_seq()%>"><%=list.get(i).getRcp_nm()%></a></td>
				<td><img alt="" src="<%=list.get(i).getAtt_file_no_mk()%>" width="60" height="60"></td>
			</tr>
			<%
				}
				
			%>
		</table>
	</body>
</html>