<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@page import="com.jns.common.FileLoadUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "#I", function(){
			location.href="noticeForm.do";
		});
		
		$(document).on("click", "#A", function(){
			location.href="noticeSelectAll.do";
		});
		
		$(document).on("click", "#S", function(){
			alert("U >>>");
			$("#NoticeList").attr({
				"method":"GET",
				"action":"noticeSelect.do"}).submit();	
		});
			
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#NoticeList").attr({
				"method":"GET",
				"action":"noticeSelectAll.do"}).submit();
		});
		
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listAll");
	List<BoardVO> list = (List)obj;
	
	int nCnt = list.size();
%>

<form name="NoticeList" id="NoticeList">
<table class="table table-striped" align="center">
<thead>
<tr>
	<td colspan="10" align="center">
		<h2>공지 게시판</h2>
	</td>
</tr>
	<tr>
		<td colspan="10" align="left">
			<select id="keyfilter" name="keyfilter">
				<option value="key1">글제목</option>
				<option value="key2">글내용</option>
				<option value="key3">글제목+글내용</option>
				<option value="key4">작성자</option>
				<option value="key5">글번호</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
			<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일">
			~<input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
			<button type="button" id="searchBtn">검색</button>
		</td>	
	</tr>
<tr>
	<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
	<td class="tt">글번호</td>
	<td class="tt">글유형</td>
	<td class="tt">글제목</td>
	<td class="tt">글내용</td>
	<td class="tt">작성자</td>
	<td class="tt">첨부파일</td>
	<td class="tt">입력날짜</td>
	<td class="tt">조회수</td>
	<td class="tt">좋아요 수</td>
</tr>
</thead>

<%
for(int i=0; i<nCnt; i++){
	BoardVO nvo = list.get(i);
%>
<tbody>
<tr>
	<td>
		<input type="checkbox" name="bno" id="chkInMnum"
				value=<%= nvo.getBno() %> onclick="checkOnly(this)">
	</td>	
	<td class="tt"><%=nvo.getBno()%></td>
	<td class="tt"><%=nvo.getBtype() %></td>
	<td class="tt"><%=nvo.getBtitle() %></td>
	<td class="tt"><%=nvo.getBcontent() %></td>
	<td class="tt"><%=nvo.getMnick() %></td>
	<td class="tt"><img src="<%=new FileLoadUtil().getFileSrc("noticeboard", nvo.getBfile()) %>"></td>
	<td class="tt"><%=nvo.getBinsertdate() %></td>
	<td class="tt"><%=nvo.getBviews() %></td>
	<td class="tt"><%=nvo.getBhits() %></td>
</tr>
<%
} // end of for
%>
<tr>
	<td colspan="10" align="right">
		<input type="button" value="글쓰기" id="I">
		<input type="button" value="글보기" id="S">
		<input type="button" value="전체목록" id="A">
	</td>
</tr>	
</tbody>
</table>
</form>
</body>
</html>