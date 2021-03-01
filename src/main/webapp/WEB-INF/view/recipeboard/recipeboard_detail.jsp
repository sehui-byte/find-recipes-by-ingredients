<%@page import="com.jns.common.Validation"%>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%
		RecipeBoardVO rbvo = (RecipeBoardVO)request.getAttribute("rbvo");
	%>
	<title><%=rbvo.getRcp_nm()%></title>
	<style type="text/css">
	
		/* 02/28 재민: 페이지 디자인 완료 */
		.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;		
		}
		
		.tt{
		text-align: center;
		vertical-align: middle;
		}
		
		
	</style>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		$(document).ready(()=>
		{
			$.ajax
			({
				url:"recipeBoardViewsPP.do",
				data:{rbno:"<%=rbvo.getRbno()%>"},
				type:"GET",
				dataType:"json"
			}).always((data)=>{console.log(data)});
			
			$("#hitsBtn").click(()=>
			{
				$.ajax
				({
					url:"recipeBoardHitsPP.do",
					data:{rbno:"<%=rbvo.getRbno()%>"},
					type:"GET",
					dataType:"json"
				}).always((data)=>{console.log(data); alert("추천하였습니다")});
			});
			
			// 취소
			$(document).on("click", "#C", function(){
				location.href="/kosmoJns/recipeboard.do";
			});
			
	//=======================즐겨찾기==========================
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
							$("#favRecipeUser").text("즐겨찾기 취소하기");
						}else{
							$("#favRecipeUser").text("즐겨찾기");
						}
					}

					function whenError(data){
						alert("실패");
					}
				
				$("#favRecipeUser").on("click", function(){
					var mno = "<%= mno %>";
					if (mno == null && mno.length == 0){
						alert("비회원을 즐겨찾기를 할 수 없습니다. 회원 가입 후에 이용해주시기 바랍니다.");
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
							alert("해당 레시피를 즐겨찾기했습니다. 즐겨찾기 레시피는 나의 즐겨찾기 레시피에서 확인하실 수 있습니다");
							$("#favRecipeUser").text("즐겨찾기 취소하기");
						}else if(data == "DeleteOK"){
							alert("해당 레시피 즐겨찾기를 취소하였습니다.");
							$("#favRecipeUser").text("즐겨찾기");
						}else{
							alert("서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주십시오.");
						}
						
					}

					function whenError(data){
						alert("서비스에 문제가 발생하였습니다. 담당자에게 문의하시기 바랍니다.");
					}
				})
			
		});
	</script>
</head>
<body>
<div id ="wrapper">
	<form>
		<span style="font-size: 14px">Cook Board</span>
		<table class="table">
			<thead>
				<tr>
					<td colspan="2"><h2><%=rbvo.getRcp_nm()%></h2></td>
				</tr>
				<tr>
					<td colspan="2" style="vertical-align: middle;"><%=rbvo.getMno()%>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="hidden" id="mno" name="mno" value="<%=rbvo.getMno()%>">
					<input type="hidden" id="rbno" name="rbno" value="<%=rbvo.getRbno()%>">			
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<span style="font-size: 14px">조회: <%=rbvo.getViews() + 1 %> 추천: <%=rbvo.getHits()%></span>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td class="tt"><span style="font-size: 14px">조리방법</span></td>
				<td><span style="font-size: 14px"><%=rbvo.getRcp_way2()%></span></td>
			</tr>
			<tr>
				<td class="tt"><span style="font-size: 14px">요리종류</span></td>
				<td><span style="font-size: 14px"><%=rbvo.getRcp_pat2()%></span></td>
			</tr>
			<tr>
				<td class="tt" width="20%"><span style="font-size: 14px">해시태그</span></td>
				<td><span style="font-size: 14px"><%=rbvo.getHash_tag() == null ? "--" : "#" + rbvo.getHash_tag()%></span></td>
			</tr>
			<tr>
				<td class="tt">메인 이미지</td>			
				<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getMain_img())%>"></td>
			</tr>
			<tr>
				<td class="tt">재료정보 : </td>
				<td><%=rbvo.getRcp_parts_dtls()%></td>
			</tr>		
			<!-- 만드는 법 -->
		<%
			if(Validation.strValidation(rbvo.getManual01()))
			{
		%>
				<tr>
					<td class="tt">만드는법 01</td>
					<td><%=rbvo.getManual01()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img01()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 01</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img01())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual02()))
			{
		%>
				<tr>
					<td class="tt">만드는법 02</td>
					<td><%=rbvo.getManual02()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img02()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 02</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img02())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual03()))
			{
		%>
				<tr>
					<td class="tt">만드는법 03</td>
					<td><%=rbvo.getManual03()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img03()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 03</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img03())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual04()))
			{
		%>
				<tr>
					<td class="tt">만드는법 04</td>
					<td><%=rbvo.getManual04()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img04()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 04</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img04())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual05()))
			{
		%>
				<tr>
					<td class="tt">만드는법 05</td>
					<td><%=rbvo.getManual05()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img05()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 05</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img05())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual06()))
			{
		%>
				<tr>
					<td class="tt">만드는법 06</td>
					<td><%=rbvo.getManual06()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img06()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 06</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img06())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual07()))
			{
		%>
				<tr>
					<td class="tt">만드는법 07</td>
					<td><%=rbvo.getManual07()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img07()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 07</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img07())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual08()))
			{
		%>
				<tr>
					<td class="tt">만드는법 08</td>
					<td><%=rbvo.getManual08()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img08()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 08</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img08())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual09()))
			{
		%>
				<tr>
					<td class="tt">만드는법 09</td>
					<td><%=rbvo.getManual09()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img09()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 09</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img09())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual10()))
			{
		%>
				<tr>
					<td class="tt">만드는법 10</td>
					<td><%=rbvo.getManual10()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img10()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 10</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img10())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual11()))
			{
		%>
				<tr>
					<td class="tt">만드는법 11</td>
					<td><%=rbvo.getManual11()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img11()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 11</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img11())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual12()))
			{
		%>
				<tr>
					<td class="tt">만드는법 12</td>
					<td><%=rbvo.getManual12()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img12()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 12</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img12())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual13()))
			{
		%>
				<tr>
					<td class="tt">만드는법 13</td>
					<td><%=rbvo.getManual13()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img13()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 13</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img13())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual14()))
			{
		%>
				<tr>
					<td class="tt">만드는법 14</td>
					<td><%=rbvo.getManual14()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img14()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 14</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img14())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual15()))
			{
		%>
				<tr>
					<td class="tt">만드는법 15</td>
					<td><%=rbvo.getManual15()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img15()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 15</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img15())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual16()))
			{
		%>
				<tr>
					<td class="tt">만드는법 16</td>
					<td><%=rbvo.getManual16()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img16()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 16</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img16())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual17()))
			{
		%>
				<tr>
					<td class="tt">만드는법 17</td>
					<td><%=rbvo.getManual17()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img17()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 17</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img17())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual18()))
			{
		%>
				<tr>
					<td class="tt">만드는법 18</td>
					<td><%=rbvo.getManual18()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img18()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 18</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img18())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual19()))
			{
		%>
				<tr>
					<td class="tt">만드는법 19</td>
					<td><%=rbvo.getManual19()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img19()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 19</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img19())%>"></td>
				</tr>
		<%
			}
		%>
		
		
		
		
		
		<%
			if(Validation.strValidation(rbvo.getManual20()))
			{
		%>
				<tr>
					<td class="tt">만드는법 20</td>
					<td><%=rbvo.getManual20()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img20()))
			{
		%>
				<tr>
					<td class="tt">만드는법 이미지 20</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img20())%>"></td>
				</tr>
		<%
			}
		%>
			<tr>
				<td colspan="2" align="right">
					<span style="font-size: 12px;">등록일 : <%=rbvo.getRb_insertdate() %>
						<%	
							if(rbvo.getRb_updatedate() != null && rbvo.getRb_updatedate().length() > 0)
							{
						%>
								수정일 : <%=rbvo.getRb_updatedate()%>
						<%
							}
						%>											
					</span>	
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" class="btn btn-orange" id="hitsBtn" value="추천">
					<input type="button" class="btn btn-orange" name="favRecipeUser" id="favRecipeUser" value="즐겨찾기">
					<input type="button" class="btn btn-orange" id="C" value="목록">
				</td>
			</tr>
		</table>
	</form>
		<c:import url="/reply/rbreply.do">
		</c:import>
</div>	
</body>
</html>

