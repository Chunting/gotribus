$(document).ready(function() {
	//��������䱳��ͼƬ
	$(".text_field input.active").click(function() {
		$(".text_field input.active").css("background","url(img/input.png) no-repeat 3px center");
		$(this).css("background","url(img/input_active.png) no-repeat -11px center");
	});
	
});