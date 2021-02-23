<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색</title>
<!-- font awesome -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">

<style>
</style>
</head>
<body>
	<h3>상품 검색</h3>
	<br>

	<!-- 검색 -->
	<form>
		<input class="form-control" list="datalistOptions" name="keyword"
			onkeydown="return captureReturnKey(event)" onkeyup="enterKey();"
			id="keyword" placeholder="Type to search..." "style="width: 300px" />
		<button type="button" class="btn btn-outline-primary"
			onclick="find(); recentSearch(); clearInput();">검색</button>
	</form>

	<!-- 최근 검색어  -->
	<!--  include file="/WEB-INF/view/product/recentKeyword.jsp"-->

	<!-- 검색결과 -->
	<div id="result"></div>

	<script>
		var piArray = new Array();//유저의 관심상품 productId값이 들어가는 배열
		//유저가 이미 저장한 관심상품의 productId 가져오기
		$.ajax({
			url : "chkLikeProductId.do",
			type : 'get',
			dataType : "json",
			contentType : "application/json; charset:UTF-8",
			success : function(data) {
				console.log("chkLikeProductId 성공");
				let item2 = data;
				console.log(item2);
				for ( var i in item2) {
					var pi = item2[i].productId;
					piArray.push(pi);
					console.log("유저의 관심상품 productId >> " + pi);
				}
			},
			error : function() {
				console.log("error!");
			}
		});

		//enter키 눌렀을 때 페이지 재로딩 되는 것 방지
		function captureReturnKey(e) {
			if (e.keyCode == 13 && e.srcElement.type != 'textarea')
				return false;
		}

		//input에서 엔터키 눌렀을 때도 검색 실행
		function enterKey() {
			if (window.event.keyCode == 13) {
				find();
				//recentSearch();
				//clearInput();
			}
		}

		// 검색 후 검색창의 텍스트 지우기
		function clearInput() {
			var keyword = document.getElementsByClassName('form-control');
			for (var i = 0; i < keyword.length; i++) {
				keyword[i].value = '';
			}
		}

		//검색결과 
		function find() {
			var keyword = $('#keyword').val();
			$
					.ajax({
						type : "GET",
						url : "search.do",
						data : {
							keyword : keyword
						},
						dataType : "json",
						contentType : "application/json; charset:UTF-8",
						error : function(error) {
							console.log("error");
						},
						success : function(data) {
							$("#result").empty();
							console.log("success");

							var html = "";
							var item = data.items;
							var count = 0;//식품 검색결과 총개수
							html += '<div class="row row-cols-1 row-cols-md-3">';
							for ( var i in item) {
								var category1 = item[i].category1; //식품만 검색되게.
								if (category1 === '식품') {
									var title = item[i].title;//상품명
									var image = item[i].image;//상품이미지
									var link = item[i].link;//상품구매링크
									var lprice = item[i].lprice;//최저가
									var hprice = item[i].hprice;//최고가
									var productId = item[i].productId;
									var productType = item[i].productType;
									var maker = item[i].maker;//제조사
									var brand = item[i].brand;//브랜드명
									var mallName = item[i].mallName;//쇼핑몰상호

									//html += '<a href="' + link +'" class="btn btn-primary" onclick=clickpurchase('+recentPro+')>구매하기</a> ';
									//html += '<a href="' + link +'" class="btn btn-primary">구매하기</a> ';
									// 구매하기 클릭시 최근 본 상품에 추가
									/* $("#btn btn-primary").click(function(){
										clickpurchase(recentPro);
									}) */;

									//onclick시 보낼 매개변수 문자열 : str (,로 구분)
									var str = productId
											+ ','
											+ title.replace(/<b>/gi, '')
													.replace(/<\/b>/gi, '')
											+ ',' //html<br>태그 지워주기
											+ image + ',' + link + ',' + lprice
											+ ',' + hprice;

									// 최근 본 상품 목록 필요한 매개변수 문자열
									var recentPro = productId + ',' + image
											+ ',' + link;
									html += '<div class="col">';
									html += '<div class="card" style="width: 18rem;">';
									html += '<img src="' + image + '" alt="..." class="card-img-top"">';
									html += '<div class="card-body">';
									html += '<h5 class="card-title">' + title
											+ '</h5>'
									html += '<ul class="list-group list-group-flush">';
									//상품코드는 테스트용으로 적어둔 것 (추후 삭제)
									html += '<li class="list-group-item"> 상품코드 : '
											+ productId + '</li>';
									html += '<li class="list-group-item"> 최저가 : '
											+ lprice + '원</li>';
									html += '<li class="list-group-item"> 제조사 : '
											+ maker + '</li>';
									html += '<li class="list-group-item"> 브랜드 : '
											+ brand + '</li>';
									html += '</ul>';

									//html += '<a href="' + link +'" class="btn btn-primary" onclick=clickpurchase('+recentPro+')>구매하기</a> ';
									html += '<a href="' + link +'" class="btn btn-primary">구매하기</a> ';

									//관심 상품 버튼 추가
									html += '<input type="button" class="heartBtn" value="관심상품 추가" id='
											+ productId
											+ ' onclick="clickProductId(\''
											+ str + '\')"';

									html += '</div></div></div>';

									//비워주기
									$('#keyword').empty();

									//검색결과값 증가
									count++;
								}

								else {//식품이 아닐 경우
									continue;
								}
							}

							if (count === 0) {
								//검색결과가 없을 때
								html = "<h3>검색결과가 없습니다</h3>";
							} else {
								html += '</div>';
							}
			
							//html코드 넣어주기
							$("#result").append(html);

						}
					});
		}

		//관심상품 버튼 이벤트 //동적 태그에 이벤트 주기
		function clickProductId(productStr) {
			console.log("관심상품 등록 버튼 클릭");
			var strArr = productStr.split(',');
			var productId = strArr[0];
			var title = strArr[1];
			var image = strArr[2];
			var link = strArr[3];
			var lprice = strArr[4];
			var hprice = strArr[5];

			var btn = document.getElementById(productId);
			var isChecked = true;
			for ( var i in piArray) {
				if (productId == piArray[i]) {
					console.log("piArray[i] >> " + piArray[i]
							+ " , productId >>" + productId);
					console.log("이미 관심상품에 들어있다!");
					isChecked = false;
				}
			}

			//true이면 관심상품 inser, false이면 이미 등록된 관심상품
			console.log("isChecked >> " + isChecked);

			//json형태로 만들어준다
			var param = {
				"productId" : productId,
				"title" : title,
				"image" : image,
				"link" : link,
				"lprice" : lprice,
				"hprice" : hprice
			};

			if (isChecked) {
				$.ajax({
					url : 'likeProductInsert.do',
					type : 'post',
					contentType : "application/json", //전달한 string데이터는 json형태로 이루어진 데이터임을 알려준다
					data : JSON.stringify(param),//string으로 전달
					success : function(data) {
						console.log("전송성공");
					},
					error : function() {
						console.log("error!");
					}
				});
				alert("관심 상품을 저장했습니다!");
				location.reload();

			} else {
				alert("이미 등록된 상품입니다");
			}

		}
	</script>


	<!-- 최근 본 상품 -->
	<!--  include file="/WEB-INF/view/product/recentProduct.jsp" -->


	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>