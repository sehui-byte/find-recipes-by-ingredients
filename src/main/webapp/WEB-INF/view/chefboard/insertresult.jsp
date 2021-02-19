<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERT RESULT</title>
</head>
<body>
<%
	Object obj=request.getAttribute("result");

	if(obj !=null){
		String result=(String)obj;
		
		
		if(result.indexOf("문제") > -1){
%>
			<script>
				alert("죄송합니다, 글 등록에 문제가 발생하였습니다.");
				history.go(-1);
			</script>
<%
		}
		else{
%>
			<script>
				location.href="/kosmoJns/chefboard/boardselectall.do";
			</script>
<% 
		}

	}
%>
</body>
</html>