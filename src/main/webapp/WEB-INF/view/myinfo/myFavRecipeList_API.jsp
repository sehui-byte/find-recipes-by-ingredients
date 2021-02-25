<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>

<%
	String mno = (String)request.getParameter("mno");
	Object obj = request.getAttribute("recipeList");
	List<RecipeVO> recipeList = (List)obj;
%>    
<script>
	$(document).ready(function(){
		$("#checkAll_APIRecipe").click(function(){
			var checkAll = $("#checkAll_APIRecipe");	
			if (checkAll.prop("checked")){
				$(".checkbox_APIRecipe").prop("checked",true)	
			}else{
				$(".checkbox_APIRecipe").prop("checked",false)	
			}
		});
			
			$("#deleteMyFavRecipeAPI").on("click", function(){
				var nCnt = $(".checkbox_APIRecipe:checked").length;
				var checkbox = $(".checkbox_APIRecipe:checked");
				var chkVal = [];
				
				for (var i = 0; i < nCnt; i++){
					var chk = checkbox[i].value;
					chkVal.push(chk);
				}
				
				var url = "/kosmoJns/favorites/myFavRecipeDelete.do";
				var data = {'chkVal' : chkVal,
						'recipeType' : 'API',
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
			
			
		//검색버튼
		$(document).on("click", "#searchBtnAPIRecipe", function(){
			console.log("searchBtn >>> : ");
			$("#myFavRecipeList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myFavRecipeList/SelectRecipe.do"}).submit();
		});
			
	})	

</script>
<form id="myFavRecipeList" name="myFavRecipeList" >
	<table border="1" style="text-align:center; margin-left:auto; margin-right:auto;">
		<thead>
			<tr>
				<td colspan="10" align="center"><h2>내 즐겨찾기 레시피 - 식약처 API</h2></td>
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
					<button type="button" id="searchBtnAPIRecipe">검색</button>
				</td>	
			</tr>
		</thead>
		<tr>
			<td>
				<input type="checkbox" id="checkAll_APIRecipe">	
			</td>	
			<td>제목 </td>	
			<td>레시피 등록 날짜</td>	
			<td>레시피 조회수</td>	
			<td>레시피 추천수</td>	
			<td>기타</td>	
		</tr>

<% 
	if (recipeList != null){
		int nCnt = recipeList.size();
		if (nCnt > 0){	
			for (int i = 0; i < nCnt; i++){
				RecipeVO rvo = null;
				rvo = recipeList.get(i);
%>
		<tr>
			<td>
				<input type="checkbox" name="rcp_seq" value="<%= rvo.getRcp_seq()%>" class="checkbox_APIRecipe">	
				<input type="hidden" name="rcp_seq" value="<%= rvo.getRcp_seq()%>">	
			</td>	
			<td>
				<a href="/kosmoJns/recipedetail.do?rcp_seq=<%= rvo.getRcp_seq() %>"><%= rvo.getRcp_nm() %></a>
			</td>	
			<td><%= rvo.getRcp_insertdate() %></td>	
			<td>조회수</td>	
			<td>추천수</td>	
			<td>기타</td>	
		</tr>
<%
			} // end of for
%>
		<tr>
			<td colspan="6">
				<input type="button" name="deleteMyFavRecipeAPI" id="deleteMyFavRecipeAPI" value="즐겨찾기 삭제">
			</td>
		</tr>	
<%
		}else{
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
	<input type="hidden" id="recipeType" name="recipeType" value="API">
</form>