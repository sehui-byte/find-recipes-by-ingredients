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
	}
	
	.section-header {
		position: relative;
		margin-bottom: 40px;
		font-size: 26px;
		font-weight: 400;
		color: #333;
		text-align: Center;
		line-height: 60px;
		letter-spacing: 1px;
	}
	
	.section-header:after {
		content: "";
		display: block;
		position: absolute;
		left: 50%;
		bottom: 0;
		width: 70px;
		height: 2px;
		background: #ff7f00;
		transform: translate(-50%, 0);
		transform: translate3d(-50%, 0, 0);
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
<div class="section-header">ChefBoard</div>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object objR = request.getAttribute("subRank");
	List<SubscribeVO> listR = (List)objR;
	
	int rank = listR.size();
	System.out.println("boardselectall.jsp rank >>> : " + rank);
	SubscribeVO svo0 = null;
	SubscribeVO svo1 = null;
	SubscribeVO svo2 = null;
	
	if(rank==3){
		svo0 = listR.get(0);
		svo1 = listR.get(1);
		svo2 = listR.get(2);
	}else if(rank==2){
		svo0 = listR.get(0);
		svo1 = listR.get(1);
	}else{
		svo0 = listR.get(0);
	}
%>
<div class="container">
  <div class="row">
    <div class="col-sm">
    	<img src="/kosmoJns/resources/img/gold-medal.png"
    		 alt="gold" style="width:50px; height:50px"><br>     
<%
		if( svo0 != null){		
%>
		<p class="fs-3 fw-bold"><%=svo0.getChefnick()%></p>
		<p class="fs-5">구독자 <%=svo0.getSubCount()%>명</p>
<%
		} // end of if 
		else{
%>
		<p>NO DATA</p>
<%
		} // end of else
%>      
    </div>
    <div class="col-sm">
    	<img src="/kosmoJns/resources/img/silver-medal.png"
    		 alt="silver" style="width:50px; height:50px"><br>
<%
		if( svo1 != null){		
%>
		<p class="fs-3 fw-bold"><%=svo1.getChefnick()%></p>
		<p class="fs-5">구독자 <%=svo1.getSubCount()%>명</p>
<%
		} // end of if 
		else{
%>
		<p>NO DATA</p>
<%
		} // end of else
%>    
    </div>
    <div class="col-sm">
    	<img src="/kosmoJns/resources/img/bronze-medal.png"
    		 alt="bronze" style="width:50px; height:50px"><br>
<%
		if( svo2 != null){		
%>
		<p class="fs-3 fw-bold"><%=svo2.getChefnick()%></p>
		<p class="fs-5">구독자 <%=svo2.getSubCount()%>명</p>
<%
		} // end of if 
		else{
%>
		<p>NO DATA</p>
<%
		} // end of else
%>    
    </div>
  </div>
</div>
<%
	Object obj = request.getAttribute("listPage");
	List<ChefBoardVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("boardselectallpage.jsp nCnt >>> : " + nCnt);
%>
<form name="boardList" id="boardList">
<table class="table">
	<thead>
	<tr>
		<td class="tt" style="font-weight: bold">글번호</td>
		<td class="tt" style="width:50%; font-weight: bold">제목</td>
		<td class="tt" style="font-weight: bold">이름</td>
		<td class="tt" style="font-weight: bold">조회</td>
		<td class="tt" style="font-weight: bold">추천</td>
		<td class="tt" style="font-weight: bold">작성일</td>
		<td class="tt" style="font-weight: bold">수정일</td>
	</tr>
	</thead>
	<tbody>
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			ChefBoardVO cbvo = list.get(i);
%>
	<tr>
		<td class="tt"  style="font-size: 12px"><%= cbvo.getRbno() %> </td>
		<td class="left">
			<a href="/kosmoJns/chefboard/boardselect.do?rbno=<%= cbvo.getRbno() %>">
			<%= cbvo.getRcp_nm() %>
			</a>
		</td>
		<td class="tt"><%= cbvo.getMnick() %> </td>
		<td class="tt"><%= cbvo.getViews() %> </td>
		<td class="tt"><%= cbvo.getHits() %> </td>
		<td class="tt" style="font-size: 12px"><%= cbvo.getRb_insertdate() %> </td>
		<td class="tt" style="font-size: 12px"><%= cbvo.getRb_updatedate() %> </td>
	</tr>
<%
		} // end of for
	}else{
%>
	<tr>
		<td colspan="10" align="center">등록된 게시물이 존재하지 않습니다.</td>
	</tr>	
<%		
		
	} // end of if
%>
	<tr>
		<td colspan="10" align="right">
			<input class="btn btn-danger col-12" type="button" value="글쓰기" id="I" disabled="disabled">
		</td>
	</tr>
	</tbody>
</table>
	<!-- =================  검색창 그리드 설정 ================= -->
	<div class="container-fluid">
		<div class="row">
		  <div class="col-6 col-md-4"></div>
		  <div class="col-6 col-md-4">
		  	<div class="row row-cols-2">
		  		<div class="col-4">
		  			<select class="form-select" id="keyfilter" name="keyfilter">
						<option value="key1">제목</option>
						<option value="key2">글번호</option>
					</select>
		  		</div>
			    <div class="col-8">
			    	<div class="input-group">
			    		<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어 입력">
				    	<span class="input-group-btn">
				    		<button class="btn btn-danger" type="button" id="searchBtn">검색</button>
				    	</span>			    			    	
			    	</div>
			    </div>
		  	</div>
		  </div>
		  <div class="col-6 col-md-4"></div>
		</div>
		<div class="row">
		  <div class="col-md-4"></div>
		  <div class="col-md-4">
		  	<div class="row row-cols-4">
		  		<div class="col-4">
		  			<input type="text" class="form-control" id="startdate" name="startdate" size="12" placeholder="시작일">
		  		</div>
		  		<div class="col-1">
		  			<p>~</p>
		  		</div>
		  		<div class="col-4">
		  			<input type="text" class="form-control" id="enddate" name="enddate" size="12" placeholder="종료일">
		  		</div>
		  		<div class="col-3">
		  		</div>
		  	</div>
		  </div>
		</div>	
	</div>
	<!-- =================  검색창 그리드 설정 ================= -->	
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