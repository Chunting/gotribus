$(document).ready(function() {
	var inputVal;			//������е���ʾ
	
	//���activityҳ�������䱳��ͼƬ�����ҿ��е�����ʧ
	$("input.act").click(function() {
		inputVal = $(this).val();
		$(".inp_search").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
		$("input.act").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
		$(this).css("background","url(http://www.gotribus.com/view/book/img/input_active.png) no-repeat -12px center");
//		$(".inp_search").css("background","url(img/input.png) no-repeat 3px center");
//		$("input.act").css("background","url(img/input.png) no-repeat 3px center");
//		$(this).css("background","url(img/input_active.png) no-repeat -12px center");	
		$(this).parent().find("input.act3").val('');	
	});
	$("input.act2").click(function() {
		inputVal = $(this).val();
		$(this).val('');	
	});
	
	//���tag��������ʧ
	$(".tag .act3").click(function() {
		inputVal = $(this).val();
		$(this).val('');
	});
	$(".tag .act3").blur(function() {
		if ($(this).val() == '') {
			$(this).val(inputVal);
		}
	});
	
	//����������򣬿��е�����ʧ
	$("textarea.intro").click(function() {
		$(this).val('');	
	});
	
	//���category������ͼ����ʾ������,����հ״���ʧ
	$(".arrow").click(function(event) {
		//ȡ���¼�ð��  
        event.stopPropagation();  
		$(".bookTag").toggle();
	});
	$(document).click(function (event) { 
		$(".bookTag").hide() 
	});  
	
	//����������ϵ�������ʾ��category��
	$(".bookTag a").click(function() {
		$(".bookTag").hide();
		$("#tag").val($(this).html());
	});
	
	//�������ʧȥ����ʱ��������û�����ݣ�����ԭ��������
	$(".contact_field_widget .act").blur(function() {
		if ($(this).val() == '') {
			$(this).val(inputVal);
		}
	});
	$(".contact_field_widget .act2").blur(function() {
		if ($(this).val() == '') {
			$(this).val(inputVal);
		}
	});
	
});