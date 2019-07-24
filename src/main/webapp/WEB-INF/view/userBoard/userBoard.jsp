<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: blue; text-decoration: none;}
</style>
</head>
<body>
	<div id="header"></div>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6" style="margin-top:50px;">
					<table class="table table-striped text-center" style="border:1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="6">
									<h4>공지사항</h4>
								</th>
							</tr>
							<tr>
								<th style="background-color:#eeeeee; text-align:center;">&nbsp;</th>
								<th style="background-color:#eeeeee; width:40%; text-align:center;">제목</th>
								<th style="background-color:#eeeeee; text-align:center;">작성자</th>
								<th style="background-color:#eeeeee; text-align:center;">작성일</th>
								<th style="background-color:#eeeeee; text-align:center;">조회</th>
								<th style="background-color:#eeeeee; text-align:center;">추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${noticeBoardList}" begin="0" end="4">
								<tr>
									<td>
										<span class="glyphicon glyphicon-bullhorn"></span>
									</td>
									<td style="text-align:center;">
										<a href= "<c:url value='/userBoard/read/${board.seq }'/>
										?pageNum=${currentPage}">${board.title}</a>
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
				<div class="col-lg-6" style="margin-top:50px;">
					<table class="table table-striped text-center" style="border:1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="6">
								<h4>추천 Best</h4>
								</th>
							</tr>
							<tr>
								<th style="background-color:#eeeeee; text-align:center;">&nbsp;</th>
								<th style="background-color:#eeeeee; width:40%; text-align:center;">제목</th>
								<th style="background-color:#eeeeee; text-align:center;">작성자</th>
								<th style="background-color:#eeeeee; text-align:center;">작성일</th>
								<th style="background-color:#eeeeee; text-align:center;">조회</th>
								<th style="background-color:#eeeeee; text-align:center;">추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${likeBoardList}" begin="0" end="4">
								<tr>
									<td>
										<span style="color:red" class="glyphicon glyphicon-heart"></span>
									</td>
									<td style="text-align:center;">
										<a href= "<c:url value='/userBoard/read/${board.seq }'/>
										?pageNum=${currentPage}">${board.title}</a>
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
				<h3><b>숨은 맛집 게시판(전체 글:${count })</b></h3>
				<table class="table table-striped text-center" style="border:1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color:#eeeeee; text-align:center;">번호</th>
							<th style="background-color:#eeeeee; width:40%; text-align:center;">제목</th>
							<th style="background-color:#eeeeee; text-align:center;">작성자</th>
							<th style="background-color:#eeeeee; text-align:center;">작성일</th>
							<th style="background-color:#eeeeee; text-align:center;">조회</th>
							<th style="background-color:#eeeeee; text-align:center;">추천</th>
						</tr>
					</thead>
					<c:if test="${count == 0}">
						<tbody>
							<tr>
								<td colspan="6"><h3 class="text-center">게시글이 없습니다.</h3></td>
							</tr>
						</tbody>
					</c:if>
					<c:if test="${count > 0}">
						<tbody>
							<c:forEach var="board" items="${userBoardList}">
								<tr>
									<td width="50">
										<c:out value="${number }"/>
										<c:set var="number" value="${number-1 }"/>
									</td>
									<td style="text-align:center;">
										<a href= "<c:url value='/userBoard/read/${board.seq }'/>
										?pageNum=${currentPage}">${board.title}</a>
									</td>
									<td>${board.nickname }</td>
									<td>${sdf.format(board.regdate) }</td>
									<td>${board.readcount }</td>
									<td>${board.reco }</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>
				<a class="btn btn-primary pull-right" 
						href="<c:url value='/userBoard/write'/>">글쓰기</a>
				<c:if test="${count>0 }">
					<c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1 }"/>
					<c:set var="pageCount" value="${count / pageSize + imsi }"/>
					<c:set var="pageBlock" value="${5 }"/>
					<fmt:parseNumber var="result" value="${currentPage / pageBlock }"
					integerOnly="true"/>
					<c:set var="startPage" value="${result * pageBlock+1 }"/>
					<c:set var="endPage" value="${startPage + pageBlock-1 }"/>
					
					<c:if test="${endPage > pageCount }">
						<c:set var="endPage" value="${pageCount }"/>
					</c:if>
					<div class="text-center">
						<ul class="pagination">
						<c:if test="${startPage > pageBlock }">
							<li><a href="<c:url value='/userBoard/list'/>?pageNum=
							${startPage - pageBlock}">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<li><a class="text text-center" 
							href="<c:url value='/userBoard/list'/>?pageNum=${i}">${i }</a></li>
						</c:forEach>
						<c:if test="${endPage < pageCount }">
							<li><a href="<c:url value='/userBoard/list'/>?pageNum=
							${startPage + pageBlock}">다음</a></li>
						</c:if>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>