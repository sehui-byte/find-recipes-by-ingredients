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
						
						
						/*
							title로 파이썬에서 크롤링
						*/ 
						
					/* Node.js
					
						// 1. child-process모듈의 spawn 취득
						const spawn = require('child_process').spawn;
						// 2. spawn을 통해 "python 파이썬파일.py" 명령어 실행
						const result = spawn('python', ['getLikeProInfo.py', title]); 
						
						// 3. stdout의 'data'이벤트리스너로 실행결과를 받는다. 
						result.stdout.on('data', function(data) { 
							console.log(data.toString()); 
						}); 
						// 4. 에러 발생 시, stderr의 'data'이벤트리스너로 실행결과를 받는다. 
						result.stderr.on('data', function(data) { 
							console.log(data.toString()); 
						});

					 */						



						
						/*
							lprice 최저가 비교
						*/
						
						
						
						
						/*
							만약 lprice 보다 낮은 가격이 있으면, 실시간 알림 (productId, title, lprice)
						*/				
			
						
						
						
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