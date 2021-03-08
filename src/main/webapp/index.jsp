<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO"%>
<%@ page import="java.util.List" %>
<head>
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="shortcut icon" href="/kosmoJns/resources/img/favicon.ico">
<link rel="icon" href="/kosmoJns/resources/img/favicon.ico">
<meta charset="UTF-8">
<title>메인 페이지 테스트</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">	
<style>
.carousel, .carousel-item img {
	height: 350px;
	width: auto;
	overflow: hidden;
	object-fit: cover;
}

#img1 {
	object-position: 50% 15%;
}

#img1_info {
	color: white;
	top: 25%;
}

#searchRecipeForm {
	z-index: 1;
	width: 400px;
	display: inline-block;
	text-align: center;
	margin-top: 15px;
}

header {
	position: fixed;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
}

.card-img-top {
    width: 100%;
    height: 15vw;
    object-fit: cover;
}

#recommedRecipe{
	text-align: center;
}

hr{
	background-color: orange;
}

.table.table-hover tbody tr:hover {
   	background-color: #F9A781; 
}

/* 하단 그리드 CSS 시작 ============================ */
.featurette-divider {
  margin: 5rem 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
.featurette-heading {
  font-weight: 300;
  line-height: 1;
  /* rtl:remove */
  letter-spacing: -.05rem;
}

@media (min-width: 40em) {
  .featurette-heading {
    font-size: 40px;
  }
}

@media (min-width: 62em) {
  .featurette-heading {
    margin-top: 7rem;
  }
}
/* 하단 그리드 CSS 종료 ============================ */

</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

<%
	Object obj = request.getAttribute("listS");
	List<BoardVO> list = (List)obj;
	BoardVO nvo = null;
%>
	<!-- navbar -->
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>

	<!-- carousel -->
	<div id="carouselExampleDark" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img id="img1"
					src="https://cdn.pixabay.com/photo/2018/09/22/18/22/vegetables-3695807_1280.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block" id="img1_info">
					<h3>냉장고 시점에서 바라본 오늘의 레시피 찾기!</h3>
					<!--  검색창 -->
					<div id="searchRecipeForm">
						<form class="d-flex" method="get" action="recipelist.do"
							id="searchRecipeForm">
							<input id="keyword" name="keyword" class="form-control me-2"
								type="search" placeholder="내 냉장고 속 재료 입력!" aria-label="Search"
								onclick="enterKey()">
							<input type="hidden" name="keyfilter" value="key1">
							<button type="submit" class="btn btn-warning">Search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form name="index" id="index" action="noticeSelect.do">
		<input type="hidden" name="bno" id="bno"> <input type="hidden"
			name="btitle" id="btitle"> <input type="hidden" name="mnick"
			id="mnick"> <input type="hidden" name="binsertdate"
			id="binsertdate">
	</form>

	<!-- content -->
	<div id="wrapper">
	
		
		<!-- 오늘의 추천 레시피 3개 보여주기 -->
		<section id="recommedRecipe">
		<img src="/kosmoJns/resources/img/TodaysRecipe (4).png" class="card-img-top" alt="기본 이미지"
		    		style="width:200; height:auto">
		<h2>추천 레시피</h2>
		<p>오늘은 이런 요리를 만들어보시는 것 어떨까요?</p>
		<div id="randomRecipe"></div>
		<br>
		</section>
		
		<br><hr>
	
		<!-- 공지사항 최신순 글 3개 표시 -->
		<section id="noticeSection">
		<div class="breadcrumb" id="brandNewNotice">
		<h3>공지사항</h3>
		</div>
		<button type="button" class="btn btn-primary"  style="float: right;" id="M">공지사항 더보기</button>
		</section>
		
		<br><br><br>
	
		<!-- 하단 그리드 시작 -->
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-7">
	        <h2 class="featurette-heading">당신의 요리 실력을 뽐내주세요!<span class="text-muted"><br>Show off your cooking skills!</span></h2>
	        <p class="lead"><br>추전수 00 이상이면 자동 등업 <i class="bi bi-arrow-right-circle-fill"></i></p>
	      </div>
	      <div class="col-md-5">
      		<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" 
      			 src="/kosmoJns/resources/img/whisk.png" 
      			 alt="toRecipeBoard" id="toRecipeBoard">
	      </div>
	    </div>
	
	    <hr class="featurette-divider">
	
	    <div class="row featurette" style="background-color: #F9A781;">
	      <div class="col-md-7 order-md-2">
	        <h2 class="featurette-heading">전냉시 최고의 셰프는 누구?<span class="text-muted"><br>Who is the best chef?</span></h2>
	        <p class="lead"><br><i class="bi bi-arrow-left-circle-fill"></i> 셰프님들 레시피 확인하기</p>
	      </div>
	      <div class="col-md-5 order-md-1">
			<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" 
      			 src="/kosmoJns/resources/img/trophy.png" 
      			 alt="toChefBoard" id="toChefBoard">
	      </div>
	    </div>
	
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-7">
	        <h2 class="featurette-heading">아 맞다! 양파...<span class="text-muted"><br>Oh, my onions...</span></h2>
	        <p class="lead"><br>부족한 식재료 구매하기 <i class="bi bi-arrow-right-circle-fill"></i></p>
	      </div>
	      <div class="col-md-5">
			<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" 
      			 src="/kosmoJns/resources/img/harvest.png" 
      			 alt="toProduct" id="toProduct">
	      </div>
	    </div>
	
	    <hr class="featurette-divider">
	
	    <!-- 하단 그리드 종료 -->
	
	<!-- 테스트용 URL -->
	<!-- 
	<h3>공지사항 관련 URL</h3>
	<ul>
		<li><a href="noticeForm.do">공지사항 글쓰기</a></li>
		<li><a href="noticeSelectAllPage.do">공지사항 목록</a></li>
	</ul>

	<hr>

	<h3>QnA 관련 URL</h3>
	<ul>
		<li><a href="qnaForm.do">QnA 글쓰기</a></li>
		<li><a href="qnaSelectAllPage.do">QnA 목록</a></li>
	</ul>

	<hr>

	<h3>레시피 관련 URL</h3>
	<ul>
		<li><a href="recipelist.do">레시피 리스트</a></li>
		<li><a href="recipeboard_list.do">레시피 일반 게시판</a></li>
	</ul>

	<hr>

	<h3>회원 관련 URL</h3>
	<ul>
		<li><a href="memberForm.do">회원가입</a></li>
		<li><a href="memberSelectAll.do">회원목록</a></li>

	</ul>

	<hr>
	<h3>셰프 관련 URL</h3>

	<ul>
		<li><a href="chefboard/writeForm.do">chefboard writeForm</a></li>
		<li><a href="chefboard/writeFormFile.do">chefboard writeForm
				파일</a></li>
		<li><a href="chefboard/boardselectall.do">chefboard boardList</a></li>
		<li><a href="chefboard/boardselectallpage.do">chefboard 페이징</a></li>
	</ul>

	<hr>

	<h3>댓글 관련 URL</h3>
	<ul>
		<li><a href="reply/reply.do">댓글 테스트</a></li>
		<li><a href="reply/rbreply.do">레시피 댓글 테스트</a></li>
	</ul>

	<hr>

	<h3>구매 관련 URL</h3>
	<ul>
		<li><a href="searchPage.do">상품 검색 페이지(최근검색어,최근본상품,관심상품등록)</a></li>
		<li><a href="likeProduct.do">관심상품 목록 보기</a></li>
		<li><a href="socketTest2">웹소켓 테스트</a></li>
	</ul>

	<hr>

	<h3>권한 & 로그인 관련 URL</h3>
	<ul>
		<li><a href="/kosmoJns/main">일반 접속</a></li>
		<li><a href="/kosmoJns/admin/main">admin 접속</a></li>
	</ul>

	<hr>

	<h3>세프 관련 URL</h3>
	<ul>
		<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
	</ul>

	<hr>

	<h3>세프 관련 URL</h3>
	<ul>
		<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
	</ul>

	<hr>

	<h3>구독 관련 URL</h3>
	<ul>
		<li><a href="/kosmoJns/subscribe/test.do">테스트</a></li>
	</ul>
	
	<h3>플라스크 테스트</h3>
	<ul>
		<li><a href="sendNutrient.do?rcp_seq=1">플라스크 테스트 - 영양소</a></li>
		<li><a
			href="sendSubscribeInc?ino=I202102220001&start_yyyymm=201102&end_yyyymm=202102">플라스크
				테스트 - 셰프번호:I202102220001의 월별구독자증가추이(파라미터 : 201102 ~ 202102)</a></li>
		<li><a href="sendSignupInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
				테스트 - 월별회원가입증가추이(파라미터 : 201102 ~ 202102)</a></li>
	</ul>
	 -->
	</div>
	<!-- wrapper end -->

	<script>
		//input에서 엔터키 눌렀을 때도 검색 실행
		function enterKey() {
			if (window.event.keyCode == 13) {
				find();
				recentSearch();
				clearInput();
			}
		}

		// 공지사항 더 보기
		$(document).on("click","#M",function(){
			location.href="noticeSelectAllPage.do";
		})
		
		//공지사항 최신순 글 3개 ajax로 가져오기
		$(document).ready(function() {
			brandNewNotice();
			randomRecipe();
		});

		function brandNewNotice() {
			console.log("brandNewNotice() 함수 시작!");
			$.ajax({
				dataType : "json",
				url : 'brandNewNotice.do',
				type : 'get',
				success : function(data) {
					console.log("최신공지사항 데이터 가져오기 success");
					console.log(data);
					var html = '';
					html += '<table class="table table-hover">';
					html += '<thead>';
					//html += '<th scope="col">번호</th>';
					html += '<th scope="col">제목</th>';
					html += '<th scope="col">내용</th>';
					html += '<th scope="col">날짜</th>';
					html+='</thead>';
					html+="<tbody>";
					for(var i = 0; i<3; i++){
						html += "<tr onclick=\"location.href='noticeSelect.do?bno=" + isEmpty(data[i].nbno) + "'\">";
						//html += '<td style=\"font-size: 12px\">' + isEmpty(data[i].nbno) + '</td>';
						html += '<td>' + isEmpty(data[i].ntitle) +  '</td>';
						html += '<td>' + isEmpty(data[i].ncontent) + '</td>';
						html += '<td>' + isEmpty(data[i].ninsertdate) + '</td>';
						html += '</tr>';
					}
					html+="</tbody>";
					html += '</table>';
					$("#brandNewNotice").append(html);
				},
				error : function() {
					console.log("최신 공자사항 가져오기 에러!");
				}
			});
		}
		
		function randomRecipe(){
			console.log("randomRecipe 함수 시작");
			$.ajax({
				dataType : "json",
				url : 'randomRecipe.do',
				type : 'get',
				success : function(data) {
					console.log("randomRecipe success");
					console.log(data);
					var html2 = '';
					html2 += '<div class="card-deck">';
					
					for(var i = 0; i<3; i++){
						html2 += '<div class="card h-100" style="width: 18rem;">';
						html2 += '<img class="card-img-top" src="'+ data[i].rpimage +'" alt="Card image cap">'
						html2 += '<div class="card-body">';
						html2 += '<h6 class="card-title">' + data[i].rptitle + '</h6>';
						html2 += '<a href="/kosmoJns/recipedetail.do?rcp_seq=' + data[i].rpno + '" class="btn btn-primary">레시피 보러가기</a>'
						html2 += '</div></div>';
					}
					html2 += '</div>';
					
					$("#randomRecipe").append(html2);
				},
				error : function() {
					console.log("randomRecipe 에러!");
				}
			});
			
		}
		
		// 데이터 체크
		function isEmpty(val) {
			if (typeof val == "undefined" || val == null || val == "") {
				return "없음";
			}
			else{
				return val;
			}
		}
		
		$(document).ready(function(){
			
			// 일반 레시피 이동
			$(document).on("click", "#toRecipeBoard", function(){		
				location.href="/kosmoJns/recipeboard_list.do";
			});
			
			// 셰프 레시피 이동
			$(document).on("click", "#toChefBoard", function(){		
				location.href="/kosmoJns/chefboard/boardselectallpage.do";
			});
			
			// 구매 페이지 이동
			$(document).on("click", "#toProduct", function(){		
				location.href="/kosmoJns/searchPage.do";
			});
		});
	</script>
	<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>