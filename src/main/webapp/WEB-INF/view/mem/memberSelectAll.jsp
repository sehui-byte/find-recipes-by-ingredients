
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jns.member.vo.MemberVO"%>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@ page import="java.util.List"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<!-- header -->
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ include file="/WEB-INF/include/jsp/adminSide.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%
Object obj2 = request.getAttribute("p_mvo");
MemberVO mvoP = (MemberVO) obj2;

int Size = mvoP.getPageSize();
int pageSize = mvoP.getPageSize();
int groupSize = mvoP.getGroupSize();
int curPage = mvoP.getCurPage();
int totalCount = mvoP.getTotalCount();

if (request.getParameter("curPage") != null) {
	curPage = Integer.parseInt(request.getParameter("curPage"));
}
%>
<meta charset="UTF-8">
<title>JNS : 전지적 냉장고 시점 회원 전체 조회</title>
<style type="text/css">
table thead {
	font-weight: bold;
}

#memberListTable {
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
<script>
	function openNav() {
		document.getElementById('adminsidenav').style.width = '250px';
	}
	function closeNav() {
		document.getElementById('adminsidenav').style.width = '10px';
	}
</script>
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

		$(document).on("click", "#searchBtn", function() {
			console.log("searchBtn >>> : ");
			$("#memberList").attr({
				"method" : "GET",
				"action" : "memberSelectAll.do"
			}).submit();
		});
	});
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Object obj = request.getAttribute("listPage");
	List<MemberVO> list = (List) obj;
	int nCnt = list.size();
	%>
	<div id="wrapper">

		<h2>회원 정보</h2>
		<h4>
			활동회원수 :
			<%=totalCount%>명
		</h4>
		<form name="memberList" id="memberList">
			<table id="memberListTable" class="table">
				<thead>
					<tr>
						<td class="tt">체크</td>
						<td class="tt">회원번호</td>
						<td class="tt">등급</td>
						<td class="tt">아이디</td>
						<td class="tt">이름</td>
						<td class="tt">닉네임</td>
						<td class="tt">전화번호</td>
						<td class="tt">이메일</td>
						<td class="tt">등록일</td>
						<td class="tt">수정일</td>
						<td class="tt">활동여부</td>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < nCnt; i++) {
						MemberVO mvo = (MemberVO) list.get(i);
					%>

					<tr>
						<td class="tt"><input type="checkbox" name="mno"
							id="chkInMnum" value=<%=mvo.getMno()%> onclick="checkOnly(this)"
							class="chkbox"/></td>
						<td title="<%=mvo.getMno()%>"><%=mvo.getMno()%></td>
						<td title="<%=mvo.getMlevel()%>"><%=mvo.getMlevel()%></td>
						<td title="<%=mvo.getMid()%>"><%=mvo.getMid()%></td>
						<td title="<%=mvo.getMname()%>"><%=mvo.getMname()%></td>
						<td title="<%=mvo.getMnick()%>"><%=mvo.getMnick()%></td>
						<td title="<%=mvo.getMhp()%>"><%=mvo.getMhp()%></td>
						<td title="<%=mvo.getMemail()%>"><%=mvo.getMemail()%></td>
						<td><%=mvo.getMinsertdate()%></td>
						<td><%=mvo.getMupdatedate()%></td>
						<td><%=mvo.getMdeleteyn()%></td>
					</tr>
					<%
					} // end of if
					%>
					<tr>
						<td colspan="16" align="right">
							<input type="button" value="회원 등록(관리자)" id="I"/> 
							<input type="button" value="회원정보 수정" id="U"/>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- =================  검색창 그리드 설정 ================= -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-6 col-md-4"></div>
					<div class="col-6 col-md-6">
						<div class="row row-cols-2">
							<div class="col-4">
								<select class="form-select" id="keyfilter" name="keyfilter">
									<option value="key1">회원이름</option>
									<option value="key2">회원ID</option>
								</select>
							</div>
							<div class="col-8">
								<div class="input-group">
									<input type="text" class="form-control" id="keyword"
										name="keyword" placeholder="검색어 입력"/> <span
										class="input-group-btn">
										<button class="btn btn-warning" type="button" id="searchBtn">검색</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-6 col-md-4"></div>
				</div>
				<div class="row">
					<div class="col-6 col-md-4"></div>
					<div class="col-6 col-md-4">
						<div class="row row-cols-4">
							<div class="col-4">
								<input type="text" class="form-control" id="startdate"
									name="startdate" size="12" placeholder="시작일">
							</div>
							<div class="col-1">
								<p>~</p>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" id="enddate"
									name="enddate" size="12" placeholder="종료일">
							</div>
							<div class="col-3"></div>
						</div>
					</div>
					<div class="col-6 col-md-4"></div>
				</div>
			</div>
			<!-- =================  검색창 그리드 설정 ================= -->


		</form>


		<br>
		<div class="paging">
			<jsp:include page="../../include/jsp/paging.jsp" flush="true">
				<jsp:param name="url" value="memberSelectAll.do" />
				<jsp:param name="str" value="" />
				<jsp:param name="pageSize" value="<%=pageSize%>" />
				<jsp:param name="groupSize" value="<%=groupSize%>" />
				<jsp:param name="curPage" value="<%=curPage%>" />
				<jsp:param name="totalCount" value="<%=totalCount%>" />
			</jsp:include>
		</div>

	</div>
	<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>
