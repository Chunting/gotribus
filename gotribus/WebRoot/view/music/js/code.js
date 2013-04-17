$(function() {
	$('#light_box_wrapper').fadeOut();
});

function showPop(){
	var winH = $(document).height();
	var binH = $(window).height();
	var windowWidth = $(window).width();
	var contentWidth = $("#light_box_wrapper").width();
	
	var contentLeft = (windowWidth-contentWidth)/2
	
	var scrollTop = $(window).scrollTop()+175;
	
	$('#popup_layer').css('height',winH+'px');
	$('#popup_layer').css('opacity',0.8);
	
	$('#popup_layer').fadeIn(500);
	
	$('#light_box_wrapper').css({'top' : scrollTop+'px'});
	$('#light_box_wrapper').css({'left' : contentLeft+'px'});
	$('#light_box_wrapper').fadeIn(500);
}
function closePop(){
	$('#popup_layer').fadeOut(500);
	$('#light_box_wrapper').fadeOut(500);
}

//Wanted
function showPopWanted(){
	var winH = $(document).height();
	var binH = $(window).height();
	var windowWidth = $(window).width();
	var contentWidth = $("#light_box_wrapper_wanted").width();
	
	var contentLeft = (windowWidth-contentWidth)/2
	
	var scrollTop = $(window).scrollTop()+270;
	
	$('#popup_layer_wanted').css('height',winH+'px');
	$('#popup_layer_wanted').css('opacity',0.8);
	
	$('#popup_layer_wanted').fadeIn(500);
	
	$('#light_box_wrapper_wanted').css({'top' : scrollTop+'px'});
	$('#light_box_wrapper_wanted').css({'left' : contentLeft+'px'});
	$('#light_box_wrapper_wanted').fadeIn(500);
}
function closePopWanted(){
	$('#popup_layer_wanted').fadeOut(500);
	$('#light_box_wrapper_wanted').fadeOut(500);
}

//Done
function showPopDone(){
	var winH = $(document).height();
	var binH = $(window).height();
	var windowWidth = $(window).width();
	var contentWidth = $("#light_box_wrapper_done").width();
	
	var contentLeft = (windowWidth-contentWidth)/2
	
	var scrollTop = $(window).scrollTop()+270;
	
	$('#popup_layer_done').css('height',winH+'px');
	$('#popup_layer_done').css('opacity',0.8);
	
	$('#popup_layer_done').fadeIn(500);
	
	$('#light_box_wrapper_done').css({'top' : scrollTop+'px'});
	$('#light_box_wrapper_done').css({'left' : contentLeft+'px'});
	$('#light_box_wrapper_done').fadeIn(500);
}
function closePopDone(){
	$('#popup_layer_done').fadeOut(500);
	$('#light_box_wrapper_done').fadeOut(500);
}

//Tracked
function showPopTracked(){
	var winH = $(document).height();
	var binH = $(window).height();
	var windowWidth = $(window).width();
	var contentWidth = $("#light_box_wrapper_tracked").width();
	
	var contentLeft = (windowWidth-contentWidth)/2
	
	var scrollTop = $(window).scrollTop()+270;
	
	$('#popup_layer_tracked').css('height',winH+'px');
	$('#popup_layer_tracked').css('opacity',0.8);
	
	$('#popup_layer_tracked').fadeIn(500);
	
	$('#light_box_wrapper_tracked').css({'top' : scrollTop+'px'});
	$('#light_box_wrapper_tracked').css({'left' : contentLeft+'px'});
	$('#light_box_wrapper_tracked').fadeIn(500);
}
function closePopTracked(){
	$('#popup_layer_tracked').fadeOut(500);
	$('#light_box_wrapper_tracked').fadeOut(500);
}