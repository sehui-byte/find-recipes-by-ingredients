<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.notice.vo.NoticeVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE SELECT</title>
<style type="text/css">
	div {
			margin: 50px 0px 0px 100px;
		}
	.mem{ text-align: center;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// U
		$(document).on("click", "#U",function(){
			alert("U >>> :");
			$("#NoticeUpdateForm").attr({
				"method":"POST",
				"action":"qnaUpdate.do"
			}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			alert("D >>> : ");
			$(document).attr({
				"method":"POST",
				"action":"qnaDelete.do"
			}).submit();
		});
		
	});
</script>
</head>
<body>
NOTICE SELECT
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<NoticeVO> list = (List)obj;
	NoticeVO nvo = null;
	
	if(list.size() == 1){
		nvo = list.get(0);
	};
%>
<div>
<form name="NoticeUpdateForm" id="NoticeUpdateForm">
<table border="1">
<tr>
<td colspan="2" align="center">게시판 글 수정하기</td>
</tr>
<tr>
<td class="mem">글번호</td>
<td><input type="text" name="nno" id="nno" value="<%= nvo.getNno() %>" readonly></td>
</tr>
<tr>
<td class="mem">글제목</td>
<td><input type="text" name="nno" id="nno" value="<%= nvo.getNno() %>"></td>
</tr>
<tr>
<td class="mem">글내용</td>
<td><textarea name="ncontent" id="ncontent" cols="50" rows="5" <%= nvo.getNcontent() %>></textarea>
</td>
</tr>
<tr>
<td class="mem">글작성자</td>
<td><input type="text" name="nwriter" id="nwriter" value="<%= nvo.getNwriter() %>"></td>
</tr>
<tr>
<td>
<img src="imgupload/sm_<%= nvo.getNfile() %>" border="1" width="40" height="50" alt="image">
</td>
</tr>
<tr>
<td class="mem">입력날짜</td>
<td><input type="text" name="ninsertdate" id="ninsertdate" value="<%= nvo.getNinsertdate() %>" readonly></td>
</tr>
<tr>
<td class="mem">수정날짜</td>
<td><input type="text" name="nupdatedate" id="nupdatedate" value="<%= nvo.getNupdatedate() %>" readonly></td>
</tr>
<tr>
<td class="mem">글조회수</td>
<td><input type="text" name="nview" id="nview" value="<%= nvo.getNview() %>" readonly></td>
</tr>
<tr>
<td class="mem">글삭제</td>
<td><input type="text" name="ndeleteyn" id="ndeleteyn" value="<%= nvo.getNdeleteyn() %>" readonly></td>
</tr>
</table>
</form>
</div>
</body>
</html>