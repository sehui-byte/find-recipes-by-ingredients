<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<%
	Object obj = request.getAttribute("myQnAList");
	List<BoardVO> list = (List)obj;	

	Object obj2 = request.getAttribute("p_bvo");
	BoardVO bvoP = (BoardVO)obj2;

      int Size = bvoP.getPageSize();
      int pageSize = bvoP.getPageSize();
      int groupSize = bvoP.getGroupSize();
      int curPage = bvoP.getCurPage();
      int totalCount = bvoP.getTotalCount();
	
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
	
	.scrolldiv {   
        height:80px;
        overflow:scroll;
    }
</style>
<link rel="stylesheet" href="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#checkAll").click(function(){
			var checkAll = $("#checkAll");	
			if (checkAll.prop("checked")){
				$(".checkbox").prop("checked",true);
			}else{
				$(".checkbox").prop("checked",false);
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
			
			var url = "/kosmoJns/myinfo/myQnADelete";
			var data = {'chkVal' : chkVal};

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
		
			//검색버튼
			$(document).on("click", "#searchBtn", function(){
				console.log("searchBtn >>> : ");
				$("#myQnAList").attr({"method":"GET"
									 ,"action":"/kosmoJns/myinfo/myQnAList"}).submit();
			});
			// 검색 초기화	
			$(document).on("click", "#searchReset", function(){
				$("#myQnAList").attr({"method":"GET"
									 ,"action":"/kosmoJns/myinfo/myQnAList"}).submit();
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
					$("#myQnAList").attr({"method":"GET"
									 ,"action":"/kosmoJns/myinfo/myQnAList"}).submit();
					}	
				}
			}
</script>
<script>
	function openNav() {
		document.getElementById('myinfosidenav').style.width = '250px';
	}
	function closeNav() {
		document.getElementById('myinfosidenav').style.width = '10px';
	}
</script>
</head>
<body>
<!-- myinfo 사이드바 호출 -->
<div class="sidebar">
	<jsp:include page="../../include/jsp/myinfoSide.jsp" flush="true">
		<jsp:param name="mno" value="<%=mno%>"/>
	</jsp:include>
</div>
<div id="wrapper">
<div class="jumbotron">
<div class="section-header">내 문의 내역</div>
<form id="myQnAList" name="myQnAList" >
	<!-- 검색창 그리드 시작 -->
	<div class="container-fluid">
		<div class="row">
		  <div class="col-2">
		  	<select class="form-select" id="keyfilter" name="keyfilter">
				<option value="key1">제목</option>
				<option value="key2">내용</option>
				<option value="key3">제목+내용</option>
			</select>
  		  </div>
	      <div class="col-6">
	    	<div class="input-group">
	    		<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어 입력" onkeydown="enterKey()">
		    	<span class="input-group-btn">
		    		<button class="btn btn-orange" type="button" id="searchBtn">검색</button>
		    	</span>&nbsp;&nbsp;					    	
		    		<button class="btn btn-orange" type="button" id="searchReset">검색 초기화</button>	    			    	
	    	</div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-2">
		  	<input type="text" class="form-control" id="startdate" name="startdate" size="12" placeholder="시작일">
		  </div>
		  <div class="col-1">
		  	<p>~</p>
		  </div>
		  <div class="col-2">
		  	<input type="text" class="form-control" id="enddate" name="enddate" size="12" placeholder="종료일">
		  </div>	  
		</div>	
	</div>
	<!-- 검색창 그리드 종료 -->

	<table class="table table-hover">
		<thead>
		<tr>
			<td>
				<input type="checkbox" id="checkAll">	
			</td>	
			<td class="tt" style="width:50%; font-weight: bold">Q&A 내용 </td>	
			<td class="tt" style="font-weight: bold">질의날짜</td>	
			<td class="tt" style="font-weight: bold">답변 개수</td>	
		</tr>	
		</thead>
<% 
	if (list != null){
		int nCnt = list.size();
			for (int i = 0; i < nCnt; i++){
				BoardVO bvo = null;
				bvo = list.get(i);
%>
		<tr>
			<td>
				<input type="checkbox" name="bno" value="<%= bvo.getBno()%>" class="checkbox">	
			</td>	
			<td>
				<div class="scrolldiv"><a href="qnaSelect?mno=<%= bvo.getMno() %>"><%= bvo.getBcontent() %></a></div>
			</td>	
			<td class="tt" style="font-size: 12px"><%= bvo.getBinsertdate() %></td>	
			<td class="tt" style="font-size: 12px"><%= bvo.getBhits() %></td>	
		</tr>
<%
		} // end of for
%>
<%
	}else{
 %>		
		<tr>
			<td colspan="4">현재 조회된 문의글이 존재하지 않습니다.</td>	
		</tr>
<% 
	}	
%>
	</table>
	<input type="button" class="btn btn-orange" name="deleteQnA" id="deleteQnA" value="게시글 삭제">
	<br>
	<input type="hidden" id="mno" name="mno" value="<%= mno %>">
	<div class="paging">
		<jsp:include page="./page/paging.jsp" flush="true">
			<jsp:param name="url" value="myQnAList"/>
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
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>