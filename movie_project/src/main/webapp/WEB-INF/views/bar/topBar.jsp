<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/resources/user/login.js" charset='UTF-8'></script>
<script type="text/javascript" src="/resources/board/board.js" charset='UTF-8'></script>
<script type="text/javascript" src="/resources/bar/bar.js" charset='UTF-8'></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/agency.min.css">
<link rel="shortcut icon" href="#">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/main.css">
<title></title>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		_FRM = document.topBarForm;
	});
</script>
<body>
<!-- Navigation -->
<form style="padding-top: 100px;" id="topBarForm" name="topBarForm" onsubmit="return false;">
<input type="hidden" id="userId" name="userId" value="${userInfo.id}">
<input type="hidden" id="userNo" name="userNo" value="${userInfo.userNo}">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: #212529;">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top" onclick="location.href='/'">Personal_Project</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			  Menu
			  <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#services" onclick="location.href='/movieChart'">Movie Chart</a>
					</li>
					<li class="nav-item">
					  	<a class="nav-link js-scroll-trigger" href="#portfolio" onclick="fnFindTgears();">FIND THEATERS</a>
					</li>
					<li class="nav-item">
					  	<a class="nav-link js-scroll-trigger" href="#freeBoard" onclick="location.href='/freeBoard'">FreeBoard</a>
					</li>
					<li class="nav-item">
					  	<a class="nav-link js-scroll-trigger" href="#team" onclick="fnFindMovieSchedule();">MOVIE SCHEDULE</a>
					</li>
					<li class="nav-item">
					  	<a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
					</li>
					<c:if test="${userInfo != null }">
						<li class="nav-item">
						  	<a id="loginName" class="nav-link js-scroll-trigger" href="#" onclick="location.href='/myPage'">${userInfo.id}님</a>
						</li>
						<li class="nav-item">
						  	<a id="logout" class="nav-link js-scroll-trigger" href="#" onclick="location.href='/logout'">logout</a>
						</li>
					</c:if>
					<c:if test="${userInfo == null }">
						<li class="nav-item">
						  	<a id="login" class="nav-link js-scroll-trigger" href="#" onclick="location.href='/loginPage'">Login</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</form>
</body>
</html>