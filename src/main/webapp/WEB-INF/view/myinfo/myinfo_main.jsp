<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<%-- cache 적용 x --%>
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>

<%
	// pricipal 객체는 로그인 후의 권한을 획득
	// 등급 변환을 바로 반영하려면 셰프 권한 획득시 바로 DB에서 꺼내와야 한다
	Object obj = request.getAttribute("myLevel");
	String nowMlevel = (String)obj;
	mlevel = nowMlevel;
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#myLevelUpdate").click(function(){
			
			var url = "myinfo/myLevelUpdate?mno=<%= mno %>";
			$.ajax({
				url : url,
				method : "GET",
				success : whenSuccess,
				error : whenError
			})
			
			function whenSuccess(data){
					if(data == 'OK'){
						alert("셰프 등급이 되었습니다. 진심으로 축하드립니다.");	
						location.reload();	
					}else{
						alert("셰프 등급 조건에 맞지 않습니다. 조건을 확인해주시기 바랍니다.(조건 - 게시글 50, 추천수 100)");	
					}
			}

			function whenError(data){
				alert("서버에 문제가 발생했습니다. 관리자에게 문의하시기 바랍니다.");
			}
		})
	})
		
		// 플라스크로 리다이렉트 할 때 분기	
		$(document).ready(function(){
			var mlevel = "<%= mlevel %>";
			var status = location.search;
			if(status.indexOf("redirect") != -1){
				return;	
			}
			if (mlevel == 'C'){
				location.href="sendSubscribeInc?start_yyyymm=202004&end_yyyymm=202104&mno=<%=mno%>";
			}
		})
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
	<div class="section-header">My Page</div>

	<!-- 셰프인 경우에 구독자 증가 추이를 그린 그래프를 삽입 // 아니면 셰프로 등급 올리기 -->
<% 
	if(mlevel.equals("C")){
%>
	<div align="left">
		
		<p>반갑습니다. <%= mnick %> 님,<br>
		   새로운 요리에 도전해 보세요!</p>
		<hr>  
		<div class="section-header">월별 구독자 증가수</div>
		<img src="http://54.180.83.249:5000/static/subscribeInc/<%= mno %>_subscribeInc.png">
	</div>
<% 
	}else{
%>
	<button type="button"  class="btn btn-primary btn-xs" id="myLevelUpdate" >내 등급 올리기</button>	
<% 
	}	
%>


</div>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>	
</body>
</html>