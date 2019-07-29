<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">
	//관리자 게시글 삭제 기능
	$(function() { //전체선택 체크박스 클릭
		$("#allCheck").click(function() { //만약 전체 선택 체크박스가 체크된상태일경우 
			if ($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked", true); // 전체선택 체크박스가 해제된 경우 
			} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})
	function confirmDelete() {
		if (check)
			var msg = confirm("정말 삭제하시겠습니까?");
		if (msg == true) {
			alert("삭제되었습니다.");
		} else {
			return false;
		}
	}
	function confirmDelete(seq) {
		var msg = confirm("정말 삭제하시겠습니까?");
		if (msg == true) {
			alert("삭제되었습니다.");
			location.href = "/teamProject/adminBoard/delete/" + seq;
		} else {
			return false;
		}
	}
</script>
<style>
a:link {
	color: black;
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
}
</style>
<body>
	<div id="header"></div>
	<section>
		<div class="container" style="width: 850px;">
			<div class="row">
			<h3>
				<b>HOT PLACE BOARD</b>
			</h3>
			<hr style="border: solid 3px black;">
			<div>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/main' />">Home</a></li>
				<li><a href="<c:url value='/adminBoard/list'/>">Hot place board</a></li>
			</ol>
			</div>
				<form action="/teamProject/adminBoard/search" method="GET">
					<div class="btn pull-right">
						<select class="selectpicker" id="ischeck" name="ischeck">
							<option value="0">전체</option>
							<option value="1">관광지</option>
							<option value="2">맛집</option>
							<option value="3">일정</option>
						</select> <input type="submit" value="조회" />
					</div>
				</form>
				<form action="/teamProject/adminBoard/delete" method="POST">
					<c:if test="${authInfo.getId()=='admin'}">
						<div class="btn pull-left">
							<input type="checkbox" id="allCheck" />전체 선택 <input
								type="submit" value="삭제" onclick="return confirmDelete()" /> <input
								type="button" value="등록"
								onclick="location.href='${pageContext.request.contextPath}/adminBoard/write'" />
						</div>
					</c:if>
					<table class="table table-striped text-center"
						style="border: 1px solid #dddddd">
						<thead>
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
								<c:forEach var="adminBoard" items="${adminBoardList}">
									<c:set var="subDate"
										value="${fn:substring(adminBoard.regdate, 0, 11)}" />
									<tr>
										<c:if test="${authInfo.getId()=='admin'}">
											<td style="text-align: center;"><input type="checkbox"
												id="checkBoxList" name="checkBoxList"
												value="${adminBoard.seq}"></td>
										</c:if>
										<td><img width="430px" height="300px"
											src="${pageContext.request.contextPath}/resources/upload/${adminBoard.filename}">
										</td>
										<td style="text-align: center;"><a
											href="<c:url value='/adminBoard/read/${adminBoard.seq}'/>">
												<br> <br> <strong>${adminBoard.title}</strong> <br>
												<br>
										</a> <c:choose>
												<c:when test="${adminBoard.ischeck==3}">
													<p>${adminBoard.schedule1}~${adminBoard.schedule2}</p>
												</c:when>
												<c:otherwise>
													<p>${subDate}</p>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
				</form>
				<c:if test="${count > 0}">
					<c:set var="imsi" value="${count % pageSize == 0 ? 0 : 1 }" />
					<c:set var="pageCount" value="${count / pageSize + imsi }" />
					<c:set var="pageBlock" value="${5 }" />
					<fmt:parseNumber var="result" value="${currentPage / pageBlock }"
						integerOnly="true" />
					<c:set var="startPage" value="${result * pageBlock+1 }" />
					<c:set var="endPage" value="${startPage + pageBlock-1 }" />
					<c:if test="${endPage > pageCount }">
						<c:set var="endPage" value="${pageCount }" />
					</c:if>
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${startPage > pageBlock }">
								<li><a
									href="<c:url value='/adminBoard/list'/>?pageNum=
							${startPage - pageBlock}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<li><a class="text text-center"
									href="<c:url value='/adminBoard/list'/>?pageNum=${i}">${i }</a></li>
							</c:forEach>
							<c:if test="${endPage < pageCount }">
								<li><a
									href="<c:url value='/adminBoard/list'/>?pageNum=
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