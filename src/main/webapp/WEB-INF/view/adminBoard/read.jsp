<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<!-- 애니메이션 담당 JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 스타일시트 -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#header").load("${pageContext.request.contextPath }/header")
	});
	function confirmDelete(seq){
		var msg = confirm("정말 삭제하시겠습니까?");
		if(msg == true){
			alert("삭제되었습니다.");
			location.href="${pageContext.request.contextPath}/adminBoard/delete/"+seq;
		}
	}
</script>
</head>
<body>
	<div id="header"></div>
	<!-- 메뉴 -->
	<div class="container">
		<!-- 글내용 -->
		<div class="row">
			<h3>
				<b>HOT PLACE BOARD</b>
			</h3>
			<hr style="border: solid 3px black;">
			<!-- 경로 -->
			<div>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/main' />">Home</a></li>
					<li><a href="<c:url value='/adminBoard/list'/>">Hot place
							board</a></li>
					<li><b>${adminBoardVO.title}</b></li>
				</ol>
			</div>
			<!-- 네비게이션 -->
			<div id="sideNav"
				style="float: left; border-top: none; border-bottom: none; padding-right: 50px;">
				<ul class="nav nav-pills nav-stacked" style="text-align: center;">
					<li role="presentation" class="active"><a href="#"><b>전체</b></a></li>
					<li role="presentation"><a href="#"><b>관광지</b></a></li>
					<li role="presentation"><a href="#"><b>맛집</b></a></li>
					<li role="presentation"><a href="#"><b>일정</b></a></li>
				</ul>
			</div>
			<div class=container>
				<div class="row">
					<h2>${adminBoardVO.title}</h2>
					<h4>
						<small>관리자 | ${sdf.format(adminBoardVO.regdate) } | 조회 :
							${adminBoardVO.readcount } </small>
					</h4>
					<table class="table text-left">
						<tr>
							<td style="font-size: 15px;">
								<div
									style="width:100%; height: 100%; float: top;">
									<br>
									<br>
									<br> ${adminBoardVO.content}<br> <br>
								</div>
							</td>
						</tr>
					</table>
					<div style="clear:both"></div>
					<div style="text-align: center;">
						<a href="<c:url value='/adminBoard/list'/>" class="btn btn-primary">목록</a>
						<c:if test="${authInfo.getId()=='admin'}">
							<a href="<c:url value='/adminBoard/edit'/>/${adminBoardVO.seq}"
								class="btn btn-warning">수정</a>
							<button class="btn btn-danger"
								onClick="return confirmDelete(${adminBoardVO.seq})">삭제</button>
						</c:if>
					</div>
				</div>
				</div>
			</div>
	</div>
</body>
</html>