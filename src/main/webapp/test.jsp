<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="filetest.do" method="post" enctype="multipart/form-data">
		test_string1<input type="text" name="rbno"><br>
		test_string2<input type="text" name="mno"><br>
		test_file1<input type="file" name="img1"><br>
		test_file2<input type="file" name="img2"><br>
		
		<input type="submit" value="submit">
	</form>
<br>
<hr/>
<%
	Object obj = request.getAttribute("returnText");
	out.println(obj);

%>
<a href="/kosmoJns/testDownload.do">플라스크 테스트 다운로드</a><br>

<img src="resources/graph/test.png"><br>
<img src="resources/img/cal_0.gif">

</body>
</html>