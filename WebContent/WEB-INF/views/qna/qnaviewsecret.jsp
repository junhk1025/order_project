<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subQna.css">
<link rel="stylesheet" href="css/subQnaView.css">
<link rel="stylesheet" href="css/subQnaViewSecret.css">
<style>
#btn{
    border: 0;
    margin-left: 10px;
    background-color: black;
    color: white;
    padding: 3px 15px;
    font-size: 12px;
}
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
		<div id="qna-secret">
			<div id="qna-secret-pw">
			<p>비밀번호를 입력하세요</p>
			비밀번호 : <input type="password" id="pw" name="pw"><input type="button" value="확인" id="btn">
			</div>
		</div>
		<div id="view-button-box">
			<div class="view-button" onclick="location.href = '/CDSInfo/qnalist.do?subTitleName=고객센터';">목록</div>
		</div>
	</div>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
	
	<script>
	$("#btn").click(function(){
		
		console.log(${seq});
		$.ajax({
			type:"POST",
			url:"/CDSInfo/qnaviewsecretok.do",
			data: "seq=" + ${seq} + "&pw=" + $("#pw").val(),
			dataType: "text",
			success: function(result) {
				//result -> 1, 0
				//alert(result);
				if(result == "1"){
					location.href = "/CDSInfo/qnaview.do?subTitleName=고객센터&seq="+${seq};
				} else {
					alert("비밀번호가 틀렸습니다.");
				}
			}
		}); 
	})
	</script>
</body>
</html>
