<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(()=>
	{
		alert("document is ready")
		$.ajax
		({
			url : "recipeSelectAll.do",
			type : "GET",
			data : "json",
			success : function(data)
			{
				console.log("asdasd")
				console.log(data);
			},
			error : function()
			{
				console.log("error");
			}
		});
		
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>