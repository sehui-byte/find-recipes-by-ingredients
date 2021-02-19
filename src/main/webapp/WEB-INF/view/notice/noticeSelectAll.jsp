<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.notice.vo.NoticeVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#I", function(){
			location.href="noticeForm.do";
		});
		
		$(document).on("click", "#U", function(){
			alert("U >>>");
			$("#NoticeList").attr({
				"method":"POST",
				"action":"noticeSelect.do"}).submit();	
		});
		
		$(document).on("click", "#D", function(){
			alert("D >>>");
			$("NoticeList").attr({
				"method":"POST",
				"action":"noticeSelect.do"}).submit();
		});
		
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listAll");
	List<NoticeVO> list = (List)obj;
	
	int nCnt = list.size();
%>

<form name="NoticeList" id="NoticeList">
<table border="1" align="center">
<thead>
<tr>
	<td colspan="10" align="center">
		<h2>게시판</h2>
	</td>
</tr>
</thead>
<%
for(int i=0; i<nCnt; i++){
	NoticeVO nvo = list.get(i);
%>
<tbody>
<tr>
	<td align="center">
		<input type="checkbox" name="nno" id="sbnum" class="nno" value=<%= nvo.getNno() %> >
	</td>		
	<td class="tt"><%= nvo.getNtitle() %> </td>
	<td class="tt"><%= nvo.getNcontent() %> </td>
	<td class="tt"><%= nvo.getNwriter() %> </td>
	<td class="tt"><img src="/imgupload/sm_<%= nvo.getNfile() %>"> </td>	
</tr>
<%
} // end of for
%>
<tr>
	<td colspan="7" align="center">
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