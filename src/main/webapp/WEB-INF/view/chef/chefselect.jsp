<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chef.vo.ChefVO" %>
<%@ page import="java.util.List" %>   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셰프 화면</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		var subscribeUrl = "/kosmoJns/subscribe/chefSubCount.do";
		var method = "GET";
		var ino = $('#ino').val();
		var dataParam = {
				"ino": ino
		};
		
		$.ajax({
			url: subscribeUrl,
			type: method,
			data: dataParam,
			dataType: "json",
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){
			var vv = resData.key;
			console.log("chefSubCount resData.key vv >>> : " + vv);
			$('.subscribe').text(vv);
		}
		function whenError(e){
			alert("오류 >>> : " + e.responseText);
		}
	});
	
</script>
</head>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("list");
	List<ChefVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("chefselect.jsp nCnt >>> : " + nCnt);
%>
<body>
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			ChefVO cvo = list.get(i);
%>
	셰프 번호 : <%=cvo.getIno() %>
	<input type="hidden" id="ino" name="ino" value="<%=cvo.getIno() %>"><br>
	내 구독자 수 : <span class="subscribe">0</span>명
<%
		} // end of for
	}else{
%>
	등록된 셰프가 아닙니다.	
<%		
		
	} // end of if
%>
<br>
<hr>

</body>
</html>