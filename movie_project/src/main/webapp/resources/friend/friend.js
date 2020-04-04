var _FRM;


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
	
	//친구 찾기
	function fnFindFriend(){
		var searchWord = $("#searchWord").val();
		var myId = $("#myId").val();
		$.ajax({
			url : "/findFriend",
			data:{"searchWord":searchWord},
			success : function(data){
				$("#findFriend").html("");
				for(var i in data){
					if(data[i].id != myId){
							$("#findFriend").append('<div class="card card-sm" style="width:501.9875px;margin-left: 190px;">'+
					                '<div class="card-body row no-gutters align-items-center" style="width:490px;">'+
				                    '<div class="col-auto">'+
				                    '</div><div class="col">'+
				                    '<h4 style="width:150px;">'+data[i].id+'</h4>'+
				                    '</div><div class="col-auto">'+
				                    '<button class="btn btn-lg btn-success" onclick="fnRequestFriend(\''+data[i].id+'\');">친구신청</button>'+
				                    '</div></div></div>');
					}
				}
			},error : function(e){
		    	console.log(e);
			}
		});
	}
	
	//친구 요청
	function fnRequestFriend(friendId){
		var userNo = $("#userNo").val();
		$.ajax({
			url : "/requestFriend",
			data:{"friendUserNo":userNo,"friendFriendId":friendId,"friendMyId" : $("#myId").val()},
			success : function(data){
				if(data > 0){
					alert("친구 신청이 완료 되었습니다.");
				}else{
					alert("이미친구이거나 친구신청 완료된 상태입니다.");
				}
			},error : function(e){
		    	console.log(e);
			}
		});
	}
	
	//친구 수락
	function fnAgreeFriend(friendId){
		var userId = $("#userId").val();
		
		$.ajax({
			url : "/agreeFriend",
			data:{"friendMyId":userId,"friendFriendId":friendId},
			success : function(data){
				if(data == 1){
					window.location.reload();
				}else{
					alert("친구수락이 실패했습니다.");
				}
			},error : function(e){
		    	console.log(e);
			}
		});
	}
	
	//채팅 팝업창 열기
	function fnChatFriend(yourId){
		var url = "/chat";
		var name = "chat";
		var option = "width = 661, height = 638, top = 100, left = 200, location = no"
		window.open(url, name, option);
		var yourId = $("#yourId").val(yourId);
		_FRM.target = name;
		_FRM.action = url;
		_FRM.submit();	 
	}
	