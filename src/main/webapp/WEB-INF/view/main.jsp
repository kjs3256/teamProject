<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#header").load("${pageContext.request.contextPath }/header");
		$('#myCarousel').carousel('cycle');
	});
</script>
<style>
a:link {
	color: #151515;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: none;
}

body {
	background-image: url('images/검정.jpg');
	background-repeat: no-repeat;
	background-position: top center;
	background-size: 100% 1100px;
}
</style>
</head>
<body>
	<div id="header"></div>
	<div class="container">
		<div class="row">
		<div>
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					data-interval="3000">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="2" class="active"></li>
					</ol>
					<div class="carousel-inner" style="height:550px;" role="listbox">
						<div class="item active">
							<img src="${pageContext.request.contextPath }/images/정사각형.jpg" class="img-responsive center-block">
						</div>
						<div class="item" style="margin-top:30px;">
							<img src="${pageContext.request.contextPath }/images/root2.png" class="img-responsive center-block">
						</div>
						<div class="item" style="margin-top:30px;">
							<img src="${pageContext.request.contextPath }/images/root1.png" class="img-responsive center-block">
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> 
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> 
					<a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> 
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
			
			<div class="col-md-12" style="margin-top: 30px;">
				<div class="text-center">
					<h2>
						<a href="<c:url value='/adminBoard/list'/>" role="button">HOT
							PLACE</a>
					</h2>
					<br>
					<div class="row">
						<c:forEach var="aList" items="${adminBoardList}" begin="0" end="2">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
								<a href="${pageContext.request.contextPath }/adminBoard/read/${aList.seq}">
									<img src="${pageContext.request.contextPath}/upload/${aList.filename}"
										alt="..." style="height:200px; width:100%;"></a>
									<div class="caption">
										<h3>${aList.title}</h3>
										<p>${aList.schedule1}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div style="margin-top: 30px;">
				<div class="text-center">
					<table class="table table-striped text-center"
						style="border: 1px solid #dddddd; table-layout:fixed">
						<colgroup>
							<col style="width:40%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:10%;">
							<col style="width:10%;">
						</colgroup>
						<thead>
							<tr>
								<th colspan="4">
									<h4>
										<strong>HIDE TASTY</strong>
									</h4>
								</th>
								<th colspan="1"
									style="vertical-align: middle; text-align: center;"><a
									href="<c:url value='/userBoard/list'/>"> <span
										class="glyphicon glyphicon-plus"></span></a></th>
							</tr>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								<th style="background-color: #eeeeee; text-align: center;">조회</th>
								<th style="background-color: #eeeeee; text-align: center;">추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${userBoardList}" begin="0" end="4">
								<tr>
									<td>
									<div class="over">
									<a href="<c:url value='/userBoard/read/${board.seq }'/>">
											${board.title}</a>&nbsp;&nbsp;<small style="color: #61210B;"><b>[
												${board.commcount } ]</b></small>
									</div>
									</td>
									<td>${board.nickname }</td>
									<td>${sdf.format(board.regdate) }</td>
									<td>${board.readcount }</td>
									<td>${board.reco }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div style="margin-top: 30px;">
				<div class="text-center">
					<table class="table table-striped text-center"
						style="border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2">
									<h4>
										<strong>TOUR MATE</strong>
									</h4>
								</th>
								<th colspan="1"
									style="vertical-align: middle; text-align: center;"><a
									href="<c:url value='/mate/list'/>" role="button"> <span
										class="glyphicon glyphicon-plus"></span></a></th>
							</tr>
							<tr>
								<th
									style="background-color: #eeeeee; width: 80%; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th
									style="background-color: #eeeeee; width: 10%; text-align: center;">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${mateBoardList}" begin="0" end="4">
								<tr>
									<td style="text-align: center;">${board.title}</td>
									<td style="text-align: center">${board.nickname }</td>
									<td>&nbsp;</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>