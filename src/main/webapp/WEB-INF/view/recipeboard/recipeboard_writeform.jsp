<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 게시판 글쓰기</title>
		<style type="text/css">
			/* 02/28 재민: 페이지 디자인 완료 */
			.btn-orange { 
				background-color: #F9A781; 
				font-weight: bold;
			}
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
				
				$("#boardList").click(function(){
					location.href="/kosmoJns/recipeboard.do";
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
				
				// 숨겨진 행 show 
				$(document).on("click", "#downArrow", function(){		
					var target = $(this).closest('tr').next();
					console.log(target);
					target.attr('style', "display:'';");
					
					// 클릭한 이미지 지우기
					$(this).remove();
				});
			});
		</script>
	</head>
	
	<body>
		<div id ="wrapper">
		<form id="rbwriteForm" name="rbwriteForm" enctype="multipart/form-data" method="POST">
			<span style="font-size: 14px">Cook Board</span>
			<table class="table">
				<thead>
					<tr>
						<td colspan="3"><h3>레시피 작성하기</h3></td>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td class="align-middle" colspan="3">
						<h5><%=mnick%></h5>
						<input type="hidden" name="mno" id="mno" value="<%=mno%>">
					</td>
				</tr>
				<tr>
					<td class="align-middle">메뉴명</td>
					<td><input type="text" class="form-control" name="rcp_nm" id="rcp_nm" placeholder="제목을 입력해주세요."></td>
				</tr>
				<tr>
					<td class="align-middle" >조리방법</td>
					<td><input type="text" class="form-control" name="rcp_way2" id="rcp_way2"></td>
				</tr>
				<tr>
					<td class="align-middle" >요리종류</td>
					<td><input type="text" class="form-control" name="rcp_pat2" id="rcp_pat2"></td>
				</tr>
				<tr>
					<td class="align-middle">해시태그</td>
					<td><input type="text" class="form-control" name="hash_tag" id="hash_tag" placeholder="# 태그를 입력해주세요."></td>
				</tr>
				<tr>
					<td class="align-middle">메인 이미지</td>
					<td><input class="form-control" id="main_img" name="file00" type="file"></td>
				</tr>
				<tr>
					<td class="align-middle">재료정보</td>
					<td><input class="form-control" id="rcp_parts_dtls" name="rcp_parts_dtls" type="text" placeholder=",로 구분 예)양파 1/6개, 달걀 1개, 소금  1작은술"></td>
				</tr>
				<tr>
					<td class="align-middle">만드는법 01</td>
					<td><textarea class="form-control" name="manual01" id="manual01" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img01" name="file01" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 02</td>
					<td><textarea class="form-control" name="manual02" id="manual02" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img02" name="file02" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 03</td>
					<td><textarea class="form-control" name="manual03" id="manual03" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img03" name="file03" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 04</td>
					<td><textarea class="form-control" name="manual04" id="manual04" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img04" name="file04" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 05</td>
					<td><textarea class="form-control" name="manual05" id="manual05" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img05" name="file05" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 06</td>
					<td><textarea class="form-control" name="manual06" id="manual06" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img06" name="file06" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 07</td>
					<td><textarea class="form-control" name="manual07" id="manual07" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img07" name="file07" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 08</td>
					<td><textarea class="form-control" name="manual08" id="manual08" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img08" name="file08" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 09</td>
					<td><textarea class="form-control" name="manual09" id="manual09" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img09" name="file09" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 10</td>
					<td><textarea class="form-control" name="manual10" id="manual10" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img02" name="file10" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 11</td>
					<td><textarea class="form-control" name="manual11" id="manual11" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img11" name="file11" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 12</td>
					<td><textarea class="form-control" name="manual12" id="manual12" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img12" name="file12" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 13</td>
					<td><textarea class="form-control" name="manual13" id="manual13" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img13" name="file13" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 14</td>
					<td><textarea class="form-control" name="manual14" id="manual14" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img14" name="file14" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 15</td>
					<td><textarea class="form-control" name="manual15" id="manual15" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img15" name="file15" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 16</td>
					<td><textarea class="form-control" name="manual16" id="manual16" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img16" name="file16" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 17</td>
					<td><textarea class="form-control" name="manual17" id="manual17" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img17" name="file17" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 02</td>
					<td><textarea class="form-control" name="manual18" id="manual18" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img18" name="file18" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 19</td>
					<td><textarea class="form-control" name="manual19" id="manual19" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img19" name="file19" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				<tr id="ta" style="display: none;">
					<td class="align-middle">만드는법 20</td>
					<td><textarea class="form-control" name="manual20" id="manual20" rows="10" cols="70"></textarea>
						<input class="form-control" id="manual_img20" name="file20" type="file">
					</td>
					<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
					</td>
				</tr>
				</tbody>
			</table>
			<div id="boardBut">
				<input type="button" class="btn btn-orange" value="저장" id="writeBtn">
				<input type="button" class="btn btn-orange" value="목록" id="boardList">
			</div>
		</form>
		<div>Icons made by <a href="https://www.flaticon.com/kr/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div>
		</div>
	</body>
</html>





















