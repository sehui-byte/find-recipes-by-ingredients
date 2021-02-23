<%@page import="com.jns.common.FileLoadUtil"%>
<%@page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%
			RecipeBoardVO rbvo = (RecipeBoardVO)request.getAttribute("rbvo");
		%>
		<title>글 수정</title>
	<script type="text/javascript">
			$(document).ready(()=>
			{		
				$("#writeBtn").click(()=>
				{
					if(validation())
					{
						$("#rbwriteForm").attr("action", "rbwrite.do");
						$("#rbwriteForm").submit();
					}
					else
					{
						console.log("else");
					}
				});
				
				function validation()
				{
					var mno = $("#mno").val(); //로그인한 회원번호(작성자)
					var rcp_nm = $("#rcp_nm").val(); //메뉴명
					var rcp_way2 = $("#rcp_way2").val(); //조리방법
					var rcp_pat2 = $("#rcp_pat2").val(); //요리종류
					var hash_tag = $("#hash_tag").val(); //해쉬태그
					var main_img = $("#main_img").val(); //레시피 메인 이미지
					var rcp_parts_dtls = $("#rcp_parts_dtls").val(); //재료정보
					
					console.log("mno >>> : " + mno);
					console.log("rcp_nm >>> : " + rcp_nm);
					console.log("rcp_way2 >>> : " + rcp_way2);
					console.log("rcp_pat2 >>> : " + rcp_pat2);
					console.log("hash_tag >>> : " + hash_tag);
					console.log("main_img >>> : " + main_img);
					console.log("rcp_parts_dtls >>> : " + rcp_parts_dtls);
					
					if(!mno) //"", null, undefined, 0, NaN 값일 경우
					{
						alert("회원번호가 유효하지 않습니다.");
						console.log("mno >>> : " + mno);
					}
					else if(!rcp_nm)
					{
						alert("메뉴명이 유효하지 않습니다.");
						console.log("rcp_nm >>> : " + rcp_nm);
					}
					else if(!rcp_way2)
					{
						alert("조리방법이 유효하지 않습니다.");
						console.log("rcp_way2 >>> : " + rcp_way2);
					}
					else if(!rcp_pat2)
					{
						alert("요리종류가 유효하지 않습니다.");
						console.log("rcp_pat2 >>> : " + rcp_pat2);
					}
					else if(!hash_tag)
					{
						alert("해쉬태그가 유효하지 않습니다.");
						console.log("hash_tag >>> : " + hash_tag);
					}
					else if(!main_img)
					{
						alert("레시피 메인 이미지가 유효하지 않습니다.");
						console.log("main_img >>> : " + main_img);
					}
					else if(!rcp_parts_dtls)
					{
						alert("재료정보가 유효하지 않습니다.");
						console.log("rcp_parts_dtls >>> : " + rcp_parts_dtls);
					}
					else
					{
						return true;
					}
					
					return false;
				};	
			});
			
			function setThumbnail(e)
			{
				no = e.target.files[0].name.slice(-2);
				
				var reader = new FileReader();
				reader.onload = function(e)
				{
					$("#thumb"+no).attr("src", e.target.result);
					console.log(e.target.result);
				}
			}
		</script>
	</head>
	
	<body>
		<form id="rbwriteForm" name="rbwriteForm" enctype="multipart/form-data" method="post">
			<input type="hidden" id="mno" name="mno" value="<%=mno%>">
			<table border="1" style="margin: auto;">
				<tr>
					<td colspan="2"><p style="text-align: center;">글수정</p></td>
				</tr>
				<tr>
					<td>메뉴명</td>
					<td><input id="rcp_nm" name="rcp_nm" type="text" value="<%=rbvo.getRcp_nm()%>"></td>
				</tr>
				<tr>
					<td>조리방법</td>
					<td><input id="rcp_way2" name="rcp_way2" type="text" value="<%=rbvo.getRcp_way2()%>"></td>
				</tr>
				<tr>
					<td>요리종류</td>
					<td><input id="rcp_pat2" name="rcp_pat2" type="text" value="<%=rbvo.getRcp_pat2()%>"></td>
				</tr>
				<tr>
					<td>해쉬태그</td>
					<td>#<input id="hash_tag" name="hash_tag" type="text" value="<%=rbvo.getHash_tag()%>"></td>
				</tr>
				<tr>
					<td>레시피 메인 이미지</td>
					<td><input id="main_img" name="file00" type="file"></td>
				</tr>
				<tr>
					<td>재료정보</td>
					<td><input id="rcp_parts_dtls" name="rcp_parts_dtls" type="text" value="<%=rbvo.getRcp_parts_dtls()%>"></td>
				</tr>
				
				
				<tr>
					<td>만드는법 01</td>
					<td><input id="manual01" name="manual01" type="text" value="<%=rbvo.getManual01()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_01</td>
					<td><img id="thumb01" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img01())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img01" name="file01" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				

			</table>
		</form>
	</body>
</html>