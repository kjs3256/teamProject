<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	a:link { color:#2A0A12; text-decoration: none;}
	a:visited { color:#2A0A12; text-decoration: none;}
	a:hover { color:#2A0A12; text-decoration: none;}
	select::-ms-expand {
    display: none;
	}
	.select-arrow-image {
    width: 200px;
    padding: .8em .5em;
    font-family: inherit;
    border: 1px solid #999;
    box-shadow: none;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    background-color: transparent;
    background-image: url("${pageContext.request.contextPath}/images/down.png");
    background-position: center right;
    background-repeat: no-repeat;
    background-size: 15px 10px;
	}
</style>
</head>
<body>
	<div id="header"></div>
	<section>
		<div class="container" style="width:80%">
			<div class="row">
			<h3>
				<b>HIDE TASTY</b>
			</h3>
			<hr style="border: solid 3px black;">
				<div class="col-lg-6" style="margin-top:50px;">
					<table class="table text-center" style="border:1px solid #dddddd; color:#2A0A12;">
						<thead>
							<tr>
								<th colspan="5">
									<h4>공지사항</h4>
								</th>
							</tr>
							<tr>
								<th style="background-color:#eeeeee; text-align:center;">&nbsp;</th>
								<th style="background-color:#eeeeee; width:15%; text-align:center;">카테고리</th>
								<th style="background-color:#eeeeee; width:40%; text-align:center;">제목</th>
								<th style="background-color:#eeeeee; text-align:center;">작성자</th>
								<th style="background-color:#eeeeee; text-align:center;">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${noticeBoardList}" begin="0" end="4">
								<tr>
									<td>
										<span class="glyphicon glyphicon-bullhorn"></span>
									</td>
									<td>${board.loc }</td>
									<td style="text-align:center;">
										<a href= "<c:url value='/userBoard/read/${board.seq }'/>
										?pageNum=${currentPage}">${board.title}</a>&nbsp;&nbsp;<small style="color:#61210B;"><b>[ ${board.commcount } ]</b></small>
									</td>
									<td>${board.nickname }</td>
									<td>${board.readcount }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-lg-6" style="margin-top:50px;">
					<table class="table text-center" style="border:1px solid #dddddd; color:#2A0A12;">
						<thead>
							<tr>
								<th colspan="6">
								<h4>추천 Best</h4>
								</th>
							</tr>
							<tr>
								<th style="background-color:#eeeeee; text-align:center;">&nbsp;</th>
								<th style="background-color:#eeeeee; width:15%; text-align:center;">카테고리</th>
								<th style="background-color:#eeeeee; width:40%; text-align:center;">제목</th>
								<th style="background-color:#eeeeee; text-align:center;">작성자</th>
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
									<td>${board.loc }</td>
									<td style="text-align:center;">
										<a href= "<c:url value='/userBoard/read/${board.seq }'/>
										?pageNum=${currentPage}">${board.title}</a>&nbsp;&nbsp;<small style="color:#61210B;"><b>[ ${board.commcount } ]</b></small>
									</td>
									<td>${board.nickname }</td>
									<td>${board.readcount }</td>
									<td>${board.reco }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<hr>
				<div class="select-box select-script">
				<form:form commandName="userBoardVO" method="get" action="${pageContext.request.contextPath }/userBoard/list/loc">
					<form:select path="loc" class="select-arrow-image">
						<option selected>지역</option>
						<form:option value="남구">남구</form:option>
						<form:option value="부산진구">부산진구</form:option>
						<form:option value="해운대구">해운대구</form:option>
						<form:option value="수영구">수영구</form:option>
						<form:option value="동구">동구</form:option>
						<form:option value="서구">서구</form:option>
						<form:option value="북구">북구</form:option>
						<form:option value="사하구">사하구</form:option>
						<form:option value="사상구">사상구</form:option>
						<form:option value="동래구">동래구</form:option>
						<form:option value="연제구">연제구</form:option>
						<form:option value="금정구">금정구</form:option>
						<form:option value="중구">중구</form:option>
						<form:option value="영도구">영도구</form:option>
						<form:option value="강서구">강서구</form:option>
						<form:option value="기장군">기장군</form:option>
					</form:select>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-info btn-sm" value="조회">
				</form:form>
				</div>
				<table class="table text-center" style="border:1px solid #dddddd; color:#2A0A12; margin-top:10px;">
					<thead>
						<tr>
							<th style="background-color:#eeeeee; text-align:center;">번호</th>
							<th style="background-color:#eeeeee; width:15%; text-align:center;">카테고리</th>
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
									<td>${board.loc }</td>
									<td style="text-align:center;">
										<a href= "<c:url value='/userBoard/read/${board.seq }'/>
										?pageNum=${currentPage}">${board.title}</a>&nbsp;&nbsp;<small style="color:#61210B;"><b>[ ${board.commcount } ]</b></small>
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
						href="<c:url value='/userBoard/write'/>" style="color:white;">글쓰기</a>
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