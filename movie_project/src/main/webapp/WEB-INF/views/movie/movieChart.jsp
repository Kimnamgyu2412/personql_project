<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Movie Chart</title>
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
		_FRM = document.movieCrawlingForm;
	});
</script>
<body>
<form style="padding-top: 100px;" id="movieCrawlingForm" name="movieCrawlingForm" onsubmit="return false;">
	<div class="container">
   		<div class="row">
   			<div class="col-lg-12 text-center">
	       		<h2 class="section-heading text-uppercase">Movie Chart</h2>
	       		<h3 class="section-subheading text-muted">현재 상영중인 영화 순위</h3>
     		</div>
		</div>
		<div class="row">
			<c:forEach var="i" begin="0" end="${crawlingLength}" >
				<div class="col-md-4 col-sm-6 portfolio-item" style="margin-top: 50px;">
	  				<a class="portfolio-link" href="http://www.cgv.co.kr${crawlingList.aTag[i]}">
	    				<div class="portfolio-hover">
		      				<div class="portfolio-hover-content">
		      					<h3>${crawlingList.rank[i]}</h3>
		      				</div>
    					</div>
	    				<img class="img-fluid" style="width: 250px;" src="${crawlingList.image[i]}" alt="">
					</a>
					<div class="portfolio-caption">
	  					<h5>${crawlingList.title[i]}</h4>
							${crawlingList.advanceRate[i]}<br/>
							${crawlingList.openMovie[i]}
	  				</div>
				</div>
			</c:forEach>
	  	</div>
	</div>
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
