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
<style type="text/css">
	/*google 웹폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');
	
	div, h1, h2, h3, h4, h5, h6, p {
	   font-family: 'Noto Serif KR', serif;
	}

	/*콘텐츠 가운데 정렬*/
	#wrapper {
	max-width: 1020px;
	margin: 0 auto;
	margin-top: 50px;
	}
	
	.tt{
		text-align: center;
		vertical-align: middle;
	}
	
	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
</style>
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
		
		// 숨겨진 행 show
		$(document).on("click", "#downArrow", function(){		
			var target = $(this).closest('tr').next();
			console.log(target);
			target.attr('style', "display:'';");
			
			// 클릭한 이미지 지우기
			$(this).remove();
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
<div id ="wrapper">
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
	<span style="font-size: 14px">Chef Board</span>
	<table class="table">
		<thead>
			<tr>
				<td colspan="3"><h2>레시피 수정하기</h2></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">
					<h4><%=mnick%></h4>
					<input type="hidden" name="mno" id="mno" value="<%=mno%>">
					<input type="hidden" id="rbno" name="rbno" value="<%=cbvo.getRbno()%>">
				</td>
			</tr>
			<tr>
				<td class="align-middle">메뉴명</td>
				<td><input type="text" class="form-control" name="rcp_nm" id="rcp_nm" value="<%=cbvo.getRcp_nm()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">조리방법</td>
				<td><input type="text" class="form-control" name="rcp_way2" id="rcp_way2" value="<%=cbvo.getRcp_way2()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">요리종류</td>
				<td><input type="text" class="form-control" name="rcp_pat2" id="rcp_pat2" value="<%=cbvo.getRcp_pat2()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">해시태그</td>
				<td><input type="text" class="form-control" name="hash_tag" id="hash_tag" value="<%=cbvo.getHash_tag()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">메인 이미지</td>
				<!-- ********************* 경로 수정 필요함 *************************** -->
				<td><img id="thumb00" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getMain_img())%>"><br>
					이미지 변경하기▼ 
					<input type="file" class="form-control" id="main_img" name="file00" onchange="setThumbnail(event);">				
				</td>
			</tr>
			<tr>
				<td class="align-middle">재료정보</td>
				<td><input type="text" class="form-control" id="rcp_parts_dtls" name="rcp_parts_dtls" value="<%=cbvo.getRcp_parts_dtls()%>"></td>
			</tr>
		<%
			if(cbvo.getManual01() != null && cbvo.getManual01().length() > 0)
			{
		%>
			<tr>
				<td class="align-middle">만드는법 1</td>
				<td>
					<textarea class="form-control" name="manual01" id="manual01" rows="10" cols="70"><%=cbvo.getManual01()%></textarea>
					<img id="thumb01" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img01())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img01f" name="manual_img01f" onchange="setThumbnail(event);">
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr>
					<td class="align-middle">만드는법 1</td>
					<td><textarea class="form-control" name="manual01" id="manual01" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img01f" id="manual_img01f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>	
		<%
			if(cbvo.getManual02() != null && cbvo.getManual02().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 2</td>
				<td>
					<textarea class="form-control" name="manual02" id="manual02" rows="10" cols="70"><%=cbvo.getManual02()%></textarea>
					<img id="thumb02" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img02())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img02f" name="manual_img02f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 2</td>
					<td><textarea class="form-control" name="manual02" id="manual02" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img02f" id="manual_img02f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>	
		<%
			if(cbvo.getManual03() != null && cbvo.getManual03().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 3</td>
				<td>
					<textarea class="form-control" name="manual03" id="manual03" rows="10" cols="70"><%=cbvo.getManual03()%></textarea>
					<img id="thumb03" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img03())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img03f" name="manual_img03f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 3</td>
					<td><textarea class="form-control" name="manual03" id="manual03" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img03f" id="manual_img03f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>	
		<%
			if(cbvo.getManual04() != null && cbvo.getManual04().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 4</td>
				<td>
					<textarea class="form-control" name="manual04" id="manual04" rows="10" cols="70"><%=cbvo.getManual04()%></textarea>
					<img id="thumb04" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img04())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img04f" name="manual_img04f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 4</td>
					<td><textarea class="form-control" name="manual04" id="manual04" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img04f" id="manual_img04f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>	
		<%
			if(cbvo.getManual05() != null && cbvo.getManual05().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 5</td>
				<td>
					<textarea class="form-control" name="manual05" id="manual05" rows="10" cols="70"><%=cbvo.getManual05()%></textarea>
					<img id="thumb05" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img05())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img05f" name="manual_img05f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 5</td>
					<td><textarea class="form-control" name="manual05" id="manual05" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img05f" id="manual_img05f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>
		<%
			if(cbvo.getManual06() != null && cbvo.getManual06().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 6</td>
				<td>
					<textarea class="form-control" name="manual06" id="manual06" rows="10" cols="70"><%=cbvo.getManual06()%></textarea>
					<img id="thumb06" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img06())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img06f" name="manual_img06f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 6</td>
					<td><textarea class="form-control" name="manual06" id="manual06" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img06f" id="manual_img06f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>		
		<%
			if(cbvo.getManual07() != null && cbvo.getManual07().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 7</td>
				<td>
					<textarea class="form-control" name="manual07" id="manual07" rows="10" cols="70"><%=cbvo.getManual07()%></textarea>
					<img id="thumb07" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img07())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img07f" name="manual_img07f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 7</td>
					<td><textarea class="form-control" name="manual07" id="manual07" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img07f" id="manual_img07f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>			
		<%
			if(cbvo.getManual08() != null && cbvo.getManual08().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 8</td>
				<td>
					<textarea class="form-control" name="manual08" id="manual08" rows="10" cols="70"><%=cbvo.getManual08()%></textarea>
					<img id="thumb08" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img08())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img08f" name="manual_img08f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 8</td>
					<td><textarea class="form-control" name="manual08" id="manual08" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img08f" id="manual_img08f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>		
		<%
			if(cbvo.getManual09() != null && cbvo.getManual09().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 9</td>
				<td>
					<textarea class="form-control" name="manual09" id="manual09" rows="10" cols="70"><%=cbvo.getManual09()%></textarea>
					<img id="thumb09" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img09())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img09f" name="manual_img09f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 9</td>
					<td><textarea class="form-control" name="manual09" id="manual09" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img09f" id="manual_img09f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>
		<%
			if(cbvo.getManual10() != null && cbvo.getManual10().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 10</td>
				<td>
					<textarea class="form-control" name="manual10" id="manual10" rows="10" cols="70"><%=cbvo.getManual10()%></textarea>
					<img id="thumb10" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img10())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img10f" name="manual_img10f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 10</td>
					<td><textarea class="form-control" name="manual10" id="manual10" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img10f" id="manual_img10f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>	
		<%
			if(cbvo.getManual11() != null && cbvo.getManual11().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 11</td>
				<td>
					<textarea class="form-control" name="manual11" id="manual11" rows="10" cols="70"><%=cbvo.getManual11()%></textarea>
					<img id="thumb11" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img11())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img11f" name="manual_img11f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 11</td>
					<td><textarea class="form-control" name="manual11" id="manual11" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img11f" id="manual_img11f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>			
		<%
			if(cbvo.getManual12() != null && cbvo.getManual12().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 12</td>
				<td>
					<textarea class="form-control" name="manual12" id="manual12" rows="10" cols="70"><%=cbvo.getManual12()%></textarea>
					<img id="thumb12" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img12())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img12f" name="manual_img12f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 12</td>
					<td><textarea class="form-control" name="manual12" id="manual12" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img12f" id="manual_img12f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>			
		<%
			if(cbvo.getManual13() != null && cbvo.getManual13().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 13</td>
				<td>
					<textarea class="form-control" name="manual13" id="manual13" rows="10" cols="70"><%=cbvo.getManual13()%></textarea>
					<img id="thumb13" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img13())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img13f" name="manual_img13f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 13</td>
					<td><textarea class="form-control" name="manual13" id="manual13" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img13f" id="manual_img13f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>
		<%
			if(cbvo.getManual14() != null && cbvo.getManual14().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 14</td>
				<td>
					<textarea class="form-control" name="manual14" id="manual14" rows="10" cols="70"><%=cbvo.getManual14()%></textarea>
					<img id="thumb14" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img14())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img14f" name="manual_img14f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 14</td>
					<td><textarea class="form-control" name="manual14" id="manual14" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img14f" id="manual_img14f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>
		<%
			if(cbvo.getManual15() != null && cbvo.getManual15().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 15</td>
				<td>
					<textarea class="form-control" name="manual15" id="manual15" rows="10" cols="70"><%=cbvo.getManual15()%></textarea>
					<img id="thumb15" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img15())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img15f" name="manual_img15f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 15</td>
					<td><textarea class="form-control" name="manual15" id="manual15" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img15f" id="manual_img15f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>		
		<%
			if(cbvo.getManual16() != null && cbvo.getManual16().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 16</td>
				<td>
					<textarea class="form-control" name="manual16" id="manual16" rows="10" cols="70"><%=cbvo.getManual16()%></textarea>
					<img id="thumb16" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img16())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img16f" name="manual_img16f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 16</td>
					<td><textarea class="form-control" name="manual16" id="manual16" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img16f" id="manual_img16f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>		
		<%
			if(cbvo.getManual17() != null && cbvo.getManual17().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 17</td>
				<td>
					<textarea class="form-control" name="manual17" id="manual17" rows="10" cols="70"><%=cbvo.getManual17()%></textarea>
					<img id="thumb17" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img17())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img17f" name="manual_img17f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 17</td>
					<td><textarea class="form-control" name="manual17" id="manual17" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img17f" id="manual_img17f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>	
		<%
			if(cbvo.getManual18() != null && cbvo.getManual18().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 18</td>
				<td>
					<textarea class="form-control" name="manual17" id="manual17" rows="10" cols="70"><%=cbvo.getManual18()%></textarea>
					<img id="thumb18" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img18())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img18f" name="manual_img18f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 18</td>
					<td><textarea class="form-control" name="manual18" id="manual18" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img18f" id="manual_img18f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>		
		<%
			if(cbvo.getManual19() != null && cbvo.getManual19().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 19</td>
				<td>
					<textarea class="form-control" name="manual19" id="manual19" rows="10" cols="70"><%=cbvo.getManual19()%></textarea>
					<img id="thumb19" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img19())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img19f" name="manual_img19f" onchange="setThumbnail(event);">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 19</td>
					<td><textarea class="form-control" name="manual19" id="manual19" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img19f" id="manual_img19f">
					</td>
					<td style="vertical-align: bottom;">				
						<img src="/kosmoJns/resources/img/down-arrow.png"
	    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
		<%
			}		
		%>
		<%
			if(cbvo.getManual19() != null && cbvo.getManual19().length() > 0)
			{
		%>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 20</td>
				<td>
					<textarea class="form-control" name="manual20" id="manual20" rows="10" cols="70"><%=cbvo.getManual20()%></textarea>
					<img id="thumb20" src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img20())%>"><br>
					이미지 변경하기▼
					<input type="file" class="form-control" id="manual_img20f" name="manual_img20f" onchange="setThumbnail(event);">
				</td>
			</tr>
		<%		
			}else{
		%>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 20</td>
					<td><textarea class="form-control" name="manual20" id="manual20" rows="10" cols="70"></textarea>
						<input type="file" class="form-control" name="manual_img20f" id="manual_img20f">
					</td>
				</tr>
		<%
			}		
		%>
		<tr>
			<td><span style="font-size: 14px">등록일</span></td>
			<td><span style="font-size: 14px"><%=cbvo.getRb_insertdate()%></span></td>
		</tr>
		<tr>
			<td><span style="font-size: 14px">수정일</span></td>
			<td><span style="font-size: 14px"><%=cbvo.getRb_updatedate()%></span></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<button type="button" class="btn btn-orange" id="U" >수정</button>
				<button type="button" class="btn btn-orange" id="D" >삭제</button>
				<button type="button" class="btn btn-orange" id="C">취소</button>
			</td>
		</tr>
		</tbody>
	</table>
</form>
<div>Icons made by <a href="https://www.flaticon.com/kr/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div>
</div>
</body>
</html>