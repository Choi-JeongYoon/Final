$(document).ready(function(){
	$(".navi_box > ul > li").mouseover(function(){
		$(this).children(".sub").stop().slideDown();
	});
	$(".navi_box > ul > li").mouseleave(function(){
		$(this).children(".sub").stop().slideUp();
	});
	
});