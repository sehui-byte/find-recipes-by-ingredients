<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@page import="com.jns.common.Validation"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA Select</title>
<style type="text/css">

	/* 03/02 재민: 페이지 디자인 완료 */
	.mem{
		text-align: center;
		vertical-align: middle;
	}

	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
	
	.scrolldiv {   
        height:500px;
        overflow:scroll;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
		// U 
		$(document).on("click", "#U", function(){
			$("#QnAUpdateForm").attr({
				"method":"POST",
				"action":"qnaUpdateForm.do",
				"enctype": "multipart/form-data"
			}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			$("#QnAUpdateForm").attr({
				"method":"POST",
				"action":"qnaDelete.do"
			}).submit();
		});	
		
		// C
		$(document).on("click", "#C", function(){
			location.href="qnaSelectAllPage.do";
		});
		
	});
	
	//썸네일
	function setThumbnail(e){
		console.log(e);
		no = e.target.name.slice(-2);
		
		var reader = new FileReader();
		reader.onload = function(e)
		{
			console.log("thumb+no >>> : " + "thumb"+no);
			$("#thumb"+no).attr("src", e.target.result);
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	
</script>
</head>
<body>
<div id ="wrapper">
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
	<span style="font-size: 14px">Q&A</span>
	<table class="table">
		<thead>
			<tr>
				<td colspan="2"><h2>공지 수정하기</h2></td>
			</tr>
			<tr>
				<td colspan="2" style="vertical-align: middle;"><%=bvo.getMnick()%>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="mnick" name="mnick" value="<%=bvo.getMnick()%>">
				<input type="hidden" id="bno" name="bno" value="<%=bvo.getBno()%>">		
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="align-middle">제목</td>
				<td><input type="text" class="form-control" name="btitle" id="btitle" value="<%=bvo.getBtitle()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">내용</td>
				<td>
				<textarea class="form-control" name="bcontent" id="bcontent" rows="10" cols="70"><%=bvo.getBcontent()%></textarea>
				</td>
			</tr>
			<tr>
				<td class="mem" width="20%">첨부파일</td>
				<td><img id="thumb01" src="<%=new FileLoadUtil().getFileSrc("qnaboard", bvo.getBfile())%>"><br>
					이미지 변경하기▼ 
					<input type="file" class="form-control" id="file01" name="file01" onchange="setThumbnail(event);">				
				</td>
			</tr>				
			<tr>
				<td colspan="7" align="right">
					<input type="button" class="btn btn-orange" value="수정하기" id="U">
					<input type="button" class="btn btn-orange" value="삭제하기" id="D">
					<input type="button" class="btn btn-orange" value="돌아가기" id="C">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
		<c:import url="/reply/reply.do">
		</c:import>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>