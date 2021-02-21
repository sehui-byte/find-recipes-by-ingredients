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

			if(!chkSubmit($("#mid"), "아이디를 ")){
				return;
			};
			if(!chkSubmit($("#memail1"), "이메일을 ")){
				return;
			};
			if(!chkSubmit($("#memail2"), "이메일을 ")){
				return;
			};

			var mid = $("#mid").val();
			var memail = $("#memail1").val() + "@" + $("#memail2").val();
			var url = "/kosmoJns/memberFindPWOK.do";
			var data = {"mid" : mid, "memail" : memail};
			
			$.ajax({
				url : url,
				type : 'POST',
				data : data,
				success : whenSuccess,
				error : whenError,
			});
			
			function whenSuccess(data){
				if (data == "OK"){
					alert("임시 비밀번호가 발송되었습니다. 이메일을 확인해주시기 바랍니다.");
					window.close();
				}else if(data == "ERROR_TEMPPW"){
					alert("작업이 정상적으로 진행되지 않았습니다. 다시 진행해주시기 바랍니다");
					
				}else if(data == "ERROR_INFO"){
					alert("회원 정보 조회에 실패하였습니다. 아이디와 이메일을 다시 확인해주시기 바랍니다.");
				}
			}
			
			function whenError(data){
				alert("임시 비밀번호 발급에 문제가 생겼습니다. 관리자에게 문의하시기 바랍니다.");
			}

		})		

		$(document).on("change", "#memail3", function(){
			var memail3 = $("#memail3").val();	
			if (memail3 != 1){
				$("#memail2").prop("disabled", true);
				$("#memail2").val(memail3);

			}else{
				$("#memail2").prop("disabled", false);
				$("#memail2").val("");
			}
		})	
		
		$("#back").click(function(){
			history.go(-1);
		})
		
		function chkSubmit(v_item, v_msg){
			if(v_item.val().replace(/\s/g,"")==""){
				alert(v_msg+" 확인해 주세요.");
				v_item.val("");
				v_item.focus();
				return false;
			}else{
				return true;
			}
		}
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
					<input type="text" name="memail2" id="memail2">
					<select name="memail3" id="memail3">
						<option value="1" selected="selected">직접입력</option> 
						<option value="naver.com">naver.com</option>	
						<option value="daum.com">daum.com</option>	
						<option value="google.com">google.com</option>	
					</select>
				</td>	
			</tr>	
			<tr>
				<td colspan="2">
					<input type="button" name="TempPW" id="TempPW" value="임시 비밀번호 발급받기">
					<input type="button" name="back" id="back" value="뒤로가기">
				</td>	
			</tr>
		</table>
	</form>
</body>
</html>