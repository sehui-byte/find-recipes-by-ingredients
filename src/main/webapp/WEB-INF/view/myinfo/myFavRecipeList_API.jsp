<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>

<%
	String mno = (String)request.getAttribute("mno");
	Object obj = request.getAttribute("recipeList");
	List<RecipeVO> recipeList = (List)obj;
%>    

<form id="myFavRecipeList" name="myFavRecipeList" >
	<table border="1" style="text-align:center; margin-left:auto; margin-right:auto;">
		<thead>
			<tr>
				<td colspan="10" align="center"><h2>내 즐겨찾기 레시피 - 식약처 API</h2></td>
			</tr>
			<tr>
				<td colspan="10" align="left">
					<select id="keyfilter" name="keyfilter">
						<option value="key1">제목</option>
						<option value="key2">내용</option>
						<option value="key3">제목+내용</option>
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
			<td>제목 </td>	
			<td>레시피 등록 날짜</td>	
			<td>레시피 조회수</td>	
			<td>레시피 추천수</td>	
		</tr>

<% 
	if (recipeList != null){
		int nCnt = recipeList.size();
			for (int i = 0; i < nCnt; i++){
				RecipeVO rvo = null;
				rvo = recipeList.get(i);
%>
		<tr>
			<td>
				<input type="checkbox" name="rcp_seq" value="<%= rvo.getRcp_seq()%>" class="checkbox">	
			</td>	
			<td>
				<a href="qnaSelect?rcp_seq=<%= rvo.getRcp_seq() %>"><%= rvo.getRcp_nm() %></a>
			</td>	
			<td><%= rvo.getRcp_insertdate() %></td>	
			<td><%= rvo %></td>	
			<td>기타</td>	
		</tr>
<%
		} // end of for
	}else{
 %>		
		<tr>
			<td colspan="4">현재 추천한 레시피가 없습니다.</td>	
		</tr>
<% 
	}	
%>
		<tr>
			<td colspan="4">
				<input type="button" name="deleteQnA" id="deleteQnA" value="즐겨찾기 삭제">
			</td>
		</tr>	
	</table>
	<input type="hidden" id="mno" name="mno" value="<%= mno %>">
</form>