<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Free Board</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%@ include file="/WEB-INF/views/bar/topBar.jsp"%>
<%-- <%@ include file="/WEB-INF/views/bar/sideBar.jsp"%> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/agency.min.css">
<link rel="shortcut icon" href="#">
</head>
<script type="text/javascript">
	$(document).ready(function(){
		_FRM = document.listForm;
	});
</script>
<body>
<form style="padding-top: 100px;" id="listForm" name="listForm" onsubmit="return false;">
	<input type="hidden" id="boardNum" name="boardNum" value="">
	<section class="bg-light page-section" id="freeBoard" style="padding-top: 200px">
	  <div class="container">
	    <div class="row">
	      <div class="col-lg-12 text-center">
	        <h2 class="section-heading text-uppercase">Free Board</h2>
	        <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
	      </div>
	    </div>
   	    <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#" onclick="fnEditPage();">글쓰기</a>
		<div class="row">
	    	<c:forEach var="boardList" items="${boardList}">
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link" data-toggle="modal" href="#portfolioModal1" onclick="fnViewBoard('${boardList.boardNum}');">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content"></div>
					    </div>
					    <img class="img-fluid" style="padding-top: 150px;" src="/resources/bootstrap/img/portfolio/01-thumbnail.jpg" alt="">
					</a>
					<div class="portfolio-caption">
				  		<h4>${boardList.title}</h4>
						<p class="text-muted">${boardList.contents}</p>
			     	</div>
				</div>
			</c:forEach>
		</div>
	</section>
</form>
</body>
<!-- Bootstrap core JavaScript -->
<script src="/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Contact form JavaScript -->
<script src="/resources/bootstrap/js/jqBootstrapValidation.js"></script>
<script src="/resources/bootstrap/js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="/resources/bootstrap/js/agency.min.js"></script>
</html>
