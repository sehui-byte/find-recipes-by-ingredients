<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA : 질문게시판 : 글쓰기</title>
<style type="text/css"> 
	.tt{
		text-align: center;
		font-weight: bold;
	}
</style>

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
		<td><input type="text" name="bno" id="bno" size="20" readonly></td>
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
		<td align="center">글제목</td>
		<td><input type="text" name="btitle" id="btitle" size="53"></td>
	</tr>
	<tr>
		<td align="center">글내용</td>
		<td>
		<textarea name="bcontent" id="bcontent" cols="50" rows="10">
		</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">글 작성자</td>
		<td><input type="text" name="mnick" id="mnick" size="20"></td>
	</tr>
	<tr>
		<td align="center">첨부파일</td>
		<td>
		<input type="file" name="bfile" id="bfile">
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