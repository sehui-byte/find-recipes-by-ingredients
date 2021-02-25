<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chefboard.vo.ChefBoardVO" %> 
<%@ page import="com.jns.subscribe.vo.SubscribeVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<%  
      Object obj2 = request.getAttribute("p_cbvo");
      ChefBoardVO cbvoP =(ChefBoardVO) obj2; //cbvo ==> pageVO
      
      int Size = cbvoP.getPageSize();
      int pageSize = cbvoP.getPageSize();
      int groupSize = cbvoP.getGroupSize();
      int curPage = cbvoP.getCurPage();
      int totalCount = cbvoP.getTotalCount();
      
      
      if(request.getParameter("curPage") != null){
         curPage = Integer.parseInt(request.getParameter("curPage"));
      }
%>
<meta charset="UTF-8">
<title>세프게시판 글 목록</title>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bole;
	}
</style>
<link rel="stylesheet" href="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		sessionMlevel = "<%=mlevel%>"
		
		// 로그인 유저가 세프일 경우 글쓰기 버튼 활성화
		if ( sessionMlevel == 'C'){
			$('#I').attr('disabled', false);
		}
			
		
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
			$("#boardList").attr({"method":"GET"
								 ,"action":"/kosmoJns/chefboard/boardselectallpage.do"}).submit();
		});
		
		
		// 입력
		$(document).on("click", "#I", function(){
			location.href="/kosmoJns/chefboard/writeForm.do";
		});	
		
	});	
	
	
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object objR = request.getAttribute("subRank");
	List<SubscribeVO> listR = (List)objR;
	
	int rank = listR.size();
	System.out.println("boardselectall.jsp rank >>> : " + rank);
%>
<form id="subscribeRank">
	<table border=1>
		<tr>
			<td colspan="3" align="center">셰프 랭킹</td>
		</tr>
		<tr>
			<td>순위</td>
			<td>셰프이름</td>
			<td>구독자 수</td>
		</tr>
<%
	if (rank > 0) {
		for(int i=0; i<rank; i++){
			SubscribeVO svo = listR.get(i);
%>	
		<tr class="rankTr">
			<td class="rankTd"><%= i + 1 %> 등</td>
			<td class="rankTd"><%= svo.getChefnick() %></td>
			<td class="rankTd"><%= svo.getSubCount() %> 명</td>
		</tr>	
<%
		} // end of for
	}else{
%>
	<tr>
		<td colspan="10" align="center">순위가 존재하지 않습니다.</td>
	</tr>	
<%		
		
	} // end of if
%>
	</table>	
</form>	
<%
	Object obj = request.getAttribute("listPage");
	List<ChefBoardVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("boardselectallpage.jsp nCnt >>> : " + nCnt);
%>
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
				<option value="key2">글번호</option>
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
		<td class="tt">조회</td>
		<td class="tt">추천</td>
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
		<td class="tt"><%= cbvo.getMnick() %> </td>
		<td class="tt"><%= cbvo.getViews() %> </td>
		<td class="tt"><%= cbvo.getHits() %> </td>
		<td class="tt"><%= cbvo.getRb_insertdate() %> </td>
		<td class="tt"><%= cbvo.getRb_updatedate() %> </td>
		<td class="tt"><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getMain_img())%>"></td>
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
			<input type="button" value="글쓰기" id="I" disabled="disabled">
		</td>
	</tr>
	</tbody>
</table>
<br>
	<div class="paging">
		<jsp:include page="../../include/jsp/paging.jsp" flush="true">
		<jsp:param name="url" value="boardselectallpage.do"/>
		<jsp:param name="str" value=""/>
		<jsp:param name="pageSize" value="<%=pageSize%>"/>
		<jsp:param name="groupSize" value="<%=groupSize%>"/>
		<jsp:param name="curPage" value="<%=curPage%>"/>
		<jsp:param name="totalCount" value="<%=totalCount%>"/>
	</jsp:include>
	</div>
</form>
</body>
</html>