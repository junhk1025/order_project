<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subQna.css">
<link rel="stylesheet" href="css/subQnaWrite.css">
<style>
#write-button-back {
	width: 160px;
	height: 50px;
	background-color: black;
	text-align: center;
	line-height: 50px;
	/* margin: 0 auto; */
	margin-top: 20px;
	float: right;
	cursor:pointer;
	color: white;
	text-decoration: none;
	margin-left:20px;
}
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	<div class="section02" id="content-qna">
      <div id="content-qna-navbox">
         <div id="content-qna-nav">
           	<span><a href="/CDSInfo/noticelist.do?subTitleName=고객센터">공지사항</a></span>
			<span><a href="/CDSInfo/faqlist.do?subTitleName=고객센터">자주묻는질문</a></span>
			<span><a href="/CDSInfo/qnalist.do?subTitleName=고객센터">1:1문의</a></span>
         </div>
      </div>
      <form method="POST" action="/CDSInfo/qnawriteok.do" id="form">
	      <div id="qna-write">
	         <div id="write-title">
	            <p>제목</p><input type="text" name="subject" id="title" placeholder="제목을 입력하세요.">
	         </div>
	         <div id="write-content">
	            <p>내용</p><textarea name="content" id="content" cols="151" rows="20"placeholder="내용을 입력하세요."></textarea>
	         </div>
	         <div id="write-info">
	            <span>이름</span><input type="text" name="name" id="name" placeholder="이름을 입력하세요.">
	            <span>비밀번호</span><input type="password" name="pw" id="pw" placeholder=" 비밀번호을 입력하세요.">
	         </div>
	      </div>
	      <div id="write-button-back"  onclick="history.back();">돌아가기</div>
	      <div id="write-button" onclick="document.getElementById('form').submit();">등록</div>
      </form>
   </div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
</body>
</html>
