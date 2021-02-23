<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
   <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:yellow
        }
    </style>

<meta charset="UTF-8">
<title>JNS MEMBER : 전지적 냉장고 시점  회원 가입 </title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--  디바이스에 최적화된 크기로 출력 -->
<meta name ="viewport" content="width=device-width, initial-scale=1.0
		maxinum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<style type="text/css">
	div{
			margin: 50px 0px 0px 100px;
	}
	.mem{text-align=center;}
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
			//버튼 클릭시 회원가입 처리 
			$(document).on("click","#membtn",function(){
				console.log("membtn >>> : ");
				var url = "mem/memberInsert.do";
				
				// formData 객체 생성
				var formData = new FormData($("#memberForm")[0]);
				
				// 이메일, 핸드폰 조합해서 key = value로 추가
				formData.append("memail", makeMemail());
				formData.append("mhp", makeMhp());

				$.ajax({
					url : url,
					method : "POST",
					enctype : "multipart/form-data",
					processData : false,
					contentType : false,
					data : formData,
					success : whenSuccess,
					error : whenError
				});
				
				function whenSuccess(data){
					alert("회원가입에 성공하였습니다. 로그인 후 이용해주시기 바랍니다");
					location.href="main.do";
				};

				function whenError(data){
					alert("통신 에러");
				};
			});
			
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
			
		// 아이디 체크 
		$(document).on("click","#midbtn",function(){
			console.log("midbtn >>  : ");
			alert("아이디 중복 확인중 ...");
			
			let idcheckURL = "mem/checkID.do";
			let method = "GET";
			let midVal = $('#mid').val();
			
			let dataParam = {"mid":midVal};
			
			$.ajax({
				url : idcheckURL,
				type : method,
				data: dataParam,
				success : whenSuccess,
				error : whenError
			});
			
			function whenSuccess(resData){
				var sVal = resData;
				if('ID_GOOD'==sVal){
					alert("사용할 수 있는 아이디 입니다");
				}else{
					alert("이미 사용중인 아이디입니다");
					$("#mid").focus();
				}
			}
			
			function whenError(resData){
				
			}
		});
			
		function mhp(obj) {
			var number = obj.value.replace(/[^0-9]/g, "");
			var mhp = ""; if(number.length < 4) { return number; } 
			else if(number.length < 7) { mhp += number.substr(0, 3);
			mhp += "-"; mhp += number.substr(3); } 
			else if(number.length < 11) { mhp += number.substr(0, 3);
			mhp += "-"; mhp += number.substr(3, 3); mhp += "-";
			mhp += number.substr(6); } else { mhp += number.substr(0, 3); 
			mhp += "-"; mhp += number.substr(3, 4); mhp += "-"; mhp += number.substr(7); }
			obj.value = mhp; 
		  }

		// 이메일 조합
		function makeMemail(){
			var memail1 = $("#memail1").val();	
			var memail2 = $("#memail2").val();
			return memail1 + "@" + memail2;
		}
			
		// 핸드폰 조합 
		function makeMhp(){
			var mhp1 = $("#mhp1").val();
			var mhp2 = $("#mhp2").val();
			var mhp3 = $("#mhp3").val();
			return mhp1 + mhp2 + mhp3;
		}
		
		// 핸드폰 정규표현식 -> 조금 더 공부 후에
		
		// 우편번호
		$("#mzipcode").prop('readonly', true);
		$("#maddr").prop('readonly', true);
		$("#maddrdetail").prop(true);
		$("#zipcode").click(function(){
			console.log("zipcode >>> : ");
			new daum.Postcode({
			oncomplete: function(data) {
				$("#mzipcode").val(data.zonecode); //5자리 새우편번호 사용
				$("#maddr").val(data.roadAddress); //도로명 주소
				$("#maddrdetail").val(data.Adddetail); //상세주소			
			}
		}).open();
	});
});				
	
</script>
</head>
<body>
</body>
</html>
<div>
<form name="memberForm" id="memberForm">
	<h2><font size="4" style="color:Blue;">전지적 냉장고 시점 회원가입 </font></h2>
	<hr>
	<table  border="1" align="center"
		bordercolor="gray">

	<tr>
		<td colspan="2" align="center">
			<font size="4" style="color:Blue;">전.냉.시</font>
			<img src="/kosmoJns/img/ban.gif" width="25" height="25" alt="image">
		</td>
	</tr>
	<tr>
		<td class="mem">회원번호</td>
		<td><input type="text" name="mno" id="mno" style="width:150px" readonly/></td>
	</tr>
	<tr>
		<td class="mem">회원등급</td>
		<td>
		<select name=mlevel id=mlevel style="width:150px" >
			<option >회원등급을 선택하세요</option>
			<option>U</option>
			<option>C</option>
		</select>
		
		</td>
	</tr>
	<tr>
		<td class="mem">아이디</td>
		<td>
	
		<input type="text" name="mid" id="mid" size="30"placeholder="아이디중복체크"  style="width:150px"/>
		<button type="button" id="midbtn">아이디중복체크</button>
		<br>&nbsp영문,숫자,영문숫자 조합만 가능 (6자 이상 30자 이하)	&nbsp
		</td>
	</tr>
	<tr>
		<td class="mem">비밀번호</td>
		<br>
		<td>
			<input type="password" name="mpw" id="mpw" style="width:150px" />
			<br>&nbsp영문, 숫자, 특수문자 조합 (8자 이상 12자 이하)&nbsp
		
	<!-- 
			<input type="text" name="mpw_r" id="mpw_r" />
			<input type="button" value="비밀번호확인" onclick="mpwCheck()" /><br/>
	 --> 
		</td>
	</tr>
	<tr>
		<td class="mem">이름</td>
		<td><input type="text" name="mname" id="mname" style="width:150px"/></td>
	</tr>
	<tr>
		<td class="mem">닉네임</td>
		<td><input type="text" name="mnick" id="mnick" style="width:150px"/></td>
	</tr>
	<tr>
		<td class="mem">핸드폰 번호</td>	
		<td>
			<input type="text" id="mhp1" name="mhp1" maxlength="3">-
			<input type="text" id="mhp2" name="mhp2" maxlength="4">-
			<input type="text" id="mhp3" name="mhp3" maxlength="4">
		</td>
	</tr>
	<tr>
		<td class="mem">이메일</td>
		<td>		
			<input type="text" name="memail1" id="memail1" style="width:100px" />
			@<input type="text" name="memail2" id="memail2" style="width:100px" placeholder="직접입력" />
			<select name="memail3" id="memail3" style="width:100px;margin-right:10px">
	        	 <option value="1" selected>직접입력</option>
	       		 <option value="naver.com">naver.com</option>	       	   
	      		 <option value="gmail.com">gmail.com</option>
	      		 <option value="daum.net">daum.net</option>	       	   
	         </select>
		</td>
	</tr>
	 <tr>
	 	<td class="mem">주소</td>
	 	<td>
	 		<input type="text" name="mzipcode" id="mzipcode" placeholder="우편번호" style="width:50px">
	 		<input type="button" name="zipcode" id="zipcode" value="우편번호 찾기"><br>	 	
	 		<input type="text" name="maddr" id="maddr" placeholder="도로명주소" style="width:250px"><br>	 	
	 		<input type="text" name="maddrdetail" id="maddrdetail" placeholder="도로명주소 상세주소" style="width:250px"><br>	 	
	 		
	 	</td>
	 </tr>	
	<tr>
		<td class="mem">프로필사진</td>
		<td><input type="file" name="file"  /></td>
	</tr>
	<tr> 
		<td colspan="2">
			<button type="button" id="membtn">가입하기</button>
			<button type="reset">다시 입력하기</button>
		</td>
	</table>
</form>
</div>
</body>
</html>