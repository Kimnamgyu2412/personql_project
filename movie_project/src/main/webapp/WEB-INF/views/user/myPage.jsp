<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<%@ include file="/WEB-INF/views/bar/topBar.jsp"%>
<%@ include file="/WEB-INF/views/bar/sideBar.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
// 		_FRM = document.editForm;
	});
</script>
<body>
<input type="hidden" id="userId" name="userId" value="${userId}">
	
</body>
</html>