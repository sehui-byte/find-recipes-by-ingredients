<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 비밀번호 발급받기</title>
<style type="text/css">
/*google 웹폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');

div, h1, h2, h3, h4, h5, h6, p {
   font-family: 'Noto Serif KR', serif;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#changePW").click(function(){
			var mid = "<%= mid %>";
			var mpw = $("#mpw").val();
			var nMpw = $("#nMpw").val();
			var url = "/kosmoJns/myinfo/myPWUpdate.do";
			var data = {"mid" : mid, 
						"mpw" : mpw,
						"nMpw" : nMpw};
			
			$.ajax({
				url : url,
				type : 'POST',
				data : data,
				success : whenSuccess,
				error : whenError,
			});
			
			function whenSuccess(data){
				if (data == "OK"){
					alert("비밀번호가 정상적으로 변경되었습니다. 감사합니다.");
					location.href="/kosmoJns/main.do";	
				}else{
					alert("비밀번호 변경에 실패하였습니다. 잠시 후에 다시 시도하시기 바랍니다.");
				}
			}
			
			
			function whenError(data){
				alert("서버에 문제가 생겨 실패했습니다. 관리자에게 문의하시기 바랍니다.");
			}
		})
		
		$(document).on("click", "#checkpw", function(){
			if(!chkSubmit($("#mpw"), "기존 비밀번호를 ")){
				return;
			};
			if(!chkSubmit($("#nMpw"), "새로 입력할 비밀번호를 ")){
				return;
			};
			if(!chkSubmit($("#nMpw_r"), "비밀번호 확인란을 ")){
				return;
			};

			var nMpw = $("#nMpw").val();
			var nMpw_r = $("#nMpw_r").val();
			
			if (nMpw == nMpw_r){
				alert("비밀번호가 일치합니다. 다음 단계를 진행해주시기 바랍니다.");
				$("#changePW").prop("disabled", false);
			}else{
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
			}
		});	
		

		$("#back").click(function(){
			history.go(-1);
		}) // end function
		

		function chkSubmit(v_item, v_msg){
			if(v_item.val().replace(/\s/g,"")==""){
				alert(v_msg+" 확인해 주세요.");
				v_item.val("");
				v_item.focus();
				return false;
			}else{
				return true;
			}
		} // end function
	})

</script>
</head>
<body>
	<form id="myPWUpdateForm">
		<table border="1" id="myPWUpdateTable" style='text-align:center;'>
			<tr>
				<td>
					<label>기존 비밀번호</label>
				</td>
				<td>
					<input type="password" name="mpw" id="mpw">	
				</td>	
			</tr>	
			<tr>
				<td>
					<label> 변경할 비밀번호 </label>
				</td>
				<td>
					<input type="password" name="nMpw" id="nMpw">
				</td>	
			</tr>	
			<tr>
				<td>
					<label> 변경할 비밀번호 확인 </label>
				</td>
				<td>
					<input type="password" name="nMpw_r" id="nMpw_r">
				</td>	
				<td>
					<input type="button" name="checkpw" id="checkpw" value="비밀번호 체크">
				</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="button" name="changePW" id="changePW" value="비밀번호 변경하기" disabled>
					<input type="button" name="back" id="back" value="뒤로">
				</td>	
			</tr>
		</table>
	</form>
</body>
</html>