<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subQna.css">
<style>

</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	<div class="section02" id="content-qna">
		<!-- https://casa.co.kr/customer/notice_list.aspx -->
		<div id="content-qna-navbox">
			<div id="content-qna-nav">
				<span><a href="/CDSInfo/noticelist.do?subTitleName=고객센터">공지사항</a></span>
				<span><a href="/CDSInfo/faqlist.do?subTitleName=고객센터">자주묻는질문</a></span>
				<span><a href="/CDSInfo/qnalist.do?subTitleName=고객센터">1:1문의</a></span>
			</div>
			<div id="content-qna-search">
					<form method="GET" action="/CDSInfo/qnalist.do" id="form">
						<input type="text" id="word" name="word" placeholder="검색어를 입력하세요.">
						<input type="hidden" id="column" name ="column" value="subject">
						<input type="hidden" name ="subTitleName" value="고객센터">
					</form>
			</div>
		</div>
		<table id="qna-list">
			<thead>
				<tr>
					<th>번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.seq}</td>
					<c:if test="${lv == 1}">
					<td><a href="/CDSInfo/qnaview.do?subTitleName=고객센터&seq=${dto.seq}">${dto.subject}</a></td>
					</c:if>
					<c:if test="${lv != 1}">
					<td><a href="/CDSInfo/qnaviewsecret.do?subTitleName=고객센터&seq=${dto.seq}">${dto.subject}</a></td>
					</c:if>
					<td>${dto.name}</td>
					<td>${dto.regdate}</td>
					<td>${dto.readcount}</td>
					<td>
					<c:if test="${dto.state=='y'}">
						<div class="complete">답변완료</div>
					</c:if>
					<c:if test="${dto.state=='n'}">
						<div>답변대기</div>				
					</c:if>
					</td>
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
			${pagebar}
			<c:if test="${lv !=1 }">
		<a href="/CDSInfo/qnawrite.do?subTitleName=고객센터"><div id="write-button">글쓰기</div></a>
		</c:if>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
	
	<script>
	$("#word").keydown(function(key) {
        if (key.keyCode == 13) {
            
            document.getElementById('form').submit();
            
        }
    });	
	
	</script>
</body>
</html>
