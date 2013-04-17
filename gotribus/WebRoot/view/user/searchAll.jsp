<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c" %><%
%><%@ page import="config.GlobleConfig" %><%
	request.setAttribute("domain",GlobleConfig.localhost);
	request.setAttribute("no_view_url",GlobleConfig.show_local);
 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Welcome to Gotribus,${user.userAlias }</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/css/style.css" />
    <script type="text/javascript" src="${domain }js/jquery-1.6.2.min.js"></script>
    <script type="text/javascript">
			$('input[name=search]').click({
				if($.trim($('input[name=search]').val()) == ''){
					alert("Please fill the form ! ");
					return false;
				}
				$('#all').submit();				
			});
			$('input[name=search_fo]').click({
				if($.trim($('input[name=search_fo]').val()) == ''){
					alert("Please fill the content ! ");
					return false;
				}
				$('#all_fo').submit();			
			});
	</script>
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html">
        	<img src="${domain }user/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li class="${no_view_url}activity/index.action"><a href="#">EVENT</a></li>
                    	<li><a href="${no_view_url}movie/movieHomePage.action" title="MOVIE">MOVIE</a></li>
                        <li><a href="${no_view_url}book/bookHomePage.action" title="BOOK">BOOK</a></li>
                        <li><a href="${no_view_url }music/musicHomePage.action" title="MUSIC">MUSIC</a></li>
                        <li><a href="${no_view_url }user/my.action" title="MY TRIBUS">MY TRIBUS</a></li>
                    </ul>
                    <div class="header_search">
                    	<form id="all" action="${no_view_url }user/searchAll.action">
                        	<p class="txt_header"><input type="text" name="search" /></p>
                            <p class="submit_header"><input type="submit" name="" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="https://www.facebook.com/TheTribus"><img src="${domain }user/img/icon_header1.png" 
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
                	<form id="all_fo" action="${no_view_url }user/searchAll.action">
                    	<p class="search_text"><input type="text" name="search_fo" value="" 
                    	onclick="if(this.value=='')(this.value='')"  
                    	onblur="if(this.value=='')(this.value='')" /></p>
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
                    	
                    	
                        	<a href="${no_view_url }userMail/box/0/0.action"><img src="${domain}user/img/icon_message1.jpg" alt="" width="22" height="22" />
							<c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if></a>
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
                            <div class="book_btn">                            	
                            </div>
                        </div><!--//end .search_title-->
                        <div class="result_list">
                        	<ul>
                        	
                        	<c:forEach items="${movies}" var="trib"> 
                            	<li>
                            	<a href="${no_view_url}movie/${trib.movieId}.action">
									${trib.movieNameOriginal}
                            	</a>  edited by ${trib.user.userAlias}</li>
							</c:forEach>
							
							<c:forEach items="${musics}" var="trib"> 
                            	<li>
                            	<a href="${no_view_url}music/${trib.musicId}.action">
									${trib.musicName}
                            	</a>  edited by ${trib.user.userAlias}</li>
							</c:forEach>

							<c:forEach items="${books}" var="trib"> 
                            	<li>
                            	<a href="${no_view_url}book/${trib.bookId}.action">
									${trib.bookName}
                            	</a>  edited by ${trib.user.userAlias}</li>
							</c:forEach>
							
                            	                                
                            </ul>
                        </div>
                        <div id="follower_apgi" class="space_pagi">
                            
                            
                            
                            
                            
                            
                        </div>
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
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
</body>
</html>                                                                                                   