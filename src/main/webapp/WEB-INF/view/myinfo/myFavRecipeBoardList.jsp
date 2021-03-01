<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<%
	Object obj = request.getAttribute("recipeBoardList");
	List<RecipeBoardVO> recipeBoardList = (List)obj;

	Object obj2 = request.getAttribute("p_rbvo");
	MemberVO rbvoP = (MemberVO)obj2;

      int Size = rbvoP.getPageSize();
      int pageSize = rbvoP.getPageSize();
      int groupSize = rbvoP.getGroupSize();
      int curPage = rbvoP.getCurPage();
      int totalCount = rbvoP.getTotalCount();
	
      if(request.getParameter("curPage") != null){
         curPage = Integer.parseInt(request.getParameter("curPage"));
      }
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*google 웹폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');

div, h1, h2, h3, h4, h5, h6, p {
   font-family: 'Noto Serif KR', serif;
}
</style>
<link rel="stylesheet" href="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#recipeTable").on("change", function(){
			var recipeTable = $("#recipeTable option:selected").val();	
			console.log(recipeTable);
			if(recipeTable == 'API'){
				location.href="/kosmoJns/myinfo/myFavRecipeList?mno=<%=mno%>";				
			}
			
		})	
	})

	//enter키 눌렀을 때 페이지 재로딩 되는 것 방지
	function captureReturnKey(e) {
		if (e.keyCode == 13 && e.srcElement.type != 'textarea')
			return false;
	}
	
	//input에서 엔터키 눌렀을 때도 검색 실행
	function enterKey(){
		if(window.event.keyCode == 13){
			if($("#keyword").val() == "" && $("#startdate").val() == "" && $("#enddate").val() == ""){
				alert("검색 조건을 입력해주세요");
			}else{
			$("#myFavRecipeBoardList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myFavRecipeList/SelectRecipe"}).submit();
			}	
		}
	}
	
</script>
</head>
<body>
<script>
	$(document).ready(function(){
		// 체크박스 전체 선택	
		$("#checkAll_RecipeBoard").click(function(){
			var checkAll = $("#checkAll_RecipeBoard");	
			if (checkAll.prop("checked")){
				$(".checkbox_RecipeBoard").prop("checked",true)	
			}else{
				$(".checkbox_RecipeBoard").prop("checked",false)	
			}})
			
			$("#deleteMyFavRecipeBoard").on("click", function(){
				var nCnt = $(".checkbox_RecipeBoard:checked").length;
				var checkbox = $(".checkbox_RecipeBoard:checked");
				var chkVal = [];
				
				for (var i = 0; i < nCnt; i++){
					var chk = checkbox[i].value;
					chkVal.push(chk);
				}
				
				var url = "/kosmoJns/favorites/myFavRecipeDelete";
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
		
		//datepicker
		$("#startdate").datepicker({
			showOn: "button",    // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage: "/kosmoJns/resources/img/cal_0.gif", 
			buttonImageOnly : true,            
			buttonText: "날짜선택",             
			dateFormat: "yy-mm-dd",             
			changeMonth: true,                  			
			onClose: function(selectedDate) {    
				$("#enddate").datepicker("option", "minDate", selectedDate);
			}	
		});
		$("#enddate").datepicker({
			showOn: "button", 
			buttonImage: "/kosmoJns/resources/img/cal_0.gif", 
			buttonImageOnly : true,
			buttonText: "날짜선택",
			dateFormat: "yy-mm-dd",
			changeMonth: true,			
			onClose: function(selectedDate) {	
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}               
		});
		
		
		})	
		
		// 검색버튼
		$(document).on("click", "#searchBtnUserRecipe", function(){
			console.log("searchBtn >>> : ");
			$("#myFavRecipeBoardList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myFavRecipeList/SelectRecipe"}).submit();
		});
		
		// 검색 초기화	
		$(document).on("click", "#searchReset", function(){
			$("#myFavRecipeBoardList").attr({"method":"GET"
							 ,"action":"/kosmoJns/myinfo/myFavRecipeList/SelectRecipe"}).submit();
			})	
</script>

<select name="recipeTable" id="recipeTable">
	<option value="API">식약처 레시피</option>
	<option value="user"selected="selected">유저 레시피</option>
</select>

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
					<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" onkeydown="enterKey()"><br>
					<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일">
					~<input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
					<button type="button" id="searchBtnUserRecipe">검색</button>
					<button type="button" id="searchReset">검색 초기화</button>
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
				<a href="/kosmoJns/chefboard/boardselect?rbno=<%= rbvo.getRbno() %>"><%= rbvo.getRcp_nm() %></a>
			</td>	
			<td><%= rbvo.getRb_insertdate() %></td>	
			<td><%= rbvo.getViews() %></td>	
			<td><%= rbvo.getHits() %></td>	
			<td>기타</td>	
		</tr>
<%
			} // end for
%>
		<tr>
			<td colspan="6">
				<button type="button" name="deleteMyFavRecipeBoard" id="deleteMyFavRecipeBoard">즐겨찾기 삭제</button>
			</td>
		</tr>	
		<tr>
			<td class="paging" colspan="6">
				<jsp:include page="./page/paging.jsp" flush="true">
					<jsp:param name="url" value="myFavReciepBoardList"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
					<jsp:param name="mno" value="<%=mno %>"/>
				</jsp:include>
			</td>
		</tr>
<%
		} else{
 %>		
		<tr>
			<td colspan="6">현재 조회된 레시피가 없습니다.</td>	
		</tr>
<% 
		} 
	}
%>
	</table>
	<input type="hidden" id="mno" name="mno" value="<%= mno %>">
	<input type="hidden" id="recipeType" name="recipeType" value="user">
</form>
</body>
</html>