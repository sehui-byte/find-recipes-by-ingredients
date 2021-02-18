<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품 페이지</title>
<!--  bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<h3>관심상품 목록</h3>
	<!--likeproduct db값 받기  -->
	
	<table class="table">
		<thead>
			<tr>
				<th scope="col">상품번호</th>
				<th scope="col">상품명</th>
				<th scope="col">이미지</th>
				<th scope="col">최저가</th>
				<th scope="col">최고가</th>
				<th scope="col">구매링크</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
			<tr>
				<th scope="row"><c:out value="${list.productId}"/></th>
				<td><c:out value="${list.title}"/></td>
				<td><c:out value="${list.image}"/></td>
				<td><c:out value="${list.lprice}"/></td>
				<td><c:out value="${list.hprice}"/></td>
				<td><c:out value="${list.link}"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>