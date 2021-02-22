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
				'action':'noticeInsert.do',
				'method':'GET',
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
		<td colspan="2" align="center">공지 게시판 글쓰기</td>
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
		<td align="center">글 내용</td>
		<td>
			<textarea name="bcontent" id="bcontent" cols="50" rows="10"></textarea>
		</td>
	</tr>
	<tr>
	<tr>
		<td align="center">글 작성자</td>
		<td><input type="text" name="mnick" id="mnick" size="20"></td>
	</tr>
	<tr>
		<td align="center">첨부파일</td>
		<td><input type="file" name="bfile" id="bfile">
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