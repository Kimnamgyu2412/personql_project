<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<%@ include file="/WEB-INF/views/bar/topBar.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		_FRM = document.editForm;
	});
</script>
<body>
<input type="hidden" id="userInfo" name="userInfo" value="${userInfo}">
<input type="hidden" id="id" name="id" value="${userInfo.id}">
	<article>
		<div class="container" role="main">
			<h2>board Form</h2>
			<form style="padding-top: 100px;" id="viewForm" name="viewForm" role="form" method="post" onsubmit="return false;">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" id="title" name="title" value="${view.title}">
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" id="userName" name="userName" value="${userInfo.userName }">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="contents" name="contents">${view.title}</textarea>
				</div>
<!-- 				<div class="mb-3"> -->
<!-- 					<label for="tag">TAG</label> -->
<!-- 					<input type="text" class="form-control" id="tag" name="tag" placeholder="태그를 입력해 주세요"> -->
<!-- 				</div> -->
			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="fnUpdMove();">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList"onclick="fnEditCancel();">목록</button>
			</div>
		</div>
	</article>
</body>
</html>