<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<%@ include file="/WEB-INF/views/bar/topBar.jsp"%>
<script type="text/javascript" src="/resources/smarteditor/js/service/HuskyEZCreator.js"></script>
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
			<form style="padding-top: 100px;" id="editForm" name="editForm" role="form" method="post" onsubmit="return false;">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" id="userName" name="userName" value="${userInfo.userName }" readonly="readonly">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea rows="5" cols="90" id="contents" name="contents"></textarea>
				</div>
<!-- 				<div class="mb-3"> -->
<!-- 					<label for="tag">TAG</label> -->
<!-- 					<input type="text" class="form-control" id="tag" name="tag" placeholder="태그를 입력해 주세요"> -->
<!-- 				</div> -->
			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="fnEditSave();">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList"onclick="fnEditCancel();">목록</button>
			</div>
		</div>
	</article>
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "contents",
	sSkinURI : "/resources/smarteditor/SmartEditor2Skin.html",
	fCreator : "createSEditor2"
});
// var pasteHTML = function(filename){                     //업로드한 사진을 화면에 보여주게 만드는 스크립트입니다.
//     var sHTML = '<img src="${pageContext.request.contextPath}/resources/upload/'+filename+'">'; //사진이 저장된 경로입니다.
//     oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);

// };
</script>
</html>