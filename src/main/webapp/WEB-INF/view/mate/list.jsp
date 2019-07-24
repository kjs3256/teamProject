<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, td{
border: 1px solid black
}

table{
width:60%;
height: 100px;
margin: auto;
text-align: center;
}

form{
width:60%;
height: 100px;
margin: auto;
text-align: center;
}

div{
width:100%;
height: 100px;
margin: auto;
text-align: center;
}
</style>
</head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행 메이트</title>
<body>
	<form action="<c:url value="/mate/list"/>"method="POST">
		<input type="button" value="카테고리">
		<h5>공지사항</h5>
		<p>님덜 공지사항 안 지키면 강퇴임<br>메롱</p>
	<br>
		<input type="button" value="목록">

		<br><br>
	<div>
		<input type="text" size="50">
		<input type="submit" value="등록">
	</div>
		<br><br><br><br>
	
	<table border="1">
		<c:forEach var="mate" items="${mateList}" varStatus="loop">
			<tr>
				<td>${mate.nickname}
				 ${mate.regDate}
				 <br>
				 ${mate.title}</td>
			</tr>
		</c:forEach>
	</table>
	</form>
	
	<div>
		<c:if test="${pagination.curRange ne 1 }">
			<a href="#" onClick="fn_paging(1)">[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1 }">
			<a href="#" onClick="fn_paging('${pagination.prevPage}')">[이전]</a>
		</c:if>
		<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
		 	<c:choose>
		 		<c:when test="${pageNum eq pagination.curPage }">
		 			<span style="font-weight:bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
		 		</c:when>
		 		<c:otherwise>
		 			<a href="#" onClick="fn_pagign('${pageNum}')">${pageNum }</a>
		 		</c:otherwise>
		 	</c:choose>
		 </c:forEach>
		 <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
		 	<a href="#" onClick="fn_paging('${pagination.nextPage}')">[다음]</a>
		 </c:if>
		 <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0 }">
		 	<a href="#" onClick="fn_paging('${pagination.pageCnt}')">[끝]</a>
		 </c:if>
	</div>
</body>
</html>