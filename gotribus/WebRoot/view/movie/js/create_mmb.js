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
	//���activityҳ��ĳ���ͼƬ
	$(".inp_search").click(function() {
		$("input.act").css("background","url(http://www.gotribus.com/view/book/img/input.png) no-repeat 3px center");
//		$("input.act").css("background","url(img/input.png) no-repeat 3px center");
	});
	
	//����������򣬿��е�����ʧ
	$("textarea.intro").click(function() {
		if ($(this).val() == 'Brief Introduction:') {
			$(this).val('');	
		}
	});
	$("textarea.intro").blur(function() {
		if ($(this).val() == '') {
			$(this).val('Brief Introduction:');	
		}
	});
	
	//���category������ͼ����ʾ������,����հ״���ʧ
	$("#category").click(function(event) {
		//ȡ���¼�ð��  
        event.stopPropagation();  
		$(".bookTag").toggle();
	});
	$(".arrow").click(function(event) {
		//ȡ���¼�ð��  
        event.stopPropagation();  
		$(".bookTag").toggle();
	});
	$(document).click(function (event) { 
		$(".bookTag").hide(); 
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
	
	//�������û��ֵ����ʾ��ʾ��Ϣ
	//���
	if($("textarea.intro").val() == '') {
		$("textarea.intro").val('Brief Introduction:');
	}
	//movieName
	if($("#movieName").val() == '') {
		$("#movieName").val('Movie Name');
	}
	//movieDirector
	if($("#movieDirector").val() == '') {
		$("#movieDirector").val('Director');
	}
	//movieActor
	if($("#movieActor").val() == '') {
		$("#movieActor").val('Actor');
	}
	//movieRegion
	if($("#movieRegion").val() == '') {
		$("#movieRegion").val('Region');
	}
	//movieDate
	if($("#movieDate").val() == '') {
		$("#movieDate").val('Release Date');
	}
	//movieRating
	if($("#movieRating").val() == '') {
		$("#movieRating").val('Rating');
	}
});