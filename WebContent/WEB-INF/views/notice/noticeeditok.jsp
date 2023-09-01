<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/asset.jsp" %>
</head>
<body>
	<!-- -->
	<c:if test="${result == 1}">
		<script>
			//location.href = "/web/board/list.do";
			location.href = "view.do?subTitleName=고객센터&seq=${result.seq}";
		</script>
		</c:if>
		
		<c:if test="${result == 0}">
		<script>
			alert('failed');
			history.back();
		</script>	
	</c:if>
</body>
</html>