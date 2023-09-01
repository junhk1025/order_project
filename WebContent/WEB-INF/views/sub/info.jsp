<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/sub.css">
<link rel="stylesheet" href="css/subInfo.css">
<script src="js/globalSub.js"></script>
<style>

</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	<div class="section02" id="content-directions">
		<div class="guide">
			<div class="circle"></div>
			<div class="guide_comment">
				<b>01 - 다 브랜드 관리</b><br>
				<span>다수의 브랜드를 보유하고 있는 본사의 경우 다브랜드 관리를 통해 브랜드별 매출/물류 분석이 가능</span></div>
		</div>
		<div class="guide">
			<div class="circle"></div>
			<div class="guide_comment"><b>02 - 거래처 관리</b><br>
				<span>거래처에 대한 다양한 정보를 등록 관리 매출/매장/매입, 배송가능일, 담당자 등</span></div>
		</div>
		<div class="guide">
			<div class="circle"></div>
			<div class="guide_comment"><b>03 - 단가 관리</b><br>
				<span>다양한 단가(등급별, 거래처별, 할인율 등) 체계를 지원하며 단가의 변경이력 관리 가능</span></div>
		</div>
		<div class="guide">
			<div class="circle"></div>
			<div class="guide_comment"><b>04 - 물류 센터 관리</b><br>
				<span>3자 물류를 사용할 경우 매입처 정보와 품목정보의 매칭을 통해 물류센터별로 물류관리 가능</span></div>
		</div>
		<div class="guide">
			<div class="circle"></div>
			<div class="guide_comment"><b>05 - 품목 관리</b><br>
				<span>품목에 대한 기본 분류체계를 제공하며 품목별 그룹관리, 품목별 과세/면세 단가 자동계산, 품목이미지를<br>등록하여 주문 편의 제공</span></div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
</body>
</html>
