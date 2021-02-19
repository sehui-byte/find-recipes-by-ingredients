<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>
<%@ page import="com.jns.chefboard.vo.ChefBoardVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD DETAIL</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		
		// 수정
		$(document).on("click", "#U", function(){
			$("#b_data").attr({"method":"POST"
									   ,"action":"/kosmoJns/chefboard/updateForm.do"}).submit();
		});
		
		
		// 삭제
		$(document).on("click", "#D", function(){
			$("#b_data").attr({"method":"POST"
									   ,"action":"/kosmoJns/chefboard/boardDelete.do"}).submit();
		});
		
		
		// 취소
		$(document).on("click", "#C", function(){
			location.href="/kosmoJns/chefboard/boardList.do";
		});
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listD");
	List<ChefBoardVO> list = (List)obj;
	ChefBoardVO cbvo = null;
	if(list.size() == 1){
		cbvo = list.get(0);
	};
%>
<div>
<form name="b_data" id="b_data">
<table border=1>
	<tr>
		<td colspan="2" align="center">게시판 글 상세보기</td>
	</tr>
	<tr>
		<td class="board">글번호</td>
		<td>
			<input type="text" name="bno" id="bno" 
				   value="<%=cbvo.getRbno()%>" readonly>
		</td>
	</tr>
	<tr>
		<td class="board">제목</td>
		<td>
			<input type="text" name="btitle" id="btitle" 
				   value="<%=cbvo.getRcp_nm()%>" readonly>
		</td>
	</tr>
	<tr>
		<td class="board">이름</td>
		<td>
			<input type="text" name="mnick" id="mnick" 
				   value="" readonly>
		</td>
	</tr>
		<tr>
		<td class="board">등록일</td>
		<td>
			<input type="text" name="binsertdate" id="binsertdate"
				   value="<%=cbvo.getRb_insertdate()%>" readonly>
		</td>
	</tr>
	<tr>
		<td class="board">수정일</td>
		<td>
			<input type="text" name="bupdatedate" id="bupdatedate"
	   			   value="<%=cbvo.getRb_updatedate()%>" readonly>
		</td>	
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="bcontent" id="bcontent" cols="50" rows="10"></textarea>
		</td>
	</tr>
	<tr>
		<td class="board">사진</td>
		<td>
			<img src="/c_" 
				 border="1" width="40" height="50" alt="image">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<button type="button" id="U" >수정</button>
			<button type="button" id="D" >삭제</button>
			<button type="button" id="C">취소</button>
		</td>
	</tr>
</table>
</form>
</div>
	<c:import url="/reply/reply.do">
	</c:import>
</body>
</html>