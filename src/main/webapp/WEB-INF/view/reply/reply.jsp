<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

	$(function(){
		/* 기본 댓글 목록 불러오기 */
		listAll(bno)
		
		/* 댓글 내용 저장 이벤트 */
		$(document).on("click", "#replyInsert", function(){
			//작성자 이름에 대한 입력여부 검사
			if(!chkSubmit($("#mnick"),"이름을")) return;
			else if(!chkSubmit($("#rcontent"),"내용을")) return;
			else{
				var insertUrl = "/kosmoJns/reply/replyInsert.do";
				console.log("insertUrl >>> : " + insertUrl);
				var method = "POST";
				var dataParam = {
						"bno": $("#bno").val(),
						"mnick": $("#rmnick").val(),
						"rcontent": $("#rcontent").val()
				};
				console.log("dataParam >>> : " + dataParam);
				/* 글 저장을 위한 POST 방삭의 Ajax 연동 처리 */
				$.ajax({
					url : insertUrl,
					type : method,
					data:dataParam,
					success: whenSuccess,
					error: whenError					
				});
				
				function whenSuccess(resultData){
					if(resultData=="GOOD"){
						alert("댓글 등록이 완료되었습니다.");
						dataReset();
						listAll(bno);
					}
				}
				function whenError(){
					alert("시스템 오류입니다. 관리자에게 문의하세요.");
				}
			}
		});
		
		/* 수정 버튼 클릭 시 수정 폼 출력 */
		$(document).on("click", ".update_form", function(){
			$(".reset_btn").click();
			var conText = $(this).parents("li").children().eq(1).html();
			console.log("conText >>> : " + conText);
			$(this).parents("li").find("input[type='button']").hide();
			$(this).parents("li").children().eq(0).html();
			var conArea = $(this).parents("li").children().eq(1);
			
			conArea.html("");
			var data="<textarea name='content' id='content'>" + conText + "</textarea>";
			data += "<input type='button' class='update_btn' value='수정완료'>";
			data += "<input type='button' class='reset_btn' value='수정취소'>";
			conArea.html(data);
		});
		
		/* 초기화 버튼 */
		$(document).on("click", ".reset_btn", function(){
			var conText = $(this).parents("li").fint("textarea").html();
			$(this).parents("li").find("input[type='button']").show();
			var conArea = $(this).parents("li").children().eq(1);
			conArea.html(conText);
		});
		
		/* 글 수정을 위한 Ajax 연동 처리 */
		$(document).on("click", ".update_btn", function(){
			var rno = $(this).parents("li").attr("data-num");
			var rcontent = $("#content").val();
			if(!chkSubmit($("#content"),"댓글 내용을")) return;
			else{
				var updateUrl = "/kosmoJns/reply/"+ rno + ".do";
				console.log("updateUrl >>> : " + updateUrl);
				var method = "PUT";
				var dataParam = JSON.stringify({
					rcontent: rcontent});
				console.log("dataParam >>> : " + dataParam);
				
				$.ajax({
					url: updateUrl,
					type: method,
					headers: {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"PUT"
					},
					data: dataParam,
					dataType:'text',
					success: whenSuccess,
				});
				
				function whenSuccess(result){
					console.log("result >>> : " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						listAll(bno);
					}
				}
			}
		});
		
		/* 글 삭제를 위한 Ajax 연동 처리 */
		$(document).on("click", ".delete_btn", function(){
			var rno = $(this).parents("li").attr("data-num");
			var target = $(this).parents(".comment_item");
			console.log("rno >>> : " + rno);
			console.log("target >>> : " + target);
			
			if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
				
				var deleteUrl = "/kosmoJns/reply/replyDelete.do";
				var method = "POST";
				var dataParam = {
						"rno": rno
				};
				
				$.ajax({
					url: deleteUrl,
					type: method,
					data: dataParam,
					success: whenSuccess,
					error: whenError
				});
				
				function whenSuccess(resData){
					console.log("resData >>> : " + resData);
					alert("댓글이 삭제되었습니다.");
					if ("GOOD" == resData){
						target.remove();
					}	
				}
				
				function whenError(e){
					alert("댓글을 삭제할 수 없습니다." + e.responseText);
				}
				
		
				/*
				var deleteUrl = "/kosmoJns/reply/replyDelete/" + rno + ".do";
				console.log("deleteUrl >>> : " + deleteUrl);
				var type = "DELETE";
				
				$.ajax({
					url: deleteUrl,
					type: type,
					headers: {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"DELETE"
					},
					dataType: 'text',
					success: whenSuccess
				});
				
				function whenSuccess(result){
					console.log("result >>> : " + result);
					if(result =="SUCCESS"){
						alert("삭제 되었습니다.");
						listAll(bno);
					}
				}
				*/
			}
		});
	});


	// 리스트 요청 함수
	function listAll(){
		$("#comment_list").html("");
		console.log("reply.jsp >> listAll()");
		var listAllURL = "/kosmoJns/reply/listAll.do";
		var method = "POST";
		var bno = $("#bno").val();
		var dataParam = {
				"bno": bno
		};
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: listAllURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){
			console.log("whenSuccess reply listAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			let v = resData.split("&");
			for(let i = 0; i< v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j = 0;
				for(; j < vv.length-1; j++){
					//console.log("vv[0] >>> : " + vv[0]);
					console.log("vv[1] >>> : " + vv[1]);
					//console.log("vv[2] >>> : " + vv[2]);
					//console.log("vv[3] >>> : " + vv[3]);
					//console.log("vv[4] >>> : " + vv[4]);
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3], vv[4]);
			}
		}
		function whenError(e){
			alert("오류 >>> : " + e.responseText);
		}
	}


	/* 새로운 글을 화면에 추가하기 위한 함수 */
	function addNewItem(rno, mnick, rcontent, rinsertdate, rupdatedate){
		
		//데이터 체크
		if(isEmpty(rno)) return false;
		
		// 새로운 글이 추가될 li 태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", rno);
		new_li.addClass("comment_item");
		
		// 작성자 정보가 지정될 <p> 태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");
		
		// 작성자 정보와 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(mnick + "님");
		
		// 작성일지
		var date_span = $("<span>");
		date_span.html(" 등록:" + rinsertdate + "/ 수정:" + rupdatedate + " ");
		
		// 수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({"type" : "button", "value" : "수정하기"});
		up_input.addClass("update_form");
		
		// 삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({"type" : "button", "value" : "삭제하기"});
		del_input.addClass("delete_btn");
		
		// 내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(rcontent);
		
		// 조립하기
		writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}
	
	// INPUT 태그들에 대한 초기화 함수 
	function dataReset(){
		$("#rno").val("");
		$("#rcontent").val("");
	}
	
	// chkSubmit(유효성 검사 대상, 메시지 내용)
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
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val == "undefined" || val == null || val == ""){
			return true;
		}else{
			return false;
		}
	}
	
</script>
<title>REPLY</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String bno = request.getParameter("bno");
	System.out.println("reply >> bno >>> : " + bno);
	
%>
<div id="replyContainer">
<h1></h1>
	<div id="comment_write">
	<form id="comment_form">
	<table>
		<tr>
			<td>작성자</td>
			<td>
				<input type="text" name="rmnick" id="rmnick">
				<input type="hidden" name="bno" id="bno" value="<%=bno%>">
				<input type="button" id="replyInsert" value="저장하기">
			</td>
		</tr>
		<tr>
			<td>댓글 내용</td>
			<td>
			<textarea name="rcontent" id="rcontent" rows="5" cols="50" style="resize:none"></textarea>
			</td>
		</tr>
	</table>
	</form>
	</div>
	<ul id="comment_list">
		<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
	</ul>
</div>
</body>
</html>