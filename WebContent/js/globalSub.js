$(document).ready(function(){
	
	//스크롤 올리기 (TOP 이미지 버튼)
	$("#scroll-top").click(function(){
		$("html,body").animate({
			scrollTop: 0
		},500);
	});

});