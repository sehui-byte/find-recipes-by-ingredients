<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 비밀번호 발급받기</title>
<script type="text/javascript">

	$(document).ready(function(){
		$("#TempPW").click(function(){
			alert("TempPW 클릭");
			var mid = $("#mid").val();
			var memail = $("#memail1").val() + "@" + $("#memail2").val();
			var url = "/kosmoJns/memberFindPWOK.do";
			var data = {"mid" : mid, "memail" : memail};
			
			$.ajax({
				url : url,
				type : 'POST',
				data : data,
				success : whenSuccess,
				fail : whenFail
			});
			
			function whenSuccess(data){
				if (data == "OK"){
					alert("임시 비밀번호가 발송되었습니다. 이메일을 확인해주시기 바랍니다.");
					window.close();
				}
			}
			function whenFail(data){
				alert("임시 비밀번호 발급에 문제가 생겼습니다. 관리자에게 문의하시기 바랍니다.");
			}

		})		
		
		$("#memail2").on('change', function(){
			var memail = $("#memail2").val();
			if (memail == "custom"){
				$("#memail2").replaceWith("<input type='text' name='memail2' id='memail2'>");
			}
		})
	})
	


</script>
</head>
<body>
	<form id="TempPWForm">
		<table border="1" id="TempPWtable" style='text-align:center;'>
			<tr>
				<td>
					<label>아이디</label>
				</td>
				<td>
					<input type="text" name="mid" id="mid">	
				</td>	
			</tr>	
			<tr>
				<td>
					<label>이메일 </label>
				</td>
				<td>
					<input type="text" name="memail1" id="memail1">@
					<select name="memail2" id="memail2">
						<option value="" selected="selected">이메일 선택</option> 
						<option value="naver.com">naver.com</option>	
						<option value="daum.com">daum.com</option>	
						<option value="google.com">google.com</option>	
						<option value="custom">직접 입력</option> 
					</select>
				</td>	
			</tr>	
			<tr>
				<td colspan="2">
					<input type="button" name="TempPW" id="TempPW" value="임시 비밀번호 발급받기">
					<input type="reset" name="reset" id="reset" value="reset">
				</td>	
			</tr>
		</table>
	</form>
</body>
</html>