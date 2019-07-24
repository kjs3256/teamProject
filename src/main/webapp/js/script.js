function writeSave(){
	if(document.writeForm.content.value == ""){
		alert("내용을 입력하세요.");
		document.writeForm.content.focus();
		return false;
	}
	document.writeForm.submit();
}
function commentCheck(){
	if(document.commentForm.content.value==""){
		alert("댓글을 입력해주세요.");
		document.commentForm.content.focus();
		return;
	}
	document.commentForm.submit();
}
