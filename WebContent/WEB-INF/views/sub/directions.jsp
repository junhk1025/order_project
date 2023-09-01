<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/sub.css">
<link rel="stylesheet" href="css/subDirections.css">
<script src="js/globalSub.js"></script>
<script src="/developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ce635b8c1309b52384031ecf0af9816"></script>
<script src="js/subDirections.js"></script>
<style>

</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	<div class="section02" id="content-directions">
		<div id="map"></div>
		<div id="box1">
			<div class="info">
				<span><b>주소</b>서울특별시 강남구 테헤란로132 한독약품빌딩 8층</span><br>
				<span><b>전화</b>(02) 1234 - 5678</span><br>
				<span><b>팩스</b>(02) 1234 - 5678</span>
			</div>
			<div class="info">
				<span><b>이메일</b>abc123@gmail.com</span>
			</div>
		</div>
		<div id="line"></div>
		<div id="box2">
			<b>교통안내</b>
			<div id="subwaybus-box">
				<div id="subway">
					<img src="images/ico_subway.png" alt="">
					<div id="info-subway">
						<b>역삼역 하차</b><br>
						<span>간선(파랑) : N13번, N61번, 146번, 341번, 360번, 740번</span><br>
						<span>공항(하늘) : 6000번, 6020번</span><br>
						<span>광역(빨강) : 1100번, 1700번, 2000번, 2000-1번, 8001번</span>
					</div>	
				</div>
				<div id="bus">
					<img src="images/ico_bus.png" alt="">
					<div id="info-bus">
						<b>2호선(역삼역, 강남역)</b><br>
						<span>역삼역 - 3번출구 도보 3분 거리, 강남역 - 1번 출구 도보 5분 거리</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
</body>
</html>
