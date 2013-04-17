$(document).ready(function() {	
	//点击输入框变背景图片，并且框中的字消失
	$(".create_txt input").click(function() {
		$(".create_txt input").css("background","url(http://www.gotribus.com/view/user/img/input.png) no-repeat 3px center");
		$(this).css("background","url(http://www.gotribus.com/view/user/img/input_active.png) no-repeat -12px center");
//		$(".create_txt input").css("background","url(img/input.png) no-repeat 3px center");
//		$(this).css("background","url(img/input_active.png) no-repeat -12px center");
	});
	
	//点击简介输入框，框中的字消失
	$(".create_txt input.toUser").click(function() {
		if ($(this).val() == 'To whom(Input email)') {
			$(this).val('');
		}
	});
	$(".create_txt input.emailTitle").click(function() {
		if ($(this).val() == 'Title') {
			$(this).val('');
		}
	});
	$(".list_intro textarea").click(function() {
		if ($(this).val() == 'Mail Content') 
			$(this).val('');	
	});

	//当输入框失去焦点时，若框中没有内容，则变回原来的文字
	$(".create_txt input.toUser").blur(function() {
		if ($(this).val() == '') {
			$(this).val('To whom(Input email)');
		}
	});
	$(".create_txt input.emailTitle").blur(function() {
		if ($(this).val() == '') {
			$(this).val('Title');
		}
	});
	$(".list_intro textarea").blur(function() {
		if ($(this).val() == '') {
			$(this).val('Mail Content');
		}
	});
});