<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jns.board.vo.BoardVO"%>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<%  
      Object obj2 = request.getAttribute("p_nvo");
      BoardVO nvoP =(BoardVO) obj2; 
      
      int Size = nvoP.getPageSize();
      int pageSize = nvoP.getPageSize();
      int groupSize = nvoP.getGroupSize();
      int curPage = nvoP.getCurPage();
      int totalCount = nvoP.getTotalCount();
      
      
      if(request.getParameter("curPage") != null){
         curPage = Integer.parseInt(request.getParameter("curPage"));
      }
%>
<meta charset="UTF-8">
<title>공지사항 목록 게시판</title>
<style type="text/css">
	
	/* 03/01 재민: 페이지 디자인 완료 */
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//검색버튼
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#NoticeList").attr({"method":"GET"
								 ,"action":"noticeSelectAllPage.do"}).submit();
		});
		
		// 입력
		$(document).on("click", "#I", function(){
			location.href="noticeForm.do";
		});	
		
		$(document).on("click", "#A", function(){
			location.href="noticeSelectAllPage.do";
		});
		
		$(document).on("click", "#S", function(){
			$("#NoticeList").attr({
				"method":"GET",
				"action":"noticeSelect.do"}).submit();	
		});
			
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#NoticeList").attr({
				"method":"GET",
				"action":"noticeSelectAllPage.do"}).submit();
		});
	});
</script>
</head>
<body>
<div id="wrapper">
<img src="/kosmoJns/resources/img/notice.png"
    		alt="notice_main" class="img-fluid">
<div class="section-header">Notice</div>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listPage");
	List<BoardVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("noticeSelectAllPage.jsp nCnt >>> : " + nCnt);
%>
<form name="NoticeList" id="NoticeList">
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
	<tbody>
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			BoardVO nvo = list.get(i);
%>
	<tr onclick="location.href='/kosmoJns/noticeSelect.do?bno=<%= nvo.getBno() %>'">	
		<td class="tt"  style="font-size: 12px"><%= nvo.getBno() %> </td>
		<td class="left"><span style="font-weight: bold;"><%= nvo.getBtitle() %></span></td>
		<td class="tt"><%= nvo.getMnick() %> </td>
		<td class="tt"><%= nvo.getBviews() %> </td>
		<td class="tt"><%= nvo.getBhits() %> </td>
		<td class="tt" style="font-size: 12px"><%= nvo.getBinsertdate() %> </td>
		<td class="tt" style="font-size: 12px"><%= nvo.getBupdatedate() %> </td>
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
	</tbody>
</table>

	<div class="container-fluid">
		<div class="row">
		  <div class="col-6 col-md-4"></div>
		  <div class="col-6 col-md-4">
		  	<div class="row row-cols-2">
		  		<div class="col-4">
		  			<select class="form-select" id="keyfilter" name="keyfilter">
						<option value="key1">제목</option>
						<option value="key2">내용</option>
						<option value="key3">제목+내용</option>
						<option value="key4">작성자</option>
						<option value="key5">글번호</option>
					</select>
		  		</div>
			    <div class="col-8">
			    	<div class="input-group">
			    		<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어 입력">
				    	<span class="input-group-btn">
				    		<input type="button" class="btn btn-orange" id="searchBtn" value="검색">
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
<br>
	<div class="paging">
		<jsp:include page="../../include/jsp/paging.jsp" flush="true">
		<jsp:param name="url" value="noticeSelectAllPage.do"/>
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