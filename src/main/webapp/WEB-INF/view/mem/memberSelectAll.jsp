<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.jns.member.vo.MemberVO"%>
<%@ page import ="java.util.List" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JNS : 전지적 냉장고 시점  회원 전체 조회</title>
<style type="text/css">
	.tt{
		text-align:center;
		font-weight: bold;
	}
</style>
<script src="http://code/jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		//체크박스 체크 확인하기 
		function checkOnly(chk){
			// alert(">>> : " + chk);
			var chkObj = document.getElementsByName("mno");		
			console.log("chkObj >>> : " + chkObj);
			for (var i=0; i < chkObj.length; i++){
				if (chkObj[i] != chk){
					chkObj[i].checked = false;
				}
			}
		}	
		
			
			$(document).on("click", "#I", function(){
				location.href="memberInsert.do";
			});
			
			$(document).on("click", "#U", function(){
				alert("U >>>");
				$("#memberList").attr({
					"method":"GET",
					"action":"memberSelect.do"}).submit();	
			});
			
			$(document).on("click", "#D", function(){
				alert("D >>>");
				$("#memberList").attr({
					"method":"GET",
					"action":"memberSelect.do"}).submit();
			});
		});
	
	
</script>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
SELECT ALL
<%
	Object obj = request.getAttribute("listAll");
	List<MemberVO> list = (List)obj;
	int nCnt = list.size();
%>
<form name = "memberList" id="memberList">
<table border="1" align="center">
<thead>
<tr>
	<td colspan="20" align="center">
		<h2>회원 정보</h2>
	</td>
</tr>
<tr>
	<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
	<td class="tt">회원번호</td>
	<td class="tt">회원등급</td>	
	<td class="tt">아이디</td>
	<td class="tt">비밀번호</td>
	<td class="tt">이름</td>	
	<td class="tt">닉네임</td>
	<td class="tt">전화번호</td>
	<td class="tt">이메일</td>
	<td class="tt">도로명주소</td>	
	<td class="tt">사진</td>
	<td class="tt">삭제여부</td>
	<td class="tt">등록일</td>
	<td class="tt">수정일</td>
</tr>
</thead>
<%
	for(int i=0; i<nCnt; i++){
		MemberVO mvo = (MemberVO)list.get(i);
	
%>
<tbody>
<tr>
	<td class="tt">	
		<input type="checkbox" name="mno" id="chkInMnum" 
			value=<%= mvo.getMno()%> onclick="checkOnly(this)">
	</td>
	<td class="tt"><%=mvo.getMno() %></td>
	<td class="tt"><%=mvo.getMid() %></td>
	<td class="tt"><%=mvo.getMpw() %></td>
	<td class="tt"><%=mvo.getMname() %></td>
	<td class="tt"><%=mvo.getMnick() %></td>
	<td class="tt"><%=mvo.getMhp() %></td>
	<td class="tt"><%=mvo.getMemail() %></td>
	<td class="tt"><%=mvo.getMaddr() %></td>
	<td class="tt"><%=mvo.getMzipcode() %></td>
	<td class="tt"><%=mvo.getMaddrdetail() %></td>
	<td class="tt"><img src="/kosmoJns/imgupload/<%=mvo.getMphoto()%>"></td>
	<td class="tt"><%=mvo.getMinsertdate() %></td>
	<td class="tt"><%=mvo.getMupdatedate() %></td>
	<td class="tt"><%=mvo.getMdeleteyn() %></td>
			
			
</tr>
<%
	} // end of if
%>
<tr>
	<td colspan="10" align="right">			
		<input type="button" value="회원 목록" id="SALL">
		<input type="button" value="회원정보 수정" id="U">
		<input type="button" value="회원 삭제" id="D">									
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>