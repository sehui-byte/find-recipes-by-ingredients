<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품 최저가 비교</title>
<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

	<script>
	
		getLikeProLprice();
		function getLikeProLprice(){
			// 유저의 관심상품 productId, title, lprice 가져오기
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
						
						// 최저가 비교 결과
						var result = sendFlask(productId);
						// console.log(typeof(result));
						
						// 알림 메세지
						// 1 : 최저가 변동 있음 -> 알림
						// 0 : 최저가 변동 없음
						if(result == 1){
							var sendMessage = "관심 상품 < " + title + " > 의 최저가를 지금 만나보세요 !";
							alert(sendMessage);
						}else{
							alert("최저가 변동 없음");
						}
						
					}
					console.log(">>>>>> getLikeProLprice() >> END");
				},
				error : function() {
					console.log("error");
				}
			});
		}
		
		
		
		// Spring => Flask => Spring : 최저가 비교 결과 가져오기
		var resultArr = new Array(); // 최저가 결과 배열
		function sendFlask(productId){
			var flaskresult = '';
			var productId = productId;
			//json형태로 만들어준다
			var param = {
				"productId" : productId
			};
			$.ajax({
				url : '/lprice/sendLikeProductInfo.do',
				type : 'get',
				data : param,
				success : function(data) {
					console.log("success : sendFlask");
					var json = data; // Controller에서 받아온 list
					console.log(json);
					
					flaskresult = json.result
					console.log(flaskresult);
				},
				error : function() {
					console.log("error : sendFlask");
				}
			});
			return flaskresult;
		}
		
		
	</script>
	
</body>
</html>