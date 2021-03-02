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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
<script>
	// 플라스크 이미지 요청 
	$(document).ready(function(){
		var status = location.search;
		if(status.indexOf("redirect") != -1){
			return;	
		}
		location.href="/kosmoJns/sendSignupInc.do?start_yyyymm=202004&end_yyyymm=202104";
	})
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
<script type="text/javascript">
	
	// 페이지 호출 함수
	function btnclick(_url){
        $.ajax({
            url : _url,
            type : 'get',
            success: function(data) {
                $('#include_page').html(data);
            },
                error: function() {
                $('#include_page').text('페이지 오류입니다.');
            }
        });
    }
</script>
</head>
<body>
<div id="wrapper">
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
	      		<div class="section-header">Admin Page</div>
	      		<hr>
	      		<div id="include_page">
	      			<!-- 여기에 페이지 불러오기 -->
	      			<p>반갑습니다. 관리자 님<br>
	      		       Open 버튼을 클릭하여 원하는 메뉴를 선택하세요.
	      		    </p>
	      		</div>	      	
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