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
<!-- jquery validator -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>
<!-- font awesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
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

h2 {
	margin-top: 50px;
	position: relative;
	max-width: 800px;
	margin: 0 auto 100px;
	padding-top: 60px;
	padding-bottom : 20px;
	align: center;
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

.memberForm {
	width: 800px;
	padding: 8% 0 0;
	margin: auto;
}

/*이메일 수평정렬*/
#memail3, #memail2, #memail1 {
	vertical-algin: middle;
}

#zipcode, #mzipcode {
	vertical-algin: middle;
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

/*validation error메세지 스타일*/
.error {
	margin-top: 3px;
	color: #d9534f !important;
	font-weight: normal !important;
}

i {
	position: absolute;
	margin-top: 5px;
}
</style>

</head>
<body class="body">
	<%@ include file="/WEB-INF/include/jsp/header.jsp"%>

	<div>
		<h2>Registration</h2>
		<form class="form-horizontal" role="form" id="memberForm"
			class="memberForm" name="memberForm">
			<div class="form-group">
				<label for="level" class="col-sm-3 control-label">등급*</label>
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
				<label for="id" class="col-sm-3 control-label">아이디*</label>
				<div class="col-sm-9">
					<input type="text" name="mid" id="mid" placeholder="아이디"
						class="form-control" autofocus>
					<!-- <span>
						<button
							type="button" id="midbtn">아이디중복체크</button></span> -->
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
					<input type="password" id="mpw2" name="mpw2" placeholder="Password"
						class="form-control">
				</div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">이름*</label>
				<div class="col-sm-9">
					<input type="text" name="mname" id="mname" placeholder="이름"
						class="form-control" autofocus>
				</div>
			</div>

			<!-- 닉네임 -->
			<div class="form-group">
				<label for="nick" class="col-sm-3 control-label">닉네임*</label>
				<div class="col-sm-9">
					<input type="text" name="mnick" id="mnick" placeholder="닉네임"
						class="form-control" autofocus>
				</div>
			</div>

			<!-- 핸드폰번호 -->
			<div class="form-group">
				<label for="phoneNumber" class="col-sm-3 control-label">핸드폰번호*
				</label>
				<div class="col-sm-9">
					<input type="text" id="mhp1" name="mhp1"
						placeholder="01012341234(- 제외하고 입력)" class="form-control" />
				</div>
			</div>
			<!-- 이메일 -->
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">이메일*</label>
				<div class="row">
					<div class="col-sm-4">
						<input type="text" placeholder="이메일" class="form-control"
							name="memail1" id="memail1" />
					</div>
					<div class="col-sm-3">
						<input type="text" placeholder="도메인" class="form-control"
							name="memail2" id="memail2" disabled />
					</div>
					<div class="col-sm-3">
						<select name="memail3" class="form-select" id="memail3">
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
			<div class="form-group">
				<label for="address" class="col-sm-3 control-label">주소</label>

				<div class="col-sm-5">
					<input type="text" class="form-control" name="mzipcode"
						id="mzipcode" placeholder="우편번호">
				</div>
				<input type="button" name="zipcode" id="zipcode" value="우편번호 찾기"><br>

				<div class="col-sm-9">
					<input type="text" name="maddr" id="maddr" placeholder="도로명주소"><br>
				</div>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="maddrdetail"
						id="maddrdetail" placeholder="도로명주소 상세주소">
				</div>
			</div>

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
			<!-- 제출 버튼 -->
			<button id="membtn" class="membtn">Register</button>
		</form>
	</div>


	<script>
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
					location.href = "login.do";
				}

				function whenError(data) {
					alert("회원가입에 실패하셨습니다. 다시 시도해주세요.");
				}
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

			/* // 아이디 체크 
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
			}); */

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

			$("#memail3").change(function() {
				$("#memail3 option:selected").each(function() {
					if ($(this).val() == '1') { //직접입력일 경우
						$("#memail2").val(''); //값 초기화
						$("#memail2").attr("disabled", false); //활성화 
					} else { //직접입력이 아닐경우 
						$("#memail2").val($(this).text()); //선택값 입력 
						$("#memail2").attr("disabled", true); //비활성화 
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

		//////jquery validation//////////////////////////////
		//필수 입력값 : 이름, 아이디, 비번, 비번확인, 이메일
		$(function() {
			$("#memberForm").validate({
				//validation이 끝난 후 submit직전 추가작업
				submitHandler: function(){
					var f = confirm("회원가입을 완료하시겠습니까?");
					if(f){
						return true;
					}else{
						return false;
					}
				},
			//유효성검사규칙
				rules : {
					mlevel : {
						required : true
					},
					mname : {
						required : true
					},
					mid : {
						required : true,
						//중복체크하기
						remote : {
							url : 'mem/checkID.do',
							type : 'get'
						}
					},
					mpw : {
						required : true,
						minlength : 8,
						maxlength : 12
					},
					mpw2 : {
						required : true,
						equalTo : mpw,
						minlength : 8,
						maxlength : 12
					},
					mhp1 : {
						required : true,
						//regex : '^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$'
					},
					mnick : {
						required : true
					},
					memail1 : {
						required : true
					},
					memail2 : {
						required : true
					}
				},
				//규칙실패시 출력되는 메세지
				messages : {
					name : {
						required : "이름을 입력해주세요."
					},
					mpw2 : {
						required : "비밀번호를 다시 한번 입력해주세요.",
						equalTo : "비밀번호가 다릅니다.",
						minlength : "비밀번호는 최소 8자 이상입니다.",
						maxlength : "비밀번호는 최대 12자까지만 가능합니다."

					},
					mpw : {
						required : "비밀번호를 입력해주세요.",
						minlength : "비밀번호는 최소 8자 이상입니다.",
						maxlength : "비밀번호는 최대 12자까지만 가능합니다."

					},
					mhp1 : {
						required : "핸드폰번호를 입력해주세요.",
						//regex : "핸드폰번호를 형식에 맞게 입력해주세요"
					},
					mid : {
						required : "아이디를 입력해주세요.",
						remote : "사용 중인 아이디입니다."
					},
					mnick : {
						required : "닉네임을 입력해주세요."
					},
					memail1 : {
						required : "이메일 주소를 입력해주세요."
					},
					meamil2 : {
						required : "도메인을 입력해주세요"
					},
					mlevel : {
						required : "회원 등급을 선택해주세요"
					}
				}
			});
		});
	</script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>