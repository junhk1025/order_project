<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/subNotice.css">
<link rel="stylesheet" href="css/subQna.css">
<link rel="stylesheet" href="css/subQnaView.css">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	.modal-dialog{
		top:350px;
		width:500px;
		margin: 0 atuo;
	}
	.btn-primary{
		border-color: #4285F4;
		background-color: #4285F4;
	}
	
	<c:if test="${lv!=1}">
	#view-button-box{
		width: 160px;	
	}
	</c:if>
	
	#content-notice-nav > span:nth-child(2) > a{
		color: black;
   		font-weight: bold;
	}
	
	.section01-wrap > span{
		position: relative;
    	top: 10px;
    }
	
	
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
            <p>
               ${result.content}
            </p>
         </div>
      </div>
      <div id="view-button-box">
      	<c:if test="${lv == 1}">
	    	<div class="view-button" onclick="location.href='faqedit.do?subTitleName=고객센터&seq=${result.seq}';">수정</div>
	     	<div class="view-button" id="btn-confirm">삭제</div>
	     </c:if>
	      <div class="view-button" onclick="location.href='faqlist.do?subTitleName=고객센터';">목록</div>
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
	
	<div class="alert" role="alert" id="result"></div>
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
	     location.href='faqdeleteok.do?seq=${result.seq}';
	   }
	 });
   </script>
</body>
</html>