<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>main 페이지</h3>
누구나 가는 익명 페이지<br>
관리자 페이지 - 관리자만 이용 가능<br>
그 외 페이지 전부 익명으로 만들어 놓을 예정<br>
익명은 조회만 가능<br>
입력/수정/삭제는 회원만 가능<br>
<div>
<h3>로그인 유지한 상태로 사이트 접속</h3>
<h3>공지사항 관련 URL</h3>
<ul>
	<li><a href="noticeForm.do">공지사항 글쓰기</a></li>
	<li><a href="noticeSelectAll.do">공지사항 목록</a></li>
</ul>

<hr>

<h3>QnA 관련 URL</h3>
<ul>
	<li><a href="qnaForm.do">QnA 글쓰기</a></li>
	<li><a href="qnaSelectAll.do">QnA 목록 조회</a></li>
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
	<li><a href = "searchPage.do">상품 검색 페이지</a></li>
	<li><a href = "likeProduct.do">관심상품 목록 보기(테스트)</a></li>
</ul>

<hr>

<h3>권한 & 로그인 관련 URL</h3>
<ul>
	<li><a href="/kosmoJns/main.do">일반 접속</a></li>
	<li><a href="/kosmoJns/admin/main.do">admin 접속</a></li>
</ul>

<h3>세프 관련 URL</h3>
<ul>
	<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
</ul>

<hr>

<h3>구독 관련 URL</h3>
<ul>
	<li><a href="/kosmoJns/subscribe/test.do">테스트</a></li>
</ul>

<hr>
</div>


</body>
</html>