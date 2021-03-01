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
	/*overflow: hidden;*/
	object-fit: cover;
	object-position: 50% 15%;
}
</style>
</head>
<body>
	<!-- navbar -->
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>


	<!-- carousel -->
	<div id="carouselExampleDark" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img
					src="https://cdn.pixabay.com/photo/2017/11/08/22/18/spaghetti-2931846_1280.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img
					src="https://cdn.pixabay.com/photo/2017/09/28/18/13/bread-2796393_1280.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second
						slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_1280.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- content -->
	
	<!-- 웹소켓 알림 띄워줄 곳 (위치 이동시킬 수 있음)-->
	<div id="socketAlarm"></div>

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
			<li><a
				href="sendSignupInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
					테스트 - 월별회원가입증가추이(파라미터 : 201102 ~ 202102)</a></li>
		</ul>
	</div>
	<!-- wrapper end -->

</body>
</html>