<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>그가거가</title>
<link href="${pageContext.request.contextPath }/css/style.css"
	rel="stylesheet" type="text/css">
<style>
	#error{
		color:red;
	}
</style>
</head>
<body>
	<header>
		<div class="navbar-inverse">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-collapsible">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/main'/>"> 
				 <span style="font-size:20pt">로고</span>
				</a>
			</div>

			<div class="navbar-collapse collapse" id="navbar-collapsible">

				<ul class="nav navbar-nav navbar-left">
					<li><a href="<c:url value='/adminBoard/list'/>"><span style="font-size:15pt; color:white;">핫 플레이스</span></a></li>
					<li><a href="<c:url value='/userBoard/list'/>"><span style="font-size:15pt; color:white;">숨은 맛집 추천</span></a></li>
					<li><a href="#"><span style="font-size:15pt; color:white;">여행 메이트</span></a></li>
				</ul>

				<div class="navbar-right btn-group">
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span class="glyphicon glyphicon-off" style="color:white"></span></a>
								<ul class="dropdown-menu">
									<c:if test="${empty authInfo}">
										<li><a href="<c:url value='/login'/>">로그인</a></li>
										<li><a href="<c:url value='/register/regist'/>">회원가입</a></li>
									</c:if>
									<c:if test="${!empty authInfo}">
										<li><a href="<c:url value='/edit/edit'/>">회원 관리</a></li>
										<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
									</c:if>
								</ul>
							</li>
						</ul>
					</div>
				</div>

				<form:form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/search" method="get">
					<div class="form-group" style="display: inline;">
						<div class="input-group">
							<input type="text" class="form-control" name="keyword"/>
							<span class="input-group-addon">
							<button type="submit" style="background: transparent; border: none; cursor: pointer;">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
							</span>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</header>