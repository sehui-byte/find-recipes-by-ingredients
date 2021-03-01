<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 게시판</title>
		<style type="text/css">
		
			/* 03/1 재민: 페이지 디자인 완료 */
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
			
			.btn-orange { 
				background-color: #F9A781; 
				font-weight: bold;
			}
			
			.table.table-hover tbody tr:hover {
		    	background-color: #F9A781; 
			}
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
		<script type="text/javascript">
			
			$(document).ready(()=>
			{		
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
					$("#rbForm").attr({"method":"GET"
										 ,"action":"recipeboard_list.do"}).submit();
				});
				
				//입력
				$("#writeBtn").click(()=>
				{					
					$("#rbForm").attr("action", "rbwriteform.do");
					$("#rbForm").attr("method", "GET");
					$("#rbForm").attr('enctype','multipart/form-data');
					$("#rbForm").submit();
				});
			});
			function onBtnClick(rbno)	
			{	
				$("#rbno").val(rbno);	
				$("#rbForm").attr("action", "rbupdateform.do");	
				$("#rbForm").attr("method", "GET");	
				$("#rbForm").attr('enctype','multipart/form-data');	
				$("#rbForm").submit();	
			}	
		</script>
	</head>
	<%
		RecipeBoardVO rbvo = (RecipeBoardVO)request.getAttribute("rbvo");
	    int Size = rbvo.getPageSize();
	    int pageSize = rbvo.getPageSize();
	    int groupSize = rbvo.getGroupSize();
	    int curPage = rbvo.getCurPage();
	    int totalCount = rbvo.getTotalCount();	
	   
      	if(request.getParameter("curPage") != null)
      	{
          curPage = Integer.parseInt(request.getParameter("curPage"));
       	}
      	
		List<RecipeBoardVO> list = (List<RecipeBoardVO>)request.getAttribute("pageList");      	
	%>
	<body>
	<div id="wrapper">
		<img src="/kosmoJns/resources/img/cook_board_main.png"
    		 alt="cook_board_main" class="img-fluid">
		<div class="section-header">Cook Board</div>
		<form id="rbForm" name="rbForm">
			<input type="hidden" id="rbno" name="rbno">
			<table class="table table-hover">
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
			<%
			for(int i=0; i<list.size(); i++)
			{
			%>
				<tr onclick="location.href='rbdetail.do?rbno=<%=list.get(i).getRbno()%>'">
					<td class="tt"  style="font-size: 12px"><%= list.get(i).getRbno() %> </td>
					<td class="left"><span style="font-weight: bold;"><%= list.get(i).getRcp_nm() %></span></td>
					<td class="tt"><%= list.get(i).getMnick() %> </td>
					<td class="tt"><%= list.get(i).getViews() %> </td>
					<td class="tt"><%= list.get(i).getHits() %> </td>
					<td class="tt" style="font-size: 12px"><%= list.get(i).getRb_insertdate() %> </td>

					<td class="tt" style="font-size: 12px">
						<%	
							if(rbvo.getRb_updatedate() != null && rbvo.getRb_updatedate().length() > 0)
							{
						%>
								list.get(i).getRb_updatedate()%>
						<%
							}else{
						%>	
								-
						<%
							}
						%>
					</td>
				</tr>
			<%
			}
			%>
			</table>
			<div align="right">
				<input class="btn btn-orange" type="button" value="글쓰기" id="writeBtn">
			</div>
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
						    		<button class="btn btn-orange" type="button" id="searchBtn">검색</button>
						    	</span>			    			    	
					    	</div>
					    </div>
				  	</div>
				  </div>
				  <div class="col-6 col-md-4"></div>
				</div>
				<div class="row">
				  <div class="col-6 col-md-4"></div>
				  <div class="col-6 col-md-4">
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
				  <div class="col-6 col-md-4"></div>
				</div>	
			</div>
			<!-- =================  검색창 그리드 설정 ================= -->	
			<br>
			<div class="paging">
				<jsp:include page="../../include/jsp/paging.jsp" flush="true">
					<jsp:param name="url" value="recipeboard_list.do"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
				</jsp:include>
			</div>
		</form>
		<div>Icons made by <a href="https://www.flaticon.com/authors/ultimatearm" title="ultimatearm">ultimatearm</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
	</div>	
	</body>
</html>





























