<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품</title>
<!-- font awesome -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
	<div class="card text-dark bg-light mb-3" style="max-width: 18rem;">
		<div class="card-header">최근 본 상품</div>
		<div class="card-body">
			<h5 class="card-title">상품명</h5>
			<img src="..." class="img-thumbnail" alt="...">
	  	</div>
	</div>
	
	<!-- 최근 본 상품 -->
	<div id="recent_product"></div>
	<script>


/* 		
		// 쿠키 생성 함수
		function setRecentCookie(cookieName, cookieValue) {
		    var expire = new Date();
		    expire.setTime(date.getTime() + 1*60*60*1000); // 1hr
		    document.cookie = cookieName + '=' + cookieValue;   
		}
*/
			    
		//쿠키 값 가져오기
		function getRecentCookie(cookieName) {
			var cookieValue = null;
			
			if(document.cookie){
				var array = document.cookies.split((escape(cookieName)+'='));
				if(array.length >= 2){
					var arraySub = array[1].split(',');
					cookieValue = unescape(arraySub[0]);
				}
			}
			return cookieValue;
		}
		
		
		// 쿠키 배열로 저장
		function setCookieArray(cookieName, cookiearray){
		 	var str = "";
		 	for(var key in cookiearray){
		  		if(str != "" ) str += ",";
		  		str += key+":"+cookiearray[key];	// 1:cookie,2:cookie,...
		 	}
		 	this.setCookie(cookieName, str); 		// recent=1:cookie,2:cookie,...
		}
		
		
		// 쿠키에서 배열로 저장된 데이터 가져오기
		function getCookieArray(cookieName){
		 	var str = this.getCookie(cookieName);
		 	var tmp1 = str.split(",");
		 	var reData = {};
		 	for(var i in tmp1){
		  		var tmp2 = tmp1[i].split(":");
		  		reData[tmp2[0]] = tmp2[1];
		 	}
		 	return reData;
		}
	</script>

	
	

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>