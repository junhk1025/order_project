<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subNotice.css">
<style>
	.new{ 
		background-color: #4285F4;
		margin-left: 5px; 
		color:white;
		padding: 4px;
	    border-radius: 2px;
	    height: 16px;
	    font-size: 12px;
	}
	
	#content-notice-nav > span:nth-child(2) > a{
		color: black;
   		font-weight: bold;
	}
	
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	<div class="section02" id="content-notice">
		<!-- https://casa.co.kr/customer/notice_list.aspx -->
		<div id="content-notice-navbox">
			<div id="content-notice-nav">
				<span><a href="/CDSInfo/noticelist.do?subTitleName=고객센터">공지사항</a></span>
				<span><a href="/CDSInfo/faqlist.do?subTitleName=고객센터">자주묻는질문</a></span>
				<span><a href="/CDSInfo/qnalist.do?subTitleName=고객센터">1:1문의</a></span>
			</div>
			<div id="content-notice-search">
				<form method="GET" action="/CDSInfo/faqlist.do" id="form">
                  <input type="text" id="word" name="word" placeholder="검색어를 입력하세요.">
                  <input type="hidden" id="column" name ="column" value="subject">
                  <input type="hidden" name ="subTitleName" value="고객센터">
               </form>
			</div>
		</div>
		<table id="notice-list">
			<thead>
				<tr>
					<th>번호</th>
					<th>글제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() == 0}">
					<tr>
						<td colspan="4">게시물이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.rnum}</td>
						<td>
							<a href="/CDSInfo/faqview.do?subTitleName=고객센터&seq=${dto.seq}">${dto.subject}</a>
							<c:if test="${dto.isnew < 60}">
								<span class="new">new</span>
							</c:if>
						</td>
						<td>${dto.regdate}</td>
						<td>${dto.readcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${pagebar}
		<c:if test="${lv == 1}">
		<div id="write-button" onclick="location.href='/CDSInfo/faqwrite.do?subTitleName=고객센터'">글쓰기</div>
		</c:if>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
	<script>
	   $("#word").keydown(function(key) {
	        if (key.keyCode == 13) {
	            
	            document.getElementById('from').submit();
	            
	        }
	    });   
   </script>
</body>
</html>
