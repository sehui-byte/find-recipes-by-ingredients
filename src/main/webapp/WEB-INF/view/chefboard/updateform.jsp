<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chefboard.vo.ChefBoardVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		
		//입력
		$(document).on("click", "#U", function(){
			
			//입력값 체크
			if(!chkSubmit($('#rcp_nm'),"제목을")) return;
			else if(!chkSubmit($('#manual01'),"작성할 내용을")) return;
			else{
				
				$("#f_updateForm").attr({
					"method": "POST",
					"action": "/kosmoJns/chefboard/boardupdate.do",
					"enctype": "multipart/form-data"
				});
				$("#f_updateForm").submit();
			}
		});
		
		//삭제
		$(document).on("click", "#D", function(){
			$("#f_updateForm").attr({"method":"POST"
									   ,"action":"boarddelete.do"}).submit();
		});
		
		// 취소
		$(document).on("click", "#C", function(){
			location.href="/kosmoJns/chefboard/boardselectallpage.do";
		});
		
	});
	
	/**
	 * chkSubmit(유효성 검사 대상, 메시지 내용)
	 */
	function chkSubmit(v_item, v_msg){
		if(v_item.val().replace(/\s/g,"")==""){
			alert(v_msg+" 확인해 주세요.");
			v_item.val("");
			v_item.focus();
			return false;
		}else{
			return true;
		}
	}
	
	
	//썸네일
	function setThumbnail(e){
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
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listS");
	List<ChefBoardVO> list = (List)obj;
	
	ChefBoardVO cbvo = null;
	if(list.size() == 1){
		cbvo = list.get(0);
	};
%>
<form name="f_updateForm" id="f_updateForm">
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
			<td><input type="text" id="rcp_nm" name="rcp_nm" value="<%=cbvo.getRcp_nm()%>"></td>
		</tr>
		<tr>
			<td>조리방법</td>
			<td><input type="text" id="rcp_way2" name="rcp_way2" value="<%=cbvo.getRcp_way2()%>"></td>
		</tr>
		<tr>
			<td>요리종류</td>
			<td><input type="text" id="rcp_pat2" name="rcp_pat2" value="<%=cbvo.getRcp_pat2()%>"></td>
		</tr>
		<tr>
			<td>해쉬태그</td>
			<td>#<input id="hash_tag" name="hash_tag" type="text" value="<%=cbvo.getHash_tag()%>"></td>
		</tr>
		<tr>
			<td>메인 이미지</td>
			<!-- ********************* 경로 수정 필요함 *************************** -->
			<td><img id="thumb00" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getMain_img())%>"></td>
		</tr>
		<tr>
			<td colspan="2">사진 : <input id="main_img" name="file00" type="file" onchange="setThumbnail(event);"></td>
		</tr>
		<tr>
			<td>재료정보</td>
			<td><input type="text" id="rcp_parts_dtls" name="rcp_parts_dtls" value="<%=cbvo.getRcp_parts_dtls()%>"></td>
		</tr>



				<tr>
					<td>만드는법 01</td>
					<td><input id="manual01" name="manual01" type="text" value="<%=cbvo.getManual01()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_01</td>
					<td><img id="thumb01" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img01())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img01" name="file01" type="file" onchange="setThumbnail(event);"></td>
				</tr>

				<tr>
					<td>만드는법1_이미지</td>
					<td><input type="file" name="manual_img01f" id="manual_img01f"></td>
				</tr>	


	
				
				<tr>
					<td>만드는법 02</td>
					<td><input id="manual02" name="manual02" type="text" value="<%=cbvo.getManual02()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_02</td>
					<td><img id="thumb02" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img02())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img02" name="file02" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 03</td>
					<td><input id="manual03" name="manual03" type="text" value="<%=cbvo.getManual03()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_03</td>
					<td><img id="thumb03" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img03())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img03" name="file03" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				
				<tr>
					<td>만드는법 04</td>
					<td><input id="manual04" name="manual04" type="text" value="<%=cbvo.getManual04()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_04</td>
					<td><img id="thumb04" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img04())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img04" name="file04" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 04</td>
					<td><input id="manual04" name="manual04" type="text" value="<%=cbvo.getManual04()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_04</td>
					<td><img id="thumb04" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img04())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img04" name="file04" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 05</td>
					<td><input id="manual05" name="manual05" type="text" value="<%=cbvo.getManual05()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_05</td>
					<td><img id="thumb05" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img05())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img05" name="file05" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 06</td>
					<td><input id="manual06" name="manual06" type="text" value="<%=cbvo.getManual06()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_06</td>
					<td><img id="thumb06" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img06())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img06" name="file06" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 07</td>
					<td><input id="manual07" name="manual07" type="text" value="<%=cbvo.getManual07()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_07</td>
					<td><img id="thumb07" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img07())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img07" name="file07" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 08</td>
					<td><input id="manual08" name="manual08" type="text" value="<%=cbvo.getManual08()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_03</td>
					<td><img id="thumb08" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img08())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img08" name="file08" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 09</td>
					<td><input id="manual09" name="manual09" type="text" value="<%=cbvo.getManual09()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_09</td>
					<td><img id="thumb09" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img09())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img09" name="file09" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 10</td>
					<td><input id="manual10" name="manual03" type="text" value="<%=cbvo.getManual10()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_03</td>
					<td><img id="thumb10" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img10())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img10" name="file10" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 11</td>
					<td><input id="manual11" name="manual11" type="text" value="<%=cbvo.getManual11()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_11</td>
					<td><img id="thumb11" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img11())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img11" name="file11" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 12</td>
					<td><input id="manual12" name="manual12" type="text" value="<%=cbvo.getManual12()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_12</td>
					<td><img id="thumb12" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img12())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img12" name="file12" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 13</td>
					<td><input id="manual13" name="manual13" type="text" value="<%=cbvo.getManual13()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_13</td>
					<td><img id="thumb13" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img13())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img13" name="file13" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				
				<tr>
					<td>만드는법 14</td>
					<td><input id="manual14" name="manual14" type="text" value="<%=cbvo.getManual14()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_14</td>
					<td><img id="thumb14" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img14())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img14" name="file14" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 14</td>
					<td><input id="manual14" name="manual14" type="text" value="<%=cbvo.getManual14()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_14</td>
					<td><img id="thumb14" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img14())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img14" name="file14" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 15</td>
					<td><input id="manual15" name="manual15" type="text" value="<%=cbvo.getManual15()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_15</td>
					<td><img id="thumb15" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img15())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img15" name="file15" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 16</td>
					<td><input id="manual16" name="manual16" type="text" value="<%=cbvo.getManual16()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_16</td>
					<td><img id="thumb16" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img16())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img16" name="file16" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 17</td>
					<td><input id="manual17" name="manual17" type="text" value="<%=cbvo.getManual17()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_17</td>
					<td><img id="thumb17" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img17())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img17" name="file17" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 18</td>
					<td><input id="manual18" name="manual18" type="text" value="<%=cbvo.getManual18()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_13</td>
					<td><img id="thumb18" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img18())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img18" name="file18" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				<tr>
					<td>만드는법 19</td>
					<td><input id="manual19" name="manual19" type="text" value="<%=cbvo.getManual19()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_19</td>
					<td><img id="thumb19" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img19())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img19" name="file19" type="file" onchange="setThumbnail(event);"></td>
				</tr>
				
				
				
				
				
				<tr>
					<td>만드는법 20</td>
					<td><input id="manual10" name="manual03" type="text" value="<%=cbvo.getManual20()%>"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_20</td>
					<td><img id="thumb10" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img20())%>"></td>
				</tr>
				<tr>
					<td colspan="2">사진 : <input id="manual_img20" name="file20" type="file" onchange="setThumbnail(event);"></td>
				</tr>



		<tr>
			<td>등록일</td>
			<td><%=cbvo.getRb_insertdate()%></td>
		</tr>
		<tr>
			<td>수정일</td>
			<td><%=cbvo.getRb_updatedate()%></td>
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
</body>
</html>