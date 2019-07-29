<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<body>
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<script>
function commentDelete(cseq){
	var msg = confirm("정말 삭제하시겠습니까?");
	if(msg == true){
		location.href="${pageContext.request.contextPath}/comment/deleteComm/"+cseq;
	}
}
</script>
	<div class=container style="margin-top: 100px;">
		<div class="row">
			<form:form id="commentForm" name="commentForm" method="post" action="${pageContext.request.contextPath }/comment/add"
			commandName="commentVO">
				<input type="hidden" name="seq" value=${seq }>
				<div>
					<strong>Comments(댓글 개수: ${count })</strong>
					<c:if test="${count == 0 }">
						<div class="text-center">
							<h3>아직 댓글이 없습니다.</h3>
						</div>
					</c:if>
					<c:if test="${count > 0 }">
						<div>
							<table class="table">
								<c:forEach var="comment" items="${commentList }">
									<tr>
										<th style="width: 150px; background-color: #dddddd">${comment.nickname }&nbsp;&nbsp;|&nbsp;&nbsp;
											${sdf.format(comment.regdate) } &nbsp;&nbsp;<br>
										</th>
										<td class="text-left">${comment.content }</td>
										<c:if test="${authInfo != null && authInfo.nickname.equals(comment.nickname) }">
											<td><input type="button"
												class="btn btn-sm btn-danger pull-right"
												onClick="return commentDelete(${comment.cseq })"
												value="댓글삭제"></td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:if>
					<div>
						<table class="table">
							<tr>
								<c:if test="${authInfo != null }">
									<td colspan="3"><form:textarea path="content"
											class="form-control" style="resize:none; height:100px;"
											placeholder="댓글을 입력하세요"></form:textarea></td>
								</c:if>
								<c:if test="${authInfo == null }">
									<td colspan="3"><textarea name="content"
											class="form-control" style="resize: none; height: 100px;"
											placeholder="로그인을 해야 댓글을 쓸 수 있습니다." readonly></textarea></td>
								</c:if>
							</tr>
							<tr>
								<td colspan="3"><input type="button"
									class="btn btn-success" value="댓글 달기" onClick="commentCheck()"></td>
							</tr>
						</table>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>