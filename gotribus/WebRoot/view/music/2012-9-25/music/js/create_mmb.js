$(document).ready(function() {
	//��������䱳��ͼƬ
	$(".persoanal_inp_field p").click(function() {
		$(".persoanal_inp_field p").css("background","url(img/input.png) no-repeat 3px center");
		$(this).css("background","url(img/input_active.png) no-repeat -12px center");
	});
	
	//���category������ͼ����ʾ������
	$(".arrow").click(function() {
		$(".bookTag").show();
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
});