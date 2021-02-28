<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.d-flex {
	width: 400px;
	margin: 0 auto;
	padding: 40px;
}
</style>
</head>
<body>
	<!--  검색창 -->
	<form class="d-flex" method="get" action="searchRecipe.do">
		<input id="keyword" name="keyword" class="form-control me-2"
			type="search" placeholder="내 냉장고 속 재료 입력!" aria-label="Search"
			onclick="enterKey()">
		<button class="btn btn-outline-success" type="submit">Search</button>
	</form>
	<script>
		//input에서 엔터키 눌렀을 때도 검색 실행
		function enterKey() {
			if (window.event.keyCode == 13) {
				find();
				recentSearch();
				clearInput();
			}
		}
	</script>
</body>
</html>