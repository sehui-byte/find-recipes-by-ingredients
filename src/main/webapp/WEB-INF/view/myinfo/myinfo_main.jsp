<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>myinfo default page...</h3>
	<ul>
		<li>
			비밀번호 수정	
		</li>
		<li>
			<a href="myinfo/myRankUpdate.do?mno=<%= mno %>">내 등급 올리기</a>
		</li>
		<li>
			아래 데이터들을 시각화해서 그래프로 보여주면 좋을 듯	
		</li>
		<li>
			<a href="myinfo/myRecipeList.do?mno=<%= mno %>">내가 쓴 레시피 조회하기</a>
		</li>
		<li>
			내가 구독한 세프 조회하기
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