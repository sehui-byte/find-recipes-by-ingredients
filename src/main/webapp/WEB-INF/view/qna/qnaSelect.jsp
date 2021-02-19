<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.qna.vo.QnAVO" %>
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
	List<QnAVO> list = (List)obj;
	QnAVO qvo = null;
	
	if(list.size() == 1){
		qvo = list.get(0);
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
<td><input type="text" name="sno" id="sno" value="<%= qvo.getSno() %>" readonly></td>
</tr>
<tr>
<td class="mem">글 제목</td>
<td><input type="text" name="stitle" id="stitle" value="<%= qvo.getStitle() %>"></td>
</tr>
<tr>
<td class="mem">글 내용</td>
<td>
<textarea name="scontent" id="scontent" rows="5" cols="50"><%= qvo.getScontent() %></textarea>
</td>
</tr>
<tr>
<td class="mem">글 작성자</td>
<td><input type="text" name="stitle" id="stitle" value="<%= qvo.getSno() %>"></td>
</tr>
<tr>
<td class="mem">사진</td>
<td> 
<img src="/testSpring3/imgupload/sm_<%= qvo.getSfile() %>" border="1" width="40" height="50" alt="image">
</td>
</tr>
<tr>
<td class="mem">입력 날짜</td>
<td><input type="text" name="sinsertdate" id="sinsertdate" value="<%= qvo.getSinsertdate() %>" readonly></td>
</tr>
<tr>
<td class="mem">수정 날짜</td>
<td><input type="text" name="supdatedate" id="supdatedate" value="<%= qvo.getSupdatedate() %>" readonly></td>
</tr>
<tr>
<td class="mem">글 조회수</td>
<td><input type="text" name="sview" id="sview" value="<%= qvo.getSview() %>" readonly></td>
</tr>
<tr>
<td class="mem">삭제여부</td>
<td><input type="text" name="sdeleteyn" id="sdeleteyn" value="<%= qvo.getSdeleteyn() %>" readonly></td>
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