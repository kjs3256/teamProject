<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>그가거가</title>
<style type="text/css">

	#error{
		color:red;
	}
	
	@font-face { font-family: 'S-CoreDream-8Heavy';
	 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-8Heavy.woff') format('woff'); 
	 font-weight: normal; font-style: normal; }
	 
	body { padding-bottom: 70px; 
	font-family:'S-CoreDream-8Heavy';
	font-size:15px;
	}
	a:hover{
		color:yellow; text-decoration: none;	}
	
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
				<a class="navbar-brand"  style="padding:2px;" href="<c:url value='/main'/>"> 
				<img src="${pageContext.request.contextPath }/images/로고2.png" width=100px; height=100%;>
				</a>
			</div>

			<div class="navbar-collapse collapse" id="navbar-collapsible">

				<ul class="nav navbar-nav navbar-left">
					<li><a id="menu" href="<c:url value='/adminBoard/list'/>"><span style="font-size:15pt; color:white;">핫 플레이스</span></a></li>
					<li><a id="menu"  href="<c:url value='/userBoard/list'/>"><span style="font-size:15pt; color:white;">숨은 맛집 추천</span></a></li>
					<li><a id="menu"  href="<c:url value='/mate/list'/>"><span style="font-size:15pt; color:white;">여행 메이트</span></a></li>
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

				<form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/search" method="get">
					<div class="form-group" style="display: inline;">
						<div class="input-group">
							<input type="text" class="form-control" name="keyword" placeholder="검색(제목)"/>
							<span class="input-group-addon">
							<button type="submit" style="background: transparent; border: none; cursor: pointer;">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</header>