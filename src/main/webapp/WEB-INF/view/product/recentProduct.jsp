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
		<div class="card-header"><strong>최근 본 상품</strong></div>
		<div class="text-center_1">
			<!-- <target="_blank> : 새 창에서 뜨기  / 없애면 현재 웹에서 이동-->
			<a href="https://google.com" target="_blank">
		    	<img src="..." style="width:150px;height:150px;">
			</a>
		</div>
		<div class="text-center_2">
			<a href="#" target="_blank">
		    	<img src="" class="rounded_2">
			</a>
		</div>
		<div class="text-center_3">
			<a href="#" target="_blank">
		    	<img src="" class="rounded_3">
			</a>
		</div>
		<div class="text-center_4">
			<a href="#" target="_blank">
		    	<img src="" class="rounded_4">
			</a>
		</div>
		<div class="text-center_5">
			<a href="#" target="_blank">
		    	<img src="" class="rounded_5">
			</a>
		</div>
	</div>
	



	<script>
				
		
		// 구매하기 버튼 클릭했을 때
		//var recentPro = prdouctId + ',' + image + ',' + link;
		function clickpurchase(recentPro){
			
			var proArr = recentPro.split(',');
			var productId = proArr[0];
			var productImage = proArr[1];
			var productLink = proArr[2];
			
			
			// 1. 해당 상품에 대한 쿠키값 저장
			setRecentCookie("recent",productId+'&&'+productImage+'&&'productLink);
			
			// 2-1. 쿠키값 가져와서
			getRecentCookie("recent");
			// 2-2. 배열로 저장
			setCookieArray("recent", productImage);
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
		// 쿠키 배열로 저장하기
		function setCookieArray(cookieName, cookiearray){
		 	var cookieValue = "";
		 	for(var idx in cookiearray){
		  		if(cookieValue != "" ) cookieValue += ",";
		  		cookieValue += idx+":"+cookiearray[idx];
		  		// 0:cookieValue_1,1:cookieValue_2,...
		 	}
		 	this.setCookie(cookieName, cookieValue);
		 	// recent=0:cookieValue_1,1:cookieValue_2,...
		 	
		}
		
		
		
		// 쿠키에서 배열로 저장된 데이터 가져오기
		function getCookieArray(cookieName){
		 	var cookieValue = this.getCookie(cookieName);
		 	// 0:cookieValue_1,1:cookieValue_2,...
		 
		 	var tmp1 = cookieValue.split(",");
			// 0:cookieValue_1
		 	
		 	var reData = [];
		 	for(var i in tmp1){
		  		var tmp2 = tmp1[i].split(":"); // [0, cookieValue_1]
		  		reData[tmp2[0]] = tmp2[1];
		  		// reData[0] = cookieValue_1
		 	}
		 	return reData; //[cookieValue_1, cookieValue_2, ...]
		 	// [productId1&&productImage1&&productLink1, productId2&&productImage2&&productLink2, ...]
		}
		
		// 쿠키로 가져온 데이터 종류별로 나누기
		function getCookieData(reData){
			var dataArr =[]; 
			
			
			var proArr = dataArr[i].split('&&');
			var productId = proArr[0];
			var productImage = proArr[1];
			var productLink = proArr[2];
			
		}
		
		
		
	</script>



	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>