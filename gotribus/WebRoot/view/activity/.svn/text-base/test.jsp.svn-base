

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Home</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
		<link rel="stylesheet" type="text/css" media="screen,projection"
			href="http://localhost:8080/tribus/view/activity/font/font.css" />
		<link rel="stylesheet" type="text/css" media="screen,projection"
			href="http://localhost:8080/tribus/view/activity/css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="http://localhost:8080/tribus/view/activity/css/slider.css" />
    
    
    <script type="text/javascript">
 
  var event2=null;
function WishList(url,id){
 event2=id;
      http_request = false;
    if (window.XMLHttpRequest) {    								// 非IE浏览器
        http_request = new XMLHttpRequest();							//创建XMLHttpRequest对象
    } else if (window.ActiveXObject) {     							// IE浏览器
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");		//创建XMLHttpRequest对象
        } catch (e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");	//创建XMLHttpRequest对象
           } catch (e) {}
        }
    }
    if (!http_request) {
        alert("不能创建XMLHttpRequest对象实例！");
        return false;
    }
    http_request.onreadystatechange = getResultWishList;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);	
    }
    
  function   getResultWishList(){
        if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById(event2+"").innerHTML=http_request.responseText;;	//设置提示内容
 
        } else {     													// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
    }
function search(){
var a =document.getElementById("txt1");
window.location.href="http://localhost:8080/tribus/activity/search.action?searchCondition="+a.value;
}

function setAtt(id){
  document.getElementById("hiddenField").value=id;
  
  }
 function submit(){
  resourceId=document.getElementById("hiddenField").value;
  typeId=document.getElementById("tribusClassify").value;
   document.form10.action="http://localhost:8080/tribus//user/addTribusList/city/"+typeId+"/"+rescourceId;
 document.form10.submit();
  closePop();
  }
</script>
<style type="text/css">
.STYLE1 {color: #FF0000}
</style>
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="http://localhost:8080/tribus/activity/index.action"><img src="http://localhost:8080/tribus/view/activity/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    <li class="current_page_item">
										<a href="http://localhost:8080/tribus/activity/index.action">CITY</a>
									</li>
									<li>
										<a href="http://localhost:8080/tribus/movie/movieHomePage.action" title="MOVIE">MOVIE</a>
									</li>
									<li>
										<a href="http://localhost:8080/tribus/book/bookHomePage.action" title="BOOK">BOOK</a>
									</li>
									<li>
										<a href="http://localhost:8080/tribus/music/musicHomePage.action" title="MUSIC">MUSIC</a>
									</li>
									<li>
										<a href="http://localhost:8080/tribus/user/my.action" title="MY TRIBUS">MY
											TRIBUS</a>
									</li>
                    </ul>
                    <div class="header_search">
                    	<form action="http://localhost:8080/tribus/user/searchAll.action">
                        	<p class="txt_header"><input id="search" name="search" type="text" /></p>
                            <p class="submit_header"><input type="submit" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="http://localhost:8080/tribus/view/activity/img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="http://localhost:8080/tribus/user/editForm.action"><img src="http://localhost:8080/tribus/view/activity/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg"><!--start search_bg-->
                	<form action="http://localhost:8080/tribus/activity/search.action">
                    	<p class="search_text"><input id="txt1" name="searchCondition" type="text" value="Seach activity, activity time, activity location" onclick="if(this.value=='Seach activity, activity time, activity location')(this.value='')"  onblur="if(this.value=='')(this.value='Seach activity, activity time, activity location')" /></p>
                        <p class="search_submit"><input type="submit" value=" " /></p>
                    </form>
                </div><!--//end #search_bg-->
                <div id="social_media"><!--start social_media-->
                	<div id="social_lftcol">
                    	
                    </div>
                    <div id="social_box"><!--start social_box-->
                    	<div id="message">
                        
								<a href="http://localhost:8080/tribus/userMail/box/0.action"><img src="http://localhost:8080/tribus/view/activity/img/icon_message1.jpg" alt="" width="22" height="22" /></a>
                            <a href="http://localhost:8080/tribus/user/about.action"><img src="http://localhost:8080/tribus/view/activity/img/icon_message2.jpg" alt="" width="22" height="22" /></a>
                            <a href="http://localhost:8080/tribus/user/police.action"><img src="http://localhost:8080/tribus/view/activity/img/icon_message3.jpg" alt="" width="22" height="22" /></a>
                            <a href="http://localhost:8080/tribus/user/logout.action"><img src="http://localhost:8080/tribus/view/activity/img/icon_message4.jpg" alt="" width="22" height="22" /></a>
                        </div>
                        <div class="address">
                        	<h3>
									<a href="http://localhost:8080/tribus/user/loginForm.action">login</a>
									 
								</h3>
								<span></span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="main_content"><!--start main_content-->
            	<div id="content"><!--start content-->
            		
                	<div id="banner">
                        <div class="slider">
                            <div class="sliderContent">
                                <div class="item">
                                    <a
								href="http://localhost:8080/tribus/activity/info.action?activityId=1"><img
									src="http://www.gotribus.com/view/pic/2012/5/21/1340257235596.jpg"
									width="729" height="479" /> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="banner_title">
                    	 <h2>isfiejknv</h2>
                         <h2>chicago,null</h2>
                    </div>
                    
                    <div class="event_box"><!--start event_box-->
                    	<div class="event_bg"><div class="event_top"><div class="event_btm">
                        	<div class="event_lftcol"><img src="http://localhost:8080/tribus/view/activity/img/icon_star.jpg" alt="" width="38" height="37" /></div>
                            <div class="event_rgtcol">
                            	<h3>Your Next City Events</h3>
                                <p>No to-do events among this month </a></p>
                            </div>
                        </div></div></div>
                    </div><!--//end .event_box-->
                    <div class="calender"><!--start calender-->
                    	
                    	<div class="prev_home"><a href="#"></a></div>
                        <ul>
                        	
								
								<li><a href="javascript:void(0);">01</a></li>
								
								
								
								<li><a href="javascript:void(0);">02</a></li>
								
								
								
								<li><a href="javascript:void(0);">03</a></li>
								
								
								
								<li><a href="javascript:void(0);">04</a></li>
								
								
								
								<li><a href="javascript:void(0);">05</a></li>
								
								
								
								<li><a href="javascript:void(0);">06</a></li>
								
								
								
								<li><a href="javascript:void(0);">07</a></li>
								
								
								
								<li><a href="javascript:void(0);">08</a></li>
								
								
								
								<li><a href="javascript:void(0);">09</a></li>
								
								
								
								<li><a href="javascript:void(0);">10</a></li>
								
								
								
								<li><a href="javascript:void(0);">11</a></li>
								
								
								
								<li><a href="javascript:void(0);">12</a></li>
								
								
								
								<li><a href="javascript:void(0);">13</a></li>
								
								
								
								<li><a href="javascript:void(0);">14</a></li>
								
								
								
								<li><a href="javascript:void(0);">15</a></li>
								
								
								
								<li><a href="javascript:void(0);">16</a></li>
								
								
								
								<li><a href="javascript:void(0);">17</a></li>
								
								
								
								<li><a href="javascript:void(0);">18</a></li>
								
								
								
								<li><a href="javascript:void(0);">19</a></li>
								
								
								
								<li><a href="javascript:void(0);">20</a></li>
								
								
								
								<li><a href="javascript:void(0);">21</a></li>
								
								
								
								<li><a href="javascript:void(0);">22</a></li>
								
								
								
								<li><a href="javascript:void(0);">23</a></li>
								
								
								
								<li><a href="javascript:void(0);">24</a></li>
								
								
								
								<li> <u><a href="javascript:void(0);">25</a> </u></li>
								
								
								
								<li><a href="javascript:void(0);">26</a></li>
								
								
								
								<li><a href="javascript:void(0);">27</a></li>
								
								
								
								<li><a href="javascript:void(0);">28</a></li>
								
								
								
								
								
								<li><a href="javascript:void(0);">29</a></li>
								
								<li><a href="javascript:void(0);">30</a></li>
								

								
								
								<li><a href="javascript:void(0);">31</a></li>
								
                        </ul>
                        <div class="month"><span>Jul</span></div>
                        <div class="next_home"><a href="#"></a></div>
                    </div><!--//end .calender-->
                    <div class="ranger"><img src="http://localhost:8080/tribus/view/activity/img/bgr_ranger.png" alt="" width="615" height="16" /></div>

							
						
                    <div id="common_content_area"><!--start common_content_area-->
                    
                    	

							
                      
                        <div class="common_box"><!--start common_box-->
                        	<div class="common_box_bg"><div class="common_box_top"><div class="common_box_btm">
                            	<div class="scnd_feature"><!--start scnd_feature-->
                                	<div class="red_arrow_home"></div>
                                	<div class="scnd_feature_lft"><!--start scnd_feature_lft-->
                                    	<a href="http://localhost:8080/tribus/activity/info.action?activityId=30"><img
																src="http://www.gotribus.com/view/pic/2012/6/1/1341184576448.jpg" alt="" width=137
																height=187 /> </a>
                                        <div class="feature_info">
                                        	<div class="feature_txt">
                                            	<p>
                                            	<a	href="http://localhost:8080/tribus/activity/info.action?activityId=30">213</a>
																	<br />
																	chicago&nbsp
																	100 s michigan ave
																	<br />
																	&nbsp
																	<br />
																	Fee: $ 2.0 each
                                            	
                                            	</p>
                                            </div>
                                            <div class="feature_social">
                                                <div class="feature_icon">
                                                     <div id='fb-root'></div>
    <script src='http://connect.facebook.net/en_US/all.js'></script>
                                	<a ><img src="http://localhost:8080/tribus/view/activity/img/icon_feature1.png" alt="" width="29" height="25"  /></a>
                                                    <a onclick='postToFeed(); return false;'><img src="http://localhost:8080/tribus/view/activity/img/icon_feature2.png" alt="" width="27" height="25" /></a>
                                                <p id='msg'></p>
                                                 <script> 
      FB.init({appId: "167819743335514", status: true, cookie: true});

      function postToFeed() {

        // calling the API ...
        var obj = {
          method: 'feed',
          link: 'https://developers.facebook.com/docs/reference/dialogs/',
          picture: 'http://fbrell.com/f8.jpg',
          name: 'Facebook Dialogs',
          caption: 'Reference Documentation',
          description: 'Using Dialogs to interact with users.'
        };

        function callback(response) {
          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }

        FB.ui(obj, callback);
      }
    
    </script> 
                                                </div>
                                                <div class="feature_list">
                                                    <ul>
                                                        <li><a id="wishList0"   href="javascript:WishList('http://localhost:8080/tribus/user/addWishList/city/30.action','wishList0')">+ Wish List</a></li>
                                                        <li><a href="javascript:void(0)" onClick="setAtt(30),showPop()">+ Tribus List</a></li>
                                                    
                                                    </ul>
                                                  <input type="hidden" id="hiddenField"  name="hiddenField" />
                                                </div>
                                        	</div>
                                        </div>
                                    </div><!--//end .scnd_feature_lft-->
                                    <div class="scnd_feature_rgt">
                                    	<ul>
                                        	
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/13.action"><img
																				src="http://www.gotribus.com/view/pic/2012/6/4/1341439990242.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: how is the activity
</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/13.action"><img
																				src="http://www.gotribus.com/view/pic/2012/6/4/1341439990242.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: btw, who gonna go there?</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/13.action"><img
																				src="http://www.gotribus.com/view/pic/2012/6/4/1341439990242.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: good</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/13.action"><img
																				src="http://www.gotribus.com/view/pic/2012/6/4/1341439990242.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: nice activity</small>
																</li>
															
                                        </ul>
                                    </div>
                                </div><!--//end .scnd_feature-->
                            </div></div></div>
                        </div><!--//end .common_box-->
                        
                        	
                      
                        <div class="common_box"><!--start common_box-->
                        	<div class="common_box_bg"><div class="common_box_top"><div class="common_box_btm">
                            	<div class="scnd_feature"><!--start scnd_feature-->
                                	<div class="red_arrow_home"></div>
                                	<div class="scnd_feature_lft"><!--start scnd_feature_lft-->
                                    	<a href="http://localhost:8080/tribus/activity/info.action?activityId=33"><img
																src="http://www.gotribus.com/view/pic/2012/6/2/1341271162780.jpeg" alt="" width=137
																height=187 /> </a>
                                        <div class="feature_info">
                                        	<div class="feature_txt">
                                            	<p>
                                            	<a	href="http://localhost:8080/tribus/activity/info.action?activityId=33">Roy Lichtenstein Exhibition </a>
																	<br />
																	Chicago&nbsp
																	111 S. Michigan Ave.
																	<br />
																	&nbsp
																	<br />
																	Fee: $ 18.0 each
                                            	
                                            	</p>
                                            </div>
                                            <div class="feature_social">
                                                <div class="feature_icon">
                                                     <div id='fb-root'></div>
    <script src='http://connect.facebook.net/en_US/all.js'></script>
                                	<a ><img src="http://localhost:8080/tribus/view/activity/img/icon_feature1.png" alt="" width="29" height="25"  /></a>
                                                    <a onclick='postToFeed(); return false;'><img src="http://localhost:8080/tribus/view/activity/img/icon_feature2.png" alt="" width="27" height="25" /></a>
                                                <p id='msg'></p>
                                                 <script> 
      FB.init({appId: "167819743335514", status: true, cookie: true});

      function postToFeed() {

        // calling the API ...
        var obj = {
          method: 'feed',
          link: 'https://developers.facebook.com/docs/reference/dialogs/',
          picture: 'http://fbrell.com/f8.jpg',
          name: 'Facebook Dialogs',
          caption: 'Reference Documentation',
          description: 'Using Dialogs to interact with users.'
        };

        function callback(response) {
          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }

        FB.ui(obj, callback);
      }
    
    </script> 
                                                </div>
                                                <div class="feature_list">
                                                    <ul>
                                                        <li><a id="wishList1"   href="javascript:WishList('http://localhost:8080/tribus/user/addWishList/city/33.action','wishList1')">+ Wish List</a></li>
                                                        <li><a href="javascript:void(0)" onClick="setAtt(33),showPop()">+ Tribus List</a></li>
                                                    
                                                    </ul>
                                                  <input type="hidden" id="hiddenField"  name="hiddenField" />
                                                </div>
                                        	</div>
                                        </div>
                                    </div><!--//end .scnd_feature_lft-->
                                    <div class="scnd_feature_rgt">
                                    	<ul>
                                        	
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/14.action"><img
																				src="http://www.gotribus.com/view/pic/2012/5/28/1340939168955.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: 212121212</small>
																</li>
															
                                        </ul>
                                    </div>
                                </div><!--//end .scnd_feature-->
                            </div></div></div>
                        </div><!--//end .common_box-->
                        
                        	
                      
                        <div class="common_box"><!--start common_box-->
                        	<div class="common_box_bg"><div class="common_box_top"><div class="common_box_btm">
                            	<div class="scnd_feature"><!--start scnd_feature-->
                                	<div class="red_arrow_home"></div>
                                	<div class="scnd_feature_lft"><!--start scnd_feature_lft-->
                                    	<a href="http://localhost:8080/tribus/activity/info.action?activityId="><img
																src="" alt="" width=137
																height=187 /> </a>
                                        <div class="feature_info">
                                        	<div class="feature_txt">
                                            	<p>
                                            	<a	href="http://localhost:8080/tribus/activity/info.action?activityId="></a>
																	<br />
																	&nbsp
																	
																	<br />
																	&nbsp
																	<br />
																	Fee: $  each
                                            	
                                            	</p>
                                            </div>
                                            <div class="feature_social">
                                                <div class="feature_icon">
                                                     <div id='fb-root'></div>
    <script src='http://connect.facebook.net/en_US/all.js'></script>
                                	<a ><img src="http://localhost:8080/tribus/view/activity/img/icon_feature1.png" alt="" width="29" height="25"  /></a>
                                                    <a onclick='postToFeed(); return false;'><img src="http://localhost:8080/tribus/view/activity/img/icon_feature2.png" alt="" width="27" height="25" /></a>
                                                <p id='msg'></p>
                                                 <script> 
      FB.init({appId: "167819743335514", status: true, cookie: true});

      function postToFeed() {

        // calling the API ...
        var obj = {
          method: 'feed',
          link: 'https://developers.facebook.com/docs/reference/dialogs/',
          picture: 'http://fbrell.com/f8.jpg',
          name: 'Facebook Dialogs',
          caption: 'Reference Documentation',
          description: 'Using Dialogs to interact with users.'
        };

        function callback(response) {
          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }

        FB.ui(obj, callback);
      }
    
    </script> 
                                                </div>
                                                <div class="feature_list">
                                                    <ul>
                                                        <li><a id="wishList2"   href="javascript:WishList('http://localhost:8080/tribus/user/addWishList/city/.action','wishList2')">+ Wish List</a></li>
                                                        <li><a href="javascript:void(0)" onClick="setAtt(),showPop()">+ Tribus List</a></li>
                                                    
                                                    </ul>
                                                  <input type="hidden" id="hiddenField"  name="hiddenField" />
                                                </div>
                                        	</div>
                                        </div>
                                    </div><!--//end .scnd_feature_lft-->
                                    <div class="scnd_feature_rgt">
                                    	<ul>
                                        	
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/13.action"><img
																				src="http://www.gotribus.com/view/pic/2012/6/4/1341439990242.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: sdfdsfsdfsdfsdfsdfsdf</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/13.action"><img
																				src="http://www.gotribus.com/view/pic/2012/6/4/1341439990242.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: vdfbfgbfgfghgf</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/13.action"><img
																				src="http://www.gotribus.com/view/pic/2012/6/4/1341439990242.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: fdfghfghfg</small>
																</li>
															
                                        </ul>
                                    </div>
                                </div><!--//end .scnd_feature-->
                            </div></div></div>
                        </div><!--//end .common_box-->
                        
                        	
                      
                        <div class="common_box"><!--start common_box-->
                        	<div class="common_box_bg"><div class="common_box_top"><div class="common_box_btm">
                            	<div class="scnd_feature"><!--start scnd_feature-->
                                	<div class="red_arrow_home"></div>
                                	<div class="scnd_feature_lft"><!--start scnd_feature_lft-->
                                    	<a href="http://localhost:8080/tribus/activity/info.action?activityId=40"><img
																src="http://www.gotribus.com/view/pic/2012/6/13/1342157759139.jpg" alt="" width=137
																height=187 /> </a>
                                        <div class="feature_info">
                                        	<div class="feature_txt">
                                            	<p>
                                            	<a	href="http://localhost:8080/tribus/activity/info.action?activityId=40">bibber?</a>
																	<br />
																	chicago&nbsp
																	200 n michigan ave
																	<br />
																	&nbsp
																	<br />
																	Fee: $ 1.0 each
                                            	
                                            	</p>
                                            </div>
                                            <div class="feature_social">
                                                <div class="feature_icon">
                                                     <div id='fb-root'></div>
    <script src='http://connect.facebook.net/en_US/all.js'></script>
                                	<a ><img src="http://localhost:8080/tribus/view/activity/img/icon_feature1.png" alt="" width="29" height="25"  /></a>
                                                    <a onclick='postToFeed(); return false;'><img src="http://localhost:8080/tribus/view/activity/img/icon_feature2.png" alt="" width="27" height="25" /></a>
                                                <p id='msg'></p>
                                                 <script> 
      FB.init({appId: "167819743335514", status: true, cookie: true});

      function postToFeed() {

        // calling the API ...
        var obj = {
          method: 'feed',
          link: 'https://developers.facebook.com/docs/reference/dialogs/',
          picture: 'http://fbrell.com/f8.jpg',
          name: 'Facebook Dialogs',
          caption: 'Reference Documentation',
          description: 'Using Dialogs to interact with users.'
        };

        function callback(response) {
          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }

        FB.ui(obj, callback);
      }
    
    </script> 
                                                </div>
                                                <div class="feature_list">
                                                    <ul>
                                                        <li><a id="wishList3"   href="javascript:WishList('http://localhost:8080/tribus/user/addWishList/city/40.action','wishList3')">+ Wish List</a></li>
                                                        <li><a href="javascript:void(0)" onClick="setAtt(40),showPop()">+ Tribus List</a></li>
                                                    
                                                    </ul>
                                                  <input type="hidden" id="hiddenField"  name="hiddenField" />
                                                </div>
                                        	</div>
                                        </div>
                                    </div><!--//end .scnd_feature_lft-->
                                    <div class="scnd_feature_rgt">
                                    	<ul>
                                        	
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/14.action"><img
																				src="http://www.gotribus.com/view/pic/2012/5/28/1340939168955.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: 23e23r2r</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/14.action"><img
																				src="http://www.gotribus.com/view/pic/2012/5/28/1340939168955.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: r3fwe43rf23rf</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/14.action"><img
																				src="http://www.gotribus.com/view/pic/2012/5/28/1340939168955.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: sdfsdffefefe</small>
																</li>
															
																<li>
																	<span><a href="http://localhost:8080/tribus/user/friendHome/14.action"><img
																				src="http://www.gotribus.com/view/pic/2012/5/28/1340939168955.jpg" alt="" width=41 height=39 />
																	</a> </span><small>: he heh hehg eheh eh e</small>
																</li>
															
                                        </ul>
                                    </div>
                                </div><!--//end .scnd_feature-->
                            </div></div></div>
                        </div><!--//end .common_box-->
                        
                        	
							
                    </div><!--//end #common_content_area-->
                </div><!--//end #content-->
                <div id="side_bar"><!--start side_bar-->
                	<!--//end .blue_widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Top News</h2>
                    	
                        <div class="bar_widget">
                        	<a href="http://localhost:8080/tribus/activity/info.action?activityId=3"><img
											src="http://www.gotribus.com/view/pic/2012/5/21/1340257235596.jpg" width="65" height="96" /> </a>
                            <div class="bar_info">
                            	<h3><a href="http://localhost:8080/tribus/activity/info.action?activityId=3">go </h3>
                                <span>Starter: rty</span>
                                <p>Open:2012-06-11 00:00:00.0
											<br /></p>
                                <div class="join"><small>2 (people)</small>      <a>Join in</a></div>
                            </div>
                            
                        </div>
                         
                        <div class="bar_widget">
                        	<a href="http://localhost:8080/tribus/activity/info.action?activityId=30"><img
											src="http://www.gotribus.com/view/pic/2012/6/1/1341184576448.jpg" width="65" height="96" /> </a>
                            <div class="bar_info">
                            	<h3><a href="http://localhost:8080/tribus/activity/info.action?activityId=30">213 </h3>
                                <span>Starter: jeremy</span>
                                <p>Open:2012-07-09 00:00:00.0
											<br /></p>
                                <div class="join"><small>2 (people)</small>      <a>Join in</a></div>
                            </div>
                            
                        </div>
                         
                        <div class="bar_widget">
                        	<a href="http://localhost:8080/tribus/activity/info.action?activityId=35"><img
											src="http://www.gotribus.com/view/pic/2012/6/4/1341354052494.JPG" width="65" height="96" /> </a>
                            <div class="bar_info">
                            	<h3><a href="http://localhost:8080/tribus/activity/info.action?activityId=35">hrllo </h3>
                                <span>Starter: rty</span>
                                <p>Open:2012-07-17 00:00:00.0
											<br /></p>
                                <div class="join"><small>1 (people)</small>      <a>Join in</a></div>
                            </div>
                            
                        </div>
                         
                    </div><!--//end .widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Tag</h2>
                        <div class="widget_info">
                        	<p>
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Book">
                        		Book
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=College">
                        		College
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Exchange Market">
                        		Exchange Market
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Game">
                        		Game
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Lifestyle">
                        		Lifestyle
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Movie">
                        		Movie
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Music">
                        		Music
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Show">
                        		Show
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Sports">
                        		Sports
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Travel">
                        		Travel
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Workshop">
                        		Workshop
                        	</a>/
                        	
                        	
                        	
                        	<a href="http://localhost:8080/tribus/activity/searchByTag.action?tagName=Others ">
                        		Others 
                        	</a>/
                        	
                        	</p>
                        </div>
                    </div><!--//end .widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Top City</h2>
                        <div class="widget_info">
                        	<ul>
                            	
										<li>
											<a href="http://localhost:8080/tribus/activity/byCityTag.action?city=chicago">chicago</a>
										</li>
									
										<li>
											<a href="http://localhost:8080/tribus/activity/byCityTag.action?city="></a>
										</li>
									
                            </ul>
                            
                        </div>
                    </div><!--//end .widget-->
                </div><!--//end #side_bar-->
            </div><!--//end #main_content-->
            <div id="footer"><p>Copyright @ Tribus.us 2012.      <span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
    
    <div id="popup_layer" onClick="closePop()"></div>   
    <div id="light_box_wrapper"><!--start light_box_wrapper-->
        <div id="light_box_bg"><!--start light_box_bg-->
            <div class="pop_up_cross"> <a href="javascript:void(0)" onClick="closePop()"></a></div>
            <h2>Add to list</h2>
            <form name="form10" id="form10" action="" method="post">
                <p>
                   <select id="tribusClassify" name="tribusClassify" >	
                    
                    </select>
                </p>
                <p><textarea rows="10" cols="10" onclick="if(this.value=='Description...')(this.value='')" onblur="if(this.value=='')(this.value='Description...')" >Description...</textarea></p>
                <div class="pop_btn"><a href="javascript:void(0)" onClick="submit()">Add</a></div>
            </form>
        </div><!--//end #light_box_bg-->
    </div><!--//end #light_box_wrapper-->
  <script src="http://localhost:8080/tribus/view/activity/css/js/jquery.min.js" type="text/javascript"></script>
	<script src="http://localhost:8080/tribus/view/activity/css/js/mobilyslider.js" type="text/javascript"></script>
    <script src="http://localhost:8080/tribus/view/activity/css/js/fade.js" type="text/javascript"></script>
    <script src="http://localhost:8080/tribus/view/activity/css/js/smoothscroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://localhost:8080/tribus/view/activity/css/js/code.js"></script>

</body>
</html>                                                                                                   