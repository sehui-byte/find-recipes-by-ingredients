<%@page import="com.jns.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 목록</title>
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
				$("#recipeForm").attr({"method":"GET"
									 ,"action":"recipelist.do"}).submit();
			});
		});
		</script>
	</head>
	<%
		RecipeVO rvo = (RecipeVO)request.getAttribute("rvo");
	    int Size = rvo.getPageSize();
	    int pageSize = rvo.getPageSize();
	    int groupSize = rvo.getGroupSize();
	    int curPage = rvo.getCurPage();
	    int totalCount = rvo.getTotalCount();	
	   
      	if(request.getParameter("curPage") != null)
      	{
          curPage = Integer.parseInt(request.getParameter("curPage"));
       	}
      	
		List<RecipeVO> list = (List<RecipeVO>)request.getAttribute("pageList");
		
		System.out.println("list.size() >>> : " + list.size());
	%>
	<style>
		#searchRecipeForm{
			width: 400px;
			margin-top: 50px;
			margin-left: 40%;
		}
		
		/* 03/01 재민: 페이지 디자인 완료 */
		.tt{
		text-align: center;
		font-weight: bold;
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
	<body>
	<div id ="wrapper">
	<img src="/kosmoJns/resources/img/cooking.png"
    		 alt="basic_cooking_main" class="img-fluid">
	<div class="section-header">Basic Cooking</div>
		<form id="recipeForm" name="recipeForm">
			<table class="table table-hover">
				<thead>
				<tr>
					<td class="tt">레시피 번호</td>
					<td class="tt">레시피 이름</td>
					<td class="tt">썸네일</td>
				</tr>
				</thead>
				<%					
				for(int i=0; i<list.size(); i++)
				{
				%>
				<tr onclick="location.href='/kosmoJns/recipedetail.do?rcp_seq=<%= list.get(i).getRcp_seq() %>'">
					<td class="align-middle" style="text-align: center;"><%=list.get(i).getRcp_seq()%></td>
					<td class="align-middle" ><%=list.get(i).getRcp_nm()%></td>
					<td><img alt="" src="<%=list.get(i).getAtt_file_no_mk()%>"
						width="60" height="60"></td>
				</tr>
				<%
				}
				%>
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
					    		<input type="text" class="form-control" id="keyword" name="keyword" value="<%=rvo.getKeyword() != null ? rvo.getKeyword() : ""%>" placeholder="검색어 입력">
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
					<jsp:param name="url" value="recipelist.do"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
				</jsp:include>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
	</body>
</html>