<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>

<%
	Object obj = request.getAttribute("myRecipeList");
	Object obj2 = request.getAttribute("p_rbvo");
	
	List<RecipeBoardVO> list = (List)obj;
	RecipeBoardVO rbvoP = (RecipeBoardVO)obj2;
	
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
<title>My Recipe List</title>
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
		$("#checkAll").click(function(){
			var checkAll = $("#checkAll");	
			if (checkAll.prop("checked")){
				$(".checkbox").prop("checked",true)	
			}else{
				$(".checkbox").prop("checked",false)	
			}
		})	
		
		
		$("#deleteQnA").click(function(){
			var nCnt = $(".checkbox:checked").length;
			var checkbox = $(".checkbox:checked");
			var chkVal = [];
			
			for (var i = 0; i < nCnt; i++){
				var chk = checkbox[i].value;
				chkVal.push(chk);
			}
			
			var data = {'chkVal' : chkVal};
			var url = "/kosmoJns/myinfo/myRecipeDelete";
			
			$.ajax({
				url : url,
				data : data,
				method : "POST",
				success : whenSuccess,
				error : whenError
			});
			
			function whenSuccess(data){
				if (data == nCnt){
					alert("삭제되었습니다.");
					location.reload();
				}else{
					alert("삭제에 실패하였습니다. ");
				}
			}	
			
			function whenError(data){
				alert("댓글 삭제에 문제가 발생하였습니다. 관리자에게 문의하시기 바랍니다.");
			}
		})
		
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
		
		//검색버튼
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#myRecipeList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myRecipeListPage"}).submit();
			});
		
		})

		$(document).on("click", "#searchReset", function(){
			$("#myRecipeList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myRecipeListPage"}).submit();

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
				$("#myRecipeList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myRecipeListPage"}).submit();
				}	
			}
		}
	
</script>
</head>
<body>
<form id="myRecipeList" name="myRecipeList">
	<table border="1" style="text-align:center; margin-left:auto; margin-right:auto;">
		<thead>
			<tr>
				<td colspan="10" align="center"><h2>나의 레시피</h2></td>
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
					<button type="button" id="searchBtn">검색</button>
					<button type="button" id="searchReset">검색 초기화</button>
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
				<a href="/kosmoJns/rbdetail?rbno=<%= rbvo.getRbno()%>"><%= rbvo.getRcp_nm() %></a>
			</td>	
			<!-- 댓글을 가져오려면 어떻게 해야 하지?? -->
			<td>댓글</td>	
			<td><%= rbvo.getHits() %></td>	
			<td><%= rbvo.getViews() %></td>	
			<td><%= rbvo.getRb_updatedate() %></td>	
		</tr>
		<tr>
			<td colspan="6">
				<input type="button" name="deleteQnA" id="deleteQnA" value="게시글 삭제">
			</td>
		</tr>	
<%
		}
%>
		<tr>
			<td colspan="6">현재 조회된 레시피 게시글이 존재하지 않습니다.	
			</td>
		</tr>
<% 
	}else{
%>
<%
	}
%>
	<tr>
		<td class="paging" colspan="6">
			<jsp:include page="./page/paging.jsp" flush="true">
				<jsp:param name="url" value="myRecipeListPage"/>
				<jsp:param name="str" value=""/>
				<jsp:param name="pageSize" value="<%=pageSize%>"/>
				<jsp:param name="groupSize" value="<%=groupSize%>"/>
				<jsp:param name="curPage" value="<%=curPage%>"/>
				<jsp:param name="totalCount" value="<%=totalCount%>"/>
				<jsp:param name="mno" value="<%=mno %>"/>
			</jsp:include>
		</td>
	</tr>
	</table>
	<input type="hidden" id="mno" name="mno" value="<%= mno %>">
</form>
</body>
</html>
