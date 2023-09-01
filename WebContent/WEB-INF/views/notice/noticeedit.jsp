<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subNotice.css">
<link rel="stylesheet" href="css/subQna.css">
<link rel="stylesheet" href="css/subQnaWrite.css">
<style>
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<jsp:include page="/inc/subtitle.jsp"></jsp:include>
	<div class="section02" id="content-qna">
		<!-- https://casa.co.kr/customer/notice_list.aspx -->
      <div id="content-qna-navbox">
         <div id="content-notice-navbox">
			<div id="content-notice-nav">
				<span><a href="/CDSInfo/noticelist.do?subTitleName=고객센터">공지사항</a></span>
				<span><a href="/CDSInfo/faqlist.do?subTitleName=고객센터">자주묻는질문</a></span>
				<span><a href="/CDSInfo/qnalist.do?subTitleName=고객센터">1:1문의</a></span>
			</div>
		</div>
      </div>
		<div id="qna-write">
			<form id="form1">
			<div id="write-title">
				<p>제목</p><input type="text" id="title" name="title" value="${dto.subject}">
			</div>
			<div id="write-content">
				<p>내용</p><textarea id="content" name="content" cols="151" rows="20">${dto.content}</textarea>
			</div>
			<input type="hidden" name="seq" value="${dto.seq}">
			</form>
		</div>
		<div id="write-button">수정</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
	<script>
		$("#title").focus(function(){
			if(!$("#title").val("")){
				$("#title").val("")
			};
		});
		
		$("#content").focus(function(){
			if(!$("#content").val("")){
				$("#content").val("")
			};
		});
		
		$("#write-button").click(function(){
		//console.log($("#title").val());
		//console.log($("#content").val());
		
			var data = $("#form1").serialize();
			
			$.ajax({
				type: "GET",
				url: "noticeeditok.do",
				data: data + "&id=${id}",
				dataType: "xml",
				error: function(a,b,c){
					console.log(a,b,c);
				}
			});
			
			$("#title").val("");
			$("#content").val("");
			
			location.href='view.do?subTitleName=고객센터&seq=${dto.seq}';
			
		});
	</script>
</body>
</html>
