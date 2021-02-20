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