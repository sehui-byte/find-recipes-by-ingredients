<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<%@ page import="com.jns.chefboard.vo.ChefBoardVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세프게시판 글 목록</title>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bole;
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		//검색버튼
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#boardList").attr({"method":"GET"
								 ,"action":"/kosmoJns/chefboard/boardselectall.do"}).submit();
		});
		
		
		//datepicker
		
		
		// 입력
		$(document).on("click", "#I", function(){
				location.href="/kosmoJns/chefboard/writeForm.do";
			});	
		
		
		// 제목 클릭시 상세 페이지 이동
		/*
		$(".goDetail").click(function(){
			var bno = $(this).parents("tr").attr("data-num");
			alert(bno);
			$("#bno").val(bno);
			// 상세 페이지로 이동하기 위해 form 추가(id: detailForm)
			$("#detailForm").attr({
				"method": "get",
				"action": "/kosmoJns/chefboard/boardDetail.do"
			});
			$("#detailForm").submit();
		});
		*/
	});	
	
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listAll");
	List<ChefBoardVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("boardList.jsp nCnt >>> : " + nCnt);
%>
<form name="detailForm" id="detailForm">
	<input type="hidden" name="bno" id="bno">
</form>
<form name="boardList" id="boardList">
<table border="1">
	<thead>
	<tr>
		<td colspan="10" align="center"><h2>세프게시판</h2></td>
	</tr>
	<tr>
		<td colspan="10" align="left">
			<select id="keyfilter" name="keyfilter">
				<option value="key1">제목</option>
				<option value="key2">내용</option>
				<option value="key3">제목+내용</option>
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
		<td class="tt">글번호</td>
		<td class="tt">제목</td>
		<td class="tt">이름</td>
		<!-- <td class="tt">내용</td>  -->
		<td class="tt">작성일</td>
		<td class="tt">수정일</td>
		<td class="tt">사진</td>
	</tr>
	</thead>
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			ChefBoardVO cbvo = list.get(i);
%>
	<tbody>
	<tr>
		<td class="tt"><%= cbvo.getRbno() %> </td>
		<td class="left">
			<a href="/kosmoJns/chefboard/boardselect.do?rbno=<%= cbvo.getRbno() %>">
			<%= cbvo.getRcp_nm() %>
			</a>
		</td>
		<td class="tt"> 작성자 </td>
		<td class="tt"><%= cbvo.getRb_insertdate() %> </td>
		<td class="tt"><%= cbvo.getRb_updatedate() %> </td>
		<td class="tt"> 메인이미지 </td>
	</tr>
<%
		} // end of for
	}else{
%>
	<tbody>
	<tr>
		<td colspan="10" align="center">등록된 게시물이 존재하지 않습니다.</td>
	</tr>	
<%		
		
	} // end of if
%>
	<tr>
		<td colspan="10" align="right">
			<input type="button" value="글쓰기" id="I">
		</td>
	</tr>
	</tbody>
</table>
</form>
</body>
</html>