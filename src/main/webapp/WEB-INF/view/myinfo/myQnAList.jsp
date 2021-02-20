<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>

<%
	Object obj = request.getAttribute("myQnAList");
	List<BoardVO> list = (List)obj;	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#checkAll").click(function(){
			var checkAll = $("#checkAll");	
			if (checkAll.prop("checked")){
				$(".checkbox").prop("checked",true)	
			}else{
				$(".checkbox").prop("checked",false)	
			}
		})	
	
		// 단일 QnA 삭제
		$("#deleteQnA").click(function(){
			var nCnt = $(".checkbox:checked").length;
			if (nCnt == 1){
				var checkedbox = $(".checkbox:checked").val();
				var url = "/kosmoJns/myinfo/myQnADelete.do";
				var data = {
						bno : checkedbox
				};

				$.ajax({
					url : url,
					data : data,
					method : "POST",
					success : whenSuccess,
					error : whenError
				});
				
				function whenSuccess(data){
					if (data == "OK"){
						alert("삭제되었습니다.");
						location.reload();
					}else{
						alert("삭제에 실패하였습니다. ");
					}
				}	
				
				function whenError(data){
					alert("댓글 삭제에 문제가 발생하였습니다. 관리자에게 문의하시기 바랍니다.");
				}
			}else{
				// 2개 이상일 경우에는 어떻게 통신을 하는지 ?
			}
		});
		
		//검색버튼
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#myQnAList").attr({"method":"GET"
								 ,"action":"/kosmoJns/myinfo/myQnAList.do"}).submit();
		});
	})
</script>
</head>
<body>
<form id="myQnAList" name="myQnAList" >
	<table border="1" style="text-align:center; margin-left:auto; margin-right:auto;">
		<thead>
			<tr>
				<td colspan="10" align="center"><h2>내 문의 내역</h2></td>
			</tr>
			<tr>
				<td colspan="10" align="left">
					<select id="keyfilter" name="keyfilter">
						<option value="key1">제목</option>
						<option value="key2">내용</option>
						<option value="key3">제목+내용</option>
					</select>
					<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
					<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일">
					~<input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
					<button type="button" id="searchBtn">검색</button>
				</td>	
			</tr>
		</thead>
		<tr>
			<td>
				<input type="checkbox" id="checkAll">	
			</td>	
			<td>Q&A 내용 </td>	
			<td>질의날짜</td>	
			<td>게시글 답변 댓글</td>	
		</tr>

<% 
	if (list != null){
		int nCnt = list.size();
			for (int i = 0; i < nCnt; i++){
				BoardVO bvo = null;
				bvo = list.get(i);
%>
		<tr>
			<td>
				<input type="checkbox" name="bno" value="<%= bvo.getBno()%>" class="checkbox">	
			</td>	
			<td>
				<a href="qnaSelect?mno=<%= bvo.getMno() %>"><%= bvo.getBcontent() %></a>
			</td>	
			<td><%= bvo.getBinsertdate() %></td>	
			<td>해당 게시글 관련 답변 개수 보여주기</td>	
		</tr>
<%
		} // end of for
	}else{
 %>		
		<tr>
			<td colspan="4">현재 문의하신 게시글이 존재하지 않습니다.</td>	
		</tr>
<% 
	}	
%>
		<tr>
			<td colspan="4">
				<input type="button" name="deleteQnA" id="deleteQnA" value="게시글 삭제">
			</td>
		</tr>	
	</table>
	<input type="hidden" id="mno" name="mno" value="<%= mno %>">
</form>
</body>
</html>