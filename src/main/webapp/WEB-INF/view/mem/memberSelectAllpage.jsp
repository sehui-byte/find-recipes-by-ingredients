<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.jns.member.vo.MemberVO"%>
<%@ page import ="java.util.List" %>    
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>



<!DOCTYPE html>
<html>
<head>
<%
	Object obj2= request.getAttribute("p_mvo");
	MemberVO mvoP = (MemberVO) obj2;
	
	int Size = mvoP.getPageSize();
	int pageSize = mvoP.getPageSize();
	int groupSize = mvoP.getGroupSize();
	int curPage = mvoP.getCurPage();
	int totalCount = mvoP.getTotalCount();
			
%>
<meta charset="UTF-8">
<title>JNS : 전지적 냉장고 시점  회원 전체 조회</title>
<style type="text/css">
	.tt{
		text-align:center;
		font-weight: bold;
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

			//체크박스 체크 확인하기 
			function checkOnly(chk){
			 alert("선택했습니다. >>> : " + chk);
				var chkObj = document.getElementsByName("mno");		
				console.log("chkObj >>> : " + chkObj);
				for (var i=0; i < chkObj.length; i++){
						if (chkObj[i] != chk){
							chkObj[i].checked = false;
						}
				}
			}
		
		$(document).ready(function(){
			
				$("#I").click(function(){	
					alert("등록 폼 이동 >>> :");
					location.href='memberForm.do';			
				});
				
				
				$(document).on("click", "#U", function(){
					alert("U >>> :");
					$("#memberList").attr({
						"method":"GET",
						"action":"memberSelect.do"}).submit();			
				});
				
				
				$(document).on("click", "#searchBtn", function(){
					console.log("searchBtn >>> : ");
					$("#memberList").attr({
						"method":"GET",
						"action":"memberSelectAllPage.do"}).submit();
				});
				
				
				
			});
</script>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>

<%
	Object obj = request.getAttribute("listPage");
	List<MemberVO> list = (List)obj;
	int nCnt = list.size();
	

	
%>
<form name = "memberList" id="memberList">
<table border="1" align="center" class="table table-striped"  > 
<thead>
<tr>
	<td colspan="20" align="center">
		<h2>회원 정보</h2>
	</td>
</tr>

<tr>
		<td colspan="10" align="left">
			<select id="keyfilter" name="keyfilter">
				<option value="key1">회원이름</option>
				<option value="key2">회원아이디</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
			<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일">
			~<input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
			<button type="button" id="searchBtn">검색</button>
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
	<td class="tt">도로명 주소</td>
	<td class="tt">우편번호</td>
	<td class="tt">상세주소</td>	
	<td class="tt">사진</td>
	<td class="tt">등록일</td>
	<td class="tt">수정일</td>
	<td class="tt">삭제여부</td>
</tr>
</thead>
<%
	for(int i=0; i<nCnt; i++){
		MemberVO mvo = list.get(i);
	
%>
<tbody>
<tr>
	<td class="tt">	
		<input type="checkbox" name="mno" id="chkInMnum" 
			value=<%= mvo.getMno()%> onclick="checkOnly(this)"  class="chkbox">
	</td>
	<td class="tt"><%=mvo.getMno() %></td>
	<td class="tt"><%=mvo.getMlevel() %></td>
	<td class="tt"><%=mvo.getMid() %></td>
	<td class="tt"><%=mvo.getMpw() %></td> 
	<td class="tt"><%=mvo.getMname() %></td>
	<td class="tt"><%=mvo.getMnick() %></td>
	<td class="tt"><%=mvo.getMhp() %></td>
	<td class="tt"><%=mvo.getMemail() %></td>
	<td class="tt"><%=mvo.getMaddr() %></td>
	<td class="tt"><%=mvo.getMzipcode() %></td>
	<td class="tt"><%=mvo.getMaddrdetail() %></td>
	<td class="tt"><img src="<%=new FileLoadUtil().getFileSrc("member", mvo.getMphoto()) %>"></td>
	<td class="tt"><%=mvo.getMinsertdate() %></td>
	<td class="tt"><%=mvo.getMupdatedate() %></td>
	<td class="tt"><%=mvo.getMdeleteyn() %></td>
			
			
</tr>
<%
	} // end of if
%>
<tr>

	<td colspan="16" align="right">	
		<input type="button" value="회원 등록(관리자)" id="I">		
		<input type="button" value="회원정보 수정" id="U">
											
	</td>
</tr>
</tbody>
</table>
<br>
	<div class="paging" style="position: absolute; left: 1200px; top: 200px;">
		<jsp:include page="paging.jsp" >
		<jsp:param value="memberSelectAllPage.do" name="url"/>
		<jsp:param value="" name="str"/>
		<jsp:param name="pageSize" value="<%=pageSize%>"/>
		<jsp:param name="groupSize" value="<%=groupSize%>"/>
		<jsp:param name="curPage" value="<%=curPage%>"/>
		<jsp:param name="totalCount" value="<%=totalCount%>"/>	
		</jsp:include>
	</div>
</form>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>
