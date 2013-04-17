$(document).ready(function() {
	var inputVal;			//输入框中的提示
	
	//点击影音书页面输入框变背景图片，并且框中的字消失
	$(".persoanal_inp_field p").click(function() {
		$(".persoanal_inp_field p").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
		$(this).css("background","url(http://www.gotribus.com/view/book/img/input_active.png) no-repeat -12px center");

//		$(".persoanal_inp_field p").css("background","url(img/input.png) no-repeat 3px center");
//		$(this).css("background","url(img/input_active.png) no-repeat -12px center");
		$(this).find("input.act").val('');	
	});
	
	//点击activity页面输入框变背景图片，并且框中的字消失
	$("input.act").click(function() {
		inputVal = $(this).val();
		$(".inp_search").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
		$("input.act").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
		$(this).css("background","url(http://www.gotribus.com/view/book/img/input_active.png) no-repeat -12px center");
		
//		$(".inp_search").css("background","url(img/input.png) no-repeat 3px center");
//		$("input.act").css("background","url(img/input.png) no-repeat 3px center");
//		$(this).css("background","url(img/input_active.png) no-repeat -12px center");
		$(this).val('');	
	});
	//点击activity页面的上传图片
	$(".inp_search").click(function() {
		$("input.act").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
//		$("input.act").css("background","url(img/input.png) no-repeat 3px center");
	});
	
	//点击简介输入框，框中的字消失
	$("textarea.intro").click(function() {
		$(this).val('');	
	});
	
	//点击category的下拉图标显示下拉框,点击空白处消失
	$(".arrow").click(function(event) {
		//取消事件冒泡  
        event.stopPropagation();  
		$(".bookTag").toggle();
	});
	$(document).click(function (event) { 
		$(".bookTag").hide() 
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
	
	//当输入框失去焦点时，若框中没有内容，则变回原来的文字
	$(".persoanal_inp_field .act").blur(function() {
		if ($(this).val() == '') {
			$(this).val(inputVal);
		}
	});
	
});