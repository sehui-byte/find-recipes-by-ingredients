<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>

<%
	String mno = (String)request.getParameter("mno");
	Object obj = request.getAttribute("recipeBoardList");
	List<RecipeBoardVO> recipeBoardList = (List)obj;
%>    
<script>
	$(document).ready(function(){
		// 체크박스 전체 선택	
		$("#checkAll_RecipeBoard").click(function(){
			var checkAll = $("#checkAll_RecipeBoard");	
			if (checkAll.prop("checked")){
				$(".checkbox_RecipeBoard").prop("checked",true)	
			}else{
				$(".checkbox_RecipeBoard").prop("checked",false)	
			}
			
			$("#deleteMyFavRecipeBoard").on("click", function(){
				var nCnt = $(".checkbox_RecipeBoard:checked").length;
				var checkbox = $(".checkbox_RecipeBoard:checked");
				var chkVal = [];
				
				for (var i = 0; i < nCnt; i++){
					var chk = checkbox[i].value;
					chkVal.push(chk);
				}
				
				var url = "/kosmoJns/favorites/myFavRecipeDelete.do";
				var data = {'chkVal' : chkVal,
						'recipeType' : 'user',
						'mno' : '<%= mno %>'
						};

				$.ajax({
					url : url,
					data : data,
					method : "POST",
					success : whenSuccess,
					error : whenError
				});
				
				function whenSuccess(data){
					if (data == nCnt){
						alert("정상적으로 삭제되었습니다.");
						location.reload();
					}else{
						alert("삭제에 실패하였습니다. ");
					}
				}	
			
				function whenError(data){
					alert("댓글 삭제에 문제가 발생하였습니다. 관리자에게 문의하시기 바랍니다.");
				}
				
			});
		})	
		
		//검색버튼
		$(document).on("click", "#searchBtnUserRecipe", function(){
			console.log("searchBtn >>> : ");
			$("#myFavRecipeBoardList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myFavRecipeList/SelectRecipe.do"}).submit();
		});
		
	})
</script>

<form id="myFavRecipeBoardList" name="myFavRecipeBoardList" >
	<table border="1" style="text-align:center; margin-left:auto; margin-right:auto;">
		<thead>
			<tr>
				<td colspan="10" align="center"><h2>내 즐겨찾기 레시피 - USER</h2></td>
			</tr>
			<tr>
				<td colspan="10" align="left">
					<select id="keyfilter" name="keyfilter">
						<option value="key1">메뉴명</option>
						<option value="key2">재료</option>
						<option value="key3">메뉴명+재료</option>
					</select>
					<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
					<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일">
					~<input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
					<button type="button" id="searchBtnUserRecipe">검색</button>
				</td>	
			</tr>
		</thead>
		<tr>
			<td>
				<input type="checkbox" id="checkAll_RecipeBoard">	
			</td>	
			<td>제목 </td>	
			<td>레시피 등록 날짜</td>	
			<td>레시피 조회수</td>	
			<td>레시피 추천수</td>	
			<td>기타</td>	
		</tr>
<% 
	if (recipeBoardList != null){
		int nCnt = recipeBoardList.size();
		if (nCnt > 0){
			for (int i = 0; i < nCnt; i++){
				RecipeBoardVO rbvo = null;
				rbvo = recipeBoardList.get(i);
%>
		<tr>
			<td>
				<input type="checkbox" name="rbno" value="<%= rbvo.getRbno() %>" class="checkbox_RecipeBoard">	
			</td>	
			<td>
				<a href="/kosmoJns/chefboard/boardselect.do?rbno=<%= rbvo.getRbno() %>"><%= rbvo.getRcp_nm() %></a>
			</td>	
			<td><%= rbvo.getRb_insertdate() %></td>	
			<td><%= rbvo.getViews() %></td>	
			<td><%= rbvo.getHits() %></td>	
			<td>기타</td>	
		</tr>
		<tr>
			<td colspan="6">
				<button type="button" name="deleteMyFavRecipeBoard" id="deleteMyFavRecipeBoard">즐겨찾기 삭제</button>
			</td>
		</tr>	
<%
			} // end for
		} else{
 %>		
		<tr>
			<td colspan="6">현재 추천한 레시피가 없습니다.</td>	
		</tr>
<% 
		} 
	}
%>
	</table>
	<input type="hidden" id="mno" name="mno" value="<%= mno %>">
	<input type="hidden" id="recipeType" name="recipeType" value="user">
</form>
