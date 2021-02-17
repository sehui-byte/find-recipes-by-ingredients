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
						//상품코드는 테스트용으로 적어둔 것 (추후 삭제)
						html += '<li class="list-group-item"> 상품코드 : ' + productId + '</li>';
						html += '<li class="list-group-item"> 최저가 : '
								+ lprice + '원</li>';
						html += '<li class="list-group-item"> 제조사 : '
								+ maker + '</li>';
						html += '<li class="list-group-item"> 브랜드 : '
								+ brand + '</li>';
						html += '</ul>';
						html += '<a href="' + link +'" class="btn btn-primary">구매하기</a>';
						//관심 상품 버튼 추가
						html += '<input type="button" value="&#xf004" id="heartBtn" onclick="saveProductId('+productId+')" style="font-family:FontAwesome; border: none; background: transparent;"/>';
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
		
		//쿠키 새로 생성
		function setCookie(cookie_name, value, days){
			var exdate = new Date();//만료날짜
			exdate.setDate(exdate.getDate() + days);
			
			 var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
			 document.cookie = cookie_name + '=' + cookie_value;
		}
		
		//쿠키 값 가져오기
		function getCookie(cookie_name){
			var val = document.cookie.split(';');
			var x,y;
			
			for(var i = 0; i<val.length; i++){
				x = val[i].substr(0, val[i].indexOf('='));
				y = val[i].substr(val[i].indexOf('=') + 1);
				x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
				if (x == cookie_name) {
					return unescape(y); // unescape로 디코딩 후 값 리턴
				}
			}
		}
		
		//기존 쿠키에 value 더하기
		function addCookie(productId) {
			  var items = getCookie('like'); // 이미 저장된 값을 쿠키에서 가져오기
			  var maxItemNum = 30; // 최대 저장 가능한 아이템개수
			  var expire = 1; // 쿠키값을 저장할 기간
			  if (items) {//쿠키가 이미 존재하면
			    var itemArray = items.split(',');
			    if (itemArray.indexOf(productId) != -1) {
			      // 이미 존재하는 경우 종료
			      console.log('Already exists.');
			    }
			    else {
			      // 새로운 값 저장 및 최대 개수 유지하기
			      itemArray.unshift(productId);
			      if (itemArray.length > maxItemNum ) itemArray.length = 30;
			      items = itemArray.join(',');
			      setCookie('like', items, expire);
			    }
			  }
			  else {//쿠키가 존재하지 않으면
			    setCookie('like', productId, expire);//쿠키생성
			  }
			}

		//관심상품 하트모양 버튼 이벤트 //동적 태그에 이벤트 주기
		function saveProductId(productId){	
			var button = document.getElementById("heartBtn");
			//빨강색으로 버튼 컬러 변경
			//이후에도 관심상품으로 기존에 저장했던건 여전히 빨강색으로 보여야 한다(이점 보완하기)
			button.style.color = "#FF0000";
			alert("관심 상품을 저장했습니다!");
			//쿠키 추가
			addCookie(productId);
		}
		
		
	</script>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>