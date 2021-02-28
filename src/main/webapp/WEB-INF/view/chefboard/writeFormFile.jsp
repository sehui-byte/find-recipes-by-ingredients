<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
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
	
	$(function(){
		
		//저장
		$("#boardInsert").click(function(){
			
			//입력값 체크
			if(!chkSubmit($('#rcp_nm'),"제목을")) return;
			else if(!chkSubmit($('#manual01'),"작성할 내용을")) return;
			else{
				
				$("#f_writeForm").attr({
					"method": "POST",
					"action": "/kosmoJns/chefboard/boardInsert.do"
				});
				$("#f_writeForm").submit();
			}		
		});
		
		$("#boardList").click(function(){
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
</script>
</head>
<body>
<div id ="wrapper">
	<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
		<span style="font-size: 14px">Chef Board</span>
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
				<td><input type="file" class="form-control" id="main_imgf" name="main_imgf"></td>
			</tr>
			<tr>
				<td class="align-middle">재료정보</td>
				<td><input type="text" class="form-control" id="rcp_parts_dtls" name="rcp_parts_dtls" placeholder=",로 구분 예)양파 1/6개, 달걀 1개, 소금  1작은술"></td>
			</tr>
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
			<tr id="ta" style="display: none;">
				<td class="tt">만드는법 9</td>
				<td><textarea class="form-control" name="manual09" id="manual09" rows="10" cols="70"></textarea>
					<input type="file" class="form-control" name="manual_img09f" id="manual_img09f">
				</td>
				<td style="vertical-align: bottom;">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
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
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 19</td>
				<td><textarea class="form-control" name="manual19" id="manual19" rows="10" cols="70"></textarea>
					<input type="file" class="form-control" name="manual_img19f" id="manual_img19f">
				</td>
				<td class="tb">				
					<img src="/kosmoJns/resources/img/down-arrow.png"
    		 			 alt="down-arrow" style="width:30px; height:30px" id="downArrow">
				</td>
			</tr>
			<tr id="ta" style="display: none;">
				<td class="align-middle">만드는법 20</td>
				<td><textarea class="form-control" name="manual20" id="manual20" rows="10" cols="70"></textarea>
					<input type="file" class="form-control" name="manual_img20f" id="manual_img20f">
				</td>
			</tr>
		</tbody>
		</table>
	</form>
<div id="boardBut">
	<input type="button" class="btn btn-orange" value="저장" id="boardInsert">
	<input type="button" class="btn btn-orange" value="목록" id="boardList">
</div>
<div>Icons made by <a href="https://www.flaticon.com/kr/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div>
</div>
</body>
</html>