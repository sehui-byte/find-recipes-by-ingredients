<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA Select</title>
<style type="text/css">
	div {
			margin: 50px 0px 0px 100ox;
		}
	.mem{ text-align: center;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// U
		$(document).on("click", "#U", function(){
			alert("U >>> ");
			$("#QnAUpdateForm").attr({
				"method":"GET",
				"action":"qnaUpdate.do"
			}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			alert("D >>> : ");
			$("#QnAUpdateForm").attr({
				"method":"GET",
				"action":"qnaDelete.do"
			}).submit();
		});	
		
	});
</script>
</head>
<body>
QnA Select
<hr>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<BoardVO> list = (List)obj;
	BoardVO bvo = null;
	
	if(list.size() == 1){
		bvo = list.get(0);
	};
%>
<div>
<form name="QnAUpdateForm" id="QnAUpdateForm">
<table>
<tr>
<td colspan="2" align="center">QnA 글 수정하기</td>
</tr>
<tr>
<td class="mem">글 번호</td>
<td><input type="text" name="bno" id="bno" value="<%= bvo.getBno() %>" readonly></td>
</tr>
<tr>
<td class="mem">글 유형</td>
<td><input type="text" name="btype" id="btype" value="<%= bvo.getBtype() %>" readonly></td>
</tr>
<tr>
<td class="mem">글제목</td>
<td><input type="text" name="btitle" id="btitle" value="<%= bvo.getBtitle() %>"></td>
</tr>
<tr>
<td class="mem">글내용</td>
<td><textarea name="bcontent" id="bcontent" rows="5" cols="50"><%= bvo.getBcontent() %></textarea>
</td>
</tr>
<tr>
<td class="mem">글 작성자</td>
<td><input type="text" name="mnick" id="mnick" value="<%= bvo.getMnick() %>"></td>
</tr>
<tr>
<td class="mem">사진</td>
<td> 
<img src="imgupload/sm_<%= bvo.getBfile() %>" border="1" width="40" height="50" alt="image">
</td>
</tr>
<tr>
<td class="mem">입력 날짜</td>
<td><input type="text" name="binsertdate" id="binsertdate" value="<%= bvo.getBinsertdate() %>" readonly></td>
</tr>
<tr>
<td class="mem">수정 날짜</td>
<td><input type="text" name="bupdatedate" id="bupdatedate" value="<%= bvo.getBupdatedate() %>" readonly></td>
</tr>
<tr>
<td class="mem">조회수</td>
<td><input type="text" name="bview" id="bview" value="<%= bvo.getBview() %>" readonly></td>
</tr>
<tr>
<td class="mem">좋아요 수</td>
<td><input type="text" name="bhits" id="bhits" value="<%= bvo.getBhits() %>" readonly></td>
</tr>
<tr>
	<td colspan="7" align="right">
		<input type="button" value="수정하기" id="U">
		<input type="button" value="삭제하기" id="D">
		<input type="button" value="돌아가기" id="C">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>