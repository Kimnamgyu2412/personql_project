<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구찾기</title>
</head>
<%@ include file="/WEB-INF/views/bar/topBar.jsp"%>
<%@ include file="/WEB-INF/views/bar/sideBar.jsp"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/resources/friend/friend.js" charset='UTF-8'></script>
<%-- <%@ include file="/WEB-INF/views/bar/sideBar.jsp"%> --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script type="text/javascript">
	$(document).ready(function(){
		_FRM = document.requestFriendForm;
	});
</script>

<body>
<form id="requestFriendForm" name="requestFriendForm" onsubmit="return false;">
<input type="hidden" id="yourId" name="yourId" value="">
	<div class="container" style="margin-top: 150px; margin-left:270px; float: left; width: 40%;">
		<h3 style="margin-left: 340px; margin-bottom: 100px;">친구 요청 목록</h3>
		<c:forEach var="requestFriendList" items="${requestFriendList}">
			<div class="card card-sm" style="width:501.9875px;margin-left: 190px;">
				<div class="card-body row no-gutters align-items-center" style="width:490px;">
			       	<div class="col">
			       		<h4 style="width:150px;">${requestFriendList.friendMyId}</h4>
			       	</div>
			       	<div class="col-auto">
				       	<button class="btn btn-lg btn-success" id="agreeBtn" onclick="fnAgreeFriend('${requestFriendList.friendMyId}');">수락</button>
				       	<button style="background-color:#dc3545; border-color:#dc3545;" class="btn btn-lg btn-success" id="refuseBtn" onclick="">거절</button>
			       	</div>
		   		</div>
		    </div>
	    </c:forEach>
	</div>
	<div>
		<img style="width: 80px; margin-top:450px; float: left;" src="/resources/bootstrap/img/image123.jpg">
	</div>
	<!--수락 후 친구 목록 -->
	<div class="container" style="margin-top: 150px; float: left; width: 30%;">
		<h3 style="margin-left: 340px; margin-bottom: 100px;">친구 목록</h3>
		<c:forEach var="agreeFriendList" items="${agreeFriendList}">
		<input type="hidden" id="friendFriendId" name="friendFriendId" value="${agreeFriendList.friendFriendId}"> 
			<div class="card card-sm" style="width:501.9875px;margin-left: 190px;">
				<div class="card-body row no-gutters align-items-center" style="width:490px;">
			       	<div class="col">
			       		<h4 style="width:150px;">${agreeFriendList.friendFriendId}</h4>
			       	</div>
			       	<div class="col-auto">
				       	<button class="btn btn-lg btn-success" onclick="fnChatFriend('${agreeFriendList.friendFriendId}');">채팅하기</button>
			       	</div>
		   		</div>
		    </div>
	    </c:forEach>
	</div>
</form>
</body>
</html>