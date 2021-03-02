<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<%  
      Object obj2 = request.getAttribute("p_rvo");
      ReplyVO rvoP =(ReplyVO) obj2; //cbvo ==> pageVO
      
      int Size = rvoP.getPageSize();
      int pageSize = rvoP.getPageSize();
      int groupSize = rvoP.getGroupSize();
      int curPage = rvoP.getCurPage();
      int totalCount = rvoP.getTotalCount();
      
      
      if(request.getParameter("curPage") != null){
         curPage = Integer.parseInt(request.getParameter("curPage"));
      }
%>
<meta charset="UTF-8">
<title>댓글 전체 조회</title>
<style type="text/css">

	/* 사이드바 스타일 */
	.sidenav {
		height:100%;
		width: 0;
		position: fixed;
		z-index:1;
		top: 0;
		left: 0;
		background-color: #FDE3D7;
		overflow-x: hidden;
		transition:0.5s ease-in-out;
		padding-top: 60px;
	}
	.sidenav a {		
		/*padding: 8px 8px 8px 32px;*/
		text-decoration: none;
		font-size: 16px;
		color: black;
		display: block;
		transition: 0.2s ease-in-out;
	}
	.sidenav a:hover, .offcanvas a:focus {
		color: #F9A781;
	}
	.closebtn {
		position: absolute;
		top: 0;
		right: 25px;
		font-size: 20px !important;
		margin-left: 50px;
	}
	.openmenu:hover {
		color:rgb(0,154,200);
		transition:0.5s ease-in-out;
	}
	.openmenu {
		font-size: 25px;
		cursor:pointer;
		transition:0.5s ease-in-out;
	}
	.openmenu > i {
		font-size: 20px;
	}
	/* 미디어쿼리 적용 */
	@media screen and (max-height:450px) {
		.sidenav {
			padding-top:15px;
		}
		.sidenav a {
			font-size: 18px;
		}
	}

	.tt{
		text-align: center;
	}
	
	.scrolldiv {   
        height:80px;
        overflow:scroll;
    }
    
    .btn-orange { 
		background-color: #F9A781; 
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
	
	.table.table-hover tbody tr:hover {
    	background-color: #F9A781; 
	}
	
</style>
<link rel="stylesheet" href="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/kosmoJns/resources/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<script>
	function openNav() {
		document.getElementById('adminsidenav').style.width = '250px';
	}
	function closeNav() {
		document.getElementById('adminsidenav').style.width = '10px';
	}
</script>
<script type="text/javascript">
	
	$(document).ready(function(){
				
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
			$("#replyList").attr({"method":"GET"
								 ,"action":"/kosmoJns/reply/replyListAll.do"}).submit();
		});
		
		/* 글 삭제를 위한 Ajax 연동 처리 */
		$(document).on("click", "#D", function(){
			var rno = $("input:checkbox[name='rno']:checked").val();
			console.log("rno >>> : " + rno);
			
			if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
				
				var deleteUrl = "/kosmoJns/reply/replyDelete.do";
				var method = "POST";
				var dataParam = {
						"rno": rno
				};
				
				$.ajax({
					url: deleteUrl,
					type: method,
					data: dataParam,
					success: whenSuccess,
					error: whenError
				});
				
				function whenSuccess(resData){
					console.log("resData >>> : " + resData);
					alert("댓글이 삭제되었습니다.");
					if ("GOOD" == resData){
						location.reload();
					}	
				}
				
				function whenError(e){
					alert("댓글을 삭제할 수 없습니다." + e.responseText);
				}
			}
		});
		
	});
	
	//체크박스
	function checkOnly(chk){
		console.log("checkOnly 함수 진입 >>> : " + chk);
		console.log("chk.value >>> : " + chk.value);
		var obj = document.getElementsByName("rno");
		for(var i=0; i<obj.length; i++){
			if(obj[i] != chk){
				obj[i].checked = false;
			}
		}
	}
</script>
</head>
<body>
<div id ="wrapper">

	<div class="container-fluid">
	   <div class="row">
	     <!-- 1단길이의 첫번째 열 -->
	      <div class="col-md-1">
	      <!-- side bar  -->
	      <span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> open</span>
			<div id="adminsidenav" class="sidenav" >
				<ul class="nav flex-column">
				  <li class="nav-item">
		            <a href="#" class="closebtn" onclick='closeNav()'><i class="bi bi-x-square"></i></a>
		          </li>	
		          <li class="nav-item">
		            <a class="nav-link" href="/kosmoJns/admin/main">
		              <i class="bi bi-house-door-fill"></i>
		              Main
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="javascript:void(0);" onclick="btnclick('/kosmoJns/noticeForm.do')">
		              <i class="bi bi-pencil-square"></i>
		              공지 등록
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="javascript:void(0);" onclick="btnclick('/kosmoJns/aboutNewMember.do')">
		              <i class="bi bi-file-bar-graph"></i>
		              가입자 현황
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="../memberSelectAll.do">
		              <i class="bi bi-collection"></i>
		              회원 관리
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="/kosmoJns/reply/replyListAll.do">
		              <i class="bi bi-chat-left-text"></i>
		              댓글 관리
		            </a>
		          </li>
		        </ul>		
			</div>
	      </div>
	      <!-- 11단길이의 첫번째 열 -->
	      <div class="col-md-11">
	      	<div class="jumbotron">
	      		<div class="section-header">Reply List</div>
	      		<hr>
	      		<form name="replyList" id="replyList">
					<!-- =================  검색창 그리드 설정 ================= -->
					<div class="container-fluid">
						<div class="row">
						  <div class="col-6 col-md-4"></div>
						  <div class="col-6 col-md-4">
						  	<div class="row row-cols-2">
						  		<div class="col-4">
						  			<select class="form-select" id="keyfilter" name="keyfilter">
										<option value="key1">작성자</option>
										<option value="key2">글내용</option>
										<option value="key3">글번호</option>
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
				<%
					Object obj = request.getAttribute("listR");
					List<ReplyVO> list = (List)obj;
					
					int nCnt = list.size();
					System.out.println("replyListAll.jsp nCnt >>> : " + nCnt);
				%>
					<div align="right">
						<input class="btn btn-orange" type="button" value="삭제" id="D">
					</div>
				<table class="table table-hover">
					<thead>
					<tr>
						<td class="tt" style="font-weight: bold"></td>
						<td class="tt" style="font-weight: bold">댓글번호</td>
						<td class="tt" style="font-weight: bold">등록 분류1</td>
						<td class="tt" style="font-weight: bold">등록 분류2</td>
						<td class="tt" style="width:40%; font-weight: bold">내용</td>
						<td class="tt" style="font-weight: bold">작성자</td>
						<td class="tt" style="font-weight: bold">작성일</td>
						<td class="tt" style="font-weight: bold">수정일</td>
					</tr>
					</thead>
					<tbody>
				<%
					if (nCnt > 0) {
						for(int i=0; i<nCnt; i++){
							ReplyVO rvo = list.get(i);
				%>
					<tr>
						<td><input type="checkbox" class="form-check-input" name="rno" id="rno" value="<%= rvo.getRno() %>" onclick="checkOnly(this)"></td>
						<td class="tt" style="font-size: 12px"><%= rvo.getRno() %></td>	
							<%
							if( rvo.getBno() != null){
							%>
								<td class="tt" style="font-size: 12px"><%= rvo.getBno() %> </td>		
							<%	
							}else{
							%>
								<td class="tt" style="font-size: 12px">- </td>		
							<%
							}
							%>
							<%
							if( rvo.getRbno() != null){
							%>
								<td class="tt" style="font-size: 12px"><%= rvo.getRbno() %> </td>		
							<%	
							}else{
							%>
								<td class="tt" style="font-size: 12px">- </td>		
							<%
							}
							%>
						<td class="left"><div class="scrolldiv"><%= rvo.getRcontent() %></div></td>
						<td class="tt"><%= rvo.getRwriter() %> </td>
						<td class="tt" style="font-size: 12px"><%= rvo.getRinsertdate() %> </td>
						<td class="tt" style="font-size: 12px"><%= rvo.getRupdatedate() %> </td>
					</tr>
				<%
						} // end of for
					}else{
				%>
					<tr>
						<td colspan="10" align="center">등록된 댓글이 존재하지 않습니다.</td>
					</tr>	
				<%		
						
					} // end of if
				%>
					</tbody>
				</table>
					<div class="paging">
						<jsp:include page="../../include/jsp/paging.jsp" flush="true">
						<jsp:param name="url" value="replyListAll.do"/>
						<jsp:param name="str" value=""/>
						<jsp:param name="pageSize" value="<%=pageSize%>"/>
						<jsp:param name="groupSize" value="<%=groupSize%>"/>
						<jsp:param name="curPage" value="<%=curPage%>"/>
						<jsp:param name="totalCount" value="<%=totalCount%>"/>
					</jsp:include>
					</div>	
				</form>	      	
	      	</div>
	      </div>
     	</div>
	</div> 
</div>
</body>
</html>