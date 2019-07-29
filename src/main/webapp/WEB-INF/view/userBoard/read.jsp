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
	$(document).ready(function(){
    $("#header").load("${pageContext.request.contextPath }/header")
    $("#comment").load("${pageContext.request.contextPath }/comment/list/${userBoardVO.seq}")
    });
	function like(){
		alert("추천은 로그인 후에 가능합니다.");
		return false;
	}
	function confirmDelete(seq){
		var msg = confirm("정말 삭제하시겠습니까?");
		if(msg == true){
			alert("삭제되었습니다.");
			location.href="${pageContext.request.contextPath}/userBoard/delete/"+seq;
		}
	}
</script>
</head>
<body>
	<div id="header"></div>
	<!-- 글내용 -->
	<div class="container">
		<div class="row">
			<h3>${userBoardVO.title }</h3>
			<h4>
				<small>${userBoardVO.nickname } |
					${sdf.format(userBoardVO.regdate) } | 조회 : ${userBoardVO.readcount }
					| 추천 : ${userBoardVO.reco }</small>
			</h4>
			<hr />
			<div class=container>
				<div class="row" style="margin-bottom:50px;">
					<table class="table text-left">
						<tr>
							<td style="font-size: 15px;">
								<div style="width: 80%; height: 100%; float:top;">
									${userBoardVO.content}<br><br>
								</div>
							</td>
						</tr>
					</table>
					<div style="clear:both">
					</div>
					<div class="text-center">
						<c:if test="${authInfo != null }">
						<a href="<c:url value='/reco?id=${authInfo.id }&seq=${userBoardVO.seq }'/>" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-thumbs-up"><br><small>${userBoardVO.reco }</small></span></a>
						</c:if>
						<c:if test="${empty authInfo}">
						<button class="btn btn-default btn-lg" onclick="like()">
						<span class="glyphicon glyphicon-thumbs-up"><br><small>${userBoardVO.reco }</small></span></button>
						</c:if>
					</div>
					<div id="comment"></div>
					<a href="<c:url value='/userBoard/list'/>" class="btn btn-primary">목록</a>
					<c:if
						test="${authInfo.getNickname().equals(userBoardVO.getNickname()) }">
						<a href="<c:url value='/userBoard/edit'/>/${userBoardVO.seq}" class="btn btn-warning">수정</a>
						<button class="btn btn-danger" onClick="return confirmDelete(${userBoardVO.seq})">삭제</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>