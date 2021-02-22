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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<h3>관심상품 목록</h3>
	<button type="button" id="deleteAllBtn" class="btn btn-primary"
		onclick="checkAll()">전체선택</button>
	<button type="button" id="deleteBtn" class="btn btn-primary">삭제</button>

	<h4>
		총 관심상품 :
		<c:out value="${size}" />
		개
	</h4>
	<c:if test="${size eq 0}">
			관심상품이 없습니다!
			</c:if>
	
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
					<td><c:out value="${list.image}" /></td>
					<td><c:out value="${list.lprice}" /></td>
					<td><c:out value="${list.hprice}" /></td>
					<td><c:out value="${list.link}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
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
				var title = td.eq(2).text();
				var image = td.eq(3).text();
				var lprice = td.eq(4).text();
				var hprice = td.eq(5).text();
				var link = td.eq(6).text();

				//쿠키 삭제
				removeCookie(productId);
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
						alert("전송성공");
					},
					error : function() {
						console.log("error!");
					}
				});//ajax
			});//for

			alert("관심상품이 삭제되었습니다!");
			window.location.reload();

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

		//쿠키 값 가져오기
		function getCookie(cookie_name) {
			var val = document.cookie.split(';');
			var x, y;

			for (var i = 0; i < val.length; i++) {
				x = val[i].substr(0, val[i].indexOf('='));
				y = val[i].substr(val[i].indexOf('=') + 1);
				x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
				if (x == cookie_name) {
					return unescape(y); // unescape로 디코딩 후 값 리턴
				}
			}
		}

		//쿠키 새로 생성
		function setCookie(cookie_name, value, days) {
			var exdate = new Date();//만료날짜
			exdate.setDate(exdate.getDate() + days);

			var cookie_value = escape(value)
					+ ((days == null) ? '' : '; expires='
							+ exdate.toUTCString());
			document.cookie = cookie_name + '=' + cookie_value;
		}

		//기존 쿠키에 value 제거하기
		function removeCookie(productId) {
			var items = getCookie('like'); // 이미 저장된 값을 쿠키에서 가져오기
			var maxItemNum = 30; // 최대 저장 가능한 아이템개수
			var expire = 1; // 쿠키값을 저장할 기간

			if (items) {//쿠키가 이미 존재하면
				var itemArray = items.split(',');
				for ( var i in itemArray) {
					if (productId == itemArray[i]) {
						console.log("찾았다");
						itemArray.splice(i, 1);//특정 인덱스 원소 삭제
					}
				}

				if (itemArray.length > 0) {
					items = itemArray.join(',');

					setCookie('like', items, expire);
					console.log("관심상품 해제 결과 쿠키 >> " + items);
				}

				else {
					console.log("쿠키 아예 다 삭제");
					setCookie('like', items, 0);//쿠키 삭제
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