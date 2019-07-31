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
		$("#header").load("${pageContext.request.contextPath }/header")
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
body{
background-image: url('images/검정.jpg');
background-repeat: no-repeat;
background-position: top center;
background-size: 100% 1000px;
}

</style>
</head>
<body>
	<div id="header"></div>
	<div class="container">
		<div class="row">
		<div>
		<img class="img-responsive center-block" src="images/정사각형.jpg" >
		</div>
			<div class="col-md-12" style="margin-top: 30px;">
				<div class="text-center">
					<h2>HOT PLACE</h2>
					<br>
					<div class="row">
					<c:forEach var="aList" items="${adminBoardList}" begin="0" end="2">
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="${pageContext.request.contextPath}/upload/${adminBoardList.filename}" alt="...">
								<div class="caption">
									<h3>${adminBoardList.title}</h3>
									<p>${adminBoardList.schedule1}</p>
									<p>
										<a href="#" class="btn btn-primary" role="button">Button</a> <a
											href="#" class="btn btn-default" role="button">Button</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-md-6" style="margin-top: 30px;">
				<div class="text-center">
					<table class="table table-striped text-center"
						style="border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="4">
									<h4>
										<strong>숨은 맛집 추천</strong>
									</h4>
								</th>
								<th colspan="1"
									style="vertical-align: middle; text-align: center;"><a
									href="<c:url value='/userBoard/list'/>" role="button"> <span
										class="glyphicon glyphicon-plus"></span></a></th>
							</tr>
							<tr>
								<th
									style="background-color: #eeeeee; width: 40%; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								<th style="background-color: #eeeeee; text-align: center;">조회</th>
								<th style="background-color: #eeeeee; text-align: center;">추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${userBoardList}" begin="0" end="4">
								<tr>
									<td style="text-align: center;"><a
										href="<c:url value='/userBoard/read/${board.seq }'/>">
											${board.title}</a>&nbsp;&nbsp;<small style="color: #61210B;"><b>[
												${board.commcount } ]</b></small></td>
									<td>${board.nickname }</td>
									<td>${sdf.format(board.regdate) }</td>
									<td>${board.readcount }</td>
									<td>${board.reco }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="text-center">
					<table class="table table-striped text-center"
						style="border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="4">
									<h4>
										<strong>여행 메이트</strong>
									</h4>
								</th>
								<th colspan="1"
									style="vertical-align: middle; text-align: center;"><a
									href="<c:url value='/userBoard/list'/>" role="button"> <span
										class="glyphicon glyphicon-plus"></span></a></th>
							</tr>
							<tr>
								<th
									style="background-color: #eeeeee; width: 40%; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								<th style="background-color: #eeeeee; text-align: center;">조회</th>
								<th style="background-color: #eeeeee; text-align: center;">추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${userBoardList}" begin="0" end="4">
								<tr>
									<td style="text-align: center;"><a
										href="<c:url value='/userBoard/read/${board.seq }'/>">
											${board.title}</a></td>
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
		</div>
		<div class="jumbotron">
			<div class="text-center">
				<h2>추천 여행 루트</h2>
				<hr>

			</div>
		</div>
	</div>
</body>
</html>