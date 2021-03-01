<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
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
</style>
<%
	Object obj = request.getAttribute("listS");
	List<BoardVO> list = (List)obj;
	BoardVO nvo = null;
	
	nvo = new BoardVO();
	
	nvo.setBtitle("공지");
	nvo.setMnick("관리자");
	nvo.setBinsertdate("2021-03-01");
%>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
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

<script>
	
	$(document).ready(function(){
		
		// 공지 호출
		noticeIndex();
		
	});
	
	//공지 요청 함수
	function noticeIndex(){
		$("#youth-notice").html("");
		console.log("index.jsp >> noticeIndex()");
		var noticeIndexURL = "brandnewNotice.do";
		var method = "GET";
		var dataParam = {};
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: noticeIndexURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){
			console.log("whenSuccess noticeIndex >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			let v = resData.split("&");
			for(let i = 0; i< v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j = 0;
				for(; j < vv.length-1; j++){
					console.log("vv[0] >>> : " + vv[0]);
					console.log("vv[1] >>> : " + vv[1]);
					console.log("vv[2] >>> : " + vv[2]);
					console.log("vv[3] >>> : " + vv[3]);   
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3]);
			}
			
		}
		function whenError(e){
			alert("오류 >>> : " + e.responseText);
		}
	}
	
	
	/* 새로운 글을 화면에 추가하기 위한 함수 */
	function addNewItem(bno, btitle, mnick, binsertdate){
		
		//데이터 체크
		if(isEmpty(bno)) return false;
		
		// 새로운 글이 추가될tr 태그 객체
		var new_tr = $("<tr>");
		
		// 글번호 지정될 <td> 태그
		var td01 = $("<td>");
		td01.html(bno);
		
		// 글제목 지정될 <td> 태그
		var td02 = $("<td>");
		td02.html(btitle);
		
		// 작성자 지정될 <td> 태그
		var td03 = $("<td>");
		td03.html(mnick);
		
		// 등록일 지정될 <td> 태그
		var td04 = $("<td>");
		td04.html(binsertdate);
		
		// 조립하기
		new_tr.append(td01).append(td02).append(td03).append(td04);
		$('#notice_list').append(new_tr)
		
	}
	
	
	// 데이터 체크
	function isEmpty(val){
		if(typeof val == "undefined" || val == null || val == ""){
			return true;
		}else{
			return false;
		}
	}
	
</script>
<form name="index" id="index" action="noticeSelect.do">
	<input type="hidden" name="bno" id="bno">
	<input type="hidden" name="btitle" id="btitle">
	<input type="hidden" name="mnick" id="mnick">
	<input type="hidden" name="binsertdate" id="binsertdate">
</form>
	<!-- content -->
	<!-- 추후 아래 링크들 삭제 -->
	<div id="wrapper">

	<div class="youth-notice">
			<h2>공지사항 안내</h2>
			<table id="notice_list">
				<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
			</table>
		<ul>
			<li>
			<a href="#index" onclick="fn_goNoticeDtl('nvo.getBno');return false;"><%= nvo.getBtitle() %></a>
			<i class="i-new"::before>
			<em><%= nvo.getMnick() %></em>
			</i>
			<span class="date" name="binsertdate" id="binsertdate"><%= nvo.getBinsertdate() %></span>
			</li>
			
			<li>
			<a href="#index" onclick="fn_goNoticeDtl2('nvo.getBno');return false;"><%= nvo.getBtitle() %></a>
			<i class="i-new"::before>
			<em><%= nvo.getMnick() %></em>
			</i>
			<span class="date" name="binsertdate" id="binsertdate"><%= nvo.getBinsertdate() %></span>
			</li>
			
			<li>
			<a href="#index" onclick="fn_goNoticeDtl3('nvo.getBno');return false;"><%= nvo.getBtitle() %></a>
			<i class="i-new"::before>
			<em><%= nvo.getMnick() %></em>
			</i>
			<span class="date" name="binsertdate" id="binsertdate"><%= nvo.getBinsertdate() %></span>
			</li>
		</ul>
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