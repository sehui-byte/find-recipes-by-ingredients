<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
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
<div id="boardTit"><h3>글쓰기</h3></div>
	<form id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td colspan="2"><p style="text-align: center;">레시피 작성하기</p></td>
			</tr>
			<tr>
				<td colspan="2"><p style="text-align: center;">작성자</p></td>
				<td>
					<input type="text" name="mnick" id="mnick" value="<%=mnick%>">
					<input type="hidden" name="mno" id="mno" value="<%=mno%>">
				</td>
			</tr>
			<tr>
				<td>일련번호</td>
				<td></td>
			</tr>
			<tr>
				<td>메뉴명</td>
				<td><input type="text" name="rcp_nm" id="rcp_nm"></td>
			</tr>
			<tr>
				<td>조리방법</td>
				<td><input type="text" name="rcp_way2" id="rcp_way2"></td>
			</tr>
			<tr>
				<td>요리종류</td>
				<td><input type="text" name="rcp_pat2" id="rcp_pat2"></td>
			</tr>
			<tr>
				<td>해쉬태그</td>
				<td>#<input id="hash_tag" name="hash_tag" type="text" placeholder="해쉬태그"></td>
			</tr>
			<tr>
				<td>메인 이미지</td>
				<td><input id="main_imgf" name="main_imgf" type="file"></td>
			</tr>
			<tr>
				<td>재료정보</td>
				<td><input id="rcp_parts_dtls" name="rcp_parts_dtls" type="text" placeholder=",로 구분 예)양파 1/6개, 달걀 1개, 소금  1작은술"></td>
			</tr>
			<tr>
				<td>만드는법 1</td>
				<td><textarea name="manual01" id="manual01" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법1_이미지</td>
				<td><input type="file" name="manual_img01f" id="manual_img01f"></td>
			</tr>
			<tr>
				<td>만드는법 2</td>
				<td><textarea name="manual02" id="manual02" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법2_이미지</td>
				<td><input type="file" name="manual_img02f" id="manual_img02f"></td>
			</tr>
			<tr>
				<td>만드는법 3</td>
				<td><textarea name="manual03" id="manual03" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법3_이미지</td>
				<td><input type="file" name="manual_img03f" id="manual_img03f"></td>
			</tr>
			<tr>
				<td>만드는법 4</td>
				<td><textarea name="manual04" id="manual04" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법4_이미지</td>
				<td><input type="file" name="manual_img04f" id="manual_img04f"></td>
			</tr>
			<tr>
				<td>만드는법 5</td>
				<td><textarea name="manual05" id="manual05" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법5_이미지</td>
				<td><input type="file" name="manual_img05f" id="manual_img05f"></td>
			</tr>
			<tr>
				<td>만드는법 6</td>
				<td><textarea name="manual06" id="manual06" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법6_이미지</td>
				<td><input type="file" name="manual_img06f" id="manual_img06f"></td>
			</tr>
			<tr>
				<td>만드는법 7</td>
				<td><textarea name="manual07" id="manual07" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법7_이미지</td>
				<td><input type="file" name="manual_img07f" id="manual_img07f"></td>
			</tr>
			<tr>
				<td>만드는법 8</td>
				<td><textarea name="manual08" id="manual08" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법8_이미지</td>
				<td><input type="file" name="manual_img08f" id="manual_img08f"></td>
			</tr>
			<tr>
				<td>만드는법 9</td>
				<td><textarea name="manual09" id="manual09" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법9_이미지</td>
				<td><input type="file" name="manual_img09f" id="manual_img09f"></td>
			</tr>
			<tr>
				<td>만드는법 10</td>
				<td><textarea name="manual10" id="manual10" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법10_이미지</td>
				<td><input type="file" name="manual_img10f" id="manual_img10f"></td>
			</tr>
			<tr>
				<td>만드는법 11</td>
				<td><textarea name="manual11" id="manual11" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법11_이미지</td>
				<td><input type="file" name="manual_img11f" id="manual_img11f"></td>
			</tr>
			<tr>
				<td>만드는법 12</td>
				<td><textarea name="manual12" id="manual12" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법12_이미지</td>
				<td><input type="file" name="manual_img12f" id="manual_img12f"></td>
			</tr>
			<tr>
				<td>만드는법 13</td>
				<td><textarea name="manual13" id="manual13" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법13_이미지</td>
				<td><input type="file" name="manual_img13f" id="manual_img13f"></td>
			</tr>
			<tr>
				<td>만드는법 14</td>
				<td><textarea name="manual14" id="manual14" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법14_이미지</td>
				<td><input type="file" name="manual_img14f" id="manual_img14f"></td>
			</tr>
			<tr>
				<td>만드는법 15</td>
				<td><textarea name="manual15" id="manual15" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법15_이미지</td>
				<td><input type="file" name="manual_img15f" id="manual_img15f"></td>
			</tr>
			<tr>
				<td>만드는법 16</td>
				<td><textarea name="manual16" id="manual16" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법16_이미지</td>
				<td><input type="file" name="manual_img16f" id="manual_img16f"></td>
			</tr>
			<tr>
				<td>만드는법 17</td>
				<td><textarea name="manual17" id="manual17" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법17_이미지</td>
				<td><input type="file" name="manual_img17f" id="manual_img17f"></td>
			</tr>
			<tr>
				<td>만드는법 18</td>
				<td><textarea name="manual18" id="manual18" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법18_이미지</td>
				<td><input type="file" name="manual_img18f" id="manual_img18f"></td>
			</tr>
			<tr>
				<td>만드는법 19</td>
				<td><textarea name="manual19" id="manual19" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법19_이미지</td>
				<td><input type="file" name="manual_img19f" id="manual_img19f"></td>
			</tr>
			<tr>
				<td>만드는법 20</td>
				<td><textarea name="manual20" id="manual20" rows="10" cols="70"></textarea></td>
			</tr>
			<tr>
				<td>만드는법20_이미지</td>
				<td><input type="file" name="manual_img20f" id="manual_img20f"></td>
			</tr>
		</table>

<!-- 
	<table id="boardWrite">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="mnick" id="mnick"></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="btitle" id="btitle"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td height="200"><textarea name="bcontent" id="bcontent" rows="10" cols="70"></textarea></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><input type="file" name="bfile" id="bfile"></td>
		</tr>
	</table>
 -->	
	<!--<s:csrfInput/> -->
</form>
<div id="boardBut">
	<input type="button" value="저장" class="but" id="boardInsert">
	<input type="button" value="목록" class="but" id="boardList">
</div>
</body>
</html>