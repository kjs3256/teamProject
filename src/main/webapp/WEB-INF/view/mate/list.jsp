<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행 메이트</title>
<body>
<div class="container">
	<div class="row">
		<form:form commandName="mateVO" method="POST">
			<h5>공지사항</h5>
			<p>님덜 공지사항 안 지키면 강퇴임<br>메롱</p>
		<br>
		<p>
		<label>
			<form:input path="title" size="50"/>
			<form:errors path="title"/>
			<input type="submit" value="등록">
		</label>
		</p>

			<br><br><br><br>
		
		<table border="1" class="table">
			<c:forEach var="mate" items="${mateList}" varStatus="loop">
				<tr>
					<td>${mate.nickname}
					 ${sdf.format(mate.regDate)}
					 <br>
					 ${mate.title}</td>
				</tr>
			</c:forEach>
		</table>
		</form:form>
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
					<li><a href="<c:url value='/mate/list'/>?pageNum=
					${startPage - pageBlock}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li><a class="text text-center" 
					href="<c:url value='/mate/list'/>?pageNum=${i}">${i }</a></li>
				</c:forEach>
				<c:if test="${endPage < pageCount }">
					<li><a href="<c:url value='/mate/list'/>?pageNum=
					${startPage + pageBlock}">다음</a></li>
				</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</div>
</body>
</html>