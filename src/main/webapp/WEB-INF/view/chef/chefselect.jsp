<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chef.vo.ChefVO" %>
<%@ page import="java.util.List" %>   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셰프 화면</title>
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
	
	
	.table.table-hover tbody tr:hover {
    	background-color: #F9A781; 
	}
	
	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
</style>
<link rel="stylesheet" href="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 구독자 수 확인
		var subscribeUrl = "/kosmoJns/subscribe/chefSubCount.do";
		var method = "GET";
		var ino = $('#ino').val();
		var dataParam = {
				"ino": ino
		};
		
		$.ajax({
			url: subscribeUrl,
			type: method,
			data: dataParam,
			dataType: "json",
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){
			var vv = resData.key;
			console.log("chefSubCount resData.key vv >>> : " + vv);
			$('.subscribe').text(vv);
		}
		function whenError(e){
			alert("오류 >>> : " + e.responseText);
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
			$("#chefRecipeList").attr({"method":"GET"
								 ,"action":"/kosmoJns/chef/chefselect.do"}).submit();
		});
		
	});
	
</script>
</head>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("list");
	List<ChefVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("chefselect.jsp nCnt >>> : " + nCnt);
%>
<body>
<div id="wrapper">
<img src="/kosmoJns/resources/img/chef-hat.png"
    		alt="chef-hat" class="img-fluid">
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			ChefVO cvo = list.get(i);
%>
	<div class="section-header"><%=cvo.getMnick() %> Recipe</div>
	셰프 번호 : <%=cvo.getIno() %>
	<input type="hidden" id="ino" name="ino" value="<%=cvo.getIno() %>"><br>
	구독자 수 : <span class="subscribe">0</span>명
<%
		} // end of for
	}else{
%>
	등록된 셰프가 아닙니다.	
<%		
		
	} // end of if
%>
	<form id="chefRecipeList" name="chefRecipeList">
	<table class="table table-hover">
		<thead>
		<tr>
			<td class="tt" style="width:50%; font-weight: bold">제목</td>	
			<td class="tt" style="font-weight: bold">댓글수</td>	
			<td class="tt" style="font-weight: bold">조회수</td>	
			<td class="tt" style="font-weight: bold">추천</td>	
			<td class="tt" style="font-weight: bold">최종 수정 날짜</td>	
		</tr>
		</thead>
		<tbody>
<%
	Object obj1 = request.getAttribute("chefRecipeList");
	Object obj2 = request.getAttribute("p_rbvo");
	
	List<RecipeBoardVO> list1 = (List)obj1;
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
<%
	if (list1 != null){
		int nCnt1 = list1.size();
		System.out.println("chefselect.jsp nCnt1 >>> : " + nCnt1);
		for (int i = 0; i < nCnt1 ; i++){
				RecipeBoardVO rbvo = list1.get(i);
%>
		<tr>	
			<td>
				<a href="/kosmoJns/rbdetail?rbno=<%= rbvo.getRbno()%>"><%= rbvo.getRcp_nm() %></a>
			</td>	
			<!-- 댓글을 가져오려면 어떻게 해야 하지?? -->
			<td class="tt"><%= rbvo.getRb_reply() %></td>	
			<td class="tt"><%= rbvo.getViews() %></td>	
			<td class="tt"><%= rbvo.getHits() %></td>	
			<td class="tt" style="font-size: 12px"><%= rbvo.getRb_updatedate() %></td>	
		</tr>	
<%
		} // end of for
%>	
<% 
	}else{
%>
		<tr>
			<td colspan="6">현재 조회된 레시피 게시글이 존재하지 않습니다.	
			</td>
		</tr>
<%
	} // end of if
%>
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
						<option value="key1">메뉴명</option>
						<option value="key2">재료</option>
						<option value="key3">메뉴명+재료</option>
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
	<input type="hidden" id="mno" name="mno" value="<%= mno %>">
	<div class="paging">
		<jsp:include page="../myinfo/page/paging.jsp" flush="true">
			<jsp:param name="url" value="chefselect"/>
			<jsp:param name="str" value=""/>
			<jsp:param name="pageSize" value="<%=pageSize%>"/>
			<jsp:param name="groupSize" value="<%=groupSize%>"/>
			<jsp:param name="curPage" value="<%=curPage%>"/>
			<jsp:param name="totalCount" value="<%=totalCount%>"/>
			<jsp:param name="mno" value="<%=mno %>"/>
		</jsp:include>
	</div>
</form>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>