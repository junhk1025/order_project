$(document).ready(function(){
	
	bgcolor();

	$(window).scroll(function() {
		
		if($(document).scrollTop()>0) {
			$("#navbg").css("background-color","#fff");
			$("#nav > .nav > a").css({
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
			$("#logo").attr("src","images/logo_white.png").css("opacity",".7");
			color("#fff","#fff");
			bgcolor();
		};
	});
});
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