<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subQna.css">
<link rel="stylesheet" href="css/subQnaView.css">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
#comment {
	height:130px;
	width: 1194px;
	margin:20px auto;
	resize: none;
}

#answer-box{
      margin-top:50px;
      width: 1200px;
      border: 1px solid gray;
   }
   
   #answer-info{
      border-bottom: 1px solid gray;
      height:80px;
   }
   
   #answer-info::after{
      clear: both;
      display: block;
      content: "";   
   }
   
   #answer-info > div:first-child {
      width:100px;
      height:80px;
      background-color: black;
      text-align: center;
      float: left;
   }
   
   #answer-info > div:first-child > b{
      color: white;
      text-align: center;
      font-size: 20px;
      display: inline;
      line-height: 80px;
   }
   
   #answer-info > div:nth-child(2) {
      float: left;
      margin-top: 30px;
      padding-left: 20px;
      width:1098px;
   }
   
   #answer-info > div:nth-child(2) > span:first-child::after{
      padding-right: 10px;
      border: 1px solid black;
   }
   
   #answer-info > div:nth-child(2) > span:nth-child(2){
      padding-left: 10px;
   }
   
   #answer-box > div:nth-child(2) {
      padding: 20px;
      font-size: 14px;
   }
   
   #answer-title{
      float:left;
      color: #828282;
   }
   #view-button-box {
	margin: 0 auto;
	margin-top: 20px;
	<c:if test="${lv!=1}">
	width:540px;
	</c:if>
	<c:if test="${lv==1}">
	width:350px;
	</c:if>
	height:70px;
	justify-content: center; 
}

.modal-dialog{
		top:350px;
		width:500px;
		margin: 0 atuo;
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
		<div id="qna-view">
			<div id="view-title">
				<div id="view-title-left">
					<span>${result.subject}</span>
				</div>
				<div id="view-title-right">
					<span>${result.regdate}</span>
					<span>${result.readcount}</span>
				</div>
			</div>
			<div id="view-content">
				<p>${result.content}</p>
			</div>
		</div>
		
		<c:if test="${lv == 1}">
		<c:if test="${clist.size() == 0}">
						
			<form method="POST" action="/CDSInfo/commentok.do" id="form">
				<textarea name="comment" id="comment"></textarea>
				<input type="hidden" name="pseq" value="${result.seq}">
			</form>
			
		</c:if>
		<c:if test="${clist.size() >= 1}">
		<div id="answer-box">
		<c:forEach items="${clist}" var="cdto">
                  <div id="answer-info">
                     <div><b>답변</b></div>
                     <div>
                        <div id="answer-title">
                           <span>작성자 - ${cdto.name}</span>
                           <span>작성일 - ${cdto.regdate}</span>
                        </div>
                     </div>
                  </div>
                  <div>
                     ${cdto.content}
                  </div>
               </c:forEach>
               </div>
			</c:if>
		</c:if>
		

		<div id="view-button-box">
		<c:if test="${lv != 1}">
			<div class="view-button" onclick="location.href = '/CDSInfo/qnaedit.do?subTitleName=고객센터&seq=${result.seq}';">수정</div>
			<div class="view-button" id="btn-confirm">삭제</div>
			</c:if>
		<c:if test="${lv == 1}">
			<c:if test="${clist.size() == 0}">
			<div class="view-button" onclick="document.getElementById('form').submit();">답변등록</div>
			</c:if>
			<c:if test="${clist.size() >= 1}">
			<div class="view-button" onclick="location.href = '/CDSInfo/qnadelcomment.do?seq=${clist.get(0).getSeq()}&pseq=${result.seq}'">답변삭제</div>
			</c:if>
		</c:if>
			<div class="view-button" onclick="location.href = '/CDSInfo/qnalist.do?subTitleName=고객센터';">목록</div>
		</div>
	</div>
	
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">정말 글을 삭제하시겠습니까?</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" id="modal-btn-si">네</button>
	        <button type="button" class="btn btn-primary" id="modal-btn-no">아니오</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
	
	 <script>
   var modalConfirm = function(callback){
	   
	   $("#btn-confirm").on("click", function(){
	     $("#mi-modal").modal('show');
	   });

	   $("#modal-btn-si").on("click", function(){
	     callback(true);
	     $("#mi-modal").modal('hide');
	   });
	   
	   $("#modal-btn-no").on("click", function(){
	     callback(false);
	     $("#mi-modal").modal('hide');
	   });
	 };

	 modalConfirm(function(confirm){
	   if(confirm){
	     //Acciones si el usuario confirma
	     location.href='qnadeleteok.do?seq=${result.seq}';
	   }
	 });
   </script>
</body>
</html>
