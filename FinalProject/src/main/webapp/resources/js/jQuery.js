$(document).ready(function(){
	$(".navi_box > ul > li").mouseover(function(){
		$(this).children(".sub").stop().show();
		/*$(this).children(".sub").stop().animate({
			width: "toggle"
		}, 400, "linear");*/
	});
	$(".navi_box > ul > li").mouseleave(function(){
		$(this).children(".sub").stop().hide();
		/*$(this).children(".sub").stop().animate({
			width: "toggle"
		}, 400, "linear");*/
	});	
});