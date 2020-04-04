<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/views/bar/topBar.jsp"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/resources/user/login.js" charset='UTF-8'></script>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/bootstrap/img/icons/favicon.ico" />
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
<link rel="shortcut icon" href="#">
<style type="text/css">
input:focus::-webkit-input-placeholder { color: transparent; } input:focus::-moz-placeholder { color: transparent; } input:focus:-ms-input-placeholder { color: transparent; } input:focus::-ms-input-placeholder { color: transparent; }
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		_FRM = document.loginForm;
	});
	
</script>
<body>
	<div class="limiter" id="loginPage" style="display:block">
		<div class="container-login100" style="background-image: url('/resources/bootstrap/img/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
				Login
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5" id="loginForm" name="loginForm" method="post" onsubmit="return false;">
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100" type="text" id="id" name="id" placeholder="아이디를 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn" id="loginButton" onclick="fnLogin();">Login</button>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn" id="joinButton" onclick="fnJoinPage();">Join</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 회원가입 팝업 -->
	<div class="limiter" id="joinPop" style="display:none">
		<div class="container-login100" style="background-image: url('/resources/bootstrap/img/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
				Join
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5">
					<div class="wrap-input100 validate-input" data-validate="ID">
						<input class="input100" type="text" id="joinId" name="joinId" placeholder="아이디를 입력해주세요.">
						<button class="login100-form-btn" onclick="idChk();" style="margin-left: 120px;">ID CHK</button>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="PASSWORD">
						<input class="input100" type="password" id="joinPassword" name="joinPassword" placeholder="비밀번호를 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="PASSWORD CHECK">
						<input class="input100" type="password" id="passwordChk" name="passwordChk" placeholder="비밀번호를 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="NAME">
						<input class="input100" type="text" id="userName" name="userName" placeholder="이름을 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="PHONE NUMBER">
						<input class="input100" type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="EMAIL">
						<input class="input100" type="text" id="email" name="email" placeholder="이메일을 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="ADDRESS">
						<input class="input100" type="text" id="address" name="address" placeholder="주소를 입력해주세요.">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn" id="loginButton" onclick="fnJoin();">Confirm</button>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn" id="cancelButton" onclick="fnJoinCancel();">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>

<script src="/resources/bootstrap/vendor/jquery/jquery-3.2.1.min.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/vendor/animsition/js/animsition.min.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/vendor/bootstrap/js/popper.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/vendor/select2/select2.min.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/vendor/daterangepicker/moment.min.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/vendor/daterangepicker/daterangepicker.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/vendor/countdowntime/countdowntime.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script src="/resources/bootstrap/js/main.js" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="94b76c4b550f0c03dfec0a4e-text/javascript"></script>
<script type="94b76c4b550f0c03dfec0a4e-text/javascript">
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="94b76c4b550f0c03dfec0a4e-|49" defer=""></script></body>
</html>
