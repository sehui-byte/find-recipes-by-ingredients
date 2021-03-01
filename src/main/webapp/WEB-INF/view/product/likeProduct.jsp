<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
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
	width: 40px;
	height: 2px;
	background: #ff7f00;
	transform: translate(-50%, 0);
	transform: translate3d(-50%, 0, 0);
}
</style>
</head>
<body>
	<!-- navbar -->
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>

	<div id="wrapper">
		<img src="/kosmoJns/resources/img/My Favorites2.png"
			alt="cook_board_main" class="img-fluid" width="1080px" height="auto">
		<div class="section-header">나의 관심상품</div>
		
		<h5>
			총 관심상품 :
			<c:out value="${size}" />
			개
		</h5>

		<!-- 관심상품 삭제 버튼 -->
		<button type="button" id="deleteAllBtn" class="btn btn-warning"
			onclick="checkAll()">전체선택</button>
		<button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
		<h3><br>
		<c:if test="${size eq 0}">
			관심상품이 없습니다!
			</c:if>
			</h3>
		<!-- size가 0이 아닐때는 아래 table 출력 -->
		<c:if test="${size ne 0}">
			<!--likeproduct db값 받기  -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">체크</th>
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
							<th><input type="checkbox" name="productChk" /></th>
							<td><c:out value="${list.productId}" /></td>
							<td><c:out value="${list.title}" /></td>
							<td><img src=" <c:out value="${list.image}" />" height="50" /></td>
							<td><c:out value="${list.lprice}" />원</td>
							<td><c:out value="${list.hprice}" />원</td>
							<td><a href='<c:out value="${list.link}" />'>구매</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>

	<script>
		$("#deleteBtn").click(function() {
			var rowData = new Array();
			//체크된 체크박스 값을 가져오기
			var checkbox = $("input[name=productChk]:checked");
			checkbox.each(function(i) {
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();

				//체크된 row의 모든 값을 배열에 담는다
				rowData.push(tr.text());
				var productId = td.eq(1).text();
				console.log("productID >> " + productId);
				var title = td.eq(2).text();
				var image = td.eq(3).text();
				var lprice = td.eq(4).text();
				var hprice = td.eq(5).text();
				var link = td.eq(6).text();


				var param = {
					"productId" : productId,
					"title" : title,
					"image" : image,
					"link" : link,
					"lprice" : lprice,
					"hprice" : hprice
				};

				$.ajax({
					url : 'likeProductDelete.do',
					type : 'post',
					contentType : "application/json", //전달한 string데이터는 json형태로 이루어진 데이터임을 알려준다
					data : JSON.stringify(param),//string으로 전달
					success : function(data) {
						console.log("success");
					},
					error : function() {
						console.log("error!");
					}
				});//ajax
			});//for

			alert("관심상품이 삭제되었습니다!");
			window.location.reload();//화면새로고침

		});

		//체크박스 전체 선택
		function checkAll() {
			var check = false;
			var chk = document.getElementsByName("productChk");
			if (check == false) {
				check = true;
				for (var i = 0; i < chk.length; i++) {
					chk[i].checked = true; //모두 체크 
				}
			} else {
				check = false;
				for (var i = 0; i < chk.length; i++) {
					chk[i].checked = false; //모두 해제 
				}
			}
		}


	</script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>