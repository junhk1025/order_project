<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/inc/asset.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<script src="js/jquery.bxslider.js"></script>
<script src="js/main.js"></script>
<style>
 .comment > a{
 	text-decoration: none;
 	color: black;
 	text-align:center;
	margin-top: 13px;
    display: inline-block;
 }
</style>
</head>
<body>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<section>
		<div id="scroll_check">
			<input type="radio" id="cb1" class="cb" data-num="1" checked>
			<label for="cb1"></label>
			<input type="radio" id="cb2" class="cb" data-num="2">
			<label for="cb2"></label>
			<input type="radio" id="cb3" class="cb" data-num="3">
			<label for="cb3"></label>
		</div>
		<div id="content01">
			<div id="content01_area">
				<div id="content01_item01">
					코스메틱 아이티의 성장 쉽게 사용하고 효율적인 업무를 경험해보세요.
				</div>
				<div id="content01_item02">
					<div id="slider_up"></div>
					<div id="view">
						<div id="list">
							<div class="item">
								<div class="val"></div>
								<div class="comment"></div>
								<img class="ico_move" src="images/ico_move.png">
							</div>
							<div class="item">
								<div class="val"></div>
								<div class="comment"></div>
								<img class="ico_move" src="images/ico_move.png">
							</div>
							<div class="item">
								<div class="val"></div>
								<div class="comment"></div>
								<img class="ico_move" src="images/ico_move.png">
							</div>
							<div class="item">
								<div class="val"></div>
								<div class="comment"></div>
								<img class="ico_move" src="images/ico_move.png">
							</div>
							<div class="item">
								<div class="val"></div>
								<div class="comment"></div>
								<img class="ico_move" src="images/ico_move.png">
							</div>
							<div class="item">
								<div class="val"></div>
								<div class="comment"></div>
								<img class="ico_move" src="images/ico_move.png">
							</div>
						</div>
					</div>
					<div id="slider_down"></div>
				</div>
				
			</div>
			<div id="ico_mouseDown">
				<img id="ico_mouse" src="images/ico_mouse.png">
				<img id="ico_down" src="images/ico_down.png">
			</div>
		</div>
		<div id="content02">
			<div id="content02_area">
				<div id="content02_item01">
						<div id="comment01">We're grow in success.<hr><div></div></div>
						<div id="comment02">CDS는 경영시스템 구축으로 가맹점과 손실을 최소화하고<br>업무효율을 극대화하여 발전하는 코스메틱 유통 수발주 프로그램 기업입니다.</div>
				</div>
				<div id="content02_item02">
					<div class="iconbox">
						<img class="icon" src="images/ico_makeup.png" data-iconnum="1">
						<div><b>C</b>osmetic Specialized</div>
						<div>특화된 분야의 코스메틱 유통 시스템을<br>편리하게 사용 가능하고 실무에 바로 적용합니다.</div>
					</div>
					<div class="iconbox">
						<img class="icon" src="images/ico_distributed.png" data-iconnum="2">
						<div><b>D</b>istribution Optimization</div>
						<div>한 번의 입력으로 상품, 재고 등<br>장부정리를 쉽게 관리할 수 있습니다.</div>
					</div>
					<div class="iconbox">
						<img class="icon" src="images/ico_software.png" data-iconnum="3">
						<div><b>S</b>ystem Management</div>
						<div>견적서, 발주서 발행부터<br>미수/미지급금 거래처 관리까지 편리하게!</div>
					</div>
				</div>
			</div>
		</div>
		<div id="content03">
			<div id="content03_item01">
				<div id="comment03">We're grow in success.<hr><div></div></div>
				<div id="comment04">CDS는 경영시스템 구축으로 가맹점과 손실을 최소화하고<br>업무효율을 극대화하여 발전하는 코스메틱 유통 수발주 프로그램 기업입니다.</div>
			</div>
			<div id="content03_item02">
				<div id="bxslider" class="bxslider">
					<div class="slide">
						<img src="images/section03_img01.png">
						<div>
							<b>01 - 다 브랜드 관리</b><br>
							<span>다수의 브랜드를 보유하고 있는<br>본사의 경우 다브랜드 관리를 통해<br>브랜드별 매출/물류 분석이 가능</span>
						</div>
					</div>
					<div class="slide">
						<img src="images/section03_img02.png">
							<div>
							<b>02 - 거래처 관리</b><br>
							<span>거래처에 대한 다양한 정보를 등록 관리<br>매출/매장/매입, 배송가능일, 담당자 등</span>
						</div>
					</div>
					<div class="slide">
						<img src="images/section03_img03.png">
							<div>
							<b>03 - 단가 관리</b><br>
							<span>다양한 단가(등급별, 거래처별, 할인율 등)<br>체계를 지원하며 단가의 변경이력 관리 가능</span>
						</div>
					</div>
					<div class="slide">
						<img src="images/section03_img04.png">
							<div>
							<b>04 - 물류 센터 관리</b><br>
							<span>3자 물류를 사용할 경우 매입처 정보와<br>
								품목정보의 매칭을 통해 물류센터별로<br>
								물류관리 가능</span>
						</div>
					</div>
					<div class="slide">
						<img src="images/section03_img05.png">
							<div>
							<b>05 - 품목 관리</b><br>
							<span>품목에 대한 기본 분류체계를 제공하며<br>
								품목별 그룹관리, 품목별 과세/면세 단가<br>
								자동계산, 품목이미지를 등록하여 주문 편의 제공</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/inc/footer.jsp"></jsp:include>
	<jsp:include page="/inc/tail.jsp"></jsp:include>
	<script>
	//공지사항 리스트의 내용배열
	var data = [
 		<c:forEach items="${list}" var="dto" varStatus="status">
 			{
				subject:"${dto.subject}",
				seq: "${dto.seq}"
 			}
			<c:if test="${list.size()-1 > status.index}">
   			,
   			</c:if>
		</c:forEach> 
	];
	
	var now = 0;
	
	fillItem(now);
	btnOn();
	
	/* 키보드로 제어
	$(window).keydown(function (evt) {
		if (evt.keyCode == 38) up();
		else if (evt.keyCode == 40) down();
	}); */

	
	function btnOn() {
		$("#slider_up").on("click", up);
		$("#slider_down").on("click", down);
	}

	function btnOff() {
		$("#slider_up").off("click", up);
		$("#slider_down").off("click", down);
	}

	function up() {

		btnOff();
		$("#list").css({
			"transition": "all .5s linear",
			"transform": "translate(0px, 0px)"
		});

		setTimeout(function () {
			$("#list").css({
				"transition": "all 0s linear",
				"transform": "translate(0px, -101px)"
			});
			fillItem();
			btnOn();
		}, 500);

		now--;
	}

	function down() {

		btnOff();
		$("#list").css({
			"transition": "all .5s linear",
			"transform": "translate(0px, -200px)"
		});

		setTimeout(function () {
			$("#list").css({
				"transition": "all 0s linear",
				"transform": "translate(0px, -101px)"
			});
			fillItem();
			btnOn();
		}, 500);

		now++;


	}

	function fillItem() {

		console.clear();

		var index = (data.length - 1 + now) % data.length;

		for (var i = 0; i < 6; i++) {
			// console.log((index + i) % data.length);
			$("#list .item > .comment").eq(i).html("<a href='/CDSInfo/view.do?subTitleName=고객센터&seq=" + data[(index + i) % data.length].seq + "'>" + data[(index + i) % data.length].subject + "</a>");
			$("#list .item > .val").eq(i).text("공지 " + (1 + (index + i) % data.length));
		}
		
		//내용 호버시 pointer
		$("#list .item > .comment").hover(function(){
			$(this).css('cursor', 'pointer');
		});

		//모르겠음 ㅡㅡ
		//클릭시 게시판으로 이동
		$("#list .item > .comment").click(function(){
			//location.href = '/CDSInfo/view.do?subTitleName=고객센터&seq=${dto2.seq}';
		}); 
		
	}
	</script>
</body>
</html>
