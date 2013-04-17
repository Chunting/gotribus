$(document).ready(function() {
	//点击输入框变背景图片，并且框中的字消失
	$(".persoanal_inp_field p").click(function() {
		$(".persoanal_inp_field p").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
		$(this).css("background","url(http://www.gotribus.com/view/book/img/input_active.png) no-repeat -12px center");
		$(this).find("input").val('');	
	});
	
	//点击简介输入框，框中的字消失
	$("textarea.intro").click(function() {
		$(this).val('');	
	});
	
	//点击category的下拉图标显示下拉框
	$(".arrow").click(function() {
		$(".bookTag").show();
	});
	
	//点击下拉框上的小箭头隐藏下拉框
	$(".tag_arrow").click(function() {
		$(".bookTag").hide();
	});
	
	//点击下拉框上的文字显示到category中
	$(".bookTag a").click(function() {
		$(".bookTag").hide();
		$("#category").val($(this).html());
	});
});