<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
</head>
<body>
	<c:if test="${result==1}">
		<script>
			location.href = "/CDSInfo/noticelist.do";
		</script>
	</c:if>
	
	<c:if test="${result==2}">
		<script>
			alert("삭제 실패");
			history.back();
		</script>
	</c:if>
</body>
</html>