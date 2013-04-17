<%@ page language="java" import="java.util.*,model.User,config.GlobleConfig" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user=(User)session.getAttribute("user");
request.setAttribute("path1",GlobleConfig.pathPath);
request.setAttribute("path2",GlobleConfig.pathPath1);
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Create Activity</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" href="${path1}activity/css/jquery.ui.all.css">
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/style.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/css/css3.css" />
    <link rel="stylesheet" href="${path1}activity/css/jqtransform.css" type="text/css" media="all" />
    <link rel="shortcut icon" href="http://www.gotribus.com/view/images/LOGO_32.png"/>
    <!--[if lt IE 10]>
   		<script src="js/PIE.js" type="text/javascript"></script>
    <![endif]-->
 <script type="text/javascript" src="${path1}js/jquery-1.6.2.min.js"></script>		
   
   	<script src="${path1}activity/css/js/jquery.ui.core.js"></script>
	<script src="${path1}activity/css/js/jquery.ui.widget.js"></script>
	<script src="${path1}activity/css/js/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="${path1}activity/css/demos.css">
	<script type="text/javascript" src="${path1}activity/js/create_mmb.js"></script>
	<script>
	
		
		$(function() {
		$( "#activitystartDate" ).datepicker( {minDate: -365,onSelect: function(dateText, inst) {$('#activityfinishDate').datepicker('option', 'minDate',new Date(dateText.replace('-',',')));}
        });
	});
	$(function() {
		$( "#activityfinishDate" ).datepicker( {onSelect: function(dateText, inst) {$('#activitystartDate').datepicker('option', 'maxDate', new Date(dateText.replace('-',',')));}
        });
	});
	</script>
    <script type="text/javascript">
    	function setAtt(){
    	document.getElementById("hd_activityDetail").value=document.getElementById("activityDetail").value;
    	document.getElementById("hd_activityName").value=document.getElementById("activityName").value;
    	document.getElementById("hd_activityCity").value=document.getElementById("activityCity").value;
    	document.getElementById("hd_activityStreet").value=document.getElementById("activityStreet").value;
    	document.getElementById("hd_activityState").value=document.getElementById("activityState").value;
    	document.getElementById("hd_activityClassified").value=document.getElementById("activityClassified").value;
    	document.getElementById("hd_activitystartDate").value=document.getElementById("activitystartDate").value;
    	document.getElementById("hd_activityfinishDate").value=document.getElementById("activityfinishDate").value;
    	
    	document.getElementById("hd_activityFeesFrom").value=document.getElementById("activityFeesFrom").value;
    	document.getElementById("hd_activityFeesTo").value=document.getElementById("activityFeesTo").value;
    	document.getElementById("hd_file_url_small").value=document.getElementById("file_url_small").value;
    	document.getElementById("hd_file_url_middle").value=document.getElementById("file_url_middle").value;
    	document.getElementById("hd_file_url_big").value=document.getElementById("file_url_big").value;
        
        document.getElementById("activityInfo").submit();
    	}
    	function check_fees(fees){
    	var feesReg1=/^[0-9]*$/;
    	var feesReg3=/[1-9]\d*/;
    	var feesReg=/^[1-9]d*.d*|0.d*[1-9]d*$/;
    	var feesReg2=/^[1-9]+?[0-9]*$/;
    	var activityFeesTo=document.getElementById("activityFeesTo").value.Trim();
    	alert(activityFeesTo.length);
    	if(feesReg1.test(fees)){
    	   if(activityFeesTo.length!=0){
    	    if(feesReg1.test(activityFeesTo)){
    	        if(fees-activityFeesTo>=0){
    	          alert("please check fees inputed");
    	         }else{
    	            setAtt();
    	            
    	          }
    	     }else{
    	           alert("please check fees inputed");
    	     }
    	   }else{
    	   setAtt();
    	   }
    	
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
    	var activityFeesFrom=document.getElementById("activityFeesFrom").value;
    	var activityFeesTo=document.getElementById("activityFeesTo").value;
    	var hidden_para1=document.getElementById("file_url_small").value.Trim()
    	var hidden_para2=document.getElementById("file_url_middle").value.Trim()
    	var hidden_para3=document.getElementById("file_url_big").value.Trim()
    if(activityDetail.length==0||activityName.length==0||activityCity.length==0||activityStreet.length==0||activitystartDate.length==0||activityFeesFrom.length==0||hidden_para2.length==0)
    	{alert("please fullfilled the form");}else{
    	
 check_fees(activityFeesFrom);}
    	
    	}
function get(){

document.getElementById("aa").style.display="block";
document.getElementById("bb").style.display="none";

}
function bu(){

document.getElementById("bb").style.display="block";
document.getElementById("aa").style.display="none";
}
    </script>
    <style>
	.file {position:relative;right:-30px;top:4px;
	       width:0px;height:30px;filter:alpha(opacity=0);
			-moz-opacity:0;opacity:0;}
	</style>
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="${path2 }activity/index.action"><img src="${path1 }activity/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li class="current_page_item">
										<a href="${path2}activity/index.action">EVENT</a>
									</li>
									<li>
										<a href="${path2}movie/movieHomePage.action" title="MOVIE">MOVIE</a>
									</li>
									<li>
										<a href="${path2}book/bookHomePage.action" title="BOOK">BOOK</a>
									</li>
									<li>
										<a href="${path2}music/musicHomePage.action" title="MUSIC">MUSIC</a>
									</li>
									<li>
										<a id="bb" onMouseOver="get()"  style="display:block"   href="${path2}user/my.action" title="MY TRIBUS">MY TRIBUS</a>
										<a id="aa"  onMouseOut="bu()" style="font-size:24px; display:none"  href="${path2}user/my.action" title="MY TRIBUS">MyTRIBUS</a>
									</li>
                    </ul>
                    <div class="header_search">
                    	<form action="${path2 }user/searchAll.action">
                        	<p class="txt_header"><input id="search" name="search" type="text" /></p>
                            <p class="submit_header"><input type="submit" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="${path1 }activity/img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="#"><img src="${path1 }activity/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg" class="space_lft"><!--start search_bg-->
                	<form action="${path2}activity/search.action">
                    	<p class="search_text"><input id="txt1" name="searchCondition" type="text" value="Seach for event name and city" onclick="if(this.value=='Seach for event name and city')(this.value='')"  onblur="if(this.value=='')(this.value='Seach for event name and city')" /></p>
                        <p class="search_submit"><input type="submit" value=" " /></p>
                    </form>
                </div><!--//end #search_bg-->
                <div id="social_media"><!--start social_media-->
                	<div id="social_lftcol">
                    	<a href="https://www.facebook.com/TheTribus"><img src="${path1}activity/img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                        <a href="#"><img src="${path1}activity/img/icon_tweet.jpg" alt="" width="24" height="24" /></a>
                    </div>
                    <div id="social_box"><!--start social_box-->
                    	<div id="message">
                        	<a href="${path2}userMail/box/0.action"><img src="${path1}activity/img/icon_message1.jpg" alt="" width="22" height="22" /><c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if></a>
                            <a href="${path2}user/logout.action"><img src="${path1}activity/img/icon_message4.jpg" alt="" width="22" height="22" /></a>
                        </div>
                        <div class="address">
                        	<h3>&nbsp;
                        	<%if(user!=null){ %><a href="${path2 }user/my.action"><%=user.getUserAlias()%></a><%}else{ %><a href="${path2 }user/login.action">login</a><%} %></h3>
                            <span>${userProf.profCity}</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="common_maincontent"><!--start common_maincontent-->
            	<div id="album_content" class="create_list"><!--start album_content-->
                    <div id="gallery"><!--start gallery-->
                    	<h2 class="create_title title_activity">Create An Activity</h2>
                        <div id="contact_form_create"><!--start contact_form_create-->
                        	
                            	<div class="account_message">
                                	<div class="message_activity">
                                    	<div class="author_speech">
                                        <textarea name="activityDetail" id="activityDetail" rows="10" cols="10" onclick="if(this.value=='Activity introduction:')(this.value='')"  onblur="if(this.value=='')(this.value='Activity introduction:')">Activity introduction:</textarea>
                                    </div>
                                    </div>
                                </div>
                                <div class="contact_field_widget">
                                    <div class="text_field"><input type="text" class="active act act3" value="Activity name" name="activityName" id="activityName"/></div>
                                </div>
                                <div class="contact_field_widget">
                                    <div class="text_field"><input type="text" class="active act act3" value="Address" name="activityStreet" id="activityStreet"/></div>
                                </div>
                                <div class="contact_field_widget">
                                  <div class="text_field"><input type="text" class="active act act3" value="City" name="activityCity" id="activityCity"/></div>
                              </div>
                                <div class="contact_field_widget">
                                    <div class="text_field"><input type="text" class="active act act3" value="State" name="activityState" id="activityState" /></div>
                              </div>
                              <div class="contact_field_widget">
                                    <div class="text_field">
                                    <input class="small_txt act2 act3" type="text" value="Start time" id="activitystartDate" name="activitystartDate"/>
                                    <input class="small_txt end act2 act3" type="text" id="activityfinishDate" value="End time" name="activityfinishDate" /></div>
                                </div>
                                <div class="contact_field_widget">                                	
                                    <input class="small_txt act2 act3" type="text" value="Fees From" name="activityFeesFrom" id="activityFeesFrom"/>
                                	<input class="small_txt end act2 act3" type="text" value="To:" name="activityFeesTo" id="activityFeesTo"/>
                                </div>
                                <div class="contact_field_widget">
                                    <div class="text_field tag">
                                     	<input type="text" class="active act3" value="Tag:" name="tag" id="tag" />
                                     	<div class="arrow"></div>
                                     	<div class="bookTag">
	                                		<span class="tag_arrow"></span>
									    	<ul>
									    		<li><a href="javascript:;">action</a></li>
									    		<li><a href="javascript:;">adventure</a></li>
									    		<li><a href="javascript:;">animation</a></li>
									    		<li><a href="javascript:;">war</a></li>
									    		<li><a href="javascript:;">comedy</a></li>
									    		<li><a href="javascript:;">horror</a></li>
									    		<li><a href="javascript:;">mystery</a></li>
									    		<li><a href="javascript:;">romance</a></li>
									    		<li><a href="javascript:;">thriller</a></li>
									    		<li><a href="javascript:;">other</a></li>
									    	</ul>
								   		</div> 
                                    </div>                 
								 </div>
                              <form method="post" name="form12" id="form_upload2"
				action="${path2}uploadForm/uploadAction.action"
				enctype="multipart/form-data" target="hidden_frame_2">
                             
                               <div class="persoanal_inp_field">
                                	<p class="inp_search">
                                		<input class="poster active" value="Activity picture" />
									<input type="file" name="myfile" class="file" value=""  onchange="$('#form_upload2').submit();"  />	
									</p>
                                </div>                             
                                </form>
                                <div class="contact_field_widget">
                                    <div class="text_field">
                                      <div class="frame pic_border" id="container_single"> 
                                          <div class="icon_edit"></div>
                                      </div>
                            
                                        <input type="hidden" name="file_url_middle" id="file_url_middle" value="" />
                                        <input type="hidden" name="file_url_big" id="file_url_big" value="" />
                                        <input type="hidden" name="file_url_small" id="file_url_small" value="" />
                                     <form method="post" id="activityInfo" name="activityInfo" action="${path2}activity/activityCreat.action" class="radio">
                                      
                                        <input type="hidden" name="hd_activityDetail" id="hd_activityDetail" value="" />
										<input type="hidden" name="hd_activityName" id="hd_activityName" value="" />
										<input type="hidden" name="hd_activityStreet" id="hd_activityStreet" value="" />
										<input type="hidden" name="hd_activityCity" id="hd_activityCity" value="" />
										<input type="hidden" name="hd_activityState" id="hd_activityState" value="" />
										<input type="hidden" name="hd_activityFeesFrom" id="hd_activityFeesFrom" value=""/>
										<input type="hidden" name="hd_activityFeesTo" id="hd_activityFeesTo" value=""/> 
										<input type="hidden" name="hd_activityClassified" id="hd_activityClassified" value=""/>
										<input type="hidden" name="hd_activitystartDate" id="hd_activitystartDate" value=""/>
										<input type="hidden" name="hd_activityfinishDate" id="hd_activityfinishDate" value=""/>
										<input type="hidden" name="hd_file_url_middle" id="hd_file_url_middle" value="" />
                                        <input type="hidden" name="hd_file_url_big" id="hd_file_url_big" value="" />
                                        <input type="hidden" name="hd_file_url_small" id="hd_file_url_small" value="" />
										
										
										
                                        
                                      </form>
                                  
				
				<!-- input type="submit" value="submit" -->
				<span id="msg"></span>
				<div id="div_pic"></div>
				
				<iframe name='hidden_frame_2' id="hidden_frame_2" style='display: none'></iframe>
		        <input type="hidden" value="2" name="div_container_number" />
                        		
                                    </div>
                                </div>
                                <div class="btn_contact_field">
                                <br/>
                               	<a href="javascript: check_blank();">Save</a></div> 
                        </div><!--//end #contact_form_create-->
                    </div><!--//end #gallery-->
                </div><!--//end #album_content-->
            </div><!--//end #common_maincontent-->
            <div id="footer"><p> &copy;2012 goTribus |<span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
  
    <script type="text/javascript" src="${path1 }activity/css/js/jquery.jqtransform.js" ></script>
    <script src="${path1 }activity/css/js/smoothscroll.js" type="text/javascript"></script>
    <script src="${path1 }activity/js/back_to_top.js" type="text/javascript"></script>
    <script type="text/ecmascript">
        $(function(){
            $('form.radio .create_radio').jqTransform({imgPath:''});
        });
    </script>
</body>
</html>                                                                                                   