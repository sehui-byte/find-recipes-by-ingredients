<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/headerForReply.jsp"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
</style>
<script type="text/javascript">

	$(function(){
		
		/* 댓글 입력창 vue setting */
		var vm = new Vue({
			el: "#comment_write",
			data: {
				sessionWriter: "<%=mnick%>"
			}
		});
		
		/* rcontent 길이 제한 */
		$("#rcontent").keyup(function(){
			cut_200(this);
		});
		
		/* 기본 댓글 목록 불러오기 */
		listAll(rbno)
		
		/* 댓글 내용 저장 이벤트 */
		$(document).on("click", "#replyInsert", function(){
			//작성 내용 대한 입력여부 검사
			if(!chkSubmit($("#rcontent"),"내용을")) return;
			else{
				var insertUrl = "/kosmoJns/reply/replyInsert.do";
				console.log("insertUrl >>> : " + insertUrl);
				var method = "POST";
				var dataParam = {
						"rbno": $("#rbno").val(),
						"rwriter": "<%=mnick%>",
						"rcontent": $("#rcontent").val(),
						"mno": $("#mno").val()
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
						listAll(rbno);
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
			var data="<textarea class='form-control' name='content' id='content'>" + conText + "</textarea>";
			data += "<input type='button' id='update_btn' class='btn btn-outline-danger btn-sm' value='수정완료'>";
			data += "<input type='button' id='reset_btn' class='btn btn-outline-danger btn-sm' value='수정취소'>";
			conArea.html(data);
		});
		
		/* 초기화 버튼 */
		$(document).on("click", "#reset_btn", function(){
			var conText = $(this).parents("li").find("textarea").html();
			$(this).parents("li").find("input[type='button']").show();
			var conArea = $(this).parents("li").children().eq(1);
			conArea.html(conText);
		});
		
		/* 글 수정을 위한 Ajax 연동 처리 */
		$(document).on("click", "#update_btn", function(){
			var rno = $(this).parents("li").attr("data-num");
			var rcontent = $("#content").val();
			if(!chkSubmit($("#content"),"댓글 내용을")) return;
			else{
				var updateUrl = "/kosmoJns/reply/replyUpdate.do";
				console.log("updateUrl >>> : " + updateUrl);
				var method = "POST";
				var dataParam = {
						"rno": rno,
						"rcontent": rcontent,						
				}
				console.log("dataParam >>> : " + dataParam);
				
				$.ajax({
					url: updateUrl,
					type: method,
					data: dataParam,
					success: whenSuccess,
					errer: whenError
				});
				
				function whenSuccess(resultData){
					if(resultData=="GOOD"){
						alert("댓글 등록이 완료되었습니다.");
						dataReset();
						listAll(rbno);
					}
				}
				function whenError(){
					alert("시스템 오류입니다. 관리자에게 문의하세요.");
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
			}
		});
	});


	// 리스트 요청 함수
	function listAll(){
		$("#comment_list").html("");
		console.log("rbreply.jsp >> listAll()");
		var listAllURL = "/kosmoJns/reply/rblistAll.do";
		var method = "POST";
		var rbno = $("#rbno").val();
		var dataParam = {
				"rbno": rbno
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
			console.log("whenSuccess rbreply listAll resData >>> : " + resData);
			
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
					//console.log("vv[1] >>> : " + vv[1]);
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
	function addNewItem(rno, rwriter, rcontent, rinsertdate, rupdatedate){	
		var sessionWriter = "<%=mnick%>";
		
		//데이터 체크
		if(isEmpty(rno)) return false;
			
		// 새로운 글이 추가될 li 태그 객체
		var new_li = $("<li class='list-group-item'>");
		new_li.attr("data-num", rno);
		new_li.addClass("comment_item");
		
		// 작성자 정보가 지정될 <p> 태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");
		
		// 작성자 정보와 이름
		var name_span = $("<span style='font-weight: bold'>");
		name_span.addClass("name");
		name_span.html(rwriter + "&nbsp;&nbsp;");
		
		// 작성일지
		var date_span = $("<span style='font-size: 8px;'>");
		date_span.html(" 등록:" + rinsertdate + " / 수정:" + rupdatedate + " ");
		
		// 수정하기 버튼
		var up_input = $("<input class='btn btn-orange btn-sm'>");
		up_input.attr({"type" : "button", "value" : "수정"});
		up_input.addClass("update_form");
		
		// 여백 1칸
		var nbsp = $("<span>");
		nbsp.html("&nbsp;");
		
		// 여백 많이
		var nbspM = $("<span>");
		nbspM.html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		// 삭제하기 버튼
		var del_input = $("<input class='btn btn-orange btn-sm'>");
		del_input.attr({"type" : "button", "value" : "삭제" });
		del_input.addClass("delete_btn");
		
		// 내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(rcontent);
		
		// 조립하기 (로그인 유저의 닉네임일 경우 수정/삭제 버튼 생성)
		if(rwriter == sessionWriter){
			writer_p.append(name_span).append(date_span).append(nbspM).append(up_input).append(nbsp).append(del_input)
			new_li.append(writer_p).append(content_p);
			$("#comment_list").append(new_li);
		}else{
			writer_p.append(name_span).append(date_span)
			new_li.append(writer_p).append(content_p);
			$("#comment_list").append(new_li);
		}

		
	}
	
	// 초기화 함수 
	function dataReset(){
		var len = 0;
		$("#rcontent").val("");
		$(".bytes").text(len);
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
	
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t= t.substring(0, l);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	
</script>
<title>REPLY</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String rbno = request.getParameter("rbno");
	System.out.println("reply >> rbno >>> : " + rbno);
	
%>
<div id="replyContainer">
	<div id="comment_write" v-cloak>
		<!-- ========== 댓글 입력 폼 ==========-->
		<form id="comment_form">
		<br>
		<p class=fs-6>댓글(로그인 후 작성 가능합니다.)</p>
		<div v-if="sessionWriter !== ''">
		<table>
			<tr>
				<td>
					<p class="fw-bold fs-5">{{sessionWriter}}</p>
					<input type="hidden" name="rbno" id="rbno" value="<%=rbno%>">
					<input type="hidden" name="mno" id="mno" value="<%=mno%>">
				</td>
			</tr>
			<tr>
				<td>
					<textarea class="form-control" name="rcontent" id="rcontent" rows="3" cols="110" style="resize:none"></textarea>
					<div style="font-size: 12px;"><span class="bytes">0</span>bytes</div>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input class="btn btn-orange" type="button" id="replyInsert" value="저장" 
						   onclick="sendMessage2()">
				</td>
			</tr>
		</table>
		</div>
		</form>
	</div>
	<ul class="list-group" id="comment_list">
		<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->	
	</ul>
</div>
<script>

	//파라미터로 넘긴 mno 값 받기
<%
	String BoardWriterMno = request.getParameter("BoardWriterMno");
	System.out.println("게시물 글 작성자 >>> : " + BoardWriterMno);
%>

function sendMessage2() {
	
	//웹소켓으로 메세지 전달(프로토콜 : "댓글 작성자 mno, 글작성 mno, reply")
	var mno = '<%=mno%>'; 
	var msg = ''; 
	msg += mno;//댓글 작성자 mno
	msg += ',';
	msg += '<%=BoardWriterMno%>'; //글 작성자 mno 
	msg += ',';
	msg += 'reply';
	sock.send(msg);//웹소켓 서버로 프로토콜 보낸다
	console.log("msg >> " + msg);
	
}

function sendMessage(type) {
	
	//웹소켓으로 메세지 전달(프로토콜 : "댓글 작성자 mno, 글작성 mno, reply")
	var mno = '<%=mno%>'; 
	var msg = ''; 
	msg += mno;//댓글 작성자 mno
	msg += ',';
	msg += '<%=BoardWriterMno%>'; //글 작성자 mno 
	msg += ',';
	msg += type;
	sock.send(msg);//웹소켓 서버로 프로토콜 보낸다
	console.log("msg >> " + msg);
	
}
</script>
</body>
</html>