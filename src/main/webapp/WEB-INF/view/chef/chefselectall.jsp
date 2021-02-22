<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chef.vo.ChefVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 세프 목록</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listChef");
	List<ChefVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("chefselectall.jsp nCnt >>> : " + nCnt);
%>
<form name="chefList" id="chefList">
<table border="1">
	<thead>
	<tr>
		<td colspan="10" align="center"><h2>세프 목록</h2></td>
	</tr>
	<tr>
		<td class="tt">세프번호</td>
		<td class="tt">회원번호</td>
		<td class="tt">아이디</td>
		<td class="tt">이름</td>
		<td class="tt">닉네임</td>
		<td class="tt">등급</td>
		<td class="tt">등록일</td>
	</tr>
	</thead>
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			ChefVO cvo = list.get(i);
%>
	<tbody>
	<tr>
		<td class="tt"><%= cvo.getIno() %> </td>	
		<td class="tt"><%= cvo.getMno() %> </td>
<%-- 		<td class="tt"><%= cvo.getMid() %> </td>
		<td class="tt"><%= cvo.getMname() %> </td>
		<td class="tt"><%= cvo.getMnick() %> </td>
		<td class="tt"><%= cvo.getMlevel() %> </td>
 --%>		<td class="tt"><%= cvo.getIinsertdate() %> </td>
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
</body>
</html>
