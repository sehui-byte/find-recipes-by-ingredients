<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--  디바이스에 최적화된 크기로 출력 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0
		maxinum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- bootstrap css-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<style>
/*google 웹폰트 */
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap')
	;

/*font 적용*/
div, h1, h2, h3, h4, h5, h6, p, form {
	font-family: 'Noto Serif KR', serif;
}

.body {
	background: #F9A781;
}

/*콘텐츠 가운데 배치*/
form {
	max-width: 1020px;
	margin: 0 auto;
	margin-top: 50px;
}

/*회원번호 안보이게*/
#mno {
	display: none;
}

form {
	margin-top: 50px;
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 800px;
	margin: 0 auto 100px;
	padding: 45px;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

input {
	outline: 0;
	background: #f2f2f2;
	border: 0;
	padding: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

form .reset, .membtn {
	text-transform: uppercase;
	outline: 0;
	background: #F9A781;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.memberForm {
	width: 800px;
	padding: 8% 0 0;
	margin: auto;
}

/*이메일 수평정렬*/
#memail3, #memail2, #memail1{
	vertical-algin:middle;
}

#membtn {
	text-transform: uppercase;
	outline: 0;
	background: #F9A781;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
</style>


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript">
	$(document).ready(function() {

		//버튼 클릭시 회원가입 처리 
		$(document).on("click", "#membtn", function() {
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

			function whenSuccess(data) {
				alert("회원가입에 성공하였습니다. 로그인 후 이용해주시기 바랍니다");
				location.href = "main.do";
			}
			;

			function whenError(data) {
				alert("통신 에러");
			}
			;
		});

		$(document).on("change", "#memail3", function() {
			var memail3 = $("#memail3").val();
			if (memail3 != 1) {
				$("#memail2").prop("disabled", true);
				$("#memail2").val(memail3);

			} else {
				$("#memail2").prop("disabled", false);
				$("#memail2").val("");
			}
		})

		// 아이디 체크 
		$(document).on("click", "#midbtn", function() {
			console.log("midbtn >>  : ");
			alert("아이디 중복 확인중 ...");

			let idcheckURL = "mem/checkID.do";
			let method = "GET";
			let midVal = $('#mid').val();

			let dataParam = {
				"mid" : midVal
			};

			$.ajax({
				url : idcheckURL,
				type : method,
				data : dataParam,
				success : whenSuccess,
				error : whenError
			});

			function whenSuccess(resData) {
				var sVal = resData;
				if ('ID_GOOD' == sVal) {
					alert("사용할 수 있는 아이디 입니다");
				} else {
					alert("이미 사용중인 아이디입니다");
					$("#mid").focus();
				}
			}

			function whenError(resData) {

			}
		});

		function mhp(obj) {
			var number = obj.value.replace(/[^0-9]/g, "");
			var mhp = "";
			if (number.length < 4) {
				return number;
			} else if (number.length < 7) {
				mhp += number.substr(0, 3);
				mhp += "-";
				mhp += number.substr(3);
			} else if (number.length < 11) {
				mhp += number.substr(0, 3);
				mhp += "-";
				mhp += number.substr(3, 3);
				mhp += "-";
				mhp += number.substr(6);
			} else {
				mhp += number.substr(0, 3);
				mhp += "-";
				mhp += number.substr(3, 4);
				mhp += "-";
				mhp += number.substr(7);
			}
			obj.value = mhp;
		}

		// 이메일 조합
		function makeMemail() {
			
			var memail1 = $("#memail1").val();
			var memail2 = $("#memail2").val();
			return memail1 + "@" + memail2;
		}
		
		$("#memail3").change(function(){
			$("#memail3 option:selected").each(function () { if($(this).val()== '1'){ //직접입력일 경우
				$("#memail2").val(''); //값 초기화
				$("#memail2").attr("disabled",false); //활성화 
				}else{ //직접입력이 아닐경우 
					$("#memail2").val($(this).text()); //선택값 입력 
					$("#memail2").attr("disabled",true); //비활성화 
					}
			});
		});

		// 핸드폰 조합 
		function makeMhp() {
			var mhp1 = $("#mhp1").val();
			return mhp1;
		}

		// 핸드폰 정규표현식 -> 조금 더 공부 후에

		// 우편번호
		$("#mzipcode").prop('readonly', true);
		$("#maddr").prop('readonly', true);
		$("#maddrdetail").prop(true);
		$("#zipcode").click(function() {
			console.log("zipcode >>> : ");
			new daum.Postcode({
				oncomplete : function(data) {
					$("#mzipcode").val(data.zonecode); //5자리 새우편번호 사용
					$("#maddr").val(data.roadAddress); //도로명 주소
					$("#maddrdetail").val(data.Adddetail); //상세주소			
				}
			}).open();
		});
	});
</script>
</head>
<body class="body">

	<div name="memberForm" id="memberForm" class="memberForm">
		<h2>Registration</h2>
		<form class="form-horizontal" role="form">

			<div class="form-group">
				<label for="level" class="col-sm-3 control-label">등급</label>
				<div class="col-sm-9">
					<select class="form-select" name="mlevel" id="mlevel">
						<option selected disabled>--선택---</option>
						<option value="U">U</option>
						<option value="C">C</option>
					</select>
				</div>
			</div>
			<!-- 아이디 -->
			<div class="form-group">
				<label for="id" class="col-sm-3 control-label">아이디</label>
				<div class="col-sm-9">
					<input type="text" name="mid" id="mid" placeholder="아이디"
						class="form-control" autofocus> <span><button
							type="button" id="midbtn">아이디중복체크</button></span>
				</div>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label">비밀번호*</label>
				<div class="col-sm-9">
					<input type="password" name="mpw" id="mpw" placeholder="Password"
						class="form-control"> <span id="passwordHelpInline"
						class="form-text"> 영문, 숫자, 특수문자 조합 (8자 이상 12자 이하)</span>
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label"> 비밀번호
					확인*</label>
				<div class="col-sm-9">
					<input type="password" id="password" placeholder="Password"
						class="form-control">
				</div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="firstName" class="col-sm-3 control-label">이름</label>
				<div class="col-sm-9">
					<input type="text" name="mname" id="mname" placeholder="이름"
						class="form-control" autofocus>
				</div>
			</div>

			<!-- 핸드폰번호 -->
			<div class="form-group">
				<label for="phoneNumber" class="col-sm-3 control-label">핸드폰번호
				</label>
				<div class="col-sm-9">
					<input type="text" id="mhp1" name="mhp1"
						placeholder="01012341234( - 제외)" class="form-control"/>
				</div>
			</div>
			<!-- 이메일 -->
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">이메일*</label>
				<div class="row">
				<div class="col-sm-4">
					<input type="email" placeholder="이메일" class="form-control"
						name="memail1" id="memail1"/>
						</div>
					<div class="col-sm-3">
						<input type="email" placeholder="도메인" class="form-control"
						name="memail2" id="memail2" disabled/>
					</div>
					<div class="col-sm-3">
						<select name="memail3" class="form-select"
						id="memail3">
						<option selected disabled>--선택--</option>
						<option value="1">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>

				</div>
				</div>
			</div>
			<!-- 주소 -->

			<!-- 주소 -->
			주소 <input type="text" name="mzipcode" id="mzipcode"
				placeholder="우편번호" style="width: 80px"> <input type="button"
				name="zipcode" id="zipcode" value="우편번호 찾기"><br> <input
				type="text" name="maddr" id="maddr" placeholder="도로명주소"
				style="width: 250px"><br> <input type="text"
				name="maddrdetail" id="maddrdetail" placeholder="도로명주소 상세주소"
				style="width: 250px"><br>


			<!-- 프로필 사진 -->
			<div class="input-group mb-3">
				<input type="file" class="form-control" id="inputGroupFile02"
					name="file"> <label class="input-group-text"
					for="inputGroupFile02">Upload</label>
			</div>

			<!-- /.form-group -->
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*Required fields</span>
				</div>
			</div>
			<button type="submit" id="membtn" class="membtn">Register</button>
		</form>
	</div>
</body>
</html>
</body>
</html>