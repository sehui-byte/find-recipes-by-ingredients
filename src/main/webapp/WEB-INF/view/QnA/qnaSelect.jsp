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
	div{
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
			$("#QnAUpdateForm").attr({ "method":"POST"
				                        ,"action":"qnaUpdate.do"}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			alert("D >>> : ");
			$("#QnAUpdateForm").attr({ "method":"POST"
				                        ,"action":"qnaDelete.do"}).submit();
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
<td colspan="2" align="center">게시판 글 수정하기</td>
</tr>
<tr>
<td class="mem">글 번호</td>
<td><input type="text" name="sno" id="sno" value="<%= bvo.getBno() %>" readonly></td>
</tr>
<tr>
<td align="center">글 유형</td>
<td>
<select name=btype id=btype style="width:150px" >
<option>글 유형을 선택하세요</option>
<option>공지사항</option>
<option>QnA</option>
</select>
</td>
</tr>
<tr>
<td class="mem">글 제목</td>
<td><input type="text" name="btitle" id="btitle" value="<%= bvo.getBtitle() %>"></td>
</tr>
<tr>
<td class="mem">글 내용</td>
<td>
<textarea name="bcontent" id="bcontent" rows="5" cols="50"><%= bvo.getBcontent() %></textarea>
</td>
</tr>
<tr>
<td class="mem">글 작성자</td>
<td><input type="text" name="btitle" id="btitle" value="<%= bvo.getMnick() %>"></td>
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
<td class="mem">글 조회수</td>
<td><input type="text" name="bview" id="bview" value="<%= bvo.getBview() %>" readonly></td>
</tr>
<tr>
<td class="mem">삭제여부</td>
<td><input type="text" name="bdeleteyn" id="bdeleteyn" value="<%= bvo.getBdeleteyn() %>" readonly></td>
</tr>
<tr>
<td>
<input type="text" name="bhits" id="bhits" value="<%= bvo.getBhits() %>" readonly></td>
</tr>
<tr>
<td colspan="2" align="right">
<button type="button" id="U">수정</button>
<button type="button" id="D">삭제</button>
</td>
</tr>
</table>
</form>
</div>
</body>
</html>