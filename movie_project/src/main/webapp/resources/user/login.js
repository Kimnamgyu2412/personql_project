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
	
	//회원가입 팝업창 이동
	function fnJoinPage(){
		$("#loginPage").css("display","none");
		$("#joinPop").css("display","block");
	}

 	/*회원가입시 유효성 검사*/
 	function fnJoin(){
 		var id = $("#joinId").val();
 		var password = $("#joinPassword").val();
 		var pwChk = $("#passwordChk").val();
 		var userName = $("#userName").val();
 		var phone = $("#phone").val();
 		var email = $("#email").val();
		var address = $("#address").val();
		
		if(isEmpty(id)){
			alert("아이디를 입력해주세요");
			$("#id").focus();
		}else if(idck == 0){
			alert("중복확인 버튼을 눌러주세요.");
 		}else if(isEmpty(password)){
			alert("비밀번호를 입력하세요.");
			$("#joinPassword").focus();
		}else if(isEmpty(pwChk)){
			alert("비밀번호를 확인해주세요.");
			$("#passwordChk").focus();
		}else if(password != pwChk){
	    	if(isNotEmpty(pwChk)){
	    	    alert("비밀번호가 일치하지 않습니다.");
	        	  $('#passwordChk').val('');
	              $('#passwordChk').focus();
	    	}
		}else if(isEmpty(userName)){
			alert("이름을 입력해주세요.");
			$("#userName").focus;
		}else if(isEmpty(phone)){
			alert("핸드폰 번호를 입력해주세요.");
			$("#phone").focus;
		}else if(isEmpty(email)){
			alert("Email 을 입력해주세요.");
			$("#email").focus;
		}else if(isEmpty(address)){
			alert("주소를 입력해주세요.");
			$("#address").focus;
		}else{
			$.ajax({
				type : 'post',
				url : "/join",
				data : {"id" : id , "password" : password , "userName" : userName , "phone" : phone , "email" : email , "address" : address },
				datatype : 'json',
				error : function(e) {
					console.log(e);
				},
				success : function(result) {
					if(result>0){//1
						location.reload();
						alert("회원가입 성공");
					}else{
						alert("ID와PASSWORD 를 확인해주세요.");						
					}
				}
			});
		}
 	}

	/* Enter키 회원가입*/
	function fnJoinEnter(){
		if(window.event.keyCode == 13){
			fnJoin();
		}
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
	                    $("#joinId").focus();
	                } else {
	                	alert("사용가능한 아이디 입니다.");
	                    $("#joinPassword").focus();
	                    idck = 1;
	                }
	            },error : function(e){
	            	console.log(e);
	            }
	      	 });
		});
	}
	
	//form형식 로그인
	function fnLogin(){
		var id = $("#id").val();
		var password = $("#password").val();
		
		if(isEmpty(id)){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
		}else if(isEmpty(password)){
			alert("패스워드를 입력해주세요.");
			$("#password").focus();
		}else{
			_FRM.target = "_self";
			_FRM.action = "/login";
			_FRM.submit();	 
		}
	}
	
	//ajax 로그인
//	function fnLogin(){
//		var id = $("#id").val();
//		var password = $("#password").val();
//		
//		if(isEmpty(id)){
//			alert("아이디를 입력해주세요.");
//			$("#id").focus();
//		}else if(isEmpty(password)){
//			alert("패스워드를 입력해주세요.");
//			$("#password").focus();
//		}else{
//			$.ajax({
//				type : 'post',
//				url : "/login",
//				data : {"id" : id , "password" : password },
//				datatype : 'json',
//				error : function(e) {
//					console.log(e);
//				},
//				success : function(result) {
//					if(result>0){//1
//						location.reload();
//						alert("로그인 성공");
//					}else{
//						alert("ID와PASSWORD 를 확인해주세요.");						
//					}
//				}
//			});
//		}
//	}
	/*Enter키 로그인*/
	function fnLoginEnter(){
		if(window.event.keyCode == 13){
			fnLogin();
		}
	}
	
	/*아이디 비밀번호 찾기 페이지 진입*/
	function fnFindPage(){
		_FRM.target = "_self";
		_FRM.action = "/findPage.do";
		_FRM.submit();	 
	}

	/*아이디 찾기 기능*/
	function fnFindId(){
		var userName = $("#findIdName").val();
		var userEmail = $("#findIdEmail").val();

		if(isEmpty(userName)){
			alert("이름을 입력해주세요.");
			$("#findIdName").focus();
		}else if(isEmpty(userEmail)){
			alert("Email을 입력해주세요.");
			$("#findIdEmail").focus();
		}else{
			$.ajax({
				type : 'post',
				url : "/findId.do",
				data : {"userName" : userName , "userEmail" : userEmail },
				datatype : 'json',
				error : function(e) {
					console.log(e);
				},
				success : function(result) {
					if(result != 0){
						alert("회원님의 ID는 "+ result + " 입니다.");
					}else{
						alert("입력하신 정보를 확인해주세요.");
					}
				}
			});
		}
	}
	
	/*Enter키 아이디 찾기*/
	function fnFindIdEnter(){
		if(window.event.keyCode == 13 ){
			fnFindId();
		}
	}

	/*비밀번호 찾기 기능*/
	function fnFindPw(){
		var userId = $("#findPwId").val();
		var userName = $("#findPwName").val();
		var userEmail = $("#findPwEmail").val();
		if(isEmpty(userId)){
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
		}else if(isEmpty(userName)){
			alert("이름을 입력해주세요.");
			$("#userName").focus();
		}else if(isEmpty(userEmail)){
			alert("Email을 입력해주세요.");
			$("#userEmail").focus();
		}else{
			$.ajax({
				type : 'post',
				url : "/findPw.do",
				data : {"userId":userId , "userName" : userName , "userEmail" : userEmail },
				datatype : 'json',
				error : function(e) {
					console.log(e);
				},
				success : function(result) {
					if(result != 0){
						alert("회원님의 비밀번호는"+ result + "입니다.");
					}else{
						alert("입력하신 정보를 확인해주세요.");						
					}
				}
			});
		}
	}
	
	/*Enter키 비밀번호 찾기*/
	function fnFindPwEnter(){
		if(window.event.keyCode == 13){
			fnFindPw();
		}
	}
	
	/*아이디 비밀번호 찾기 취소*/
	function fnFindBack(){
		self.close();
	}
	