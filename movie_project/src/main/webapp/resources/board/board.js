var _FRM;
var idck = 0;

/**
	 * 빈값 체크
	 * @param str
	 * @returns
	 */
	function isEmpty(str) {
		if (str == "undefined")
			return true;
		if (str == null)
			return true;
		if (str == "null")
			return true;
		str = $.trim(str);
		if (str.length == 0)
			return true;
		return false;
	}
	
	function isNotEmpty(str) {
		return (isEmpty(str)) ? false : true;
	}
	
	//상세보기
	function fnViewBoard(boardNum){
		var boardNum = $("#boardNum").val(boardNum);
		_FRM.target = "_self";
		_FRM.action = "/viewBoard";
		_FRM.submit();	 
	}
	
	//이전목록
	function fnEditCancel(){
		history.back();
	}
	
	//글쓰기 페이지 이동
	function fnEditPage(){
		var userId = $("#userId").val();
		if(isEmpty(userId)){
			alert("로그인 후 사용 가능합니다.");
		}else{
			_FRM.target = "_self";
			_FRM.action = "/editBoardPage";
			_FRM.submit();
		}
	}
	
	function fnFreeBoardList(){
        $.ajax({
            url : "/freeBoard",
            type:'post',
            success : function(data) {
            	data.forEach(function(e){
	            	var title = e.name;
	            	var content = e.code;
	            	alert(title);
            	});
            },error : function(e){
            	console.log(e);
            }
      	 });
	}
	
 	//글쓰기
 	function fnEditSave(boardNum){
 		submitContents();
 		$("#boardNum").val(boardNum);
 		var title = $("#title").val();
 		var userName = $("#userName").val();
 		var contents = $("#contents").val();
 		var smartEditContents = $("#contents").val();
 		var contents = smartEditContents.replace(/(<([^>]+)>)/ig,"");
		if(isEmpty(title)){
			alert("제목을 입력해주세요");
			$("#title").focus();
		}else if(isEmpty(userName)){
			alert("이름을 입력해주세요.");
			$("#userName").focus;
		}else if(isEmpty(contents)){
			alert("내용을 입력해주세요.");
			$("#contents").focus;
		}else{
			_FRM.target = "_self";
			_FRM.action = "/editBoardSave";
			_FRM.submit();	 
		}
 	}
 	
 	function submitContents(elClickedObj){
 		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD",[]);
 		try{
 			elClickedObj.form.submit();
 		}catch(e){
 			
 		}
 	}
 	
 	//수정페이지 (값을 들고 글쓰기 페이지 이동)
 	function fnUpdMove(boardNum){
 		$("#boardNum").val(boardNum);
 		_FRM.target = "_self";
		_FRM.action = "/editBoardPage";
		_FRM.submit();
 	}
 	
 	//글 삭제 
 	function fnDelete(boardNum){
 		$("#boardNum").val(boardNum);
 		_FRM.target = "_self";
		_FRM.action = "/delBoard";
		_FRM.submit();
 	}
 	
 	//크롤링 페이지 진입
 	function fnCrawling(){
 		_FRM.target = "_self";
		_FRM.action = "/crawling";
		_FRM.submit();
 	}
	
 	/*아이디 중복 체크*/
	function idChk(){
		var id = $("#joinId").val();
		$(function() {
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : id,
	            url : "/idcheck",
	            dataType : "html",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data > 0) {
	                	alert("아이디가 존재합니다.");
	                    $("#id").focus();
	                } else {
	                	alert("사용가능한 아이디 입니다.");
	                    $("#password").focus();
	                    idck = 1;
	                }
	            },error : function(e){
	            	console.log(e);
	            }
	      	 });
		});
	}
	
