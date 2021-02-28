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
	<style type="text/css">
	
		/* 02/28 재민: 페이지 디자인 완료 */
		.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
		}
	</style>
	<script type="text/javascript">
			$(document).ready(()=>
			{		
				$("#updateBtn").click(()=>
				{

					$("#rbupdateForm").attr("action", "rbupdate.do");
					$("#rbupdateForm").submit();

				});
				
				// 숨겨진 행 show
				$(document).on("click", "#downArrow", function(){		
					var target = $(this).closest('tr').next();
					console.log(target);
					target.attr('style', "display:'';");
					
					// 클릭한 이미지 지우기
					$(this).remove();
				});
				
				// 취소
				$(document).on("click", "#C", function(){
					location.href="/kosmoJns/recipeboard.do";
				});
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
	<div id ="wrapper">
		<form id="rbupdateForm" name="rbupdateForm" enctype="multipart/form-data" method="post">
			<span style="font-size: 14px">Cook Board</span>
			<input type="hidden" id="rbno" name="rbno" value="<%=rbvo.getRbno()%>">
			<input type="hidden" id="mno" name="mno" value="<%=mno%>">
			<table class="table">
				<thead>
					<tr>
						<td colspan="3"><h2>레시피 수정하기</h2></td>
					</tr>
				</thead>
				<tr>
					<td class="align-middle">메뉴명</td>
					<td><input class="form-control" id="rcp_nm" name="rcp_nm" type="text" value="<%=rbvo.getRcp_nm()%>"></td>
				</tr>
				<tr>
					<td class="align-middle">조리방법</td>
					<td><input class="form-control" id="rcp_way2" name="rcp_way2" type="text" value="<%=rbvo.getRcp_way2()%>"></td>
				</tr>
				<tr>
					<td  class="align-middle">요리종류</td>
					<td><input class="form-control" id="rcp_pat2" name="rcp_pat2" type="text" value="<%=rbvo.getRcp_pat2()%>"></td>
				</tr>
				<tr>
					<td class="align-middle">해시태그</td>
					<td><input class="form-control" id="hash_tag" name="hash_tag" type="text" value="<%=rbvo.getHash_tag()%>"></td>
				</tr>
				<tr>
					<td>메인 이미지</td>
					<td><img id="thumb00" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getMain_img())%>"><br>
						이미지 변경하기▼ 
						<input class="form-control" id="main_img" name="file00" type="file" onchange="setThumbnail(event);">
					</td>
				</tr>
				<tr>
					<td>재료정보</td>
					<td><input class="form-control" id="rcp_parts_dtls" name="rcp_parts_dtls" type="text" value="<%=rbvo.getRcp_parts_dtls()%>"></td>
				</tr>
				<%
					if(rbvo.getManual01() != null && rbvo.getManual01().length() > 0)
					{
				%>
					<tr>
						<td class="align-middle">만드는법 1</td>
						<td>
							<textarea class="form-control" name="manual01" id="manual01" rows="10" cols="70"><%=rbvo.getManual01()%></textarea>
							<img id="thumb01" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img01())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img01" name="file01" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img01" name="file01">
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
					if(rbvo.getManual02() != null && rbvo.getManual02().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 2</td>
						<td>
							<textarea class="form-control" name="manual02" id="manual02" rows="10" cols="70"><%=rbvo.getManual02()%></textarea>
							<img id="thumb02" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img02())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img02" name="file02" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img02" name="file02">
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
					if(rbvo.getManual03() != null && rbvo.getManual03().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 3</td>
						<td>
							<textarea class="form-control" name="manual03" id="manual03" rows="10" cols="70"><%=rbvo.getManual03()%></textarea>
							<img id="thumb03" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img03())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img03" name="file03" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img03" name="file03">
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
					if(rbvo.getManual04() != null && rbvo.getManual04().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 4</td>
						<td>
							<textarea class="form-control" name="manual04" id="manual04" rows="10" cols="70"><%=rbvo.getManual04()%></textarea>
							<img id="thumb04" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img04())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img04" name="file04" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img04" name="file04">
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
					if(rbvo.getManual05() != null && rbvo.getManual05().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 5</td>
						<td>
							<textarea class="form-control" name="manual05" id="manual05" rows="10" cols="70"><%=rbvo.getManual05()%></textarea>
							<img id="thumb05" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img05())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img05" name="file05" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img05" name="file05">
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
					if(rbvo.getManual06() != null && rbvo.getManual06().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 6</td>
						<td>
							<textarea class="form-control" name="manual06" id="manual06" rows="10" cols="70"><%=rbvo.getManual06()%></textarea>
							<img id="thumb06" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img06())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img06" name="file06" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img06" name="file06">
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
					if(rbvo.getManual07() != null && rbvo.getManual07().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 7</td>
						<td>
							<textarea class="form-control" name="manual07" id="manual07" rows="10" cols="70"><%=rbvo.getManual07()%></textarea>
							<img id="thumb07" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img07())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img07" name="file07" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img07" name="file07">
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
					if(rbvo.getManual08() != null && rbvo.getManual08().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 8</td>
						<td>
							<textarea class="form-control" name="manual08" id="manual08" rows="10" cols="70"><%=rbvo.getManual08()%></textarea>
							<img id="thumb08" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img08())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img08" name="file08" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img08" name="file08">
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
					if(rbvo.getManual09() != null && rbvo.getManual09().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 9</td>
						<td>
							<textarea class="form-control" name="manual09" id="manual09" rows="10" cols="70"><%=rbvo.getManual09()%></textarea>
							<img id="thumb09" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img09())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img09" name="file09" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img09" name="file09">
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
					if(rbvo.getManual10() != null && rbvo.getManual10().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 10</td>
						<td>
							<textarea class="form-control" name="manual10" id="manual10" rows="10" cols="70"><%=rbvo.getManual10()%></textarea>
							<img id="thumb10" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img10())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img10" name="file10" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img10" name="file10">
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
					if(rbvo.getManual11() != null && rbvo.getManual11().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 11</td>
						<td>
							<textarea class="form-control" name="manual11" id="manual11" rows="10" cols="70"><%=rbvo.getManual11()%></textarea>
							<img id="thumb11" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img11())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img11" name="file11" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img11" name="file11">
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
					if(rbvo.getManual12() != null && rbvo.getManual12().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 12</td>
						<td>
							<textarea class="form-control" name="manual12" id="manual12" rows="10" cols="70"><%=rbvo.getManual12()%></textarea>
							<img id="thumb12" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img12())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img12" name="file12" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img12" name="file12">
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
					if(rbvo.getManual13() != null && rbvo.getManual13().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 13</td>
						<td>
							<textarea class="form-control" name="manual13" id="manual13" rows="10" cols="70"><%=rbvo.getManual13()%></textarea>
							<img id="thumb13" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img13())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img13" name="file13" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img13" name="file13">
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
					if(rbvo.getManual14() != null && rbvo.getManual14().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 14</td>
						<td>
							<textarea class="form-control" name="manual14" id="manual14" rows="10" cols="70"><%=rbvo.getManual14()%></textarea>
							<img id="thumb14" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img14())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img14" name="file14" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img14" name="file14">
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
					if(rbvo.getManual15() != null && rbvo.getManual15().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 15</td>
						<td>
							<textarea class="form-control" name="manual15" id="manual15" rows="10" cols="70"><%=rbvo.getManual15()%></textarea>
							<img id="thumb15" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img15())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img15" name="file15" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img15" name="file15">
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
					if(rbvo.getManual16() != null && rbvo.getManual16().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 16</td>
						<td>
							<textarea class="form-control" name="manual16" id="manual16" rows="10" cols="70"><%=rbvo.getManual16()%></textarea>
							<img id="thumb16" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img16())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img16" name="file16" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img16" name="file16">
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
					if(rbvo.getManual17() != null && rbvo.getManual17().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 17</td>
						<td>
							<textarea class="form-control" name="manual17" id="manual17" rows="10" cols="70"><%=rbvo.getManual17()%></textarea>
							<img id="thumb17" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img17())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img17" name="file17" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img17" name="file17" >
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
					if(rbvo.getManual18() != null && rbvo.getManual18().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 18</td>
						<td>
							<textarea class="form-control" name="manual18" id="manual18" rows="10" cols="70"><%=rbvo.getManual18()%></textarea>
							<img id="thumb18" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img18())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img18" name="file18" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img18" name="file18" >
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
					if(rbvo.getManual19() != null && rbvo.getManual19().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 19</td>
						<td>
							<textarea class="form-control" name="manual19" id="manual19" rows="10" cols="70"><%=rbvo.getManual19()%></textarea>
							<img id="thumb19" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img19())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img19" name="file19" onchange="setThumbnail(event);">
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
								<input type="file" class="form-control" id="manual_img19" name="file19" >
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
					if(rbvo.getManual20() != null && rbvo.getManual20().length() > 0)
					{
				%>
					<tr id="ta" style="display: none;">
						<td class="align-middle">만드는법 20</td>
						<td>
							<textarea class="form-control" name="manual20" id="manual20" rows="10" cols="70"><%=rbvo.getManual20()%></textarea>
							<img id="thumb20" src="<%=new FileLoadUtil().getFileSrc("recipeboard", rbvo.getManual_img20())%>"><br>
							이미지 변경하기▼
							<input type="file" class="form-control" id="manual_img20" name="file20" onchange="setThumbnail(event);">
					</tr>
				<%		
					}else{
				%>
						<tr id="ta" style="display: none;">
							<td class="align-middle">만드는법 20</td>
							<td><textarea class="form-control" name="manual19" id="manual20" rows="10" cols="70"></textarea>
								<input type="file" class="form-control" id="manual_img20" name="file20" >
							</td>

						</tr>
				<%
					}		
				%>
				<tr>
					<td colspan="2" align="right">
						<button type="button" class="btn btn-orange" id="updateBtn" >수정</button>
						<button type="button" class="btn btn-orange" id="C">취소</button>
					</td>
				</tr>			
			</table>
		</form>
	<div>Icons made by <a href="https://www.flaticon.com/kr/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div>
	</div>
	</body>
</html>