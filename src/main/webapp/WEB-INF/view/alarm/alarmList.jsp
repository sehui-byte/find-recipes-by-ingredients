<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 전체조회</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
			
						<tr class="alarmRow" id=<c:out value="${alarmList.ano}" /> 
						style="background-color:
						<c:if test='${alarmList.readyn eq "Y"}'>#DEDDDD;</c:if>
						<c:if test='${alarmList.readyn eq "N"}'>white;</c:if>
						">
							<fmt:parseDate value="${alarmList.insertdate}" var="insertdate"
								pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${insertdate}" var="insertdate2"
								type="DATE" pattern="yyyy-MM-dd" />
							<td><c:out value="${insertdate2}" /></td>

							<td><c:if test="${alarmList.type eq 'reply'}">
									<c:out value="${alarmList.sender}" />님이 회원님의 게시물에
								댓글을 달았습니다.
						</c:if> <c:if test="${alarmList.type eq 'subscribe'}">
									<c:out value="${alarmList.sender}" />님이 회원님의 글을 구독하기 시작했습니다.
						</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

	</div>
	<script>
	$(document).ready(function(){
		$(".alarmRow").click(function() {
			//클릭한 행 배경색 변경
			$(this).css("background-color", "#DEDDDD");
			var currentRow = $(this).closest('tr');
			//클릭한 행 id값 가져오기(ano)
			var ano = currentRow.attr('id');
			console.log("ano >> " + ano);
			var param = {"ano" : ano};
			
			$.ajax({
				url : 'updateReadYN.do',
				type : 'post',
				contentType : "application/json", //전달한 string데이터는 json형태로 이루어진 데이터임을 알려준다
				data : JSON.stringify(param),//string으로 전달
				success : function(data) {
					console.log("읽음처리 success");
				},
				error : function() {
					console.log("error!");
				}
			});
			window.location.reload();//화면새로고침
		});
	});
		
	</script>
</body>
</html>