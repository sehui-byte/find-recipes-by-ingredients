<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	/*
	>> 플라스크 연동시 주석 해제 
	$(document).ready(function(){
		var status = location.search;
		if(status.indexOf("redirect") != -1){
			return;	
		}
		location.href="/kosmoJns/sendSignupInc.do?start_yyyymm=202004&end_yyyymm=202104";
	})
	*/
</script>
<style type="text/css">
	/*google 웹폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');
	
	div, h1, h2, h3, h4, h5, h6, p {
	   font-family: 'Noto Serif KR', serif;
	}

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
	
	.panel-heading{
		padding: 15px 0px 0px 5px;
	}
</style>
</head>
<body>
<div id="wrapper">
	<div class="container-fluid">
	   <div class="row">
	     <!-- 3단길이의 첫번째 열 -->
	      <div class="col-md-3">
	      <!-- side bar  -->
	      <span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> open</span>
			<div id="adminsidenav" class="sidenav" >
				<div class="panel panel-info">
					<div class="panel-heading">
					  <h5 class="panel-title">
					  <span style="font-size: 10px; vertical-align: middle;">▶</span>
					  공지사항 관리</h5>
				    </div>				
					<ul class="list-group">
						<li class="list-group-item"><a href="../noticeSelectAllPage.do">공지 조회</a></li>
						<li class="list-group-item"><a href="../noticeForm.do">공지 등록</a></li>
					</ul>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
					  <h5 class="panel-title"><span style="font-size: 10px; vertical-align: middle;">▶</span>
					  회원 관리</h5>
				    </div>				
					<ul class="list-group">
						<li class="list-group-item"><a href="../memberSelectAll.do">회원 조회</a></li>
						<li class="list-group-item"><a href="../memberForm.do">회원 등록</a></li>
					</ul>				
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
					  <h5 class="panel-title"><span style="font-size: 10px; vertical-align: middle;">▶</span>
					  게시판 관리</h5>
				    </div>				
					<ul class="list-group">
						<li class="list-group-item"><a href="../qnaSelectAllPage.do">QnA</a></li>
						<li class="list-group-item"><a href="../recipelist.do">Basic Cooking</a></li>
						<li class="list-group-item"><a href="../recipeboard_list.do">Cook Board</a></li>
						<li class="list-group-item"><a href="/kosmoJns/chefboard/boardselectallpage.do">Chef Board</a></li>
					</ul>				
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
					  <h5 class="panel-title"><span style="font-size: 10px; vertical-align: middle;">▶</span>
					  댓글 관리</h5>
				    </div>				
					<ul class="list-group">
						<li class="list-group-item"><a href="../reply/reply.do">댓글 조회</a></li>
					</ul>				
				</div>		
			</div>
	      </div>
	      <!-- 9단길이의 첫번째 열 -->
	      <div class="col-md-9">
	      	<div class="jumbotron">
	      		<div class="section-header">Admin Page</div>
	      	<hr>
	      	<!-- admin 페이지 메인 부분에다가 회원 유입 현황 그래프  -->
			<img src="http://localhost:5000/static/signupInc/signupInc.png">
	      	<p>Open 버튼을 클릭하면 메뉴가 열립니다.</p>
	      	</div>
	      </div>
     	</div>
    </div> 
	
	<script>
		function openNav() {
			document.getElementById('adminsidenav').style.width = '250px';
		}
		function closeNav() {
			document.getElementById('adminsidenav').style.width = '10px';
		}
	</script>
</div>	
</body>
</html>