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

	<script>

		getLikeProLprice();
		
		
		function getLikeProLprice(){
			/*
				유저의 관심상품 productId, title, lprice 가져오기
			*/
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
						console.log("productId >> " + productId);
						var title = item[i].title;
						console.log("title >> " + title);
						var lprice = item[i].lprice;
						console.log("lprice >> " + lprice);
						
						
						// -----------------------------------------------
						
						
						/*
							Spring -> Flask : http://127.0.0.1:5001/lprice
							
							def lprice():
								관심상품 데이터 Json(문자열) : LikeProductInfo : 유저의 관심상품 productId, title, lprice
								def naver_api(title, lprice, productId):
									1. title로 크롤링
									2. productId로 해당 상품 정보 가져오기
									3. lprice 최저가 비교
									4. 최저가 발견시 최저가 상품의 title, lprice, productId 가져오기
						*/ 
						
						//<a href="sendLikeProductInfo.do?productId=&title=&lprice=">플라스크 테스트 - 관심상품 최저가 비교</a>

								
						/*
							해당 상품 정보 가져오기
						*/
						
						
						
						
						/*
							실시간 알림 (productId, title, lprice)
						*/				
			
						// message = "관심 상품 " + title + " 의 최저가 상품을 지금 만나보세요 !";
						
						
					}
					console.log(">>>>>> getLikeProLprice() >> END");
				},
				error : function() {
					console.log("error");
				}
			});
		}
		
	</script>
	

</body>
</html>