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
						var image = item[i].image;
						image = image.replace(/http:\\/gi,'');
						console.log("image >> " + image)
						
						// 최저가 비교 결과
						var result = sendFlask(productId);
						// console.log(typeof(result));
						
						// 알림 메세지
						// 1 : 최저가 변동 있음 -> 알림
						// 0 : 최저가 변동 없음
						if(result == 1){
							//var sendMessage = "관심 상품 < " + title + " > 의 최저가를 지금 만나보세요 !";
							//alert(sendMessage);
							popup(title, image);
						}
						if(result ==0){
							popup(title, image);
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
				url : 'sendLikeProductInfo.do',
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
		
		
		// 최저가 변동시 팝업창 띄우기
		function popup(title, image) {
			// '오늘 하루 보지 않기' 설정 이미 되어 있는지 확인
			var cookieCheck = getCookie("close");
		    // 설정 되어 있지 않은 경우, 팝업창 열기
			if (cookieCheck != "close"){
		    	var url = "popup.do?info=";
		    	url += title;
		    	url += "==";
		    	url += image;
		    	console.log("url >> " + url);
		    	var name = "lpricepopup";
				var option = "width=300, height=300, toolbar=no, status=no, location=no, scrollbar=no, menubar=no, resizable=yes, left=50, right=50";
				window.open(url, name, option);
		     }
		}
		// 쿠키값 가져오기
		function getCookie(name) {
		     var cookie = document.cookie;
		     if (document.cookie != "") {
		          var cookieArray = cookie.split("; ");
		          for ( var index in cookieArray) {
		              var cookieName = cookieArray[index].split("=");
		              if (cookieName[0] == "close") {
		                   return cookieName[1];
		              }
		          }
		     } return ;    
		}
		
		
	</script>
	
</body>
</html>