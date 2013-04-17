<%@ page language="java"
	import="java.util.*,model.User,model.Activity,model.ActivityClassified,vo.ActivityGoingMax,vo.UserComment,config.GlobleConfig"
	pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%><%
	request.setAttribute("path2",GlobleConfig.pathPath1);
	request.setAttribute("path1",GlobleConfig.pathPath);
	%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Tribus_Activity_Final</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="${path1}activity/font/font.css" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="${path1}activity/css/style.css" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="${path1}activity/css/css3.css" />

    <link rel="stylesheet" type="text/css" href="${path1}activity/css/jquery.lightbox.css" media="screen" />
    <!--[if lt IE 10]>
   		<script src="js/PIE.js" type="text/javascript"></script>
    <![endif]-->


</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html"><img src="img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="#">EVENT</a></li>
                    	<li class="current_page_item"><a href="#" title="MOVIE">MOVIE</a></li>
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
                <div id="review_lftcol"><!--start review_lftcol-->
                    <div id="product_area"><!--start product_area-->
                    	<h2>The Black Keys 2011 - 2012 Tour Chicago</h2>
                        <div id="product_twocol"><!--start product_twocol-->
                        	<div id="product_lftcol"><img src="img/pic_product1.jpg" alt="" width="313" height="417" /></div>
                            <div id="product_rgtcol"><!--start product_rgtcol-->
                            	<p>Start Date: 2012-3-9 19:30 P.M.<br />End Date: 2012-3-20 00:00<br />PLace: Chicago 1901 West Madison Street<br />Starter:<br />
                                Type: Music<br />Fees: 150 D</p>
                                <div class="king_wish">
                                	<a href="#">+ Track List</a><a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>
                                </div>
                                <div class="king_social">
                                	<a href="#"><img src="img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                                    <a href="#"><img src="img/icon_tweet.jpg" alt="" width="24" height="24" /></a>
                                </div>
                                <div class="king_blue_rating">
                                	<span>Rate this movie:</span>
                                	<div class="rating_align"><div id="score" ></div></div>
                                </div>
                                <div class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo click_done">Done</a>
                                </div>
                                <div class="map"><a href="img/pic_map_large.jpg"><img src="img/pic_map.jpg" alt="" width="172" height="167" /></a></div>
                            </div><!--//end #product_rgtcol-->
                        </div><!--//end #product_twocol-->
                    </div><!--//end #product_area-->
                    <div id="brief_main"><!--start brief_main-->
                    	<div class="brief_activity"><!--start brief_activity-->
                        	<h2>Brief Introduction</h2>
                            <div class="comment_box"><!--start comment_box-->
                                <div class="brief_content">
                                	<p>Two of music��s hardest-hitting bands are teaming up this spring for a massive arena tour. In support of their new album, El Camino, The Black Keys are hitting the road with UK rockers Arctic Monkeys. The trek currently spans 15 dates, kicking off in Cincinnati on March 2nd and ending in Norfolk, VA on March 23rd.Along the way, they��ll wreck havoc on places like New York��s Madison Square Garden, Boston��s TD Garden, and Chicago��s United Center.</p>
                                    <div class="icon_brief"><img src="img/icon_plus.jpg" alt="" width="20" height="20" /></div>
                                </div>
                            </div><!--//end .comment_box-->
                        </div><!--//end .brief_activity-->
                        <div class="brief_gallery"><!--start brief_gallery-->
                        	<h2>Activity Image</h2>
                           	<div class="brief_img">
                            	<ul id="slider1"><li>
                                <img src="img/pic_brief1.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief2.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief3.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief4.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief5.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief6.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief7.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief8.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief9.jpg" alt="" width="103" height="103" />
                                <img src="img/pic_brief10.jpg" alt="" width="103" height="103" />
                                <div class="clear"></div>
                               </li></ul>
                            </div>
                        </div><!--//end #brief_gallery-->
                        <div class="video_box"><!--start video_box-->
                        	<h2>Activity Video</h2>
                        	<div class="video_box_cont"><!--start video_box_cont-->
                            	<div class="btn_play"><a href="#"><img src="img/btn_play.jpg" alt="" width="18" height="18" /></a></div>
                            	<img src="img/pic_play1.jpg" alt="" width="187" height="106" />
                                <div class="play_side">
                                	<p>Uploaded by theblackkeys on 7 Feb 2012<br />&copy; 2012 WMG</p>
                                    <p>This is the official video for "Gold On The Ceiling" from El Camino.  To download El Camino now clickhere - 
                                    <a href="#">http://smarturl.it/ElCamino</a></p>
                                    <p>Directed by Reid Long</p>
                                </div>
                            </div><!--//end .video_box_cont-->
                        </div><!--//end .video_box-->
                        <div class="video_box"><!--start video_box-->
                        	<div class="video_box_cont"><!--start video_box_cont-->
                            	<div class="btn_play"><a href="#"><img src="img/btn_play.jpg" alt="" width="18" height="18" /></a></div>
                            	<img src="img/pic_play2.jpg" alt="" width="188" height="107"  />
                                <div class="play_side">
                                	<p class="space_top">Uploaded by theblackkeys on 2 Dec 2011 <br />The Black Keys essential Videos Playlist</p>
                                </div>
                            </div><!--//end .video_box_cont-->
                        </div><!--//end .video_box-->
                    </div><!--//end #brief_main-->
                    <div id="comment_box_brief"><!--start comment_box_brief-->
                        <div class="comment_box"><!--start comment_box-->
                            <div class="arrow_author2"></div>
                            <div class="comment_first_content"><!--start comment_first_content-->
                                <div class="pic_author">
                                    <div class="arrow_author1"></div>
                                    <img src="img/pic_author1.png" alt="" width="73" height="73" />
                                </div>
                                <div class="author_total_rgt">
                                    <div class="author_speech">
                                        <textarea rows="10" cols="10" onclick="if(this.value=='Name Says : ...')(this.value='')"  onblur="if(this.value=='')(this.value='Name Says : ...')">Name Says : ...</textarea>
                                    </div>
                                    <div class="author_icon">
                                        <span><img src="img/icon_album.jpg" alt="" width="20" height="19" /></span>
                                        <div class="btn_done"><a href="#">Done</a></div>
                                    </div>
                                </div>
                            </div><!--//end .comment_first_content-->
                        </div><!--//end .comment_box-->
                        
                        <div class="comment_box bg_differ"><!--start comment_box-->
                            <div class="comment_scnd_content"><!--start comment_scnd_content-->
                                <div class="pic_author">
                                    <img src="img/pic_author2.png" alt="" width="72" height="72" />
                                </div>
                                <div class="author_total_rgt">
                                    <div class="author_speech">
                                        <h3>Pierce Tetro Cooper (New York)</h3>
                                        <div class="edit_tools">
                                        	<label  class="text_label">Am I actually goin to see you there or are you too big<br />time to mingle wit us little people?</label>
                                            <div style="display: block;" class="edit"></div>
                                            <input type="text" />
                                         </div>
                                        <span>Feb.18, 2012  at 1:43pm</span>
                                    </div>
                                </div>
                            </div><!--//end .comment_scnd_content-->
                        </div><!--//end .comment_box-->
                        
                        <div class="comment_box"><!--start comment_box-->
                            <div class="comment_scnd_content"><!--start comment_scnd_content-->
                                <div class="pic_author">
                                    <img src="img/pic_author3.png" alt="" width="72" height="72" />
                                </div>
                                <div class="author_total_rgt">
                                    <div class="author_speech">
                                        <h3>Pierce Tetro Cooper (New York)</h3>
                                        <div class="edit_tools">
                                        	<label  class="text_label">Am I actually goin to see you there or are you too big<br />time to mingle wit us little people?</label>
                                            <div style="display: block;" class="edit"></div>
                                            <input type="text" />
                                         </div>
                                        <span>Feb.18, 2012  at 1:43pm</span>
                                    </div>
                                </div>
                            </div><!--//end .comment_scnd_content-->
                        </div><!--//end .comment_box-->
                        
                        <div class="comment_box bg_differ"><!--start comment_box-->
                            <div class="comment_scnd_content"><!--start comment_scnd_content-->
                                <div class="pic_author">
                                    <img src="img/pic_author4.png" alt="" width="72" height="72" />
                                </div>
                                <div class="author_total_rgt">
                                    <div class="author_speech">
                                        <h3>Pierce Tetro Cooper (New York)</h3>
                                        <div class="edit_tools">
                                        	<label  class="text_label">Am I actually goin to see you there or are you too big<br />time to mingle wit us little people?</label>
                                            <div style="display: block;" class="edit"></div>
                                            <input type="text" />
                                         </div>
                                        <span class="color_differ">Feb.18, 2012  at 1:43pm</span>
                                    </div>
                                </div>
                            </div><!--//end .comment_scnd_content-->
                        </div><!--//end .comment_box-->
                        
                        <div class="comment_box"><!--start comment_box-->
                            <div class="comment_scnd_content"><!--start comment_scnd_content-->
                                <div class="pic_author">
                                    <img src="img/pic_author3.png" alt="" width="72" height="72" />
                                </div>
                                <div class="author_total_rgt">
                                    <div class="author_speech">
                                        <h3>Pierce Tetro Cooper (New York)</h3>
                                        <div class="edit_tools">
                                        	<label  class="text_label">Am I actually goin to see you there or are you too big<br />time to mingle wit us little people?</label>
                                            <div style="display: block;" class="edit"></div>
                                            <input type="text" />
                                         </div>
                                        <span>Feb.18, 2012  at 1:43pm</span>
                                    </div>
                                </div>
                            </div><!--//end .comment_scnd_content-->
                        </div><!--//end .comment_box-->
                        
                    </div><!--//end #comment_box_brief-->
                    <div id="comment_pagination">
                        <a href="#" class="prev"></a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#" class="next"></a>
                    </div>
                </div><!--//end #review_lftcol-->
                <div class="clear"></div>
            </div><!--//end #common_maincontent-->
            <div id="footer"><p> &copy;2012 goTribus |<span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
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
    <script src="js/easy-editable-text.js" type="text/javascript"></script>
    <script src="js/latest.js" type="text/javascript"></script>
    <script src="js/box.slider.js" type="text/javascript"></script>
    <script src="js/jquery.raty.js" type="text/javascript"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
		$('#slider1').bxSlider();
	  });
	</script>
    <script type="text/javascript" src="js/jquery.lightbox.js"></script>
	<script type="text/javascript">
        $(document).ready(function() {
				$('.map a').lightBox();
        	});
		
    </script>
    <script type="text/javascript">
		$(function() {
			$('#score').raty({
				  starOn  : 'blue_star1.jpg',
				  starOff : 'blue_star2.jpg'	,							  
				score: function() {
					return $(this).attr('data-rating');
				}
			});
					   
			$(".selectOne").click(function() {
				$(".selectOne").addClass("click_done");
				$(".selectTwo").removeClass("click_done");
			});
			$(".selectTwo").click(function() {
				$(".selectTwo").addClass("click_done");
				$(".selectOne").removeClass("click_done");
			});   
        });
    </script>
	<script type="text/javascript" src="js/code.js"></script>
 </body>
</html>                                                                                                   