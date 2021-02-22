<%@page import="com.jns.recipe.vo.RecipeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/loginSession.jsp" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 상세정보</title>
		<script type="text/javascript">
			$(document).ready(function(){
				// 추천 내역 확인하기	
					var mno = "<%= mno %>";
					var rcp_seq = $("#rcp_seq").val();
					var recipeType = "API";
					var url = "/kosmoJns/favorites/favRecipeCheck.do";
					var data = {
							"mno" : mno,
							"rcp_seq" : rcp_seq,
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
							$("#subRecipeAPI").val("추천 해제하기");
						}else{
							$("#subRecipeAPI").text("추천하기");
						}
					}

					function whenError(data){
						alert("실패");
					}
				
				$("#subRecipeAPI").on("click", function(){
					var mno = "<%= mno %>";
					if (mno == null && mno.length == 0){
						alert("비회원을 추천을 할 수 없습니다. 회원 가입 후에 이용해주시기 바랍니다.");
						return;
					}
					var rcp_seq = $("#rcp_seq").val();
					var recipeType = "API";
					var data = {
							"mno" : mno,
							"rcp_seq" : rcp_seq,
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
							$("#subRecipeAPI").text("추천 취소하기");
						}else if(data == "DeleteOK"){
							alert("해당 레시피 추천을 취소하였습니다.");
							$("#subRecipeAPI").text("추천하기");
						}else{
							alert("서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주십시오.");
						}
						
					}

					function whenError(data){
						alert("서비스에 문제가 발생하였습니다. 담당자에게 문의하시기 바랍니다.");
					}
				})
			})	
		</script>
	</head>
	
	<%
		RecipeVO rvo = (RecipeVO)request.getAttribute("data");
	%>
	
	<body>
		<table border="1" style="margin: auto;">
			<tr>
				<td colspan="2"><p style="text-align: center;">상세정보</p></td>
			</tr>
			<tr>
				<td>일련번호</td>
				<td><%=rvo.getRcp_seq()%></td>
			</tr>
			<tr>
				<td>메뉴명</td>
				<td><%=rvo.getRcp_nm()%></td>
			</tr>
			<tr>
				<td>조리방법</td>
				<td><%=rvo.getRcp_way2()%></td>
			</tr>
			<tr>
				<td>요리종류</td>
				<td><%=rvo.getRcp_pat2()%></td>
			</tr>
			<tr>
				<td>중량(1인분)</td>
				<td><%=rvo.getInfo_wgt() == null ? "--" : rvo.getInfo_wgt()%></td>
			</tr>
			<tr>
				<td>열량</td>
				<td><%=rvo.getInfo_eng()%></td>
			</tr>
			<tr>
				<td>탄수화물</td>
				<td><%=rvo.getInfo_car()%></td>
			</tr>
			<tr>
				<td>단백질</td>
				<td><%=rvo.getInfo_pro()%></td>
			</tr>
			<tr>
				<td>지방</td>
				<td><%=rvo.getInfo_fat()%></td>
			</tr>
			<tr>
				<td>나트륨</td>
				<td><%=rvo.getInfo_na()%></td>
			</tr>
			<tr>
				<td>해쉬태그</td>
				<td><%=rvo.getHash_tag() == null ? "--" : "#" + rvo.getHash_tag()%></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><img src="<%=rvo.getAtt_file_no_main()%>" width="300" height="300"></td>
			</tr>
			<tr>
				<td>재료정보</td>
				<td><%=rvo.getRcp_parts_dtls()%></td>
			</tr>
			
			<%
				if(rvo.getManual01() != null && rvo.getManual01().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 1</td>
						<td><%=rvo.getManual01()%>></td>
					</tr>
			<%
					if(rvo.getManual_img01() != null && rvo.getManual_img01().length() > 0)
					{
			%>
						<tr>
							<td>만드는법1_이미지</td>
							<td><img src="<%=rvo.getManual_img01()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual02() != null && rvo.getManual02().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 2</td>
						<td><%=rvo.getManual02()%>></td>
					</tr>
			<%
					if(rvo.getManual_img02() != null && rvo.getManual_img02().length() > 0)
					{
			%>
						<tr>
							<td>만드는법2_이미지</td>
							<td><img src="<%=rvo.getManual_img02()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual03() != null && rvo.getManual03().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 3</td>
						<td><%=rvo.getManual03()%>></td>
					</tr>
			<%
					if(rvo.getManual_img03() != null && rvo.getManual_img03().length() > 0)
					{
			%>
						<tr>
							<td>만드는법3_이미지</td>
							<td><img src="<%=rvo.getManual_img03()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual04() != null && rvo.getManual04().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 4</td>
						<td><%=rvo.getManual04()%>></td>
					</tr>
			<%
					if(rvo.getManual_img04() != null && rvo.getManual_img04().length() > 0)
					{
			%>
						<tr>
							<td>만드는법4_이미지</td>
							<td><img src="<%=rvo.getManual_img04()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual05() != null && rvo.getManual05().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 5</td>
						<td><%=rvo.getManual05()%>></td>
					</tr>
			<%
					if(rvo.getManual_img05() != null && rvo.getManual_img05().length() > 0)
					{
			%>
						<tr>
							<td>만드는법5_이미지</td>
							<td><img src="<%=rvo.getManual_img05()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual06() != null && rvo.getManual06().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 6</td>
						<td><%=rvo.getManual06()%>></td>
					</tr>
			<%
					if(rvo.getManual_img06() != null && rvo.getManual_img06().length() > 0)
					{
			%>
						<tr>
							<td>만드는법6_이미지</td>
							<td><img src="<%=rvo.getManual_img06()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual07() != null && rvo.getManual07().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 7</td>
						<td><%=rvo.getManual07()%>></td>
					</tr>
			<%
					if(rvo.getManual_img07() != null && rvo.getManual_img07().length() > 0)
					{
			%>
						<tr>
							<td>만드는법7_이미지</td>
							<td><img src="<%=rvo.getManual_img07()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual08() != null && rvo.getManual08().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 8</td>
						<td><%=rvo.getManual08()%>></td>
					</tr>
			<%
					if(rvo.getManual_img08() != null && rvo.getManual_img08().length() > 0)
					{
			%>
						<tr>
							<td>만드는법8_이미지</td>
							<td><img src="<%=rvo.getManual_img08()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual09() != null && rvo.getManual09().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 9</td>
						<td><%=rvo.getManual09()%>></td>
					</tr>
			<%
					if(rvo.getManual_img09() != null && rvo.getManual_img09().length() > 0)
					{
			%>
						<tr>
							<td>만드는법9_이미지</td>
							<td><img src="<%=rvo.getManual_img09()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual10() != null && rvo.getManual10().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 10</td>
						<td><%=rvo.getManual10()%>></td>
					</tr>
			<%
					if(rvo.getManual_img10() != null && rvo.getManual_img10().length() > 0)
					{
			%>
						<tr>
							<td>만드는법10_이미지</td>
							<td><img src="<%=rvo.getManual_img10()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual11() != null && rvo.getManual11().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 11</td>
						<td><%=rvo.getManual11()%>></td>
					</tr>
			<%
					if(rvo.getManual_img11() != null && rvo.getManual_img11().length() > 0)
					{
			%>
						<tr>
							<td>만드는법11_이미지</td>
							<td><img src="<%=rvo.getManual_img11()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual12() != null && rvo.getManual12().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 12</td>
						<td><%=rvo.getManual12()%>></td>
					</tr>
			<%
					if(rvo.getManual_img12() != null && rvo.getManual_img12().length() > 0)
					{
			%>
						<tr>
							<td>만드는법12_이미지</td>
							<td><img src="<%=rvo.getManual_img12()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual13() != null && rvo.getManual13().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 13</td>
						<td><%=rvo.getManual13()%>></td>
					</tr>
			<%
					if(rvo.getManual_img13() != null && rvo.getManual_img13().length() > 0)
					{
			%>
						<tr>
							<td>만드는법13_이미지</td>
							<td><img src="<%=rvo.getManual_img13()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual14() != null && rvo.getManual14().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 14</td>
						<td><%=rvo.getManual14()%>></td>
					</tr>
			<%
					if(rvo.getManual_img14() != null && rvo.getManual_img14().length() > 0)
					{
			%>
						<tr>
							<td>만드는법14_이미지</td>
							<td><img src="<%=rvo.getManual_img14()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual15() != null && rvo.getManual15().length() > 0)
				{
			%>
					<tr>
						<td>만드는법15</td>
						<td><%=rvo.getManual15()%>></td>
					</tr>
			<%
					if(rvo.getManual_img15() != null && rvo.getManual_img15().length() > 0)
					{
			%>
						<tr>
							<td>만드는법15_이미지</td>
							<td><img src="<%=rvo.getManual_img15()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual16() != null && rvo.getManual16().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 16</td>
						<td><%=rvo.getManual16()%>></td>
					</tr>
			<%
					if(rvo.getManual_img16() != null && rvo.getManual_img16().length() > 0)
					{
			%>
						<tr>
							<td>만드는법16_이미지</td>
							<td><img src="<%=rvo.getManual_img16()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual17() != null && rvo.getManual17().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 17</td>
						<td><%=rvo.getManual17()%>></td>
					</tr>
			<%
					if(rvo.getManual_img17() != null && rvo.getManual_img17().length() > 0)
					{
			%>
						<tr>
							<td>만드는법17_이미지</td>
							<td><img src="<%=rvo.getManual_img17()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual18() != null && rvo.getManual18().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 18</td>
						<td><%=rvo.getManual18()%>></td>
					</tr>
			<%
					if(rvo.getManual_img18() != null && rvo.getManual_img18().length() > 0)
					{
			%>
						<tr>
							<td>만드는법18_이미지</td>
							<td><img src="<%=rvo.getManual_img18()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual19() != null && rvo.getManual19().length() > 0)
				{
			%>
					<tr>
						<td>만드는법19</td>
						<td><%=rvo.getManual19()%>></td>
					</tr>
			<%
					if(rvo.getManual_img19() != null && rvo.getManual_img19().length() > 0)
					{
			%>
						<tr>
							<td>만드는법19_이미지</td>
							<td><img src="<%=rvo.getManual_img19()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(rvo.getManual20() != null && rvo.getManual20().length() > 0)
				{
			%>
					<tr>
						<td>만드는법 20</td>
						<td><%=rvo.getManual20()%>></td>
					</tr>
			<%
					if(rvo.getManual_img20() != null && rvo.getManual_img20().length() > 0)
					{
			%>
						<tr>
							<td>만드는법20_이미지</td>
							<td><img src="<%=rvo.getManual_img20()%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<tr>
				<td>등록일</td>
				<td><%=rvo.getRcp_insertdate()%></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="" name="subRecipeAPI" id="subRecipeAPI">추천</button>
					<input type="hidden" name="rcp_seq" id="rcp_seq" value="<%=	rvo.getRcp_seq() %>" />
				</td>
			</tr>
		</table>
	</body>
</html>
