<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.qna.vo.QnAVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록 조회</title>
<style type="text/css"> 
	.tt{
		text-align: center;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(document).on("click","#I",function(){
			location.href="qnaForm.do";
		});
	

		$(document).on("click","#U",function(){
		
			$("#QnAList").attr({
				"method":"POST",
				"action":"qnaSelect.do"}).submit();	
			
		}); // end of Updatebutton
	
	
		$(document).on("click","#D",function(){
			
			$("#QnAList").attr({
				"method":"POST",
				"action":"qnaSelect.do"}).submit();
		}); // end of Deletebutton
		
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listAll");
	List<QnAVO> list = (List)obj;
	
	int nCnt = list.size();
%>
<form name="QnAlist" id="QnAlist">
<table border="1" align="center">
<thead>
<tr>
	<td colspan="10" align="center">
		<h2>QnA 게시판</h2>
	</td>
</tr>
</thead>
<%
for(int i=0; i<nCnt; i++){
	QnAVO qvo = list.get(i);
%>
<tbody>
<tr>
	<td align="center">
		<input type="checkbox" name="sno" id="sno" class="sno" value=<%= qvo.getSno() %>>
	</td>
	<td class="tt"><%=qvo.getStitle() %></td>
	<td class="tt"><%=qvo.getScontent() %></td>
	<td class="tt"><%=qvo.getSwriter() %></td>
	<td class="tt"><img src="/imgupload/sm_<%= qvo.getSfile() %>"></td>
	
</tr>
<%
}// end of for
%>
<tr>
	<td colspan="7" align="right">
	<input type="button" value="글쓰기" id="I">
	<input type="button" value="글수정" id="U">
	<input type="button" value="글삭제" id="D">
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>