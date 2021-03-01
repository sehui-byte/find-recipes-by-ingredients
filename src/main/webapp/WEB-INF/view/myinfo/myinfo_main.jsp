<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
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

<%--	 >> 셰프 마이페이지 진입시 플라스크 서버에서 자동으로 데이터 연동
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
	
 --%>
 </script>
</head>
<body>

	<h3 align="center">마이페이지</h3>

	<!-- 셰프인 경우에 구독자 증가 추이를 그린 그래프를 삽입 -->	
<% 
	if(mlevel.equals("C")){
%>
	<div align="center">
		<p>현재 내 구독자 수 증가 추이</p>	
		<img src="http://localhost:5000/static/subscribeInc/<%= mno %>_subscribeInc.png">
	</div>
<% 
	}
%>



	<div id="myinfosidenav" class="sidenav" >
	<% 
			if (mlevel.equals("U")){
%>
	
		
			<button type="button"  class="btn btn-primary btn-xs" id="myLevelUpdate" >내 등급 올리기</button>	
		
<% 
			}	
%>
		<a href="#" class="closebtn" onclick='closeNav()'>x</a>
		<a href="myinfo/updateMyPW">비밀번호 수정</a>
		<a href="myinfo/myRecipeListPage?mno=<%= mno %>">내가 쓴 레시피 조회하기</a>
		<a href="myinfo/mySubList?mno=<%= mno %>">내가 구독한 셰프 조회하기</a>			
		<a href="myinfo/myFavRecipeList?mno=<%= mno %>">내 즐겨찾기 레시피</a>
		<a href="myinfo/myQnAList?mno=<%= mno %>">내 Q&A 조회하기</a>
		<a href="/kosmoJns/myinfo/myFavReciepBoardList?mno=<%=mno%>">내 즐겨찾기 레시피 - 유저</a>			
		<a href="index.jsp">인덱스 페이지로</a>
	</div>
	<p align="center">  오픈  버튼을 클릭하면 메뉴가 열립니다.</p>
	<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> open</span>

	<script>
		function openNav() {
			document.getElementById('myinfosidenav').style.width = '250px';
		}
		function closeNav() {
			document.getElementById('myinfosidenav').style.width = '10px';
		}
	</script>
	
	
<!-- 	
		<li>
			아래 데이터들을 시각화해서 그래프로 보여주면 좋을 듯	
		</li>
 -->

</body>
</html>