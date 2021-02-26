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
		var productInfo = new Array(); // info 값이 들어가는 배열
		
		getlikeProInfo();
		
		// 유저의 관심상품 productId, title, lprice,  가져오는 함수
		function getlikeProInfo(){
			
			$.ajax({
				url : "getlikeProInfo.do",
				type : 'get',
				dataType : "json",
				contentType : "application/json; charset:UTF-8",
				success : function(data) {
					console.log("getlikeProInfo() >> START");
					let item = data;
					console.log(item);
										
					for (var i in item) {
						
						var productId = item[i].productId;
						console.log("productId >> " + productId);
						var title = item[i].title;
						console.log("title >> " + title);
						var lprice = item[i].lprice;
						console.log("lprice >> " + lprice);
						
						var info = productId + '=' + title + '&&' + lprice + ';'
						
						productInfo.push(info);
						
						console.log("productInfo >> " + info);
					}
					console.log("getlikeProInfo() >> END");
				},
				error : function() {
					console.log("error");
				}
			});
		}
	
	</script>


	<script>
		//var what = "title";
	
	</script>


</body>
</html>