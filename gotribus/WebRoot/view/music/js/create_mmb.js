$(document).ready(function() {
	var inputVal;			//������е���ʾ
	
	//���Ӱ����ҳ�������䱳��ͼƬ�����ҿ��е�����ʧ
	$(".persoanal_inp_field p").click(function() {
		$(".persoanal_inp_field p").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
		$(this).css("background","url(http://www.gotribus.com/view/book/img/input_active.png) no-repeat -12px center");

//		$(".persoanal_inp_field p").css("background","url(img/input.png) no-repeat 3px center");
//		$(this).css("background","url(img/input_active.png) no-repeat -12px center");
		$(this).find("input.act").val('');	
	});
	
	//���activityҳ�������䱳��ͼƬ�����ҿ��е�����ʧ
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
	//���activityҳ����ϴ�ͼƬ
	$(".inp_search").click(function() {
		$("input.act").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
//		$("input.act").css("background","url(img/input.png) no-repeat 3px center");
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
	
	//����������ϵ�С��ͷ����������
	$(".tag_arrow").click(function() {
		$(".bookTag").hide();
	});
	
	//����������ϵ�������ʾ��category��
	$(".bookTag a").click(function() {
		$(".bookTag").hide();
		$("#category").val($(this).html());
	});
	
	//�������ʧȥ����ʱ��������û�����ݣ�����ԭ��������
	$(".persoanal_inp_field .act").blur(function() {
		if ($(this).val() == '') {
			$(this).val(inputVal);
		}
	});
	
});