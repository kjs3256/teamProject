<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!authInfo.nickname.equals(userBoardVO.nickname)}">
	<script>
		alert("잘못된 접근입니다.");
		location.href="${pageContext.request.contextPath}/userBoard/read/"+${userBoardVO.seq};
	</script>
</c:if>
<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/userBoard/list">
