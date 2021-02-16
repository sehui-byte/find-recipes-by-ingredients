<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
<script type="text/javascript" src="/include/js/common.js"></script>
<script type="text/javascript">
	
	$(function(){
		/*저장 버튼 클릭 시 처리 이벤트 */
		$("#boardInsert").click(function(){
			
			//입력값 체크
			if(!chkSubmit($('#b_name'),"이름을")) return;
			else if(!chkSubmit($('#b_title'),"제목을")) return;
			else if(!chkSubmit($('#b_content'),"작성할 내용을")) return;
			else if(!chkSubmit($('#file'),"첨부파일을")) return;
			else if(!chkSubmit($('#b_pwd'),"비밀번호를")) return;
			else{
				/* 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우-1반환)
				 jQuery.inArray(찾을 값, 검색 대상의 배열)*/
				var ext = $('#file').val().split('.').pop().toLowerCase();
				if(jQuery.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
					alert("gif, pag, jpg, jpeg 파일만 업로드 할 수 있습니다.");
					return;
				}
				$("#f_writeForm").attr({
					"method": "POST",
					"action": "/chefboard/boardInsert.do"
				});
				$("#f_writeForm").submit();
			}		
		});
		
		$("#boardList").click(function(){
			location.href="/chefboard/boardList.do";
		});
	});
</script>
</head>
<body>
<div id="boardTit"><h3>글쓰기</h3></div>
<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
	<table id="boardWrite">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="bnick" id="bnick"></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="btitle" id="btitle"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td height="200"><textarea name="bcontent" id="bcontent" rows="10" cols="70"></textarea></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><input type="file" name="bfile" id="bfile"></td>
		</tr>
	</table>
</form>
<div id="boardBut">
	<input type="button" value="저장" class="but" id="boardInsert">
	<input type="button" value="목록" class="but" id="boardList">
</div>
</body>
</html>