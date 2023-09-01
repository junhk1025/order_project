<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/sub.css">
<link rel="stylesheet" href="css/subCompany.css">
<script src="js/globalSub.js"></script>
<style>

</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	<div class="section02" id="content-company">
		<!-- 컨텐츠 넣으면 됨 -->
		<div id="company-box1">
			<b class="company-title">회사 개요</b>
			<div class="company-line"></div>
			<div id="company-box1-info">
				<span>CDS는 화장품 유통을 위한 플랫폼으로 발주부터 출고까지 언제 어디서나 빠르고 간편하게 관리해주는 플랫폼입니다.</span><br>
				<span>
					CDS는 기술과 데이터를 통해 거래처들의 운영비용을 줄이고<br>
					사업 경쟁력과 매출을 높일 수 있도록 하여 화장품 유통이 가치 창출 사업이 되도록 혁신하고 있습니다.
				</span>
			</div>
		</div>
		<div id="company-box2">
			<b class="company-title">회사 정보</b>
			<div class="company-line"></div>
			<div id="company-box2-info">
				<div><b>회사명</b><span>CDS(Cosmetic Distribution System)</span></div>
				<div><b>대표이사</b><span>쌍용교육센터</span></div>
				<div><b>주소</b><span>서울특별시 강남구 역삼동 테헤란로 132</span></div>
				<div><b>설립일</b><span>2019년 08월 26일</span></div>
				<div><b>매출액</b><span>1,285억원(2019년)</span></div>
				<div><b>직원수</b><span>1,160명</span></div>
			</div>
		</div>
		<div id="company-box3">
			<b class="company-title">사업 분야</b>
			<div class="company-line"></div>
			<div class="company-box3-info">
				<div class="box3-imgbox"></div>
				<div class="box3-content">
					<b>프랜차이즈 솔루션 자체 개발</b><br>
					<span>
						프랜차이즈 기업에 최적화 된 유통 관리 솔루션<br>
						자체제작 POS와 연계되어 통합관리가 가능한 POS 연동 ERP 보유<br>
						스타트업을 위한 수발주 시스템 보유
					</span>
				</div>
			</div>
			<div class="company-box3-info">
				<div class="box3-imgbox"></div>
				<div class="box3-content">
					<b>유통 관리</b><br>
					<span>
						축적된 데이터를 기반으로 새로운 트랜드와 차별화된 상품을 큐레이션<br>
						온라인 서비스를 이용한 협력업체와의 빠르고 명확한 소통
					</span>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
</body>
</html>
