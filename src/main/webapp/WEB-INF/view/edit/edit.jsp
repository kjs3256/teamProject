<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-4" style="margin-top:50px;">
				<form:form commandName="member" method="post">
					<fieldset>
					<legend>회원 관리</legend>
					<form:password path="password" class="form-control" placeholder="비밀번호를 입력하세요"/>
					<small id="error"><form:errors path="password"/></small><br>
					<input type="submit" value="확인">
					</fieldset>
				</form:form>
				</div>
			</div>
		</div>
	</section>

</body>
</html>