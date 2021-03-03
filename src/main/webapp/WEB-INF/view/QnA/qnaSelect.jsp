<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@page import="com.jns.common.Validation"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA Select</title>
<style type="text/css">

	/* 03/01 재민: 페이지 디자인 완료 */
	.mem{
		text-align: center;
		vertical-align: middle;
	}

	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
	
	.scrolldiv {   
        height:500px;
        overflow:scroll;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
		
		// 조회수 증가
		var viewsUrl = "qnaViews.do";
		var viewsType = "GET";
		var viewsData = {"bno": $("#bno").val()};
		$.ajax({
			url: viewsUrl,
			type: viewsType,
			data: viewsData,
			success: viewsSuccess,
			error: viewsError
		});

		function viewsSuccess(resultData){
			if(resultData=="GOOD"){
				console.log("조회 수 +1 증가");
			}
		}
		function viewsError(){
			alert("시스템 오류입니다. 관리자에게 문의하세요.");
		}
		
		// 좋아요
		$(document).on("click", "#Hitsbtn", function(){
			var hitsUrl = "qnaHits.do";
			var hitsType = "GET";
			var hitsData = {"bno": $("#bno").val()};
			$.ajax({
				url: hitsUrl,
				type: hitsType,
				data: hitsData,
				success: hitsSuccess,
				error: hitsError
			});

			function hitsSuccess(resultData){
				if(resultData=="GOOD"){
					console.log("좋아요 수 +1 증가");
				}
			}
			function hitsError(){
				alert("시스템 오류입니다. 관리자에게 문의하세요.");
			}
		});
		
		// 수정
		$(document).on("click", "#U", function(){
			$("#QnAUpdateForm").attr({
				"method":"POST",
				"action":"qnaUpdate.do"
			}).submit();
		});
		
		// C
		$(document).on("click", "#C", function(){
				location.href="qnaSelectAllPage.do";
		});
		
		// 로그인 유저와 작성자가 일치할 경우 수정/삭제 버튼 생성
		if ( sessionWriter == boardWriter){
			$('#U').attr('disabled', false);
			$('#D').attr('disabled', false);
		}
		
	});
	
</script>
</head>
<body>
<div id ="wrapper">
<%request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<BoardVO> list = (List)obj;
	BoardVO bvo = null;	
	
	if(list.size() == 1){
		bvo = list.get(0);
	};
%>
	<div>
	<form name="QnAUpdateForm" id="QnAUpdateForm">
	<span style="font-size: 14px">Q&A</span>
	<table class="table">
		<thead>
			<tr>
				<td colspan="2"><h2><%=bvo.getBtitle()%></h2></td>
			</tr>
			<tr>
				<td colspan="2" style="vertical-align: middle;"><%=bvo.getMnick()%>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="mnick" name="mnick" value="<%=bvo.getMnick()%>">
				<input type="hidden" id="bno" name="bno" value="<%=bvo.getBno()%>">		
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<span style="font-size: 14px">조회: <%=bvo.getBviews() %> 추천: <%=bvo.getBhits() %></span>	
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<div class="scrolldiv"><%= bvo.getBcontent() %></div>
				</td>
			</tr>
			<tr>
				<td class="mem" width="20%">첨부파일</td>
				<td><img src="<%=new FileLoadUtil().getFileSrc("qnaboard", bvo.getBfile()) %>" border="1" width="40" height="50" alt="image">
			</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<span style="font-size: 12px;">등록: <%=bvo.getBinsertdate()%> 수정: <%=bvo.getBupdatedate()%></span>
				</td>
			</tr>				
			<tr>
				<td colspan="7" align="right">
					<input type="button" class="btn btn-orange" value="좋아요" id="Hitsbtn">
					<input type="button" class="btn btn-orange" disabled=disabled value="수정" id="U">
					<input type="button" class="btn btn-orange" disabled=disabled value="삭제" id="D">
					<input type="button" class="btn btn-orange" value="돌아가기" id="C">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
		<c:import url="/reply/reply.do">
		</c:import>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>