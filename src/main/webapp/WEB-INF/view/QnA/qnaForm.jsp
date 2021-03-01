<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA : 질문게시판 : 글쓰기</title>
<style type="text/css"> 
	
	/* 03/01 재민: 페이지 디자인 완료 */
	.btn-orange { 
		background-color: #F9A781; 
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
		
		$(document).on("click", "#cancel", function(){
			console.log("cancel >>> : ");					
			location.href="/kosmoJns/qnaSelectAllPage.do";
		});
	});
</script>
</head>
<body>
<div id ="wrapper">
	<form action="qnaInsert.do" method="POST" enctype="multipart/form-data" name="QnAForm" id="QnAForm">
	<span style="font-size: 14px">Q&A</span>
	<table class="table">
		<thead>
		<tr>
			<td colspan="2"><h3>질문 글쓰기</h3></td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="align-middle" colspan="2">
				<h5><%=mnick%></h5>
				<input type="hidden" name="mno" id="mno" value="<%=mno%>">
			</td>
		</tr>
		<tr>
	      <td class="align-middle">글 유형</td>
	      <td>
	      <select class="form-select" name=btype id=btype>
	         <option>글 유형을 선택하세요</option>
	         <option>공지사항</option>
	         <option>QnA</option>
	      </select>
	      </td>
		</tr>
		<tr>
			<td class="align-middle">글제목</td>
			<td><input type="text" class="form-control" name="btitle" id="btitle"></td>
		</tr>
		<tr>
			<td class="align-middle">글 내용</td>
			<td>
				<textarea class="form-control" name="bcontent" id="bcontent" cols="50" rows="10"></textarea>
			</td>
		</tr>
		<tr>
		<tr>
			<td class="align-middle">첨부파일</td>
			<td><input type="file" class="form-control" name="file01" id="file01">
			</td>
		</tr>
		</tbody>
	</table>
	<div id="boardBut">
		<input type="button" class="btn btn-orange" value="저장" id="sbtn">
		<input type="button" class="btn btn-orange" value="목록" id="cancel">
	</div>
	</form>
</div>
</body>
</html>