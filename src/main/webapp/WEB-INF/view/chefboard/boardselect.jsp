<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chefboard.vo.ChefBoardVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세프레시피 상세보기</title>
<script type="text/javascript">

	$(document).ready(function(){
		
				// 추천 내역 확인하기	
					var mno = "<%= mno %>";
					var rbno = $("#rbno").val();
					var recipeType = "user";

					var url = "/kosmoJns/favorites/favRecipeCheck.do";

					var data = {
							"mno" : mno,
							"rbno" : rbno,
							"recipeType" : recipeType};
					$.ajax({
						url : url,
						method : "GET",
						data : data,
						success : whenSuccess,
						error : whenError
					});
					
					function whenSuccess(data){
						if (data == "CHECK"){
							$("#FavRecipe").text("추천 취소하기");
						}else{
							$("#FavRecipe").text("추천하기");
						}
					}

					function whenError(data){
						alert("서비스에 문제가 발생하였습니다. 담당자에게 문의하시기 바랍니다.");
					}
				
				$("#FavRecipe").on("click", function(){
					var mno = "<%= mno %>";
					if (mno == null && mno.length == 0){
						alert("비회원을 추천을 할 수 없습니다. 회원 가입 후에 이용해주시기 바랍니다.");
						return;
					}

					var rbno = $("#rbno").val();
					var recipeType = "user";
					var data = {
							"mno" : mno,
							"rbno" : rbno,
							"recipeType" : recipeType};

					var url = "/kosmoJns/favorites/favRecipe.do";

					$.ajax({
						url : url,
						method : "GET",
						data : data,
						success : whenSuccess,
						error : whenError
					});
					
					function whenSuccess(data){
						if (data == "OK"){
							alert("해당 레시피를 추천했습니다. 추천 레시피는 나의 추천 레시피에서 확인하실 수 있습니다");
							$("#FavRecipe").text("추천 취소하기");
						}else if(data == "DeleteOK"){
							alert("해당 레시피 추천을 취소하였습니다.");
							$("#FavRecipe").text("추천하기");
						}else{
							alert("서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주십시오.");
						}
					}

					function whenError(data){
						alert("서비스에 문제가 발생하였습니다. 담당자에게 문의하시기 바랍니다.");
					}
				})
		
		// 수정
		$(document).on("click", "#U", function(){
			$("#b_data").attr({"method":"POST"
									   ,"action":"/kosmoJns/chefboard/updateform.do"}).submit();
		});
		
		
		// 삭제
		$(document).on("click", "#D", function(){
			$("#b_data").attr({"method":"POST"
									   ,"action":"/kosmoJns/chefboard/boarddelete.do"}).submit();
		});
		
		
		// 취소
		$(document).on("click", "#C", function(){
			location.href="/kosmoJns/chefboard/boardselectall.do";
		});
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
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
			<td>글번호</td>
			<td><%=cbvo.getRbno()%>
				<input type="hidden" id="rbno" name="rbno" value="<%=cbvo.getRbno()%>">
			</td>		
		</tr>
		<tr>
			<td>메뉴명</td>
			<td><%=cbvo.getRcp_nm()%></td>
		</tr>
		<tr>
			<td>조리방법</td>
			<td><%=cbvo.getRcp_way2()%></td>
		</tr>
		<tr>
			<td>요리종류</td>
			<td><%=cbvo.getRcp_pat2()%></td>
		</tr>
		<tr>
			<td>해쉬태그</td>
			<td><%=cbvo.getHash_tag() == null ? "--" : "#" + cbvo.getHash_tag()%></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><img src="<%=cbvo.getMain_img()%>" width="300" height="300"></td>
		</tr>
		<tr>
			<td>재료정보</td>
			<td><%=cbvo.getRcp_parts_dtls()%></td>
		</tr>
		
		<%
			if(cbvo.getManual01() != null && cbvo.getManual01().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 1</td>
					<td><%=cbvo.getManual01()%></td>
				</tr>
		<%
				if(cbvo.getManual_img01() != null && cbvo.getManual_img01().length() > 0)
				{
		%>
					<tr>
						<td>만드는법1_이미지</td>
						<td><img src="<%=cbvo.getManual_img01()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual02() != null && cbvo.getManual02().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 2</td>
					<td><%=cbvo.getManual02()%></td>
				</tr>
		<%
				if(cbvo.getManual_img02() != null && cbvo.getManual_img02().length() > 0)
				{
		%>
					<tr>
						<td>만드는법2_이미지</td>
						<td><img src="<%=cbvo.getManual_img02()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual03() != null && cbvo.getManual03().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 3</td>
					<td><%=cbvo.getManual03()%></td>
				</tr>
		<%
				if(cbvo.getManual_img03() != null && cbvo.getManual_img03().length() > 0)
				{
		%>
					<tr>
						<td>만드는법3_이미지</td>
						<td><img src="<%=cbvo.getManual_img03()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual04() != null && cbvo.getManual04().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 4</td>
					<td><%=cbvo.getManual04()%></td>
				</tr>
		<%
				if(cbvo.getManual_img04() != null && cbvo.getManual_img04().length() > 0)
				{
		%>
					<tr>
						<td>만드는법4_이미지</td>
						<td><img src="<%=cbvo.getManual_img04()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual05() != null && cbvo.getManual05().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 5</td>
					<td><%=cbvo.getManual05()%></td>
				</tr>
		<%
				if(cbvo.getManual_img05() != null && cbvo.getManual_img05().length() > 0)
				{
		%>
					<tr>
						<td>만드는법5_이미지</td>
						<td><img src="<%=cbvo.getManual_img05()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual06() != null && cbvo.getManual06().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 6</td>
					<td><%=cbvo.getManual06()%></td>
				</tr>
		<%
				if(cbvo.getManual_img06() != null && cbvo.getManual_img06().length() > 0)
				{
		%>
					<tr>
						<td>만드는법6_이미지</td>
						<td><img src="<%=cbvo.getManual_img06()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual07() != null && cbvo.getManual07().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 7</td>
					<td><%=cbvo.getManual07()%></td>
				</tr>
		<%
				if(cbvo.getManual_img07() != null && cbvo.getManual_img07().length() > 0)
				{
		%>
					<tr>
						<td>만드는법7_이미지</td>
						<td><img src="<%=cbvo.getManual_img07()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual08() != null && cbvo.getManual08().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 8</td>
					<td><%=cbvo.getManual08()%></td>
				</tr>
		<%
				if(cbvo.getManual_img08() != null && cbvo.getManual_img08().length() > 0)
				{
		%>
					<tr>
						<td>만드는법8_이미지</td>
						<td><img src="<%=cbvo.getManual_img08()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual09() != null && cbvo.getManual09().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 9</td>
					<td><%=cbvo.getManual09()%></td>
				</tr>
		<%
				if(cbvo.getManual_img09() != null && cbvo.getManual_img09().length() > 0)
				{
		%>
					<tr>
						<td>만드는법9_이미지</td>
						<td><img src="<%=cbvo.getManual_img09()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual10() != null && cbvo.getManual10().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 10</td>
					<td><%=cbvo.getManual10()%></td>
				</tr>
		<%
				if(cbvo.getManual_img10() != null && cbvo.getManual_img10().length() > 0)
				{
		%>
					<tr>
						<td>만드는법10_이미지</td>
						<td><img src="<%=cbvo.getManual_img10()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual11() != null && cbvo.getManual11().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 11</td>
					<td><%=cbvo.getManual11()%></td>
				</tr>
		<%
				if(cbvo.getManual_img11() != null && cbvo.getManual_img11().length() > 0)
				{
		%>
					<tr>
						<td>만드는법11_이미지</td>
						<td><img src="<%=cbvo.getManual_img11()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual12() != null && cbvo.getManual12().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 12</td>
					<td><%=cbvo.getManual12()%></td>
				</tr>
		<%
				if(cbvo.getManual_img12() != null && cbvo.getManual_img12().length() > 0)
				{
		%>
					<tr>
						<td>만드는법12_이미지</td>
						<td><img src="<%=cbvo.getManual_img12()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual13() != null && cbvo.getManual13().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 13</td>
					<td><%=cbvo.getManual13()%></td>
				</tr>
		<%
				if(cbvo.getManual_img13() != null && cbvo.getManual_img13().length() > 0)
				{
		%>
					<tr>
						<td>만드는법13_이미지</td>
						<td><img src="<%=cbvo.getManual_img13()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual14() != null && cbvo.getManual14().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 14</td>
					<td><%=cbvo.getManual14()%></td>
				</tr>
		<%
				if(cbvo.getManual_img14() != null && cbvo.getManual_img14().length() > 0)
				{
		%>
					<tr>
						<td>만드는법14_이미지</td>
						<td><img src="<%=cbvo.getManual_img14()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual15() != null && cbvo.getManual15().length() > 0)
			{
		%>
				<tr>
					<td>만드는법15</td>
					<td><%=cbvo.getManual15()%></td>
				</tr>
		<%
				if(cbvo.getManual_img15() != null && cbvo.getManual_img15().length() > 0)
				{
		%>
					<tr>
						<td>만드는법15_이미지</td>
						<td><img src="<%=cbvo.getManual_img15()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual16() != null && cbvo.getManual16().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 16</td>
					<td><%=cbvo.getManual16()%></td>
				</tr>
		<%
				if(cbvo.getManual_img16() != null && cbvo.getManual_img16().length() > 0)
				{
		%>
					<tr>
						<td>만드는법16_이미지</td>
						<td><img src="<%=cbvo.getManual_img16()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual17() != null && cbvo.getManual17().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 17</td>
					<td><%=cbvo.getManual17()%></td>
				</tr>
		<%
				if(cbvo.getManual_img17() != null && cbvo.getManual_img17().length() > 0)
				{
		%>
					<tr>
						<td>만드는법17_이미지</td>
						<td><img src="<%=cbvo.getManual_img17()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual18() != null && cbvo.getManual18().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 18</td>
					<td><%=cbvo.getManual18()%></td>
				</tr>
		<%
				if(cbvo.getManual_img18() != null && cbvo.getManual_img18().length() > 0)
				{
		%>
					<tr>
						<td>만드는법18_이미지</td>
						<td><img src="<%=cbvo.getManual_img18()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual19() != null && cbvo.getManual19().length() > 0)
			{
		%>
				<tr>
					<td>만드는법19</td>
					<td><%=cbvo.getManual19()%></td>
				</tr>
		<%
				if(cbvo.getManual_img19() != null && cbvo.getManual_img19().length() > 0)
				{
		%>
					<tr>
						<td>만드는법19_이미지</td>
						<td><img src="<%=cbvo.getManual_img19()%>"></td>
					</tr>
		<%		}
			}
		%>
		
		<%
			if(cbvo.getManual20() != null && cbvo.getManual20().length() > 0)
			{
		%>
				<tr>
					<td>만드는법 20</td>
					<td><%=cbvo.getManual20()%></td>
				</tr>
		<%
				if(cbvo.getManual_img20() != null && cbvo.getManual_img20().length() > 0)
				{
		%>
					<tr>
						<td>만드는법20_이미지</td>
						<td><img src="<%=cbvo.getManual_img20()%>"></td>
					</tr>
		<%		}
			}
		%>		
		<tr>
			<td>등록일</td>
			<td><%=cbvo.getRb_insertdate()%></td>
		</tr>
		<tr>
			<td>수정일</td>
			<td><%=cbvo.getRb_updatedate()%></td>
		</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="" name="FavRecipe" id="FavRecipe">추천하기</button>
					<input type="hidden" name="rbno" id="rbno" value="<%= cbvo.getRbno() %>" />
				</td>
			</tr>
		<tr>
			<td colspan="2" align="right">
				<button type="button" id="U" >수정</button>
				<button type="button" id="D" >삭제</button>
				<button type="button" id="C">목록</button>
			</td>
		</tr>
	</table>
</form>
</div>
	<c:import url="/reply/rbreply.do">
	</c:import>
</body>
</html>