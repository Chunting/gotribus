<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c" %><%
%><%@ page import="config.GlobleConfig" %>
<%
	request.setAttribute("domain",GlobleConfig.localhost);
	request.setAttribute("no_view_url",GlobleConfig.show_local);
 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Tribus_about</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain}user/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain}user/css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain}user/css/css3.css" />
    <!--[if lt IE 10]>
   		<script src="js/PIE.js" type="text/javascript"></script>
    <![endif]-->
    
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html"><img src="${domain }user/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="${no_view_url}activity/index.action">EVENT</a></li>
                    	<li><a href="${no_view_url}movie/movieHomePage.action" title="MOVIE">MOVIE</a></li>
                        <li><a href="${no_view_url}book/bookHomePage.action" title="BOOK">BOOK</a></li>
                        <li><a href="${no_view_url}music/musicHomePage.action" title="MUSIC">MUSIC</a></li>
                        <li class="current_page_item">
                        	<a href="${no_view_url}user/my.action" title="MY TRIBUS">MY TRIBUS</a>
                        </li>
                    </ul>
                    <div class="header_search">
                    	<form action="#">
                        	<p class="txt_header"><input type="text" /></p>
                            <p class="submit_header"><input type="submit" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="${domain }user/img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="#"><img src="${domain }user/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="about_content"><!--start about_content-->
            	<h2>About</h2>
                <div id="about_menu"><!--strat about_menu-->
                	<ul>
                    	<li><a href="#"><span><span>About Lacoo</span></span></a></li>
                        <li><a href="#"><span><span>Support</span></span></a></li>
                        <li><a href="#"><span><span>Copyright &amp; Trademark</span></span></a></li>
                        <li><a href="#"><span><span>Terms &amp; Privacy</span></span></a></li>
                        <li><a href="#"><span><span>Career</span></span></a></li>
                    </ul>
                </div><!--//end #about_menu-->
                <div id="about_box"><!--start about_box-->
                
                    <p>
                    	Sorry , the page you want to visit is no longer exits ... 
                    </p>
                    
                </div><!--//end #about_box-->
            </div><!--//end #about_content-->
            <div id="footer"><p> &copy;2012 goTribus |<span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>            
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
</body>
</html>                                                                                                   