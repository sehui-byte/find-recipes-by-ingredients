<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.subscribe.vo.SubscribeVO" %> 
<%@ page import="java.util.List" %> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 구독 리스트</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("subList");
	List<SubscribeVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("mysublist.jsp nCnt >>> : " + nCnt);
%>
	<form name="chefList" id="chefList">
	<table border="1">
		<thead>
		<tr>
			<td colspan="10" align="center"><h2>구독 목록</h2></td>
		</tr>
		<tr>
			<td class="tt">구독번호</td>
			<td class="tt">세프이름</td>
			<td class="tt">등록일</td>
		</tr>
		</thead>
	<%
		if (nCnt > 0) {
			for(int i=0; i<nCnt; i++){
				SubscribeVO svo = list.get(i);
	%>
		<tbody>
		<tr>
			<td class="tt"><%= svo.getSno() %> </td>
			<td class="tt"><%= svo.getChefnick() %> </td>
			<td class="tt"><%= svo.getSinsertdate() %> </td>
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
</body>
</html>