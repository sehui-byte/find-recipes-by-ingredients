<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.jns.member.vo.MemberVO"%>
<%@ page import ="java.util.List" %>    
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JNS : 전지적 냉장고 시점  회원  조회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style type="text/css">

	.tt{
		text-align: center;
	}
    
    .btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
	
	.section-header {
		position: relative;
		margin-bottom: 40px;
		font-size: 26px;
		font-weight: 400;
		color: #333;
		text-align: Center;
		line-height: 60px;
		letter-spacing: 1px;
	}
	
	.section-header:after {
		content: "";
		display: block;
		position: absolute;
		left: 50%;
		bottom: 0;
		width: 70px;
		height: 2px;
		background: #ff7f00;
		transform: translate(-50%, 0);
		transform: translate3d(-50%, 0, 0);
	}
	
</style>
<script type="text/javascript">
		
	$(document).ready(function(){
	

			// U
			$(document).on("click", "#U", function(){
				alert("U >>> :");
				$("#memUpdateForm").attr({
					"method":"POST",
					"enctype":"multipart/form-data",
					"action":"memberUpdate.do"
				}).submit();
			});
			
			// D
			$(document).on("click", "#D", function(){
				alert("D >>> : ");
				$("#memUpdateForm").attr({
					"method":"GET",
					"action":"memberDelete.do"
				}).submit();
			});
			
			// ALL
			$(document).on("click", "#SALL", function(){
				location.href="memberSelectAllPage.do";
			});
		});

	//썸네일
	function setThumbnail(e){
		console.log(e);
		no = e.target.name.slice(-2);
		
		var reader = new FileReader();
		reader.onload = function(e)
		{
			console.log("thumb+no >>> : " + "thumb"+no);
			$("#thumb"+no).attr("src", e.target.result);
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");


	List<MemberVO> aList = (List)obj;
	int nCnt = aList.size();	
	
	String no = "";	
	String level = "";
	String id = "";
	String pw = "";	
	String name = "";
	String nick = "";
	String hp = "";
	String email = "";
	String addr = "";
	String zipcode = "";
	String addrdetail = "";
	String photo = "";
	String insertdate = "";
	String updatedate = "";
	String deleteyn = "";
	
	
	if(nCnt ==1){
		MemberVO mvo = aList.get(0);
		
	no = mvo.getMno();
	level = mvo.getMlevel();
	id = mvo.getMid();
	pw = mvo.getMpw();
	name = mvo.getMname();
	nick = mvo.getMnick();
	hp = mvo.getMhp();
	email = mvo.getMemail();
	addr = mvo.getMaddr();
	zipcode = mvo.getMzipcode();
	addrdetail = mvo.getMaddrdetail();
	photo = mvo.getMphoto();
	insertdate = mvo.getMinsertdate(); 
	updatedate = mvo.getMupdatedate();
	deleteyn = mvo.getMdeleteyn(); 
	}
%>
<div id ="wrapper">
<div class="jumbotron">
<div class="section-header">회원 조회</div>
	<form name ="memUpdateForm" id="memUpdateForm">
	<table class="table">
		<tr>
			<td class="tt">회원 번호 </td>
			<td><input type="text" class="form-control" name="mno" id="mno" value="<%= no %>" readonly/></td>
		</tr>
		<tr>
			<td class="tt"> 아이디 </td>
			<td><input type="text" class="form-control" name="mid" id="mid" value="<%= id %>" readonly/></td>
		</tr>
		<tr>
			<td class="tt"> 비밀 번호 </td>
			<td><input type="text" class="form-control" name="mpw" id="mpw" value="<%= pw %>" readonly/></td>
		</tr>
		<tr>
			<td class="tt"> 이름 </td>
			<td><input type="text" class="form-control" name="mname" id="mname" value="<%= name %>" readonly/></td>
		</tr>
		<tr>
			<td class="tt"> 닉네임 </td>
			<td><input type="text" class="form-control" name="mnick" id="mnick" value="<%= nick %>" /></td>
		</tr>
		<tr>
			<td class="tt">전화 번호 </td>
			<td><input type="text" class="form-control" name="mhp" id="mhp" value="<%= hp %>" /></td>
		</tr>
		<tr>
			<td class="tt">이메일 </td>
			<td><input type="text" class="form-control" name="memail" id ="memail" value="<%= email %>" /></td>
		</tr>
		<tr>
			<td class="tt">도로명주소 </td>
			<td><input type="text" class="form-control"  name="maddr" id="maddr" placeholder="도로명주소" value="<%= addr %>" /></td>
		</tr>
		<tr>
		<td class="tt">사진  </td>
		<td><img id="thumb00" src="<%=new FileLoadUtil().getFileSrc("member",  photo)%>"><br>
			이미지 변경하기▼ 
			<input type="file" class="form-control" id="inputGroupFile02" name="file00" onchange="setThumbnail(event);">	
		</td>
		</tr>
		<tr>
			<td class="tt">등록일</td>
			<td><input type="text" class="form-control" name="minsertdate" id="minsertdate" value="<%=insertdate %>" readonly></td>
		</tr>
		<tr>
			<td class="tt">수정일</td>
			<td><input type="text" class="form-control" name="mupdatedate" id="mupdatedate" value="<%=updatedate %>" readonly></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-orange" value="수정" id="U">
				<input type="button" class="btn btn-orange" value="삭제" id="D">
				<input type="reset" class="btn btn-orange" value="취소">
				 &nbsp;&nbsp;&nbsp;&nbsp;
			    <input type="button" class="btn btn-orange" value="목록" id="SALL">
			</td>
		</tr>
	</table>
	</form>
</div>
</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>