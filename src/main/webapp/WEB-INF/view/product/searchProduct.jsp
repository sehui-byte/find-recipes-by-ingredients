<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색</title>
<!-- font awesome -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
</style>
</head>
<body>

	<h3>상품 검색</h3>
	<br>

	<!-- 검색 -->
	<form>
		<input class="form-control" list="datalistOptions" name="keyword"
			onkeydown="return captureReturnKey(event)" onKeyUp="find()"
			id="keyword" placeholder="Type to search..." " style="width: 300px">
		<button type="button" class="btn btn-outline-primary" onclick="find()">검색</button>
	</form>


	<!-- 검색결과 -->
	<div id="result"></div>
	<script>
		//enter키 눌렀을 때 페이지 재로딩 되는 것 방지
		function captureReturnKey(e) {
			if (e.keyCode == 13 && e.srcElement.type != 'textarea')
				return false;
		}
		//ajax코드 넣기
		function find() {
			var keyword = $('#keyword').val();
			$.ajax({
			type : "GET",
			url : "search.do",
			data : {
				keyword : keyword
			},
			dataType : "json",
			contentType : "application/json; charset:UTF-8",
			error : function(error) {
				console.log("error");
			},
			success : function(data) {
				$("#result").empty();
				console.log("success");
				console.log(data);

				var html = "";
				var item = data.items;
				//'식품'카테고리 결과만 반영해야 되니까 이 변수를 쓰면 안될듯
				//var total = data.total; //검색결과 문서 총 개수

				var count = 0;//식품 검색결과 총개수

				html += '<div class="card-deck">';
				for ( var i in item) {
					var category1 = item[i].category1; //식품만 검색되게.
					if (category1 === '식품') {
						var title = item[i].title;//상품명
						var image = item[i].image;//상품이미지
						var link = item[i].link;//상품구매링크
						var lprice = item[i].lprice;//최저가
						var hprice = item[i].hprice;//최고가
						var productId = item[i].productId; //화면에 안보이게 하기?
						var productType = item[i].productType;
						var maker = item[i].maker;//제조사
						var brand = item[i].brand;//브랜드명
						var mallName = item[i].mallName;//쇼핑몰상호

						html += '<div class="col-sm-6">';
						html += '<div class="card" style="width: 18rem;">';
						html += '<img src="' + image + '" alt="..." class="card-img-top"">';
						html += '<div class="card-body">';
						html += '<h5 class="card-title">' + title
								+ '</h5>'
						html += '<ul class="list-group list-group-flush">';
						html += '<li class="list-group-item"> 최저가 : '
								+ lprice + '원</li>';
						html += '<li class="list-group-item"> 제조사 : '
								+ maker + '</li>';
						html += '<li class="list-group-item"> 브랜드 : '
								+ brand + '</li>';
						html += '</ul>';
						html += '<a href="' + link +'" class="btn btn-primary">구매하기</a>';
						//관심 상품 버튼 추가
						html += '<input type="button" value="&#xf004" id="heartBtn" onclick="saveProductId()" style="font-family:FontAwesome; border: none; background: transparent;"/>';
						html += '</div></div></div>';

						//비워주기
						$('#keyword').empty();
						title = "";
						image = "";
						link = "";

						//검색결과값 증가
						count++;
						
					}

					else {//식품이 아닐 경우
						continue;
					}
				}

				if (count === 0) {
					//검색결과가 없을 때
					html = "<h3>검색결과가 없습니다</h3>";
				} else {
					html += '</div>';
				}

				//html코드 넣어주기
				$("#result").append(html);
				
			}
		});
		}

		//동적 태그에 이벤트 주기
		function saveProductId(){
			alert("관심 상품을 저장했습니다!");
			//쿠키 생성해서 저장하기
		
		}
	</script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>