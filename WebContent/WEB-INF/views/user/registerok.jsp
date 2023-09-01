<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/login.css">
<script src="js/global.js"></script>
<style>
.findbox {
	text-align :center;
}
.findbox > p { 
	font-size: 24px;
}

input[type=button] {
    width: 281px;
    height: 53px;
    border: 1px solid black;
    border-radius: 25px;
    background-color: rgba(255,255,255, .5);
    color: black;
    margin-top:10px;
}
#idbox{
	padding-top : 179px;
}
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<div id="content">
		<div id="box">
			<div id="idbox" class="findbox">
			<c:if test="${result == 1}">
				<p>회원가입이 완료 되었습니다.</p>
				<input type="button" value="로그인" onclick="location.href='/CDSInfo/login.do'">
			</c:if>
			<c:if test="${result == 0}">
				<p>정보를 제대로 입력해 주세요</p>
				<input type="button" value="돌아가기" onclick="history.back();">
			</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>
