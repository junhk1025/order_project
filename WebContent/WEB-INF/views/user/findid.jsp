<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/login.css">
<script src="js/global.js"></script>
<style>

</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<div id="content">
		<div id="box">
			<div id="idbox" class="findbox">
				<p>아이디 찾기</p>
				<form action="/CDSInfo/findidok.do" method="POST">
					<input type="text" name="name" placeholder="이름을 입력하세요." id="id"><br>
					<input type="text" name="phone" placeholder="휴대폰 번호를 입력하세요." class="phone"><br>
					<span class="find-loginpw"><a href="/CDSInfo/login.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/CDSInfo/findpw.do">비밀번호 찾기</a></span><br>
					<input type="submit" value="아이디 찾기">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
</body>
</html>
