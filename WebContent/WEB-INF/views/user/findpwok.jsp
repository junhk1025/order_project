<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/login.css">
<script src="js/global.js"></script>
<style>
.findbox > p { 
	/* margin-top : 50px; */
	font-size: 24px;
	padding-bottom: 30px;
}
#idbox{
	font-size:20px;
	padding-top: 198px;
}

.find-loginpw {
	display: block;
	text-align: center;
	margin-left: 0;
}
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<div id="content">
		<div id="box">
			<div id="idbox" class="findbox">
			<c:if test="${result == null}">
				<p>일치하는 회원이 없습니다.</p>
			</c:if>
			<c:if test="${result != null }">
				<p>${result.name}님의 비밀번호는 " ${result.pw} " 입니다.</p>
			</c:if>
				<span class="find-loginpw"><a href="/CDSInfo/login.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/CDSInfo/findid.do">아이디 찾기</a></span><br>
			</div>
		</div>s
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>
