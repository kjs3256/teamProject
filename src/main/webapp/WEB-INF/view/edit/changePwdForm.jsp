<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="col-lg-4"></div>
			<div class="col-lg-4" style="margin-top:50px;">
				<!-- 점보트론 -->
				<div class="jumbotron" style="padding-top:20px;">
					<form:form commandName="pwdCmd" method="post">
					<fieldset>
						<legend>비밀번호 변경</legend>
						<div class="form-group">
							<form:password class="form-control" placeholder="현재 비밀번호" path="currentPassword"/><br>
							<small id="error"><form:errors path="currentPassword"/></small>
						</div>
						<div class="form-group">					
							<form:password class="form-control" placeholder="새 비밀번호" path="newPassword"/><br>
							<small id="error"><form:errors path="newPassword"/></small>
						</div>
						<input type="submit" class="btn btn-success" value="변경">
						<a href="<c:url value='/main'/>" class="btn btn-danger pull-right">취소</a>
					</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>