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
<script type="text/javascript">
	

	
$(document).ready(function(){
	

			// U
			$(document).on("click", "#U", function(){
				alert("U >>> :");
				$("#memUpdateForm").attr({
					"method":"GET",
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
				location.href="memberSelectAll.do";
			});
		});




</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");


	List<MemberVO> aList = (List)obj;
	int nCnt = aList.size();
	out.println( "nCnt >>> : " +nCnt );
	
	
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
<div>
<form name ="memUpdateForm" id="memUpdateForm">
<h2><font size="4" style="color:Blue;">전지적 냉장고 시점 : 회원 조회</font>			</h2>
<hr>
<table border="1">
<tr>
<td colspan="2" align="center">
	<font size="4" style="color:Blue;">전지적냉장고시점</font>
</td>
</tr>
<tr>
<td class="mem">회원 번호 </td>
<td><input type="text" name="mno" id="mno" value="<%= no %>" readonly/></td>
</tr>
<tr>
<td class="mem"> 아이디 </td>
<td><input type="text" name="mid" id="mid" value="<%= id %>" /></td>
</tr>
<tr>
<td class="mem"> 비밀 번호 </td>
<td><input type="text" name="mpw" id="mpw" value="<%= pw %>" /></td>
</tr>
<tr>
<td class="mem"> 이름 </td>
<td><input type="text" name="mname" id="mname" value="<%= name %>" /></td>
</tr>
<tr>
<td class="mem"> 닉네임 </td>
<td><input type="text" name="mnick" id="mnick" value="<%= nick %>" /></td>
</tr>
<tr>
<td class="mem">전화 번호 </td>
<td><input type="text" name="mhp" id="mhp" value="<%= hp %>" /></td>
</tr>
<tr>
<td class="mem">이메일 </td>
<td><input type="text" name="memail" id ="memail" value="<%= email %>" /></td>
</tr>
<tr>
<td class="mem">도로명주소 </td>
<td><input type="text" name="maddr" id="maddr" placeholder="도로명주소" value="<%= addr %>" /></td>
</tr>
<tr>
<td class="mem">사진  </td>
<td>
<img src="<%= new FileLoadUtil().getFileSrc("member",  photo) %>" border="1" width="40" height="50" alt="image">
</td>
</tr>
<tr>
<td class="mem">등록일</td>
<td><input type="text" name="minsertdate" id="minsertdate" value="<%=insertdate %>" readonly></td>
</tr>
<tr>
<td class="mem">수정일</td>
<td><input type="text" name="mupdatedate" id="mupdatedate" value="<%=updatedate %>" readonly></td>
</tr>

<tr>
	<td colspan="2">
		<input type="button" value="수정" id="U">
		<input type="button" value="삭제" id="D">
		<input type="reset" value="취소">
		 &nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="목록" id="SALL">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>