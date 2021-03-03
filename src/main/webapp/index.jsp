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
		<h3>추천 레시피</h3>
		<p>오늘은 이런 요리를 만들어보시는 것 어떨까요?</p>
		<div id="randomRecipe"></div>
	
	
		<!-- 공지사항 최신순 글 3개 표시 -->
		<div class="breadcrumb" id="brandNewNotice">
		<h3>공지사항</h3>
		</div>
	
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
					html += '<table class="table">';
					html += '<thead>';
					html += '<th scope="col">번호</th>';
					html += '<th scope="col">제목</th>';
					html += '<th scope="col">내용</th>';
					html += '<th scope="col">날짜</th>';
					html+='</thead>';
					html+="<tbody>";
					for(var i = 0; i<3; i++){
						html += '<tr>';
						html += '<td>' + isEmpty(data[i].nbno) + '</td>';
						html += '<td>' + "<a href='noticeSelect.do?bno=" + isEmpty(data[i].nbno) +"'>" + isEmpty(data[i].ntitle) +  '</a>' + '</td>';
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
	</script>
	<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>