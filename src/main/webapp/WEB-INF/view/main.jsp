<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<!-- 애니메이션 담당 JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 스타일시트 -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		<div class="row">
			<div class="col-md-4">
				<div class="text-center">
					<h2>HOT PLACE</h2>
				</div>
			</div>
			<div class="col-md-4">
				<div class="text-center">
					<h2>숨은 맛집</h2>
				</div>
			</div>
			<div class="col-md-4">
				<div class="text-center">
					<h2>여행 메이트</h2>
				</div>
			</div>
		</div>
		<div class="jumbotron">
			<div class="text-center">
				<h2>추천 여행 루트</h2><hr>
				
			</div>
		</div>
	</div>
</body>
</html>