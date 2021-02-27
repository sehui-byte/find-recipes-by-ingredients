<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 전체조회</title>
</head>
<body>
	<!-- navbar -->
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
	<br>
	<div id="wrapper">
		<h3>알림 전체 조회</h3>
		<c:if test="${size eq 0}">
			알림이 없습니다.
			</c:if>

		<c:if test="${size ne 0}">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">날짜</th>
						<th scope="col">내용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="alarmList">
						<tr>
						<fmt:parseDate value="${alarmList.insertdate}" var="insertdate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${insertdate}" var="insertdate2" type="DATE" pattern="yyyy-MM-dd"/>
							<td><c:out value="${insertdate2}" /></td>

							<td><c:if test="${alarmList.type eq 'reply'}">
									<c:out value="${alarmList.receiver}" />님이 회원님의 게시물에
								댓글을 달았습니다.
						</c:if> <c:if test="${alarmList.type eq 'subscribe'}">
									<c:out value="${alarmList.receiver}" />님이 회원님의 글을 구독하기 시작했습니다.
						</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

	</div>
	<script>
		console.log("${size}");
	</script>
</body>
</html>