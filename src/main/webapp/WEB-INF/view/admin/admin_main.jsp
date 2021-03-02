<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<%@ include file="/WEB-INF/include/jsp/adminSide.jsp" %>
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
	     <!-- 1단길이의 첫번째 열 -->
	      <div class="col-md-1">

	      </div>
	      <!-- 11단길이의 첫번째 열 -->
	      <div class="col-md-11">
	      	<div class="jumbotron">
	      		<div class="section-header">Admin Page</div>
	      		<hr>
      			<p>반갑습니다. 관리자 님</p>      	
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