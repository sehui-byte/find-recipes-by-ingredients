<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지 테스트</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
</style>
</head>
<body>
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
					<form class="d-flex" method="get" action="searchRecipe.do"
						id="searchRecipeForm">
						<input id="keyword" name="keyword" class="form-control me-2"
							type="search" placeholder="내 냉장고 속 재료 입력!" aria-label="Search"
							onclick="enterKey()">
						<button type="submit" class="btn btn-warning">Search</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- content -->
	<!-- 추후 아래 링크들 삭제 -->
	<div id="wrapper">
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
			<li><a href="chefboard/boardselectall.do">chefboard
					boardList</a></li>
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
			<li><a href="/kosmoJns/main.do">일반 접속</a></li>
			<li><a href="/kosmoJns/admin/main.do">admin 접속</a></li>
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
			<li><a
				href="sendSignupInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
					테스트 - 월별회원가입증가추이(파라미터 : 201102 ~ 202102)</a></li>
		</ul>
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
		</script>
</body>
</html>