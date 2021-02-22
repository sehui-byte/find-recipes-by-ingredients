<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<%  
	Object obj1 = request.getAttribute("recipeList");
	List<RecipeVO> recipeList = (List)obj1;

	Object obj2 = request.getAttribute("recipeBoardList");
	List<RecipeBoardVO> recipeBoardList = (List)obj2;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page = "./myFavRecipeList_API.jsp">
	<jsp:param name="recipeList" value="<%= recipeList %>" />
	<jsp:param name="mno" value="<%= mno %>" />
</jsp:include>

<hr/>

<jsp:include page = "./myFavRecipeList_user.jsp">
	<jsp:param name="recipeBoardList" value="<%= recipeBoardList %>" />
</jsp:include>
</body>
</html>