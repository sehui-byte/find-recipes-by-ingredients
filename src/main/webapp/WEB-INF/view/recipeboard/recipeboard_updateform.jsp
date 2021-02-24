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
				console.log(e);
				no = e.target.name.slice(-2);
				
				var reader = new FileReader();
				reader.onload = function(e)
				{
					console.log("thumb+no >>> : " + "thumb"+no);
					$("#thumb"+no).attr("src", e.target.result);
				}
				reader.readAsDataURL(event.target.files[0]);
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
					<td><img id="thumb00" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getMain_img())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="main_img" name="file00" type="file" onchange="setThumbnail(event);"></td>
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
				
				
				
				
				<tr>
					<td>만드는법 02</td>
					<td><input id="manual02" name="manual02" type="text" value="<%=rbvo.getManual02()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_02</td>
					<td><img id="thumb02" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img02())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img02" name="file02" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 03</td>
					<td><input id="manual03" name="manual03" type="text" value="<%=rbvo.getManual03()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_03</td>
					<td><img id="thumb03" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img03())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img03" name="file03" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				
				<tr>
					<td>만드는법 04</td>
					<td><input id="manual04" name="manual04" type="text" value="<%=rbvo.getManual04()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_04</td>
					<td><img id="thumb04" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img04())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img04" name="file04" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 04</td>
					<td><input id="manual04" name="manual04" type="text" value="<%=rbvo.getManual04()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_04</td>
					<td><img id="thumb04" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img04())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img04" name="file04" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 05</td>
					<td><input id="manual05" name="manual05" type="text" value="<%=rbvo.getManual05()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_05</td>
					<td><img id="thumb05" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img05())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img05" name="file05" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 06</td>
					<td><input id="manual06" name="manual06" type="text" value="<%=rbvo.getManual06()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_06</td>
					<td><img id="thumb06" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img06())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img06" name="file06" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 07</td>
					<td><input id="manual07" name="manual07" type="text" value="<%=rbvo.getManual07()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_07</td>
					<td><img id="thumb07" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img07())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img07" name="file07" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 08</td>
					<td><input id="manual08" name="manual08" type="text" value="<%=rbvo.getManual08()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_03</td>
					<td><img id="thumb08" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img08())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img08" name="file08" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 09</td>
					<td><input id="manual09" name="manual09" type="text" value="<%=rbvo.getManual09()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_09</td>
					<td><img id="thumb09" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img09())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img09" name="file09" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 10</td>
					<td><input id="manual10" name="manual03" type="text" value="<%=rbvo.getManual10()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_03</td>
					<td><img id="thumb10" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img10())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img10" name="file10" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 11</td>
					<td><input id="manual11" name="manual11" type="text" value="<%=rbvo.getManual11()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_11</td>
					<td><img id="thumb11" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img11())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img11" name="file11" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 12</td>
					<td><input id="manual12" name="manual12" type="text" value="<%=rbvo.getManual12()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_12</td>
					<td><img id="thumb12" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img12())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img12" name="file12" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 13</td>
					<td><input id="manual13" name="manual13" type="text" value="<%=rbvo.getManual13()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_13</td>
					<td><img id="thumb13" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img13())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img13" name="file13" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				
				<tr>
					<td>만드는법 14</td>
					<td><input id="manual14" name="manual14" type="text" value="<%=rbvo.getManual14()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_14</td>
					<td><img id="thumb14" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img14())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img14" name="file14" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 14</td>
					<td><input id="manual14" name="manual14" type="text" value="<%=rbvo.getManual14()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_14</td>
					<td><img id="thumb14" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img14())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img14" name="file14" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 15</td>
					<td><input id="manual15" name="manual15" type="text" value="<%=rbvo.getManual15()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_15</td>
					<td><img id="thumb15" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img15())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img15" name="file15" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 16</td>
					<td><input id="manual16" name="manual16" type="text" value="<%=rbvo.getManual16()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_16</td>
					<td><img id="thumb16" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img16())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img16" name="file16" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 17</td>
					<td><input id="manual17" name="manual17" type="text" value="<%=rbvo.getManual17()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_17</td>
					<td><img id="thumb17" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img17())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img17" name="file17" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 18</td>
					<td><input id="manual18" name="manual18" type="text" value="<%=rbvo.getManual18()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_13</td>
					<td><img id="thumb18" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img18())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img18" name="file18" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 19</td>
					<td><input id="manual19" name="manual19" type="text" value="<%=rbvo.getManual19()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_19</td>
					<td><img id="thumb19" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img19())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img19" name="file19" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				
				<tr>
					<td>만드는법 20</td>
					<td><input id="manual10" name="manual03" type="text" value="<%=rbvo.getManual20()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_20</td>
					<td><img id="thumb10" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img20())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img20" name="file20" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
			</table>
		</form>
	</body>
</html>