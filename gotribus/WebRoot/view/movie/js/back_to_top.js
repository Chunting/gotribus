$(document).ready(function() {
	//����������λ�ô��ھඥ��200��������ʱ����ת���ӳ��֣�������ʧ
	$(window).scroll(function() {
		if ($(window).scrollTop() > 200) {
			$("#back_to_top").fadeIn(500);
		} else {
			$("#back_to_top").fadeOut(500);
		}
	});
	//�������ת���Ӻ󣬻ص�ҳ�涥��λ��
	$("#back_to_top").click(function() {
		$('body,html').animate({scrollTop:0},1000);
		return false;
	});
	
	
});