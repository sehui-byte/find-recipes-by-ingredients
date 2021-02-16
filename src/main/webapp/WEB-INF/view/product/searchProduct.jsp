<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<h3>상품 검색</h3>
	<br>
	
	<!-- 검색 -->
	<form>
		<input class="form-control" list="datalistOptions" name="keyword"
			onKeyUp="find()" id="keyword" placeholder="Type to search..."
			" style="width: 300px">
		<button type="button" class="btn btn-outline-primary" onclick="find()">검색</button>
	</form>
	
	<!-- 검색결과 (추후 디자인 바꿀 예정) -->
	<div id="result"></div>
	<script>


	//ajax코드 넣기
	function find(){
		var keyword = $('#keyword').val();
		$.ajax({
			type: "GET",
			url: "search.do",
			data: { keyword : keyword },
			dataType: "json",
			contentType: "application/json; charset:UTF-8",
			error: function(error){
				console.log("error");
			},
			success: function(data){
				$("#result").empty();
				console.log("success");
				console.log(data);
				
				var html = "";
				var item = data.items;
				 
				html += '<table class = "table"><thead><tr><th scope="col">상품명</th><th scope="col">이미지</th><th scope="col">구매링크</th></tr></thead>';
				html += '<tbody>';
				for(var i in item){
					var title = item[i].title;
					var image = item[i].image;
					var link = item[i].link;
					html+='<tr>';
					html += '<td>'+ title+'</td>';
					html += '<td><image src="'+image+'" width ="50"/></td>';
					html += '<td><a href ='+link+'>구매링크</a></td>';
					html+='</tr>';
					$('#keyword').empty();
					title = "";
					image = "";
					link = "";
					
				}
				
				html += '</tbody></table>';
				$("#result").append(html);
			}
		});
	}

</script>

<!-- bootstrap -->
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>