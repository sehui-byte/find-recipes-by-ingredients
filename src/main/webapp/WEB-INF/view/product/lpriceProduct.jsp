<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품 최저가 비교</title>
<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

<body>
	<!-- 유저의 관심상품 productId, title, lprice 가져오기 -->
	<script>
		getLikeProLprice();
		function getLikeProLprice(){
			$.ajax({
				url : "getlikeProInfo.do",
				type : 'get',
				dataType : "json",
				contentType : "application/json; charset:UTF-8",
				success : function(data) {
					console.log(">>>>>> getLikeProLprice() >> START");
					let item = data; // Controller에서 받아온 list
					console.log(item);
					
					// list에서 필요한 정보만 가져오기
					for (var i in item) {
						var productId = item[i].productId;
						//console.log("productId >> " + productId);
						var title = item[i].title;
						//console.log("title >> " + title);
						var lprice = item[i].lprice;
						//console.log("lprice >> " + lprice);
						
						//var flaskurl = "http://localhost:5001/lprice?productId="+productId+"&title="+title+"&lprice="+lprice;
						var flaskurl = "sendLikeProductInfo?productId="+productId+"&title="+title+"&lprice="+lprice;
						console.log(flaskurl);
						
						LpriceResult();
						
					}
					console.log(">>>>>> getLikeProLprice() >> END");
				},
				error : function() {
					console.log("error");
				}
			});
		}
		
		
	</script>

	<!-- http://localhost:5001/lprice?productId='+ productId +'&title=' + title + '&lprice=' + lprice -->	
	<a href="http://localhost:5001/lprice?productId=82549095413&title=스타벅스 캡슐커피 8종 네스카페 돌체구스토캡슐 18종&lprice=6700">플라스크 테스트 localhost:5001/lprice?productId=82549095413</a><br />
	<a href="sendLikeProductInfo?productId=82549095413&title=스타벅스 캡슐커피 8종 네스카페 돌체구스토캡슐 18종&lprice=6700">플라스크 테스트 sendLikeProductInfo?productId=82549095413</a><br />
	<a href="sendLikeProductInfo?">플라스크 테스트 sendLikeProductInfo?</a><br />
	




	<script>
		var resultArr = new Array(); // 최저가 결과 배열
		function LpriceResult(){
			$.ajax({
				url : "getLpriceResult.do",
				type : 'get',
				dataType : "json",
				contentType : "application/json; charset:UTF-8",
				success : function(data) {
					console.log("success : LpriceResult");
					let result = data; // Controller에서 받아온 list
					console.log(result);
					for (var i in result) {
						var arr = result[i].result;
						resultArr.push(arr);
						console.log("최저가 result >> " + arr);
					}
				},
				error : function() {
					console.log("error : LpriceResult");
				}
			});
		}
	</script>
	
	
	<!-- Spring => Flask : 최저가 비교 : http://127.0.0.1:5001/lprice -->
	<!-- 
		def lprice():
			관심상품 데이터 Json(문자열) : LikeProductInfo : 유저의 관심상품 productId, title, lprice
			def naver_api(title, lprice, productId):
				1. title로 크롤링
				2. productId로 해당 상품 정보 가져오기
				3. lprice 최저가 비교
					: 새로운 최저가 상품 -> true
					: 현재 상품이 최저가 -> false
	 -->
	
		
	<!-- Flask => Spring : 최저가 비교 결과 가져오기 -->
	
	<!-- 알림 메세지 -->
	<script>
		function message(result){
			if (result){ //true
				sendMessage = "관심 상품 " + getLikeProLprice.title + " 의 최저가를 지금 만나보세요 !";
				alert(sendMessage);
			}
		}	
	</script>
</body>
</html>