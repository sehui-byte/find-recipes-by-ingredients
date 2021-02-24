<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE SELECT</title>
<style type="text/css">
	div {
			margin: 50px 0px 0px 100px;
		}
	.mem{ text-align: center;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// U
		$(document).on("click", "#U", function(){
			alert("U >>> :");
			$("#NoticeUpdateForm").attr({
				"method":"GET",
				"action":"noticeUpdate.do"
			}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			alert("D >>> : ");
			$("#NoticeUpdateForm").attr({
				"method":"GET",
				"action":"noticeDelete.do"
			}).submit();
		});
		
		// C
		$(document).on("click", "#C", function(){
			location.href="noticeSelectAll.do";
		});
		
	});
</script>
</head>
<body>
공지 수정
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<BoardVO> list = (List)obj;
	BoardVO nvo = null;
	
	if(list.size() == 1){
		nvo = list.get(0);
	};
%>
<div>
<form name="NoticeUpdateForm" id="NoticeUpdateForm">
<table border="1">
<tr>
<td colspan="2" align="center">공지글 수정하기</td>
</tr>
<tr>
<td class="mem">글번호</td>
<td><input type="text" name="bno" id="bno" value="<%= nvo.getBno() %>" readonly></td>
</tr>
<tr>
<td class="mem">글유형</td>
<td><input type="text" name="btype" id="btype" value="<%= nvo.getBtype() %>" readonly></td>
</tr>
<tr>
<td class="mem">글제목</td>
<td><input type="text" name="btitle" id="btitle" value="<%= nvo.getBtitle() %>"></td>
</tr>
<tr>
<td class="mem">글내용</td>
<td><textarea name="bcontent" id="bcontent" cols="50" rows="5" <%= nvo.getBcontent() %>></textarea>
</td>
</tr>
<tr>
<td class="mem">글작성자</td>
<td><input type="text" name="mnick" id="mnick" value="<%= nvo.getMnick() %>"></td>
</tr>
<tr>
<td class="mem">첨부파일</td>
<td><img src="<%=new FileLoadUtil().getFileSrc("noticeboard", nvo.getBfile()) %>" border="1" width="40" height="50" alt="image">
</td>
</tr>
<tr>
<td class="mem">입력날짜</td>
<td><input type="text" name="binsertdate" id="binsertdate" value="<%= nvo.getBinsertdate() %>" readonly></td>
</tr>
<tr>
<td class="mem">수정날짜</td>
<td><input type="text" name="bupdatedate" id="bupdatedate" value="<%= nvo.getBupdatedate() %>" readonly></td>
</tr>
<tr>
<td class="mem">조회수</td>
<td><input type="text" name="bviews" id="bviews" value="<%= nvo.getBviews() %>" readonly></td>
</tr>
<tr>
<td class="mem">좋아요 수</td>
<td><input type="text" name="bhits" id="bhits" value="<%= nvo.getBhits() %>" readonly></td>
</tr>
<tr>
	<td colspan="7" align="right">
		<input type="button" value="수정하기" id="U">
		<input type="button" value="삭제하기" id="D">
		<input type="button" value="돌아가기" id="C">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>