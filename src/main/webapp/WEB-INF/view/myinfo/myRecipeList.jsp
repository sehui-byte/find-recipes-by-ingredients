<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>

<%
	Object obj = request.getAttribute("myRecipeList");
	List<RecipeBoardVO> list = (List)obj;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Recipe List</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#checkAll").click(function(){
			var checkAll = $("#checkAll");	
			if (checkAll.prop("checked")){
				$(".checkbox").prop("checked",true)	
			}else{
				$(".checkbox").prop("checked",false)	
			}
		})	
	})
</script>
</head>
<body>
<form id="myRecipeList" name="myRecipeList" >
	<table border="1" style="text-align:center; margin-left:auto; margin-right:auto;">
		<thead>
			<tr>
				<td colspan="10" align="center"><h2>나의 레시피</h2></td>
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
		</thead>
		<tr>
			<td>
				<input type="checkbox" id="checkAll">	
			</td>	
			<td>제목</td>	
			<td>댓글수</td>	
			<td>조회수</td>	
			<td>추천</td>	
			<td>최종 수정 날짜</td>	
		</tr>
<%
	if (list != null){
		int nCnt = list.size();
		for (int i = 0; i < nCnt ; i++){
				RecipeBoardVO rbvo = list.get(i);
%>
		<tr>
			<td>
				<input type="checkbox" name="rbno" value="<%= rbvo.getRbno()%>" class="checkbox">	
			</td>	
			<td>
				<a href="/kosmoJns/boardController.do?<%= rbvo.getRbno()%>"><%= rbvo.getRcp_nm() %></a>
			</td>	
			<!-- 댓글을 가져오려면 어떻게 해야 하지?? -->
			<td>댓글</td>	
			<td>조회수</td>	
			<td>추천</td>	
			<td><%= rbvo.getRb_updatedate() %></td>	
		</tr>
<%
		}
	}else{
%>
		<tr>
			<td colspan="6">현재 게시한 레시피 게시글이 존재하지 않습니다.</td>	
		</tr>
<%
	}
%>
	</table>
</form>
</body>
</html>
