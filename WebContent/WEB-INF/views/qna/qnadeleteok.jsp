<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<style>

</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	
	<c:if test="${result == 1}">
	<script>
		location.href = "/CDSInfo/qnalist.do?subTitleName=고객센터";
	</script>
	</c:if>
	
	<c:if test="${result == 0}">
	<script>
		alert('failed');
		history.back();
	</script>	
	</c:if>
			
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
</body>
</html>



