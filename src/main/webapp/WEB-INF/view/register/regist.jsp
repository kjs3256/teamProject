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
	$(document).ready(function(){
		$(function(){
			$('#phone').keydown(function(event){
				var key = event.charCode || event.keyCode || 0;
				$text = $(this);
				if(key !== 8 && key !==9){
					if($text.val().length === 3){
						$text.val($text.val() + '-');
					}
					if($text.val().length === 8){
						$text.val($text.val() + '-');
					}
				}
				return  (key ==8 || key ==9 || key==46 || (key >= 48 && key <= 57) || (key >= 96 && key <=105));
			})
		})
	});
	
	
</script>
</head>
<body>
	<div id="header"></div>
	<section>
		<!-- 회원가입 폼 -->
		<div class="container">
			<div class="col-lg-3"></div>
			<div class="col-lg-6" style="margin-top:50px;">
			<!-- 점보트론 -->
				<div class="jumbotron" style="padding-top:20px;">
				<form:form class="form-horizontal" method="post"
				 action="welcome" commandName="formData" path="join">
				<h3 style="text-align:center;">회원가입</h3>
				<div class="form-group">
					<div class="col-lg-10">
						<form:input class="form-control" placeholder="아이디" path="id" maxlength="20"/>
					</div>
					<input type="button" class="btn btn-default" id="idCh" value="중복"/><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;<small id="error"><form:errors path="id"/></small>
					<p class="result text-right">
						<span class="msg" style="font-size:13px; color:red;">중복확인 하세요!</span>
					</p>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<form:password class="form-control" placeholder="비밀번호" path="password" maxlength="20"/>
						<small id="error"><form:errors path="password"/></small>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<form:password class="form-control" placeholder="비밀번호 확인" path="confirmPassword" maxlength="20"/>
						<small id="error"><form:errors path="confirmPassword"/></small>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<form:input class="form-control" placeholder="닉네임" path="nickname" maxlength="20"/>
						<small id="error"><form:errors path="nickname"/></small>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<form:input path="phone" class="form-control" placeholder="핸드폰" data-format="ddd-dddd-dddd" maxlength="13"/>
						<small id="error"><form:errors path="phone"/></small>
					</div>
				</div>
				<div class="form-group">
					<div class="center" style="text-align:center">
						<input type="submit" class="btn btn-success" id="submit" disabled="disabled" value="회원가입"/>
					</div>
				</div>
				</form:form>
				</div>
			</div>
		</div>
	</section>
	<script>
	$("#idCh").click(function(){
		var query = {id : $("#id").val()};
		$.ajax({
			url : "<c:url value='/register/idCheck'/>",
			type : "post",
			data : query,
			success : function(data) {
				if(data == 1) {
					$(".result .msg").text("ID가 중복입니다.");
					$(".result .msg").attr("style", "color:#f00; font-size:13px;");   
					$("#submit").attr("disabled", "disabled");
				} else if(data == 0){
					$(".result .msg").text("이 ID는 사용 가능합니다.");
					$(".result .msg").attr("style", "color:#00f; font-size:13px;");
					$("#submit").removeAttr("disabled");
				}else{
					$(".result .msg").text("ID를 입력하세요");
					$(".result .msg").attr("style", "color:#f00; font-size:13px;");
					$("#submit").attr("disabled", "disabled");
				}
			}
		});  // ajax 끝
	});
	</script>
</body>
</html>