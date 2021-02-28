
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jns.member.vo.MemberVO"%>
<%@ page import="java.util.List"%>
<!-- header -->
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JNS : 전지적 냉장고 시점 회원 전체 조회</title>
<style type="text/css">
table thead {
	font-weight: bold;
}

#memberListTable {
	table-layout: fixed;
	width: 1080px;
}


tbody td {
	overflow: hidden;
	/*말줄임표 */
	text-overflow: ellipsis;
	/*줄바꿈 막기*/
	white-space: nowrap;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	//체크박스 체크 확인하기 
	function checkOnly(chk) {
		//alert("선택했습니다. >>> : " + chk);
		var chkObj = document.getElementsByName("mno");
		console.log("chkObj >>> : " + chkObj);
		for (var i = 0; i < chkObj.length; i++) {
			if (chkObj[i] != chk) {
				chkObj[i].checked = false;
			}
		}
	}

	$(document).ready(function() {

		$("#I").click(function() {
			//alert("등록 폼 이동 >>> :");
			location.href = 'memberForm.do';
		});

		$(document).on("click", "#U", function() {
			//alert("U >>> :");
			$("#memberList").attr({
				"method" : "GET",
				"action" : "memberSelect.do"
			}).submit();
		});
	});
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

	<%
	Object obj = request.getAttribute("listAll");
	List<MemberVO> list = (List) obj;
	int nCnt = list.size();
	%>
	<div id="wrapper">
		<h2>회원 정보</h2>
		<form name="memberList" id="memberList">
			<table id="memberListTable"  class="table">
				<thead>
					<tr>
						<td class="tt"><input type="checkbox" name="chkAll"
							id="chkAll"></td>
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
				for (int i = 0; i < nCnt; i++) {
					MemberVO mvo = (MemberVO) list.get(i);
				%>
				<tbody>
					<tr>
						<td class="tt"><input type="checkbox" name="mno"
							id="chkInMnum" value=<%=mvo.getMno()%> onclick="checkOnly(this)"
							class="chkbox"></td>
						<td title="<%=mvo.getMno()%>"><%=mvo.getMno()%></td>
						<td title="<%=mvo.getMlevel()%>"><%=mvo.getMlevel()%></td>
						<td title="<%=mvo.getMid()%>"><%=mvo.getMid()%></td>
						<td title="<%=mvo.getMpw()%>"><%=mvo.getMpw()%></td>
						<td title="<%=mvo.getMname()%>"><%=mvo.getMname()%></td>
						<td title="<%=mvo.getMnick()%>"><%=mvo.getMnick()%></td>
						<td title="<%=mvo.getMhp()%>"><%=mvo.getMhp()%></td>
						<td title="<%=mvo.getMemail()%>"><%=mvo.getMemail()%></td>
						<td title="<%=mvo.getMaddr()%>"><%=mvo.getMaddr()%></td>
						<td title="<%=mvo.getMzipcode()%>"><%=mvo.getMzipcode()%></td>
						<td title="<%=mvo.getMaddrdetail()%>"><%=mvo.getMaddrdetail()%></td>
						<td>
							<%-- <img
							src="<%=new FileLoadUtil().getFileSrc("member", mvo.getMphoto())%>"> --%>이미지
						</td>
						<td><%=mvo.getMinsertdate()%></td>
						<td><%=mvo.getMupdatedate()%></td>
						<td><%=mvo.getMdeleteyn()%></td>


					</tr>
					<%
					} // end of if
					%>

				</tbody>
			</table>
		</form>
		<input type="button" value="회원 등록(관리자)" id="I"> <input
			type="button" value="회원정보 수정" id="U">
	</div>
</body>
</html>
