<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#myRankUpdate").click(function(){
			
			var url = "myinfo/myRankUpdate.do?mno=<%= mno %>";
			$.ajax({
				url : url,
				method : "GET",
				success : whenSuccess,
				error : whenError
			})
			
			function whenSuccess(data){
					if(data == 'OK'){
						alert("셰프 등급이 되었습니다. 진심으로 축하드립니다.");	
					}else{
						alert("셰프 등급 조건에 맞지 않습니다. 조건을 확인해주시기 바랍니다.");	
					}
			}

			function whenError(data){
				alert("서버에 문제가 발생했습니다. 관리자에게 문의하시기 바랍니다.");
			
				
			}
			
		})
	})
</script>
</head>
<body>
	<h3>myinfo default page...</h3>
	<ul>
		<li>
			<a href="myinfo/updateMyPW.do">내 비밀번호 수정</a>
		</li>
		<s:authorize access="hasRole('ROLE_U')">		
		<li>
			<button type="button" class="" id="myRankUpdate">내 등급 올리기</button>	
		</li>
		</s:authorize>
		<li>
			아래 데이터들을 시각화해서 그래프로 보여주면 좋을 듯	
		</li>
		<li>
			<a href="myinfo/myRecipeList.do?mno=<%= mno %>">내가 쓴 레시피 조회하기</a>
		</li>
		<li>
			<a href="myinfo/mySubList.do?mno=<%= mno %>">내가 구독한 셰프 조회하기</a>
		</li>
		<li>
			<a href="myinfo/myFavRecipeList.do?mno=<%= mno %>">내가 추천한 레시피 조회하기(즐겨찾기 레시피)</a>
		</li>
		<li>
			<a href="myinfo/myQnAList.do?mno=<%= mno %>">내 Q&A 조회하기</a>
		</li>
		<li>
			내 댓글??	
		</li>
		<li>
			<a href="index.jsp">인덱스 페이지로</a>
		</li>
	</ul>
</body>
</html>