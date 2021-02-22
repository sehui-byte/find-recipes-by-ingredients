<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
</style>
</head>
<body>
	
	<!-- 최근 본 상품 --> <!-- 이미지 + 링크 -->
	<div class="card text-dark bg-light mb-3" style="max-width: 16rem;">
		<span id="recent_text"></span>
		<div class="text-center_1">
			<!-- <target="_blank> : 새 창에서 뜨기  / 없애면 현재 웹에서 이동-->
			<span id="product1">
			</span>
		</div>
		<div class="text-center_2">
			<span id="product2">
			</span>
		</div>
		<div class="text-center_3">
			<span id="product3">
			</span>
		</div>
		<div class="text-center_4">
			<span id="product4">
			</span>
		</div>
		<div class="text-center_5">
			<span id="product5">
			</span>
		</div>
	</div>
	



	<script>
				
		/*
			구매하기 버튼 클릭했을 때, 해당 상품의 필요한 데이터 쿠키 배열로 저장
		*/
		
		// var recentPro = prdouctId + ',' + image + ',' + link;
		function clickpurchase(recentPro){	
			// 최근 본 상품 화면에 추가
			showRecent();
			
			var info = recentPro.split(","); // [prdouctId, image, link]
			var productId = info[0];
			var productImage = info[1];
			var productLink = info[2];
			
			// 1. 해당 상품에 대한 쿠키값 저장
			setRecentCookie(productId, productImage+'&&'+productLink);
			//productId=productImage&&productLink
			
			// 2. 쿠키값 배열로 저장 : 최대 5개
			setCookieArray(productId);
			
			// 3. 쿠키 배열로 데이터 가져오기
			getCookieArray(cookieArr);
		}
		
		
		function showRecent(){		
			var a = document.getElementById("recent_text");
	    	a.innerHTML = '<div class="card-header"><strong>최근 본 상품</strong></div>';
		}
		
				
		// 쿠키 생성 함수
		// cookieName : "recent", cookieValue : recentPro , 유효시간 : 1시간
		function setRecentCookie(cookieName, cookieValue) {
		    var expire = new Date();
		    expire.setTime(date.getTime() + 1*60*60*1000); // 1hr
		    document.cookie = cookieName + '=' + cookieValue;
		}

		
		// 쿠키 값 가져오기
		function getRecentCookie(cookieName) {
			var cookieValue = null;
			if(document.cookie != ""){
				var array = document.cookies.split((escape(cookieName)+'='));
				if(array.length >= 2){
					var arraySub = array[1];
					cookieValue = unescape(arraySub[0]);
				}
			}
			return cookieValue;
		}
		
		// 쿠키 배열로 저장하기 : 최대 5개
		var cookieArr = [];
		function setCookieArray(cookieName){ // productId1
		 	var cookieValue = getRecentCookie("cookieName"); // productImage1&&productLink1
		 	
		 	// 배열 맨 앞에 요소 추가, 배열의 크기 리턴
	        cookieArr.unshift(cookieValue);
	         
	        // 중복된 쿠키 제거 (뒷쪽에 있는 쿠키 삭제됨)
	        var recentArr = cookieArr.filter(function(item, pos, self) {
				return self.indexOf(item) == pos;
	        });
	         
	        // 쿠키 5개 넘으면
	        if(recentArr.length > 5){
	        	recentArr.pop(); // 배열의 마지막 요소를 제거, 제거한 요소 리턴
	        }
	        console.log(recentArr);
	        
	        return cookieArr; // [productImage5&&productLink5, ..., productImage1&&productLink1]
		}

		
		
		/*
			쿠키 이용해서 데이터 가져오기
		*/
		
		// 쿠키에서 배열로 저장된 데이터(이미지, 링크) 가져와서 화면에 보여주기
		function getCookieArray(cookieArr){ // [productImage5&&productLink5, ..., productImage1&&productLink1]
			
			for(var i=0; i<cookieArr.length; i++){
				
				var product = cookieArr[i]; // productImage&&productLink
				var info = product.split("&&"); // [productImage, productLink]
				var image = info[0]	// productImage5
				var link = info[1]	// productLink5
				
				var recentProduct = '<a href="'+link+'" target="_blank"><img src="'+image+'" class="rounded_2"></a>';
					        	
	        	var id = "product"+(i+1);
	            var a = document.getElementById(id);
	            if (a != null){
	            	a.innerHTML = recentProduct;
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