<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글쓰기 화면</title>
<style type="text/css">
	.tt{
		text-align: center;
		vertical-align: middle;
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
	<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
		<table class="table">
		<thead>
			<tr>
				<td colspan="2"><h2>레시피 작성하기</h2></td>
			</tr>
		</thead>
			<tr>
				<td colspan="2">
					<h4><%=mnick%></h4>
					<input type="hidden" name="mno" id="mno" value="<%=mno%>">
				</td>
			</tr>
			<tr>
				<td class="tt" >메뉴명</td>
				<td><input type="text" class="form-control" name="rcp_nm" id="rcp_nm" placeholder="제목을 입력해주세요."></td>
			</tr>
			<tr>
				<td class="tt" >조리방법</td>
				<td><input type="text" class="form-control" name="rcp_way2" id="rcp_way2"></td>
			</tr>
			<tr>
				<td class="tt" >요리종류</td>
				<td><input type="text" class="form-control" name="rcp_pat2" id="rcp_pat2"></td>
			</tr>
			<tr>
				<td class="tt" >해시태그</td>
				<td><input type="text" class="form-control" name="hash_tag" id="hash_tag" placeholder="# 태그를 입력해주세요."></td>
			</tr>
			<tr>
				<td class="tt" >메인 이미지</td>
				<td><input type="file" class="form-control" id="main_img" name="main_img"></td>
			</tr>
			<tr>
				<td class="tt" >재료정보</td>
				<td><input type="text" class="form-control" id="rcp_parts_dtls" name="rcp_parts_dtls" placeholder=",로 구분 예)양파 1/6개, 달걀 1개, 소금  1작은술"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 1</td>
				<td><textarea class="form-control" name="manual01" id="manual01" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법1_이미지</td>
				<td><input type="file" class="form-control" name="manual_img01" id="manual_img01"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 2</td>
				<td><textarea class="form-control" name="manual02" id="manual02" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법2_이미지</td>
				<td><input type="file" class="form-control" name="manual_img02" id="manual_img02"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 3</td>
				<td><textarea class="form-control" name="manual03" id="manual03" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법3_이미지</td>
				<td><input type="file" name="manual_img03" id="manual_img03"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 4</td>
				<td><textarea name="manual04" id="manual04" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법4_이미지</td>
				<td><input type="file" name="manual_img04" id="manual_img04"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 5</td>
				<td><textarea name="manual05" id="manual05" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법5_이미지</td>
				<td><input type="file" name="manual_img05" id="manual_img05"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 6</td>
				<td><textarea name="manual06" id="manual06" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법6_이미지</td>
				<td><input type="file" name="manual_img06" id="manual_img06"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 7</td>
				<td><textarea name="manual07" id="manual07" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법7_이미지</td>
				<td><input type="file" name="manual_img07" id="manual_img07"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 8</td>
				<td><textarea name="manual08" id="manual08" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법8_이미지</td>
				<td><input type="file" name="manual_img08" id="manual_img08"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 9</td>
				<td><textarea name="manual09" id="manual09" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법9_이미지</td>
				<td><input type="file" name="manual_img09" id="manual_img09"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 10</td>
				<td><textarea name="manual10" id="manual10" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법10_이미지</td>
				<td><input type="file" name="manual_img10" id="manual_img10"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 11</td>
				<td><textarea name="manual11" id="manual11" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법11_이미지</td>
				<td><input type="file" name="manual_img11" id="manual_img11"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 12</td>
				<td><textarea name="manual12" id="manual12" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법12_이미지</td>
				<td><input type="file" name="manual_img12" id="manual_img12"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 13</td>
				<td><textarea name="manual13" id="manual13" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법13_이미지</td>
				<td><input type="file" name="manual_img13" id="manual_img13"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 14</td>
				<td><textarea name="manual14" id="manual14" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법14_이미지</td>
				<td><input type="file" name="manual_img14" id="manual_img14"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 15</td>
				<td><textarea name="manual15" id="manual15" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법15_이미지</td>
				<td><input type="file" name="manual_img15" id="manual_img15"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 16</td>
				<td><textarea name="manual16" id="manual16" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법16_이미지</td>
				<td><input type="file" name="manual_img16" id="manual_img16"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 17</td>
				<td><textarea name="manual17" id="manual17" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법17_이미지</td>
				<td><input type="file" name="manual_img17" id="manual_img17"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 18</td>
				<td><textarea name="manual18" id="manual18" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법18_이미지</td>
				<td><input type="file" name="manual_img18" id="manual_img18"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 19</td>
				<td><textarea name="manual19" id="manual19" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법19_이미지</td>
				<td><input type="file" name="manual_img19" id="manual_img19"></td>
			</tr>
			<tr>
				<td class="tt" >만드는법 20</td>
				<td><textarea name="manual20" id="manual20" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td class="tt" >만드는법20_이미지</td>
				<td><input type="file" name="manual_img20" id="manual_img20"></td>
			</tr>
		</table>
	</form>
<div id="boardBut">
	<input type="button" value="저장" class="but" id="boardInsert">
	<input type="button" value="목록" class="but" id="boardList">
</div>
</body>
</html>