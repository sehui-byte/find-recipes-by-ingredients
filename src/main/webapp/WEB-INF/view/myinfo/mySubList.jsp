<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 구독 리스트</title>
<style type="text/css">
	/*google 웹폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');
	
	div, h1, h2, h3, h4, h5, h6, p {
	   font-family: 'Noto Serif KR', serif;
	}

	.tt{
		text-align: center;
	}
	
	.section-header {
		position: relative;
		margin-bottom: 40px;
		font-size: 26px;
		font-weight: 400;
		color: #333;
		text-align: Center;
		line-height: 60px;
		letter-spacing: 1px;
	}
	
	.section-header:after {
		content: "";
		display: block;
		position: absolute;
		left: 50%;
		bottom: 0;
		width: 70px;
		height: 2px;
		background: #ff7f00;
		transform: translate(-50%, 0);
		transform: translate3d(-50%, 0, 0);
	}
	
	
	.table.table-hover tbody tr:hover {
    	background-color: #F9A781; 
	}
	
	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
</style>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 구독 취소
		$(document).on("click", "#subCancel", function(){
			var subCancelUrl = "/kosmoJns/subscribe/subDelete";
			var subCancelType = "POST";
			var subCancelData = {"sno": $("#sno").val()};
			$.ajax({
				url: subCancelUrl,
				type: subCancelType,
				data: subCancelData,
				success: whenSuccess,
				error: whenError
			});

			function whenSuccess(resultData){
				if(resultData=="GOOD"){
					alert("구독이 취소되었습니다.");
					console.log("구독 취소 완료");
					location.reload();
				}
			}
			function whenError(){
				alert("시스템 오류입니다. 관리자에게 문의하세요.");
			}
		});
	});

</script>
<script>
	function openNav() {
		document.getElementById('myinfosidenav').style.width = '250px';
	}
	function closeNav() {
		document.getElementById('myinfosidenav').style.width = '10px';
	}
</script>
</head>
<body>
<!-- myinfo 사이드바 호출 -->
<div class="sidebar">
	<jsp:include page="../../include/jsp/myinfoSide.jsp" flush="true">
		<jsp:param name="mno" value="<%=mno%>"/>
	</jsp:include>
</div>
<div id="wrapper">
<div class="jumbotron">
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("mySubList");
	List<SubscribeVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("mysublist.jsp nCnt >>> : " + nCnt);
%>
	<div class="section-header">My Subscribe</div>
	<form name="subscribeList" id="subscribeList">
	<table class="table table-hover">
		<thead>
		<tr>
			<td class="tt" style="font-weight: bold">구독번호</td>
			<td class="tt" style="font-weight: bold">셰프이름</td>
			<td class="tt" style="font-weight: bold">등록일</td>
			<td><td>
		</tr>
		</thead>
	<%
		if (nCnt > 0) {
			for(int i=0; i<nCnt; i++){
				SubscribeVO svo = list.get(i);
	%>
		<tbody>
		<tr>
			<td class="tt" style="font-size: 12px"><%= svo.getSno() %> 
				<input type="hidden" id="sno" name="sno" value="<%= svo.getSno() %>">
			</td>
			<td class="tt"><%= svo.getChefnick() %> </td>
			<td class="tt"><%= svo.getSinsertdate() %> </td>
			<td>
				<input type="button" class="btn btn-orange" id="subCancel" value="구독 취소">
			</td>
		</tr>
	<%
			} // end of for
		}else{
	%>
		<tbody>
		<tr>
			<td colspan="10" align="center">구독한 세프가 존재하지 않습니다.</td>
		</tr>	
	<%		
			
		} // end of if
	%>
		</tbody>
	</table>
	</form>
</div>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>	
</body>
</html>
