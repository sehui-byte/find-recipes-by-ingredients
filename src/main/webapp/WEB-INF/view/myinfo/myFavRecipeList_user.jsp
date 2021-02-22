<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>

<%
	Object obj = request.getAttribute("recipeList");
	List<RecipeVO> recipeList = (List)obj;
	out.println(recipeList.size());
	

%>    
