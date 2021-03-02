<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<%-- cache 적용 x --%>
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/* 	$(document).ready(function(){
		var status = location.search;
		if(status.indexOf("redirect") != -1){
			return;	
		}
		location.href="/kosmoJns/sendSignupInc.do?start_yyyymm=202004&end_yyyymm=202104";
	})
 */</script>
<style type="text/css">
/*google 웹폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');

div, h1, h2, h3, h4, h5, h6, p {
   font-family: 'Noto Serif KR', serif;
}

body {
	background: #F9A781;
}
/* 사이드바 스타일 */
	.sidenav {
			height:100%;
			width: 0;
			position: fixed;
			z-index:1;
			top: 0;
			left: 0;
			background-color: rgb(0,154,200);
			overflow-x: hidden;
			transition:0.5s ease-in-out;
			padding-top: 60px;
		}
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: #fff;
			display: block;
			transition: 0.2s ease-in-out;
		}
		.sidenav a:hover, .offcanvas a:focus {
			color: #000;
		}
		.closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px !important;
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
			font-size: 30px;
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
</style>


</style>
</head>
<body>
<h3>admin 페이지</h3>

<!-- admin 페이지 메인 부분에다가 회원 유입 현황 그래프  -->
<img src="http://54.180.83.249:5000/static/signupInc/signupInc.png">

	<div id="adminsidenav" class="sidenav" >
	
	<a href="../noticeSelectAllPage.do">공지사항 </a>
	<a href="../memberSelectAll.do">회원 조회/수정/삭제</a>
	<a href="../qnaSelectAllPage.do">QnA 게시판 조회/수정/삭제  </a>
	<a href="../recipeboard_list.do">레시피 게시판 조회/수정/삭제 </a>
	<a href="../reply/reply.do">댓글 조회/수정/삭제</a>
<!-- 
		<li>
			실적	
		</li>
		<li>
			부서 관리
		</li>
		<li>
			근태
		</li>
		<li>
			사내 일정 등등.
		</li>
							 -->				
	</div>
	
	<p align="center">  오픈  버튼을 클릭하면 메뉴가 열립니다.</p>
	<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> open</span>

	<script>
		function openNav() {
			document.getElementById('adminsidenav').style.width = '250px';
		}
		function closeNav() {
			document.getElementById('adminsidenav').style.width = '10px';
		}
	</script>
	
</body>
</html>