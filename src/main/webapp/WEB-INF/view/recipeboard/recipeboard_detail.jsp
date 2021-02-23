<%@page import="com.jns.common.Validation"%>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%
		RecipeBoardVO rbvo = (RecipeBoardVO)request.getAttribute("rbvo");
	%>
	<title><%=rbvo.getRcp_nm()%></title>
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
		});
	</script>
</head>
<body>
	<form>
		<table border="1" style="margin: auto;">
			<tr>
				<td colspan="2"><%=rbvo.getRcp_nm()%> |
					<small>
						작성자 : <%=rbvo.getMno()%>
						조회수 : <%=rbvo.getViews()%>
						추천수 : <%=rbvo.getHits()%>
						등록일 : <%=rbvo.getRb_insertdate() %>
					</small>
				</td>
			<%	
				if(rbvo.getRb_updatedate() != null && rbvo.getRb_updatedate().length() > 0)
				{
			%>
					<td>수정일 : <%=rbvo.getRb_updatedate()%></td>
			<%
				}
			%>	
			
			</tr>
			<tr>
				<td>조리방법 : </td>
				<td><%=rbvo.getRcp_way2()%></td>
			</tr>
			<tr>
				<td>요리종류 : </td>
				<td><%=rbvo.getRcp_pat2()%></td>
			</tr>
			<tr>
				<td>해쉬태그 : </td>
				<td><%=rbvo.getHash_tag()%></td>
			</tr>
			<tr>
				<td>메인 이미지 : </td>			
				<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getMain_img())%>"></td>
			</tr>
			<tr>
				<td>재료정보 : </td>
				<td><%=rbvo.getRcp_parts_dtls()%></td>
			</tr>
			
			<!-- 만드는 법 -->
		<%
			if(Validation.strValidation(rbvo.getManual01()))
			{
		%>
				<tr>
					<td>만드는법 01</td>
					<td><%=rbvo.getManual01()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img01()))
			{
		%>
				<tr>
					<td>만드는법 이미지 01</td>
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
					<td>만드는법 02</td>
					<td><%=rbvo.getManual02()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img02()))
			{
		%>
				<tr>
					<td>만드는법 이미지 02</td>
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
					<td>만드는법 03</td>
					<td><%=rbvo.getManual03()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img03()))
			{
		%>
				<tr>
					<td>만드는법 이미지 03</td>
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
					<td>만드는법 04</td>
					<td><%=rbvo.getManual04()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img04()))
			{
		%>
				<tr>
					<td>만드는법 이미지 04</td>
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
					<td>만드는법 05</td>
					<td><%=rbvo.getManual05()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img05()))
			{
		%>
				<tr>
					<td>만드는법 이미지 05</td>
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
					<td>만드는법 06</td>
					<td><%=rbvo.getManual06()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img06()))
			{
		%>
				<tr>
					<td>만드는법 이미지 06</td>
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
					<td>만드는법 07</td>
					<td><%=rbvo.getManual07()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img07()))
			{
		%>
				<tr>
					<td>만드는법 이미지 07</td>
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
					<td>만드는법 08</td>
					<td><%=rbvo.getManual08()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img08()))
			{
		%>
				<tr>
					<td>만드는법 이미지 08</td>
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
					<td>만드는법 09</td>
					<td><%=rbvo.getManual09()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img09()))
			{
		%>
				<tr>
					<td>만드는법 이미지 09</td>
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
					<td>만드는법 10</td>
					<td><%=rbvo.getManual10()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img10()))
			{
		%>
				<tr>
					<td>만드는법 이미지 10</td>
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
					<td>만드는법 11</td>
					<td><%=rbvo.getManual11()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img11()))
			{
		%>
				<tr>
					<td>만드는법 이미지 11</td>
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
					<td>만드는법 12</td>
					<td><%=rbvo.getManual12()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img12()))
			{
		%>
				<tr>
					<td>만드는법 이미지 12</td>
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
					<td>만드는법 13</td>
					<td><%=rbvo.getManual13()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img13()))
			{
		%>
				<tr>
					<td>만드는법 이미지 13</td>
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
					<td>만드는법 14</td>
					<td><%=rbvo.getManual14()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img14()))
			{
		%>
				<tr>
					<td>만드는법 이미지 14</td>
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
					<td>만드는법 15</td>
					<td><%=rbvo.getManual15()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img15()))
			{
		%>
				<tr>
					<td>만드는법 이미지 15</td>
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
					<td>만드는법 16</td>
					<td><%=rbvo.getManual16()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img16()))
			{
		%>
				<tr>
					<td>만드는법 이미지 16</td>
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
					<td>만드는법 17</td>
					<td><%=rbvo.getManual17()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img17()))
			{
		%>
				<tr>
					<td>만드는법 이미지 17</td>
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
					<td>만드는법 18</td>
					<td><%=rbvo.getManual18()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img18()))
			{
		%>
				<tr>
					<td>만드는법 이미지 18</td>
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
					<td>만드는법 19</td>
					<td><%=rbvo.getManual19()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img19()))
			{
		%>
				<tr>
					<td>만드는법 이미지 19</td>
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
					<td>만드는법 20</td>
					<td><%=rbvo.getManual20()%></td>
				</tr>
		<%
			}
			if(Validation.strValidation(rbvo.getManual_img20()))
			{
		%>
				<tr>
					<td>만드는법 이미지 20</td>
					<td><img src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img20())%>"></td>
				</tr>
		<%
			}
		%>
		
		</table>
		
		<input type="button" id="hitsBtn" value="추천">
	</form>
	
</body>
</html>

















