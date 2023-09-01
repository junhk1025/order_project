<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ##### header.jsp ##### -->
<header>
	<div id="navbg">
		<div id="nav">
			<c:choose>
			<c:when test="${navLv==1}">
				<a href="/CDSInfo/index.do"><img id="logo" src="images/logo_white.png"></a>
			</c:when>
			<c:when test="${navLv!=1}">
				<a href="/CDSInfo/index.do"><img id="logo" src="images/logo_black.png"></a>
			</c:when>
			</c:choose>
			<span class="nav"><a href="/CDSInfo/company.do?subTitleName=회사소개">회사소개</a></span>
			<span class="nav"><a href="/CDSInfo/info.do?subTitleName=이용안내">이용안내</a></span>
			<span class="nav"><a href="/CDSInfo/directions.do?subTitleName=오시는길">오시는길</a></span>
			<span class="nav"><a href="/CDSInfo/noticelist.do?subTitleName=고객센터">고객센터</a></span>
			<span class="nav">
				<c:if test="${not empty id}">
				<div class="nav-login">
					<a href="/cds/afterMain.do?id=${id}&lv=${lv}&name=${name}&bigo=${bigo}">직원 페이지 바로가기</a>
					<a href="/CDSInfo/logout.do">로그아웃</a>
				</div>
				</c:if>
				<c:if test="${empty id}">
					<a href="/CDSInfo/login.do">CDS&nbsp;&nbsp;직원&nbsp;&nbsp;로그인</a>
				</c:if>
			</span>
		</div>
	</div>
</header>
<!-- ##### header.jsp ##### -->

