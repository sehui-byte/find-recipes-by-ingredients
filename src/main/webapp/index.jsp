<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<!-- socketJS -->
<!-- socketJS -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<html>
<body>
<h2>main test 페이지</h2><br>
<h3>제 마음대로 정리좀 했습니다. 순서는 아무 상관 없습니다.</h3>

<h3>공지사항 관련 URL</h3>
<ul>
	<li><a href="noticeForm.do">공지사항 글쓰기</a></li>
	<li><a href="noticeSelectAll.do">공지사항 목록</a></li>
	<li><a href="noticeSelectAllPage.do">공지사항 목록 페이징</a></li>
</ul>

<hr>

<h3>QnA 관련 URL</h3>
<ul>
	<li><a href="qnaForm.do">QnA 글쓰기</a></li>
	<li><a href="qnaSelectAll.do">QnA 목록 조회</a></li>
	<li><a href="qnaSelectAllPage.do">QnA 목록 페이징</a></li>
</ul>

<hr>

<h3>레시피 관련 URL</h3>
<ul>
	<li><a href="recipelist.do">레시피 리스트</a></li>
	<li><a href="recipeboard.do">레시피 일반 게시판</a></li>
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
	<li><a href = "searchPage.do">상품 검색 페이지(최근검색어,최근본상품,관심상품등록)</a></li>
	<li><a href = "likeProduct.do">관심상품 목록 보기</a></li>
	<li><a href = "socketTest2">웹소켓 테스트</a></li>
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
</ul>

<hr>
</body>
</html>