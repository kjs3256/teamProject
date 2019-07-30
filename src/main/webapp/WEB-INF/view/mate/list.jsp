<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	function confirmDelete(seq){
		var msg = confirm("정말 삭제하시겠습니까?");
		if(msg == true){
			alert("삭제되었습니다.");
			location.href="${pageContext.request.contextPath}/mate/delete/"+seq;
		}
	}
</script>
</head>
<body>
	<div id="header"></div>
	<section>
		<div class="container" style="width:70%">
			<div class="row">
			<h3>
				<b>FIND TOUR MATE</b>
			</h3>
			<hr style="border: solid 3px black;">
			<h4 style="text-align:center"><strong>공지사항</strong></h4>
			<p style="text-align:center">
				여행 장소 및 연락처와 일정을 반드시 기입해주세요. 같이 갈 인원이 구해졌으면 삭제 부탁드립니다.
			</p>
			<hr style="border:solid 1px yellow;">
				<form:form commandName="mateVO" method="POST">
				<div style="margin:auto; padding: 50px;">
					<div class="form-group col-lg-10">				
						<form:input path="title" class="form-control" placeholder="내용 (공지사항에 따라 작성 부탁드립니다)" maxlength="500"/>
						<small id="error"><form:errors path="title"/></small>
					</div>
					<div class="form-group col-lg-2">
						<input type="submit" class="btn btn-success" value="등록">
					</div>
				</div>
				</form:form>
				<table class="table">
					<c:forEach var="mate" items="${mateList}" varStatus="loop">
						<tr>
							<td>${mate.nickname} | 
							<small>${sdf.format(mate.regdate)}</small>
							 <br>
							 <h4>${mate.title}</h4></td>
							 <c:if test="${!empty authInfo && authInfo.nickname.equals(mate.nickname) }">
							 <td>
							 	<button onClick="return confirmDelete(${mate.seq})" class="btn btn-danger btn-sm">삭제</button>
							 </td>
							 </c:if>
						</tr>
					</c:forEach>
				</table>
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
	</section>
</body>
</html>