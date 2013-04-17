<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c" %><%
%><%@ page import="config.GlobleConfig" %><%
	request.setAttribute("domain",GlobleConfig.localhost);
	request.setAttribute("no_view_url",GlobleConfig.show_local);
 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Welcome to Gotribus,${user.userAlias }'s tribus list</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/css/style.css" />    
	<script type="text/javascript">
			$("#searchAll_Sub").click(function(){
				if($.trim($('input[name=search]').val()) == ''){
					alert("Please fill the form ! ");
					return false;
				});
				$('#all_sea').submit();
			}
	</script>
	<style type="text/css">
	#menu_rgt ul li a:hover {
		font-size: 20px;
	}
	</style>    
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="${no_view_url}activity/index.action">
        	<img src="${domain }user/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="${no_view_url}activity/index.action">EVENT</a></li>
                    	<li><a href="${no_view_url}movie/movieHomePage.action" title="MOVIE">MOVIE</a></li>
                        <li><a href="${no_view_url}book/bookHomePage.action" title="BOOK">BOOK</a></li>
                        <li><a href="${no_view_url }music/musicHomePage.action" title="MUSIC">MUSIC</a></li>
                        <li><a href="${no_view_url }user/my.action" title="MY TRIBUS">MY TRIBUS</a></li>
                    </ul>
                    <div class="header_search">
                    	<form id="all_sea" action="${no_view_url}user/searchAll.action">
                        	<p class="txt_header"><input type="text" name="search" /></p>
                            <p class="submit_header"><input id="searchAll_Sub" type="submit" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="${domain }user/img/icon_header1.png" 
                    	alt="" width="10" height="11" /></a></span>
                        <span><a href="#"><img src="${domain }user/img/icon_header2.png" 
                        alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg"><!--start search_bg-->
                	<form action="#">
                    	<p class="search_text"><input type="text" value="ROSE" onclick="if(this.value=='ROSE')(this.value='')"  onblur="if(this.value=='')(this.value='ROSE')" /></p>
                        <p class="search_submit"><input type="submit" value=" " /></p>
                    </form>
                </div><!--//end #search_bg-->
                <div id="social_media"><!--start social_media-->
                	<div id="social_lftcol">
                    	<a href="https://www.facebook.com/TheTribus"><img src="${domain }user/img/icon_facebook.jpg" 
                    	alt="" width="24" height="24" /></a>
                        <a href="#"><img src="${domain }user/img/icon_tweet.jpg" 
                        alt="" width="24" height="24" /></a>
                    </div>
                    <div id="social_box"><!--start social_box-->
                    	<div id="message">
						
                        	<a href="${no_view_url }userMail/box/0.action"><img src="${domain}user/img/icon_message1.jpg" alt="" width="22" height="22" />
							
							<c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if>
							</a>
                            <a href="#"><img src="${domain}user/img/icon_message2.jpg" alt="" width="22" height="22" /></a>
                            <a href="#"><img src="${domain}user/img/icon_message3.jpg" alt="" width="22" height="22" /></a>
                            <a href="${no_view_url }user/editForm.action"><img src="${domain}user/img/icon_message4.jpg" alt="" width="22" height="22" /></a>

                        </div>
                        <div class="address">
                        	<h3>${user.userAlias }</h3>
                            <span>${userProf.profCity }</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="common_maincontent"><!--start common_maincontent-->
            	<div id="main_search_content"><!--start main_search_content-->
                	<div id="search_lftcol"><!--start search_lftcol-->
                    	<div class="search_title"><!--start search_title-->
                        	<h2>
								TribusList Name:
							</h2>                            
                        </div><!--//end .search_title-->
                        <div id="gallery_book"><!--start gallery_book-->

							<c:forEach items="${list}" var="l" varStatus="in"> 
							

							<c:if test="${l.type=='book'}">
							<div class="book_feature">                            	
                                <h2><a href="${no_view_url}book/${l.resourceId}.action">${l.resourceName}</a></h2>
                            </div>
							</c:if>

							<c:if test="${l.type=='music'}">
							<div class="book_feature">                            	
                                <h2><a href="${no_view_url}music/${l.resourceId}.action">${l.resourceName}</a></h2>
                            </div>
							</c:if>

							<c:if test="${l.type=='movie'}">
							<div class="book_feature">
                            	
                                <h2><a href="${no_view_url}movie/${l.resourceId}.action">${l.resourceName}</a></h2>
                            </div>
							</c:if>

							<c:if test="${l.type=='city'}">
							<div class="book_feature">
                            	
                                <h2><a href="${no_view_url}activity/info.action?activityId=${l.resourceId}">${l.resourceName}</a></h2>
                            </div>
							</c:if>

							<c:if test="${in.index%4 == 0 && in.index != 0}">
								<div class="clear"></div>
							</c:if>
                            
							</c:forEach>

                        </div><!--//end #gallery_book-->												
					</div><!--//end #search_lftcol-->
                    <div id="search_rgt"><!--start search_rgt-->

						
                    	<div class="search_widget"><!--start search_widget-->
                        	<img src="${domain }user/img/pic_search_widget1.jpg" 
                        	alt="" width="240" height="200" />
                        </div><!--//end .search_widget-->
                        <div class="search_widget"><!--start search_widget-->
                        	<img src="${domain }user/img/pic_search_widget2.jpg" alt="" 
                        	width="237" height="208" />
                        </div><!--//end .search_widget-->
                        <div class="search_widget"><!--start search_widget-->
                        	<img src="${domain }user/img/pic_search_widget6.jpg" 
                        	alt="" width="234" height="202" />
                        </div><!--//end .search_widget-->
					
					</div><!--//end #search_rgt-->
                </div><!--//end #main_search_content-->
            </div><!--//end #common_maincontent-->
            <div id="footer"><p> &copy;2012 goTribus |<span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
            <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
            <script src="js/back_to_top.js" type="text/javascript"></script>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
</body>
</html>                                                                                                   