<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ include file="/WEB-INF/include/jsp/adminSide.jsp" %>
<%@ page import="com.jns.chef.vo.ChefVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 세프 목록</title>
<style type="text/css">

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
	
	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
	
	.table.table-hover tbody tr:hover {
    	background-color: #F9A781; 
	}
</style>
<script>
	function openNav() {
		document.getElementById('adminsidenav').style.width = '250px';
	}
	function closeNav() {
		document.getElementById('adminsidenav').style.width = '10px';
	}
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listChef");
	List<ChefVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("chefselectall.jsp nCnt >>> : " + nCnt);
%>
<div id ="wrapper">
<div class="jumbotron">
	<div class="section-header">Chef List</div>
	<form name="chefList" id="chefList">
		<table class="table table-hover">
			<thead>
			<tr>
				<td class="tt" style="font-weight: bold;">세프번호</td>
				<td class="tt" style="font-weight: bold;">회원번호</td>
				<td class="tt" style="font-weight: bold;">아이디</td>
				<td class="tt" style="font-weight: bold;">이름</td>
				<td class="tt" style="font-weight: bold;">닉네임</td>
				<td class="tt" style="font-weight: bold;">등급</td>
				<td class="tt" style="font-weight: bold;">등록일</td>
			</tr>
			</thead>
		<%
			if (nCnt > 0) {
				for(int i=0; i<nCnt; i++){
					ChefVO cvo = list.get(i);
		%>
			<tbody>
			<tr>
				<td class="tt" style="font-size: 12px"><%= cvo.getIno() %> </td>	
				<td class="tt" style="font-size: 12px"><%= cvo.getMno() %> </td>
		 		<td class="tt"><%= cvo.getMid() %> </td>
				<td class="tt"><%= cvo.getMname() %> </td>
				<td class="tt"><%= cvo.getMnick() %> </td>
				<td class="tt"><%= cvo.getMlevel() %> </td>
				<td class="tt" style="font-size: 12px"><%= cvo.getIinsertdate() %> </td>
			</tr>
		<%
				} // end of for
			}else{
		%>
			<tbody>
			<tr>
				<td colspan="10" align="center">등록된 세프가 존재하지 않습니다.</td>
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
