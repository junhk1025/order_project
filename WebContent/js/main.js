$(document).ready(function () {
	
	bgcolor();

	//새로고침 시 시작점 맨위로 이동
	$(window).on('beforeunload', function(){
		$(window).scrollTop(0);
	});
	
	$('#bxslider').bxSlider({
		auto: false,
		pager: false,
		slideWidth: 362,
		minSlides: 3,
		maxSlides: 3,
		slideMargin: 57,
		moveSlides: 1,
		controls : true
	});
	
	

	$(window).scroll(function(){
		
		if($(window).scrollTop()>0) {
			$("#navbg").css("background-color","#fff");
			$("#nav > .nav > a").css({
				"color":"#000",
				"opacity":"1"
			});
			
			/* 수정 */
			$(".nav-login > a").css({
				"color":"#000",
				"opacity":"1"
			});
			
			$("#logo").attr("src","images/logo_black.png").css("opacity","1");
			color("#4285F4","#000");
			$("#navbg").off("mouseenter");
			$("#navbg").off("mouseleave");

		} else {
			$("#navbg").css("background-color","transparent");
			$("#nav > .nav > a").css({
				"color":"#fff",
				"opacity":".7"
			});
			
			/* 수정 */
			$(".nav-login > a").css({
				"color":"#fff",
				"opacity":".7"
			});
			
			$("#logo").attr("src","images/logo_white.png").css("opacity",".7");
			color("#fff","#fff");
			bgcolor();
		};
		
		
		
		
		
		// console.log($(document).scrollTop());
		// console.log($("#content02").outerHeight());
		if($(window).scrollTop() >= $("#content02").outerHeight()-200) {
			$("#comment01").css("animation", "move1 1s forwards");
			setTimeout(() => {
				$("#comment02").css("animation", "move1 1s forwards");
			}, 500);
			
			$(".iconbox:nth-child(1)").css("animation", "move2 1s forwards");
			setTimeout(function(){
				$(".iconbox:nth-child(2)").css("animation", "move2 1s forwards");
			},200);
			setTimeout(function(){
				$(".iconbox:nth-child(3)").css("animation", "move2 1s forwards");
			},400);
		}
		if($(window).scrollTop() >= $("#content03").offset().top - 500) {
			$("#comment03").css("animation", "move3 1s forwards");
			setTimeout(() => {
				$("#comment04").css("animation", "move4 1s forwards");
			}, 500);

			$("#content03_item02").css("animation", "move2 1s forwards");
		}
	})
	

	//마우스 아이콘 클릭시 content02로 이동
	$("#ico_mouseDown").click(function () {
		// console.log($("#content02").offset().top);
		// console.log($("#navbg").outerHeight());
		// console.log($("#content02").offset().top - $("#navbg").outerHeight());
		$("html,body").animate({
			scrollTop: $("#content02").offset().top - $("#navbg").outerHeight()
		}, 500);
	});

	scrollCheck();

	$(".cb").click(function () {
		// console.log($(this).data("num"));
		if ($(this).prop('checked')) {
			$('.cb').prop('checked', false);
			$(this).prop('checked', true);
		}
		$(document).off("scroll");
		switch ($(this).data("num")) {
			case 1:
				//$(document).off("scroll");
				$("html,body").animate({
					scrollTop: 0
				}, 500);
				break;
			case 2:
				//$(document).off("scroll");
				// console.log($("#content02").offset().top - $("#navbg").outerHeight());
				// console.log($("#content02").offset().top);
				// console.log($("#navbg").outerHeight());
				$("html,body").animate({
					scrollTop: $("#content02").offset().top - $("#navbg").outerHeight()
				}, 500);
				break;
			case 3:
				//$(document).off("scroll");
				$("html,body").animate({
					scrollTop: $("#content03").offset().top - $("#navbg").outerHeight()
				}, 500);
				break;
		}
		setTimeout(function () {
			scrollCheck();
		}, 600);
	});

	
	$(".icon").mouseenter(function() {
		// console.log($(this).data("iconnum"));
		switch($(this).data("iconnum")){
			case 1:
				$(this).attr("src","images/ico_makeupblue.png");
				break;
			case 2:
				$(this).attr("src","images/ico_distributedblue.png");
				break;
			case 3:
				$(this).attr("src","images/ico_softwareblue.png");
				break;
		}
	});
	$(".icon").mouseleave(function() {
		switch($(this).data("iconnum")){
			case 1:
				$(this).attr("src","images/ico_makeup.png");
				break;
			case 2:
				$(this).attr("src","images/ico_distributed.png");
				break;
			case 3:
				$(this).attr("src","images/ico_software.png");
				break;
		}
	});

});
function scrollCheck() {
	$(document).on("scroll", function () {
		
		// console.log($("#content03").offset().top - 200);
		// console.log($("#content02").offset().top - $("#navbg").outerHeight());
		if ($(document).scrollTop() == 0) {
			$(".cb").eq(0).prop('checked', true);
			$(".cb").eq(1).prop('checked', false);
			$(".cb").eq(2).prop('checked', false);
		} else if ($(document).scrollTop() >= $("#content03").offset().top - 500) {
			$(".cb").eq(0).prop('checked', false);
			$(".cb").eq(1).prop('checked', false);
			$(".cb").eq(2).prop('checked', true);
		} else if ($(document).scrollTop() >= $("#content02").outerHeight()-200) {
			$(".cb").eq(0).prop('checked', false);
			$(".cb").eq(1).prop('checked', true);
			$(".cb").eq(2).prop('checked', false);
		}
	});
}


function color(enter, leave) {
	$("#nav > .nav > a").mouseenter(function() {
		$(this).css("color",enter);
	});
	$("#nav > .nav > a").mouseleave(function() {
		$(this).css("color",leave);
	});
};
function bgcolor() {
	$("#navbg").on("mouseenter",function(){
		$("#navbg").css("background-color","rgba(0,0,0,.7)")
		$("#nav > a > #logo").css("opacity","1");
		$("#nav > .nav > a").css("opacity","1");
	});
	$("#navbg").on("mouseleave", function() {
		$("#navbg").css("background-color","transparent")
		$("#nav > a > #logo").css("opacity",".7");
		$("#nav > .nav > a").css("opacity",".7");
	});
};