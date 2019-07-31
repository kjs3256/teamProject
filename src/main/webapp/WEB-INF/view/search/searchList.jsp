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
<style>
	a:visited { text-decoration: none;}
</style>
</head>
<body>
	<div id="header"></div>
	<section>
		<div class="container">
			<div class="row">
				<h3><b>"${keyword }"에 대한 검색 결과</b></h3><hr style="border:solid 1px blue">
				<h4> HOT PLACE ></h4>
				<div id="search">
					<c:if test="${empty adminBoardList}">
						<h3 class="text-center">검색 결과가 없습니다.</h3>
						<hr style="border:double 1px black">
					</c:if>
					<c:if test="${!empty adminBoardList}">
						<c:forEach var="board" items="${adminBoardList}" begin="0" end="4">
							<a href= "<c:url value='/adminBoard/read/${board.seq }'/>" style="font-size:16px;">
							${board.title}</a><br>
							<br>
							관리자 | 
								<small>조회 : ${board.readcount }</small>
								<br><hr>
						</c:forEach>
						<hr style="border:double 1px black">
					</c:if>
				</div>
				<h4> HIDE TASTY ></h4>
				<div id="search">
					<c:if test="${empty userBoardList}">
						<h3 class="text-center">검색 결과가 없습니다.</h3>
					</c:if>
					<c:if test="${!empty userBoardList}">
						<c:forEach var="board" items="${userBoardList}" begin="0" end="4">
							<a href= "<c:url value='/userBoard/read/${board.seq }'/>" style="font-size:16px;">
							${board.title}</a><br>
							<br>
								${board.nickname } |
								<small>조회 : ${board.readcount }</small> |
								<small>추천 : ${board.reco }</small> |
								<br><hr>
						</c:forEach>
						<hr style="border:double 1px black">
					</c:if>
				</div>
			</div>
		</div>
	</section>
</body>
</html>