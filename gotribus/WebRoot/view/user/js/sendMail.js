$(document).ready(function() {	
	//��������䱳��ͼƬ�����ҿ��е�����ʧ
	$(".create_txt input").click(function() {
		$(".create_txt input").css("background","url(http://www.gotribus.com/view/user/img/input.png) no-repeat 3px center");
		$(this).css("background","url(http://www.gotribus.com/view/user/img/input_active.png) no-repeat -12px center");
//		$(".create_txt input").css("background","url(img/input.png) no-repeat 3px center");
//		$(this).css("background","url(img/input_active.png) no-repeat -12px center");
	});
	
	//����������򣬿��е�����ʧ
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

	//�������ʧȥ����ʱ��������û�����ݣ�����ԭ��������
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