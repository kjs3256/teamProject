<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<section>
		<!-- 로그인 폼 -->
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4" style="margin-top:50px;">
			<div>
			<img class="img-responsive center-block" src="${pageContext.request.contextPath}/images/그가거가.jpg" >			
			</div>
				<!-- 점보트론 -->
				<div class="jumbotron" style="padding-top:20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form:form method="post" commandName="loginCommand">
				<h3 style="text-align:center;">로그인</h3>
					<div class="form-group">
						<form:input class="form-control" placeholder="아이디" path="id"/>
						<small id="error"><form:errors path="id"/></small>
					</div>
					<div class="form-group">
						<form:password class="form-control" placeholder="비밀번호" path="password"/>
						<small id="error"><form:errors path="password"/></small>
					</div>
					<div class="form-group">
						<form:checkbox path="rememberId"/>아이디 저장
					</div>
					<div class="form-group text-center">
						<input type="submit" class="btn btn-primary" value="로그인">
						<a href="<c:url value='/register/regist'/>" class="btn btn-success">회원가입</a>
					</div>
				</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>