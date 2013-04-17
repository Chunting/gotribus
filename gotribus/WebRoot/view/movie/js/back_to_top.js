$(document).ready(function() {
	//当滚动条的位置处于距顶部200像素以下时，跳转链接出现，否则消失
	$(window).scroll(function() {
		if ($(window).scrollTop() > 200) {
			$("#back_to_top").fadeIn(500);
		} else {
			$("#back_to_top").fadeOut(500);
		}
	});
	//当点击跳转链接后，回到页面顶部位置
	$("#back_to_top").click(function() {
		$('body,html').animate({scrollTop:0},1000);
		return false;
	});
	
	
});