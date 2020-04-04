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
		_FRM = document.findFriendForm;
	});
</script>
<body>
<form id="findFriendForm" name="findFriendForm" onsubmit="return false;">
<input type="hidden" id="myId" name="myId" value="${userId}">
	<div class="container" style="margin-top: 50px;">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8">
	            <div class="card card-sm">
	                <div class="card-body row no-gutters align-items-center">
	                    <div class="col-auto">
	                        <i class="fas fa-search h4 text-body"></i>
	                    </div>
	                    <div class="col">
	                        <input class="form-control form-control-lg form-control-borderless" type="search" id="searchWord" name="searchWord" placeholder="Find Friend Id">
	                    </div>
	                    <div class="col-auto">
	                        <button class="btn btn-lg btn-success" onclick="fnFindFriend();">Search</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="container" id="findFriend" style="margin-top: 50px;">
	</div>
</form>
</body>
</html>