<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영시간표</title>
</head>
<%@ include file="/WEB-INF/views/bar/topBar.jsp"%>
<%-- <%@ include file="/WEB-INF/views/bar/sideBar.jsp"%> --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="author" content="colorlib.com">
<link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
<link href="/resources/bootstrap/css/searchMain.css"  rel="stylesheet" />
<body>
<script type="text/javascript">
	$(document).ready(function(){
		_FRM = document.findMovieScheduleForm;
	});
</script>
<div class="s003">
	<form id="findMovieScheduleForm" name="findMovieScheduleForm" onsubmit="return false;">
		<p><h2>FIND SCHEDULE</h2></p>
        <div class="inner-form" style=" margin-top:40px; position: relative; z-index: 2;">
          <div class="input-field first-wrap" style="width: 350px;">
            <div class="input-select" style="margin-top: 15px;">
              <select data-trigger="" id="movieTheatersType" name="choices-single-defaul" onchange="findMovieTheatersName();">
                <option placeholder="영화관">선택</option>
                <option value="CGV">CGV</option>
                <option value="메가박스">메가박스</option>
                <option value="롯데시네마">롯데시네마</option>
              </select>
            </div>
          </div>
          <div class="input-field first-wrap" id="theatersNameWrap" style="width: 380px;">
            <div class="input-select" id="theatersNameSelect" style="margin-top: 15px;">
              <select data-trigger="" id="movieTheatersName" name="choices-single-defaul">
                <option placeholder="지점">선택</option>
              </select>
            </div>
          </div>
          <div class="input-field third-wrap">
            <button class="btn-search" type="button" onclick="fnFindMovieTime();">
              <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
              </svg>
            </button>
          </div>
        </div>
        <div style="margin-top:100px; width:900px; height:600px; position: relative; z-index: 1;">
			<div id="schedule">
			</div>
		</div>
	</form>
</div>
</body>
<script src="/resources/bootstrap/js/choices.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=680465f8913b8ef7feb46143e133911d&libraries=services"></script>
<script type="text/javascript" src="/resources/movie/movie.js" charset='UTF-8'></script>
</html>