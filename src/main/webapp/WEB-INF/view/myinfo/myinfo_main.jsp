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
</style>
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
	<h3>myinfo default page...</h3>
	<!-- 셰프인 경우에 구독자 증가 추이를 그린 그래프를 삽입 -->	
<% 
	if(mlevel.equals("C")){
%>
	<div>
		<p>현재 내 구독자 수 증가 추이</p>	
		<img src="http://localhost:5000/static/subscribeInc/<%= mno %>_subscribeInc.png">
	</div>
<% 
	}
%>
	
	<ul>
		<li>
			<a href="myinfo/updateMyPW">내 비밀번호 수정</a>
		</li>
<% 
			if (mlevel.equals("U")){
%>
		<li>
			<button type="button" class="" id="myLevelUpdate">내 등급 올리기</button>	
		</li>
<% 
			}	
%>
		<li>
			아래 데이터들을 시각화해서 그래프로 보여주면 좋을 듯	
		</li>
		<li>
			<a href="myinfo/myRecipeListPage?mno=<%= mno %>">내가 쓴 레시피 조회하기</a>
		</li>
		<li>
			<a href="myinfo/mySubList?mno=<%= mno %>">내가 구독한 셰프 조회하기</a>
		</li>
		<li>
			<a href="myinfo/myFavRecipeList?mno=<%= mno %>">내 즐겨찾기 레시피</a>
		</li>
		<li>
			<a href="myinfo/myQnAList?mno=<%= mno %>">내 Q&A 조회하기</a>
		</li>
		<li>
			<a href="/kosmoJns/myinfo/myFavReciepBoardList?mno=<%=mno%>">내 즐겨찾기 레시피 - 유저</a>
		</li>
		<li>
			<a href="index.jsp">인덱스 페이지로</a>
		</li>
	</ul>
</body>
</html>