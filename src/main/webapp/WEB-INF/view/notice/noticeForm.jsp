<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE : 공지사항 글쓰기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#nbtn", function(){
			console.log("nbbtn >>> : ");					
			$('#NoticeForm').attr({
				'action':'noticeInsert',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});
</script>
</head>
<body>
<form name="NoticeForm" id="NoticeForm">
<table border="1" align="center">
	<tr>
		<td colspan="2" align="center">게시판 글쓰기</td>
	</tr>
	<tr>
		<td align="center">글번호</td>
		<td><input type="text" name="nno" id="nno" size="20" readonly></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><input type="text" name="ntitle" id="ntitle" size="53"></td>
	</tr>
	<tr>
		<td align="center">글 내용</td>
		<td>
			<textarea name="ntitle" id="ntitle" cols="50" rows="10"></textarea>
		</td>
	</tr>
	<tr>
	<tr>
		<td align="center">글 작성자</td>
		<td><input type="text" name="nwriter" id="nwriter" size="20"></td>
	</tr>
	<tr>
		<td align="center">첨부파일</td>
		<td><input type="file" name="nfile" id="nfile">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="button" value="글쓰기" id="nbtn">
		</td>
	</tr>
</table>
</form>
</body>
</html>