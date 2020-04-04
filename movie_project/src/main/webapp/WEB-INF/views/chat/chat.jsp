<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value="https://code.jquery.com/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="/resources/chat/js/sockjs.js"></script>
<mata name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/chat/css/bootstrap.css">
<link rel="stylesheet" href="/resources/chat/css/custom.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="/resources/chat/js/bootstrap.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function() {
        $("#sendMessage").click(function() {
        	autoClosingAlert("#successMessage",2000);
            sendMessage();
        });
    });
    var sock;
    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo"/>");
    //자바스크립트 안에 function을 집어넣을 수 있음.
    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
    sock.onmessage = onMessage;
    //데이터를 끊고싶을때 실행하는 메소드
    sock.onclose = onClose;
    /* sock.onopen = function(){
        sock.send($("#message").val());
    }; */
    
    
    function sendMessage() {
    	var myId = $("#myId").val();
    	var chatName = $("#chatName").val();
    	var message = $("#chatContent").val();
    	var yourId = opener.document.getElementById("friendFriendId").value;
    	var msg = {
   			chatName : chatName,
    		myId : myId,
    		yourId : yourId,
    		message : message
    	}
        /*소켓으로 보내겠다.  */
        sock.send(JSON.stringify(msg));
    }
    
    
    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    function onMessage(evt) {
    	var data = evt.data;
		var dataSplit = data.split(",");
        $("#chatContent").val("");
        if(data != null){
	    	$("#liveChat").append('<div class="col-lg-12"><div class="media"><a class="pull-left" href="#">'
					+'<img class="media-object img-circle" src="/resources/chat/images/user.png" style="width:50px;"></a>'
					+'<div class="media-body"><h4 class="media-heading">'+dataSplit[1]+'<span class="small pull-right">'+dataSplit[2]+'</span></h4>'
					+'</div><p>'+dataSplit[0]+'</p></div></div>');
		}
    }
    function onClose(evt) {
        $("#data").append("연결 끊김");
    }
  
	function autoClosingAlert(selector,delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function(){alert.hide();},delay);
	}
</script>
</head>
<body>
    <input type="hidden" id="myId" name="userId" value="${myId }">
    <input type="hidden" id="uesrName" name="uesrName" value="${uesrName}">
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default" style="width: 831.9875px;">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget" style="overflow: auto; width: 830px; height: 630px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2020년 01월 14일</p>
									</div>
								</div>
								<hr>
								<div class="row" id="liveChat">
									<c:forEach var="chatList" items="${chatList}">
								    	<div class="col-lg-12">
											<div class="media">
												<a class="pull-left" href="#">
													<img class="media-object img-circle" src="/resources/chat/images/user.png" style="width:50px;">
												</a>
												<div class="media-body">
													<h4 class="media-heading">${chatList.chatName}
														<span class="small pull-right">${chatList.chatTime}</span>
													</h4>
												</div>
												<p>${chatList.chatContent}</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<input style="height: 40px;" type="text" id="chatName" name="chatName" value="${chatName}" class="form-control" value="" maxlength="20">
									</div>
								</div>
								<div class="row" style="height: 90px;">
									<div class="form-group col-xs-10">
										<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
									</div>
									<div class="form-group col-xs-2">
										<button type="button" class="btn btn-default pull-right" id="sendMessage">전송</button>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="alert alert-success" id="successMessage" style="display: none;">
			<strong>메시지 전송에 성공하였습니다.</strong>
		</div>
		<div class="alert alert-danger" id="dangerMessage" style="display: none;">
			<strong>이름과 내용을 모두 입력해주세요.</strong>
		</div>
		<div class="alert alert-warning" id="warningMessage" style="display: none;">
			<strong>데이터베이스 오류가 발생했습니다.</strong>
		</div>	
	</div>
	
</body>
</html>