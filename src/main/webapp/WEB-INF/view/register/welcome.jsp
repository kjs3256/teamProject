<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<!-- 애니메이션 담당 JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 스타일시트 -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
    $("#header").load("${pageContext.request.contextPath }/header")
    });
</script>
</head>
<body>
	<div id="header"></div>
	<div class="container">
		<div class="row text-center" style="margin-top:40px;">
		<b>${formData.nickname }님, 회원 가입을 축하드립니다.</b><br/>
		<a href="<c:url value='/login'/>" class="btn btn-primary">로그인</a>
		</div>
	</div>
</body>
</html>