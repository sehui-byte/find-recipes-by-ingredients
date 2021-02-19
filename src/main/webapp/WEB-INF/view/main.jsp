<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>main 페이지</h3>
------------page 분류 예시, test 용도<br>
누구나 가는 익명 페이지<br>
관리자 페이지 - 관리자만 이용 가능<br>
그 외 페이지 전부 익명으로 만들어 놓을 예정<br>
익명은 조회만 가능<br>
입력/수정/삭제는 회원만 가능<br>
<div>
<h3>로그인 유지한 상태로 사이트 접속</h3>
	<ul>
		<li><a href="qnaForm.do">QnA 글쓰기</a></li>
		<li><a href="/kosmoJns/main.do">일반 접속</a></li>
		<li><a href="chefboard/writeForm.do">chefboard writeForm</a></li>
		<li><a href="chefboard/boardList.do">chefboard boardList</a></li>
		<li><a href = "searchPage.do">상품 검색 페이지</a></li>
		<li><a href = "likeProduct.do">관심상품 목록 보기(테스트)</a></li>
		<li><a href="join.do">회원가입</a></li>
		<li><a href="reply/reply.do">댓글 테스트</a></li>
		<li><a href="recipelist.do">레시피 리스트</a></li>
	</ul>
</div>

</body>
</html>