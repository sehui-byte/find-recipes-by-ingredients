<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE SELECT</title>
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
		
		sessionMlevel = "<%=mlevel%>"
			
		// 로그인 유저가 관리자일 경우 수정버튼 활성화
		if ( sessionMlevel == 'A'){
			$('#U').attr('disabled', false);
			$('#D').attr('disabled', false);
		}
		
		// 조회수 증가
		var viewsUrl = "noticeViews.do";
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
			var hitsUrl = "noticeHits.do";
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
		
		// U
		$(document).on("click", "#U", function(){
			$("#NoticeUpdateForm").attr({
				"method":"POST",
				"action":"noticeUpdate.do"
			}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			$("#NoticeUpdateForm").attr({
				"method":"POST",
				"action":"noticeDelete.do"
			}).submit();
		});
		
		// C
		$(document).on("click", "#C", function(){
			location.href="noticeSelectAllPage.do";
		});
		
	});
</script>
</head>
<body>
<div id ="wrapper">
	<div>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<BoardVO> list = (List)obj;
	BoardVO nvo = null;
	
	if(list.size() == 1){
		nvo = list.get(0);
	};
%>

	<form name="NoticeUpdateForm" id="NoticeUpdateForm">
	<span style="font-size: 14px">Notice</span>
	<table class="table">
		<thead>
			<tr>
				<td colspan="2"><h2><%=nvo.getBtitle()%></h2></td>
			</tr>
			<tr>
				<td colspan="2" style="vertical-align: middle;"><%=nvo.getMnick()%>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="mnick" name="mnick" value="<%=nvo.getMnick()%>">
				<input type="hidden" id="bno" name="bno" value="<%=nvo.getBno()%>">		
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<span style="font-size: 14px">조회: <%=nvo.getBviews() %> 추천: <%=nvo.getBhits() %></span>	
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<div class="scrolldiv"><%= nvo.getBcontent() %></div>
				</td>
			</tr>
			<tr>
				<td class="mem" width="20%">첨부파일</td>
				<td><img src="<%=new FileLoadUtil().getFileSrc("noticeboard", nvo.getBfile()) %>" border="1" width="40" height="50" alt="image">
			</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<span style="font-size: 12px;">등록: <%=nvo.getBinsertdate()%> 수정: <%=nvo.getBupdatedate()%></span>
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
			<c:param name="selectMno" value="<%=nvo.getMno()%>"></c:param>
		</c:import>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>