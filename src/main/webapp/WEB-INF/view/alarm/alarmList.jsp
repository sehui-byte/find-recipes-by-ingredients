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
		${size}
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
						<td><c:out value="${alarmList.insertdate}" /></td>
						<td><c:out value="${alarmList.receiver}" />님이 <c:out
								value="${alarmList.type}" />을 하셨습니다.</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


	</div>
	<script>
console.log("${size}");
</script>
</body>
</html>