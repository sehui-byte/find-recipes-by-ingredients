<%@page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 게시판</title>
	</head>
	<%
		 List<RecipeBoardVO> list = (List<RecipeBoardVO>)request.getAttribute("list");
	%>
	
	<body>
		<table border="1" style="margin: auto;">
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		<%
		for(int i=0; i<list.size(); i++)
		{
		%>
			<tr>
				<td><%=list.get(i).getRcp_nm()%> </td>
				<td><%=list.get(i).getMno() %></td>
				<td><%=list.get(i).getRb_insertdate() %></td>
			</tr>
		<%
		}
		%>
		</table>
	</body>
</html>