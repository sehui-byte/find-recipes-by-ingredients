<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 찾기</title>
<script type="text/javascript">

	$(document).ready(function(){
		$("#findID").click(function(){
			alert("findID 클릭");

			if(!chkSubmit($("#mname"), "이름을 ")){
				return;
			};
			if(!chkSubmit($("#memail1"), "이메일을 ")){
				return;
			};
			if(!chkSubmit($("#memail2"), "이메일을 ")){
				return;
			};

			var mname = $("#mname").val();
			var memail = $("#memail1").val() + "@" + $("#memail2").val();
			
			
			var url = "/kosmoJns/memberFindIDOK.do";
			var data = {"mname" : mname, "memail" : memail};
			
			$.ajax({
				url : url,
				type : 'POST',
				data : data,
				success : whenSuccess,
				fail : whenFail
			});
			
			function whenSuccess(data){
				if (data == "OK"){
					alert("아이디가 이메일로 발송되었습니다. 이메일을 확인해주시기 바랍니다.");
					window.close();
				}else{
					alert("회원 정보 확인에 실패하였습니다. 이름과 이메일을 다시 확인해주시기 바랍니다.")	
				}
			}
			function whenFail(data){
				alert("아이디 찾기에 문제가 발생했습니다. 관리자에게 문의주시기 바랍니다.");
			}

		})		
		
		$("#back").click(function(){
			history.go(-1);
		})
		
		
		$("#memail2").on('change', function(){
			var memail = $("#memail2").val();
			if (memail == "custom"){
				$("#memail2").replaceWith("<input type='text' name='memail2' id='memail2'>");
			}
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
	<form id="findIDForm">
		<table border="1" id="findIDtable" style='text-align:center;'>
			<tr>
				<td>
					<label>이름 </label>
				</td>
				<td>
					<input type="text" name="mname" id="mname">	
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
					<input type="button" name="findID" id="findID" value="아이디 찾기">
					<input type="reset" name="reset" id="reset" value="다시 입력하기">
					<input type="button" name="back" id="back" value="뒤로가기">
				</td>	
			</tr>
		</table>
	</form>
</body>
</html>