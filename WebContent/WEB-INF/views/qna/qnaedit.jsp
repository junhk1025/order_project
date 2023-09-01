<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subQna.css">
<link rel="stylesheet" href="css/subQnaEdit.css">
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
		</div>
			<form method="POST" action="/CDSInfo/qnaeditok.do" id="form">
			   	<div id="qna-edit">
			       <div id="edit-title">
			          <p>제목</p><input type="text" name="subject" id="title" placeholder="제목을 입력하세요." value="${dto.subject}">
			       </div>
			       <div id="edit-content">
			          <p>내용</p><textarea name="content" id="content" cols="151" rows="20"placeholder="내용을 입력하세요.">${dto.content}</textarea>
			       </div>
			       <div id="edit-info">
			          <span>이름</span><input type="text" name="name" id="name" placeholder="이름을 입력하세요." value="${dto.name}">
			          <span>비밀번호</span><input type="password" name="pw" id="pw" placeholder=" 비밀번호을 입력하세요.">
			      	 </div>
			  	  </div>
			  	  <input type="hidden" name="seq" value="${seq}">
      		</form>
			<div id="edit-button-box">
				<div class="edit-button" onclick="document.getElementById('form').submit();">수정하기</div>
				<div class="edit-button" onclick="history.back();">돌아가기</div>
			</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
</body>
</html>
