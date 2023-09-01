<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<c:if test="${not empty id}">
		<script>
				location.href = "index.do";
		</script>
	</c:if>
	
	<c:if test="${empty id}">
		<script>
			alert('failed');
			history.back();
		</script>		
	</c:if>	
</body>
</html>
