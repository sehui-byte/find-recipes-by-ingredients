<%@page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 게시판</title>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script type="text/javascript">
			
			$(document).ready(()=>
			{
				$("#writeBtn").click(()=>
				{					
					$("#rbForm").attr("action", "rbwriteform.do");
					$("#rbForm").attr("method", "GET");
					$("#rbForm").attr('enctype','multipart/form-data');
					$("#rbForm").submit();
				});
			});
			function onBtnClick(rbno)	
			{	
				$("#rbno").val(rbno);	
				$("#rbForm").attr("action", "rbupdateform.do");	
				$("#rbForm").attr("method", "GET");	
				$("#rbForm").attr('enctype','multipart/form-data');	
				$("#rbForm").submit();	
			}	
		</script>
	</head>
	<%
		 List<RecipeBoardVO> list = (List<RecipeBoardVO>)request.getAttribute("list");
	%>
	
	<body>
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
	<input id="writeBtn" type="button" value="글쓰기"> 
		<form id="rbForm" name="rbForm">
			<table class="table table-striped" style="margin: auto;">
				<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">추천수</th>
					<th scope="col">작성일</th>
					<th scope="col">수정</th>
				</tr>
				</thead>
			<%
			for(int i=0; i<list.size(); i++)
			{
			%>
				<tr>
					<td><a href="rbdetail.do?rbno=<%=list.get(i).getRbno()%>"><%=list.get(i).getRcp_nm()%></a></td>
					<td><%=list.get(i).getMno() %></td>
					<td><%=list.get(i).getViews() %></td>
					<td><%=list.get(i).getHits() %></td>
					<td><%=list.get(i).getRb_insertdate() %></td>
					<td><input type="button" value="글수정" onclick="onBtnClick('<%=list.get(i).getRbno()%>')"></td>
				</tr>
			<%
			}
			%>
			</table>
			<input type="hidden" id="rbno" name="rbno">
		</form>
	</body>
</html>