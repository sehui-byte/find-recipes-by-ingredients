<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 검색어</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style type="text/css">
	a:link {text-decoration: none; color: blue;}
	a:visited {text-decoration: none; color: green;}
	a:active {text-decoration: none; color: grey;}
	a:hover {text-decoration: underline; color: red;}
</style>

<body>

	<!-- 최근 검색어 -->
	<!-- 검색버튼 누르면 최근 검색어에 추가 : onclick= -->
	<!-- 엔터키 눌렀을 때도 최근 검색어에 추가 : enterKey(){}-->
	<div id="recent_key">
		<span id="key_text"></span>
		<span id="key1"></span>
		<span id="key2"></span>
		<span id="key3"></span>
		<span id="key4"></span>
		<span id="key5"></span>
		<span id="key6"></span>
	</div>
	<br>
	<script>
	    var arr = []; 
	      
	    // 최근 검색어 6개
		function recentSearch() {
			showKeytext();
			
	    	var keyword = $('#keyword').val(); // 검색어 : keyword
	         
	        // 배열 맨 앞에 요소 추가, 배열의 크기 리턴
	        arr.unshift(keyword);
	         
	        // 중복된 검색어 제거 (뒷쪽에 있는 검색어가 삭제됨)
	        var uniqueArr = arr.filter(function(item, pos, self) {
				return self.indexOf(item) == pos;
	        });
	         
	        // 검색어가 6개 넘으면
	        if(uniqueArr.length > 6){
	        	uniqueArr.pop(); // 배열의 마지막 요소를 제거, 제거한 요소 리턴
	        }
	        console.log(uniqueArr);
	        
	     	// 최근 검색어 화면에 보여주기
	        showKeyword(uniqueArr);
		}
	    
	    

	    function showKeytext(){
	    	var keytext = "최근 검색어 :";
	    	var a = document.getElementById("key_text");
	    	a.innerHTML = keytext;
		}
	    
	    
		// 최근 검색어 화면에 보여주기 
	    function showKeyword(uniqueArr){
			for(var i=0; i<uniqueArr.length; i++){
	        	var search = '<a href="javascript:void(0);" onclick="keywordLink(\''+ uniqueArr[i] + '\')" id="recentKeyword'+(i+1)+'"><i>';
	        	search += uniqueArr[i];
	        	search += '</i></a>';
	        	console.log(search);
	        	
	        	var id = "key"+(i+1);
	            var a = document.getElementById(id);
	            if (a != null){
	            	a.innerHTML = search;
	            }
	        }
	    }
	    
			    
	    
	    // 최근 검색어 링크에 검색결과 연결
	    function keywordLink(keyword){
    		
    		/*
    			최근 검색어 수정
    		*/
    		
	    	// 배열 맨 앞에 요소 추가, 배열의 크기 리턴
	        arr.unshift(keyword);
	        // 중복된 검색어 제거 (뒷쪽에 있는 검색어가 삭제됨)
	        var uniqueArr = arr.filter(function(item, pos, self) {
				return self.indexOf(item) == pos;
	        });
	        // 검색어가 6개 넘으면
	        if(uniqueArr.length > 6){
	        	uniqueArr.pop(); // 배열의 마지막 요소를 제거, 제거한 요소 리턴
	        }
	        console.log(uniqueArr);
	        
	        // 수정된 최근 검색어 화면에 보여주기
	        showKeyword(uniqueArr);
    		
    		
    		
    		
	        /*
				클릭한 검색어에 대한 검색 결과
			*/
			
 			$.ajax({
				type : "GET",
				url : "search.do",
				data : { keyword : keyword },
				dataType : "json",
				contentType : "application/json; charset:UTF-8",
				error : function(error) {
					console.log("error");
				},
				success : function(data) {
					$("#result").empty();
					console.log("success");
					//console.log(data);

					var html = "";
					var item = data.items;
					var count = 0;//식품 검색결과 총개수

					html += '<div class="card-deck">';
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
							
							//onclick시 보낼 매개변수 문자열 : str (,로 구분)
							var str = productId + ','
										+ title.replace(/<b>/gi,'').replace(/<\/b>/gi,'') + ',' //html<br>태그 지워주기
										+ image + ',' 
										+ link + ',' 
										+ lprice + ',' 
										+ hprice;
							
 							// 최근 본 상품 목록 필요한 매개변수 문자열
							var recentPro = prdouctId + ',' + image + ',' + link;
							
			
							html += '<div class="col-sm-6">';
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
							html += '<a href="' + link +'" class="btn btn-primary" onclick=clickpurchase('+recentPro+')>구매하기</a> ';
							//관심 상품 버튼 추가
							html += '<input type="checkbox" class="heartBtn" id='
									+ productId 
									+ ' onclick="clickProductId(\'' + str +'\')"';
							
							var cookieString = getCookie('like');
							console.log(cookieString);
							if (cookieString != undefined) {
								var cookie = cookieString.split(',');
								for ( var i in cookie) {
									//기존 저장되어있는 쿠키랑 현재 상품id가 같으면 checkbox 체크해준다
									if (cookie[i] == productId) {
										html += 'checked';
									}
								}
								html+= ' />';
							}
							
							else{
								html+= ' />';
							}

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
	    
	    
	</script>

</body>
</html>