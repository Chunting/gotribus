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
	<title>Tribus_main_search_activity</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="style.css" />
    
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html"><img src="img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li class="current_page_item"><a href="#">CITY</a></li>
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
                    	<span class="space_btm"><a href="#"><img src="img/icon_header1.png" alt="" height="11" width="10" /></a></span>
                        <span><a href="#"><img src="img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg" class="space_lft"><!--start search_bg-->
                	<form action="#">
                    	<p class="search_text"><input type="text" value="Musician" onclick="if(this.value=='Musician')(this.value='')"  onblur="if(this.value=='')(this.value='Musician')" /></p>
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
            	<div id="main_search_content"><!--start main_search_content-->
                	<div id="search_lftcol"><!--start search_lftcol-->
                    	<div class="search_title"><!--start search_title-->
                        	<h2>SEARCH: MUSICIAN</h2>
                            <div class="user_btn">
                            	<a href="#">USERS</a>
                                <a href="#" class="user_scnd">ACTIVITIES</a>
                            </div>
                        </div><!--//end .search_title-->
                        <div class="search_post"><!--start search_post-->
                        	<div class="search_post_lft"><a href="#"><img src="img/pic_search1.jpg" alt="" width="134" height="179" /></a></div>
                            <div class="search_info"><!--start search_info-->
                            	<h2><a href="#">The Black Keys 2011 - 2012 Tour Chicago</a></h2>
                                <p>Chicago 1901 West Madison Street<br />Start Date: 2012-3-9 19:30 P.M.<br />End Date: 2012-3-20 00:00</p>
                                <span><a href="#"><img src="img/tripple_arrow3.jpg" alt="" width="25" height="8" /></a></span>
                                <ul>
                                	<li><a href="#">+ Attend</a></li>
                                    <li><a href="#">+ Track List</a></li>
                                    <li><a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a></li>
                                </ul>
                            </div><!--//end .search_info-->
                        </div><!--//end .search_post-->
                        <div class="search_post"><!--start search_post-->
                        	<div class="search_post_lft"><a href="#"><img src="img/pic_search1.jpg" alt="" width="134" height="179" /></a></div>
                            <div class="search_info"><!--start search_info-->
                            	<h2><a href="#">The Black Keys 2011 - 2012 Tour Chicago</a></h2>
                                <p>Chicago 1901 West Madison Street<br />Start Date: 2012-3-9 19:30 P.M.<br />End Date: 2012-3-20 00:00</p>
                                <span><a href="#"><img src="img/tripple_arrow3.jpg" alt="" width="25" height="8" /></a></span>
                                <ul>
                                	<li><a href="#">+ Attend</a></li>
                                    <li><a href="#">+ Track List</a></li>
                                    <li><a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a></li>
                                </ul>
                            </div><!--//end .search_info-->
                        </div><!--//end .search_post-->
                        <div class="search_post"><!--start search_post-->
                        	<div class="search_post_lft"><a href="#"><img src="img/pic_search1.jpg" alt="" width="134" height="179" /></a></div>
                            <div class="search_info"><!--start search_info-->
                            	<h2><a href="#">The Black Keys 2011 - 2012 Tour Chicago</a></h2>
                                <p>Chicago 1901 West Madison Street<br />Start Date: 2012-3-9 19:30 P.M.<br />End Date: 2012-3-20 00:00</p>
                                <span><a href="#"><img src="img/tripple_arrow3.jpg" alt="" width="25" height="8" /></a></span>
                                <ul>
                                	<li><a href="#">+ Attend</a></li>
                                    <li><a href="#">+ Track List</a></li>
                                    <li><a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a></li>
                                </ul>
                            </div><!--//end .search_info-->
                        </div><!--//end .search_post-->
                        <div class="search_post"><!--start search_post-->
                        	<div class="search_post_lft"><a href="#"><img src="img/pic_search1.jpg" width="134" height="179" alt="" /></a></div>
                            <div class="search_info"><!--start search_info-->
                            	<h2><a href="#">The Black Keys 2011 - 2012 Tour Chicago</a></h2>
                                <p>Chicago 1901 West Madison Street<br />Start Date: 2012-3-9 19:30 P.M.<br />End Date: 2012-3-20 00:00</p>
                                <span><a href="#"><img src="img/tripple_arrow3.jpg" alt="" width="25" height="8" /></a></span>
                                <ul>
                                	<li><a href="#">+ Attend</a></li>
                                    <li><a href="#">+ Track List</a></li>
                                    <li><a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a></li>
                                </ul>
                            </div><!--//end .search_info-->
                        </div><!--//end .search_post-->
                        <div class="search_post"><!--start search_post-->
                        	<div class="search_post_lft"><a href="#"><img src="img/pic_search1.jpg" alt="" width="134" height="179" /></a></div>
                            <div class="search_info"><!--start search_info-->
                            	<h2><a href="#">The Black Keys 2011 - 2012 Tour Chicago</a></h2>
                                <p>Chicago 1901 West Madison Street<br />Start Date: 2012-3-9 19:30 P.M.<br />End Date: 2012-3-20 00:00</p>
                                <span><a href="#"><img src="img/tripple_arrow3.jpg" alt="" width="25" height="8" /></a></span>
                                <ul>
                                	<li><a href="#">+ Attend</a></li>
                                    <li><a href="#">+ Track List</a></li>
                                    <li><a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a></li>
                                </ul>
                            </div><!--//end .search_info-->
                        </div><!--//end .search_post-->
                        <div id="follower_apgi">
                            <a href="#" class="prev"> </a>
                            <a href="#">1</a>   
                            <a href="#">2 </a>   
                            <a href="#">3 </a>   
                            <a href="#">4 </a>   
                            <a href="#">5</a>    
                            <a href="#">6 </a>   
                            <a href="#">7 </a>   
                            <a href="#">8</a>    
                            <a href="#">9 </a>   
                            <a href="#">10 </a>   
                            <a href="#">11</a>    
                            <a href="#">12</a>    
                            <a href="#">13</a>    
                            <a href="#">14</a>  
                            <a href="#" class="next"></a>
                    	</div>
                    </div><!--//end #search_lftcol-->
                    <div id="search_rgt"><!--start search_rgt-->
                    	<div class="search_widget"><!--start search_widget-->
                        	<img src="img/pic_search_widget1.jpg" alt="" width="240" height="200" />
                        </div><!--//end .search_widget-->
                        <div class="search_widget"><!--start search_widget-->
                        	<img src="img/pic_search_widget2.jpg" alt="" width="237" height="208" />
                        </div><!--//end .search_widget-->
                        <div class="search_widget"><!--start search_widget-->
                        	<img src="img/pic_search_widget3.jpg" alt="" width="235" height="78" />
                            <h2>Insider: Kerry Tribe at The Power Plant</h2>
                            <strong>April 3rd, 2012 7:00pm-9:00pm</strong>
                            <p>Join the Ministry at The Power Plant Contemporary Art Gallery for a special viewing of the film works 
                            of Kerry Tribe and a discussion with the museum...</p>
                            <a href="#">More info...</a>
                        </div><!--//end .search_widget-->
                        <div class="search_widget"><!--start search_widget-->
                        	<img src="img/pic_search_widget4.jpg" alt="" width="234" height="78" />
                            <h2>Dialogue: Brendan Monroe at Cooper Cole</h2>
                            <strong>March 3rd, 2012 3:00pm-4:00pm</strong>
                            <p>Join the Ministry of artist talk with internationally exhibited artist Brendan Monroe...</p>
                            <a href="#">More info...</a>
                        </div><!--//end .search_widget-->
                        <div class="search_widget"><!--start search_widget-->
                        	<img src="img/pic_search_widget5.jpg" alt="" width="234" height="77" />
                            <h2>Studio: Niall McClelland</h2>
                            <strong>February 21st,6:00pm-8:00pm</strong>
                            <p>For the past five years, Niall McClelland has been exhibiting his art in numerous galleries across North america. 
                            A true multidisciplinary artist, McC...</p>
                            <a href="#">More info...</a>
                        </div><!--//end .search_widget-->
                    </div><!--//end #search_rgt-->
                </div><!--//end #main_search_content-->
            </div><!--//end #common_maincontent-->
            <div id="footer"><p>Copyright @ Tribus.us 2012.      <span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
            <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
            <script src="js/back_to_top.js" type="text/javascript"></script>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
    
    <div id="popup_layer" onClick="closePop()"></div>   
    <div id="light_box_wrapper"><!--start light_box_wrapper-->
        <div id="light_box_bg"><!--start light_box_bg-->
            <div class="pop_up_cross"> <a href="javascript:void(0)" onClick="closePop()"></a></div>
            <h2>Add to list</h2>
            <form action="#">
                <p>
                    <select>	
                        <option>List Name</option>
                        <option>Ahmed</option>
                        <option>Naser</option>
                        <option>Syed</option>
                    </select>
                </p>
                <p><textarea rows="10" cols="10" onclick="if(this.value=='Description...')(this.value='')" onblur="if(this.value=='')(this.value='Description...')" >Description...</textarea></p>
                <div class="pop_btn"><a href="#">Add</a></div>
            </form>
        </div><!--//end #light_box_bg-->
    </div><!--//end #light_box_wrapper-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/smoothscroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/code.js"></script>
    
</body>
</html>                                                                                                   