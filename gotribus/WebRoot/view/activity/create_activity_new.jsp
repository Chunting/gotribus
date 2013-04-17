<%@ page language="java" import="java.util.*,model.User,config.GlobleConfig" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user=(User)session.getAttribute("user");
request.setAttribute("path1",GlobleConfig.pathPath);
request.setAttribute("path2",GlobleConfig.pathPath1);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'create_activity_new.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" href="${path1}activity/css/jquery.ui.all.css">
    
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/css/css3.css" />
       <link rel="stylesheet" href="${path1}activity/css/jqtransform.css" type="text/css" media="all" />
      <!--[if lt IE 10]>
   		<script src="${path1}activity/css/js/PIE.js" type="text/javascript"></script>
    <![endif]-->
   <script type="text/javascript" src="${path1}js/jquery-1.6.2.min.js"></script>	
   
   	<script src="${path1}activity/css/js/jquery.ui.core.js"></script>
	<script src="${path1}activity/css/js/jquery.ui.widget.js"></script>
	<script src="${path1}activity/css/js/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="${path1}activity/css/demos.css">
	
	<script>
	
		
		$(function() {
		$( "#activitystartDate" ).datepicker( {minDate: -0,onSelect: function(dateText, inst) {$('#activityfinishDate').datepicker('option', 'minDate',new Date(dateText.replace('-',',')));}
        });
	});
	$(function() {
		$( "#activityfinishDate" ).datepicker( {onSelect: function(dateText, inst) {$('#activitystartDate').datepicker('option', 'maxDate', new Date(dateText.replace('-',',')));}
        });
	});
	</script>
    <script type="text/javascript">
    	function check_sub(){
			document.getElementById("form1").submit();
    	}
    	function check_fees(fees){
    	var feesReg1=/^[0-9]*$/;
    	var feesReg3=/[1-9]\d*/;
    	var feesReg=/^[1-9]d*.d*|0.d*[1-9]d*$/;
    	var feesReg2=/^[1-9]+?[0-9]*$/;
    	if(feesReg1.test(fees)){
    	check_sub();
    	}else{
    	alert("please check fees inputed");
    	}
    	}
 String.prototype.Trim = function()
{
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
    	function check_blank(){
    	   	var activityDetail=document.getElementById("activityDetail").value.Trim();
    	var activityName=document.getElementById("activityName").value.Trim();
    	var activityCity=document.getElementById("activityCity").value.Trim();
    	var activityStreet=document.getElementById("activityStreet").value.Trim();
    	var activityState=document.getElementById("activityState").value.Trim();
    	var activitystartDate=document.getElementById("activitystartDate").value;
    	var activityfinishDate=document.getElementById("activityfinishDate").value;
    	var activityFees=document.getElementById("activityFees").value;
    	var hidden_para1=document.getElementById("file_url_small").value.Trim()
    	var hidden_para2=document.getElementById("file_url_middle").value.Trim()
    	var hidden_para3=document.getElementById("file_url_big").value.Trim()
    if(activityDetail.length==0||activityName.length==0||activityCity.length==0||activityStreet.length==0||activityState.length==0||activitystartDate.length==0||activityFees.length==0||hidden_para2.length==0||hidden_para1.length==0||hidden_para3.length==0)
    	{alert("please fullfilled the form");}else{
    	
 check_fees(activityFees);}
    	
    	}
    </script>
  </head>
  
  <body>
  	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html"><img src="img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="#">CITY</a></li>
                    	<li><a href="#" title="MOVIE">MOVIE</a></li>
                        <li><a href="#" title="BOOK">BOOK</a></li>
                        <li><a href="#" title="MUSIC">MUSIC</a></li>
                        <li><a href="#" title="MY TRIBUS">MY TRIBUS</a></li>
                    </ul>
                    <div class="header_search">
                    	<form action="#">
                        	<p class="txt_header"><input type="text" /></p>
                            <p class="submit_header"><input type="submit" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="#"><img src="img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg" class="space_lft"><!--start search_bg-->
                	<form action="#">
                    	<p class="search_text"><input type="text" value="Seach movie, actors, comment, tribus music list" onclick="if(this.value=='Seach movie, actors, comment, tribus music list')(this.value='')"  onblur="if(this.value=='')(this.value='Seach movie, actors, comment, tribus music list')" /></p>
                        <p class="search_submit"><input type="submit" value=" " /></p>
                    </form>
                </div><!--//end #search_bg-->
                <div id="social_media"><!--start social_media-->
                	<div id="social_lftcol">
                    	<a href="#"><img src="img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                        <a href="#"><img src="img/icon_tweet.jpg" alt="" width="24" height="24" /></a>
                    </div>
                    <div id="social_box"><!--start social_box-->
                    	<div id="message">
                        	<a href="#"><img src="img/icon_message1.jpg" alt="" width="22" height="22" /><span>5</span></a>
                            <a href="#"><img src="img/icon_message2.jpg" alt="" width="22" height="22" /></a>
                            <a href="#"><img src="img/icon_message3.jpg" alt="" width="22" height="22" /></a>
                            <a href="#"><img src="img/icon_message4.jpg" alt="" width="22" height="22" /></a>
                        </div>
                        <div class="address">
                        	<h3>Jeremy Guan</h3>
                            <span>New York City</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="common_maincontent"><!--start common_maincontent-->
            	<div id="album_content" class="create_list"><!--start album_content-->
                    <div id="gallery"><!--start gallery-->
                    	<h2 class="create_title title_activity">Create An Activity</h2>
                        <div id="contact_form_create"><!--start contact_form_create-->
                        	<form action="#" class="radio">
                            	<div class="account_message">
                                	<div class="message_drop"></div>
                                	<div class="message_activity">
                                    	<div class="author_speech">
                                        <textarea rows="10" cols="10" onclick="if(this.value=='Activity introduction:')(this.value='')"  onblur="if(this.value=='')(this.value='Activity introduction:')">Activity introduction:</textarea>
                                    </div>
                                    </div>
                                </div>
                                <div class="contact_field_widget">
                                	<label>Activity name :</label>
                                    <div class="text_field"><input type="text" /></div>
                                </div>
                                <div class="contact_field_widget">
                                	<label>Activity address: :</label>
                                    <div class="text_field"><input class="edit_info" type="text" /></div>
                                </div>
                                <div class="contact_field_widget">
                                    <div class="text_field"><input class="edit_info" type="text" /></div>
                                </div>
                                <div class="contact_field_widget">
                                  <div class="text_field">
                                  <p>
                                    <input type="text" />
                                  </p>
                                    </div>
                                </div>
                                <div class="contact_field_widget">
                                	<label>Fees:</label>
                                    <div class="text_field"><input class="small_txt" type="text" /></div>
                                </div>
								 <div class="contact_field_widget">
                                	<label>Feesdfs:</label>
                                    <div class="text_field"></div>
								 </div>
                                <div class="contact_field_widget">
                                	<label>Start time - End time：</label>
                                    <div class="text_field"><input class="small_txt" type="text" />
                                    <small>-</small>
                                    <input class="small_txt" type="text" /></div>
                                </div>
                                <div class="contact_field_widget">
                                	<label>Authorization:</label>
                                    <div class="radio_field_area">
                                    	<div class="radio_col">
                                        	<span> Privacy</span>
                                            <div class="create_radio"><div class="rowElem"><input type="radio" name="radio" value="" /></div></div>
                                        </div>
                                        <div class="radio_col radio_col_rgt">
                                        	<span> Public</span>
                                            <div class="create_radio"><div class="rowElem"><input type="radio" name="radio" value="" /></div></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="contact_field_widget">
                                	<label>Activity picture</label>
                                    <div class="text_field"><input  type="text" /></div>
                                </div>
                                <div class="contact_field_widget">
                                    <div class="text_field">
                                    	<textarea class="txt_type" rows="10" cols="10"></textarea>
                                    </div>
                                </div>
                                <div class="btn_contact_field">
                                	<a href="#">Save</a>
                                    <a href="#">Edit</a>
                                </div>
                            </form>
                        </div><!--//end #contact_form_create-->
                    </div><!--//end #gallery-->
                </div><!--//end #album_content-->
            </div><!--//end #common_maincontent-->
            <div id="footer"><p>Copyright @ Tribus.us 2012.      <span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.jqtransform.js" ></script>
    <script src="js/smoothscroll.js" type="text/javascript"></script>
    <script type="text/ecmascript">
        $(function(){
            $('form.radio .create_radio').jqTransform({imgPath:''});
        });
    </script>
  </body>
</html>
