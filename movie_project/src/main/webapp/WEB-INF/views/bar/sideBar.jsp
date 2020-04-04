<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Side Bar</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/resources/bar/bar.js" charset='UTF-8'></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		_FRM = document.sideBarForm;
	});
	
	function fnFindFriendPage(){
		_FRM.target = "_self";
		_FRM.action = "/findFriendPage";
		_FRM.submit();	 
	}
	
</script>
<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #212529;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
 	margin-top : 20px;
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
	margin-top : 120px;		
    font-size: 1.3em;
    line-height: 3em;
  }

</style>
<body>
<form id="sideBarForm" name="sideBarForm" method="post" onsubmit="return false;">
	<div id="page-wrapper">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"></li>
				<li><a href="#"><h4>개인정보</h4></a></li>
				<li><a href="#">개인정보 수정</a></li>
				<li><a href="#">비밀번호 변경</a></li>
				<li style="margin-top: 70px;"><a href="#"><h4>친구/채팅</h4></a></li>
				<li><a href="#" onclick="fnFindFriendPage();">친구 찾기</a></li>
				<li><a href="#" onclick="fnRequestFriendList();">친구 수락/목록</a></li>
				<li><a href="#">채팅</a></li>
			</ul>
		</div>
	</div>
</form> 
</body>
</html>