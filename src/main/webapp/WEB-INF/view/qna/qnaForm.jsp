<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA : 질문게시판 : 글쓰기</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@2.6.12/dist/vue.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

		
		$(document).on("click", "#sbtn", function(){
			console.log("sbtn >>> : ");	
			$("#QnAForm").attr({
				'action':'qnaInsert.do',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});
</script>
</head>
<body>
<form name="QnAForm" id="QnAForm">
<s:csrfInput/>
<table border="1" align="center">
	<tr>
		<td colspan="2" align="center">질문 글쓰기</td>
	</tr>
	<tr>
		<td align="center">글번호</td>
		<td><input type="text" name="sno" id="sno" size="20" readonly></td>
	</tr>
	<tr>
		<td align="center">글제목</td>
		<td><input type="text" name="stitle" id="stitle" size="53"></td>
	</tr>
	<tr>
		<td align="center">글내용</td>
		<td>
		<textarea name="scontent" id="scontent" cols="50" rows="10">
		</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">글 작성자</td>
		<td><input type="text" name="swriter" id="swriter" size="20"></td>
	</tr>
	<tr>
		<td align="center">첨부파일</td>
		<td>
		<input type="file" name="sfile" id="sfile">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="button" value="글쓰기" id="sbtn">
		</td>
	</tr>
</table>
</form>
</body>
</html>