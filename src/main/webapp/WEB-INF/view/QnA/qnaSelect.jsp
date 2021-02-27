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
	div {
			margin: 50px 0px 0px 100ox;
		}
	.mem{ text-align: center;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
		
		// 조회수 증가
		var viewsUrl = "qnaViews.do";
		var viewsType = "GET";
		var viewsData = {"bno": $("#bno").val()};
		$.ajax({
			url: viewsUrl,
			type: viewsType,
			data: viewsData,
			success: viewsSuccess,
			error: viewsError
		});

		function viewsSuccess(resultData){
			if(resultData=="GOOD"){
				console.log("조회 수 +1 증가");
			}
		}
		function viewsError(){
			alert("시스템 오류입니다. 관리자에게 문의하세요.");
		}
		
		// 좋아요
		$(document).on("click", "#hitsbtn", function(){
			var hitsUrl = "qnaHits.do";
			var hitsType = "GET";
			var hitsData = {"bno": $("#bno").val()};
			$.ajax({
				url: hitsUrl,
				type: hitsType,
				data: hitsData,
				success: hitsSuccess,
				error: hitsError
			});

			function hitsSuccess(resultData){
				if(resultData=="GOOD"){
					console.log("좋아요 수 +1 증가");
				}
			}
			function hitsError(){
				alert("시스템 오류입니다. 관리자에게 문의하세요.");
			}
		});
		
		
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
		
		// C
		$(document).on("click", "#C", function(){
			location.href="qnaSelectAllPage.do";
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
<table border="1">
<tr>
<td colspan="2" align="center">QnA 글 보기 </td>
</tr>
<tr>
<td class="mem">글 번호</td>
<td><input type="text" name="bno" id="bno" value="<%= bvo.getBno() %>" readonly></td>
</tr>
<tr>
<td class="mem">글유형</td>
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
<img src="<%=new FileLoadUtil().getFileSrc("qnaboard", bvo.getBfile()) %>" border="1" width="40" height="50" alt="image">
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
<td><input type="text" name="bviews" id="bviews" value="<%= bvo.getBviews() %>" readonly></td>
</tr>
<tr>
<td class="mem">좋아요 수</td>
<td><input type="text" name="bhits" id="bhits" value="<%= bvo.getBhits() %>" readonly></td>
</tr>
<tr>
	<td colspan="7" align="right">
		<input type="button" value="좋아요" id="hitsbtn">
		<input type="button" value="수정하기" id="U">
		<input type="button" value="삭제하기" id="D">
		<input type="button" value="돌아가기" id="C">
	</td>
</tr>
</table>
</form>
</div>
		<c:import url="/reply/reply.do">
		</c:import>
</body>
</html>