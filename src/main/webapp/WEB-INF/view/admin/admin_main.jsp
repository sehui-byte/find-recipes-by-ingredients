<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		var status = location.search;
		if(status.indexOf("redirect") != -1){
			return;	
		}
		location.href="/kosmoJns/sendSignupInc.do?start_yyyymm=202004&end_yyyymm=202104";
	})
</script>

</head>
<body>
<h3>admin 페이지</h3>

<!-- admin 페이지 메인 부분에다가 회원 유입 현황 그래프  -->
<img src="http://localhost:5000/static/signupInc/signupInc.png">

<ul>
	<li><a href="../noticeSelectAll.do">공지사항 </a>
	<li><a href="../memberSelectAll.do">회원 조회/수정/삭제</a>	</li>
	<li><a href="../qnaSelectAll.do">QnA 게시판 조회/수정/삭제  </a></li>
	<li><a href="../recipeboard.do">레시피 게시판 조회/수정/삭제 </a></li>
	<li><a href="../reply/reply.do">댓글 조회/수정/삭제</a></li>
	<li>
		실적	
	</li>
	<li>
		부서 관리
	</li>
	<li>
		근태
	</li>
	<li>
		사내 일정 등등.
	</li>
</ul>
</body>
</html>