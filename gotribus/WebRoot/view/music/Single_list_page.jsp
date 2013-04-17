<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" import="config.*"%>
<%
	request.setAttribute("domain",GlobleConfig.localhost);
	//request.setAttribute("my_local",GlobleConfig.show_local);
	request.setAttribute("my_local",GlobleConfig.my_local);
	request.setAttribute("my_domain",GlobleConfig.my_domain);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Single list page</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${my_local }/movie/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="style.css" />
    <link rel="shortcut icon" href="http://www.gotribus.com/view/images/LOGO_32.png"/>

	<script src="${my_local }/movie/js/jquery-1.8.0.min.js" type="text/javascript"></script>
	<script src="${my_local }/movie/js/jquery.pager.js" type="text/javascript"></script>
	
</head>

<body style="margin:0 0 0 -16px;">
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html"><img src="${my_local }/movie/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="${my_domain}/activity/index.action">EVENT</a></li>
                    	<li class="current_page_item"><a href="${my_domain }/movie/movieHomePage.action" title="MOVIE">MOVIE</a></li>
                        <li><a href="${my_domain }/book/bookHomePage.action" title="BOOK">BOOK</a></li>
                        <li><a href="${my_domain }/music/musicHomePage.action" title="MUSIC">MUSIC</a></li>
						<li><a id="bb" onMouseOver="get()" style="display:block" href="${my_domain}/user/my.action" title="MY TRIBUS">MY TRIBUS</a>
						<a id="aa" onMouseOut="bu()" style="font-size:24px; display:none"  href="${my_domain}/user/my.action" title="MY TRIBUS">MyTRIBUS</a></li>
                    </ul>
                    <div class="header_search">
						<form action="${my_domain}/user/ searchAll.action">
                         	<p class="txt_header"><input type="text" name="search" value="" /></p>
                            <p class="submit_header"><input type="submit"  value="" /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="${my_local }/movie/img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="${my_domain }/user/editForm.action"><img src="${my_local }/movie/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg"><!--start search_bg-->
                	<form action="${my_domain }/movie/search/1.action" id="single_search_bar" name="single_search_bar">
                    	<p class="search_text"><input name="single_search_name" type="text" value="${searchName}" onclick="(this.value='')"  onblur="if(this.value=='')(this.value='${searchName}')" /></p>
                        <p class="search_submit"><input type="submit" value=" " /></p>
                    </form>
                </div><!--//end #search_bg-->
                <div id="social_media"><!--start social_media-->
                	<div id="social_lftcol">
                    	<a href="https://www.facebook.com/TheTribus"><img src="${my_local }/movie/img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                        <a href="#"><img src="${my_local }/movie/img/icon_tweet.jpg" alt="" width="24" height="24" /></a>
                    </div>
                    <div id="social_box"><!--start social_box-->
                    	<div id="message">
                        	<a href="${my_domain }/userMail/box/0.action"><img src="${my_local }/movie/img/icon_message1.jpg" alt="" width="22" height="22" /><c:if test="${unreadMail > 0}"><span><c:out value="${unreadMail}"/></span></c:if></a>
                        
                            <a href="${my_domain }/user/logout.action"><img src="${my_local }/movie/img/icon_message4.jpg" alt="" width="22" height="22" /></a>
                        </div>
                        <div class="address">
                        	<h3><a href="${my_domain }/user/my.action"><c:out value="${userName}" /></a></h3>
                            <span><c:out value="${userCity }" /></span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="common_maincontent"><!--start common_maincontent-->
            	<div id="main_search_content"><!--start main_search_content-->
                	<div id="search_lftcol"><!--start search_lftcol-->
                    	<div class="search_title list_title"><!--start search_title-->
                        	<h2>List Name</h2>
                        </div><!--//end .search_title-->
                        <div class="list"><!--start gallery_book-->                          
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
                    		<dl>
                    			<dt><img src="img/list_pic1.png" alt="list_pic1" /></dt>
                    			<dd class="item_title">The Black Keys 2011 - 2012 Tour Chicago</dd>
                    			<dd class="item_intro">The Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour ChicagoThe Black Keys 2011 - 2012 Tour Chicago</dd>
								<dd class="king_wish">
                                	<a href="#" class="trackList">+ Track List</a>
                                	<a href="javascript:void(0)" onClick="showPop()">+ Tribus List</a>                               	
                                </dd>         
                                <dd class="king_done">
                                	<a href="javascript:void(0)" class="selectOne">Wanted</a>
                                    <a href="javascript:void(0)" class="selectTwo">Done</a>                                  
                                </dd>           		
                    		</dl>
						<div class="clear"></div>
                        </div><!--//end #gallery_book-->                      
                        <div id="follower_apgi" class="space_pagi">
							${pageStr}
                        </div>
                    </div><!--//end #search_lftcol-->
	                <div id="side_bar"><!--start review_side_bar-->
	                	
	                </div><!--//end review_side_bar-->
	                <div class="clear"></div>
                </div><!--//end #main_search_content-->
            </div><!--//end #common_maincontent-->
            <div id="footer">
            	<p> &copy;2012 goTribus |<span>All rights reserved</span> </p>
            </div>
            <div id="back_to_top"><a href="#top"></a></div>           
            <script src="${my_local }/movie/js/back_to_top.js" type="text/javascript"></script>
            <script src="${my_local }/movie/js/smoothscroll.js" type="text/javascript"></script>         
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->   
    <div id="light_box_wrapper"><!--start light_box_wrapper-->
            <div class="pop_up_cross"> <a href="javascript:void(0)" onClick="closePop()"></a></div>
            <h2>Add to list</h2>
            <form action="#">               
                <p><textarea onclick="if(this.value=='Brief Introduction')(this.value='')" onblur="if(this.value=='')(this.value='Brief Introduction')" >Brief Introduction</textarea></p>
                <div class="persoanal_inp_field mmb">
                	<p><span class="arrow"></span><input type="text" id="category" value="My Lists" name="category" class="text act" onfocus(this.value='') onblur(this.value='movie name') /></p>                             
                	<div class="bookTag">
               			 <span class="tag_arrow"></span>
						<ul>
						<forEach items="${list}" var="l">
							<li><a href="javascript:;" title="${l.id}">${l.name}</a></li>
						</forEach>
						</ul>
					</div>                                 
				</div>
                <div class="pop_btn">
                	<a class="add" href="gotribus.com/tribuslist/add.action">Add</a>
                	<a class="create" href="gotribus.com/user/addTribusList/movie/{tribusListId}/${singlePageMain.itemId}">Create</a>
                </div>
            </form>
    </div><!--//end #light_box_wrapper-->
    <script type="text/javascript">  		
        	$(".trackList").click(function() {
			$.ajax({  
				type: "POST",  
				url: "${my_domain }/user/addWishList/movie/${singlePageMain.itemId }.action",  
				success: function(data, textStatus, jqXHR) {  
					if(data == "ok!"){
						$(".trackList").html("Already added");
					}else {
						$(".trackList").html("+Track List");
					}
				}  
			});   		
    		});
    		
    		$(".tribusList").click(function() {
     		var dataString;
			$.ajax({  
				type: "POST",  
				url: "${my_domain }/user/addTribusList/movie/${singlePageMain.itemId }.action",  
				data: dataString,  
				success: function(data, textStatus, jqXHR) {  
					if(data == "ok!"){
						$(".tribusList").html("Already added");
					}else {
						$(".tribusList").html("+Tribus List");
					}
				}  
			});   		
    		});
    	});
    </script>
	<script type="text/javascript">		
	var markWatch = "${markWatch}";
	if(markWatch == 1){
		$(".selectOne").addClass("click_done");
	}
	if(markWatch == 2){
		$(".selectTwo").addClass("click_done");
	}			   

    $(".selectOne").click(function() {
     $(".selectOne").addClass("click_done");
     $(".selectTwo").removeClass("click_done");
     var dataString = "mark=wanted";
				$.ajax({  
				  type: "POST",  
				  url: "${my_domain}/movie/markMovie/${singlePageMain.itemId}.action",  
				  data: dataString,  
				  success: function() {  
				  }
				});
    });
    $(".selectTwo").click(function() {
     $(".selectTwo").addClass("click_done");
     $(".selectOne").removeClass("click_done");
          var dataString = "mark=done";
				$.ajax({  
				  type: "POST",  
				  url: "${my_domain}/movie/markMovie/${singlePageMain.itemId}.action",  
				  data: dataString,  
				  success: function(data) {
				  }  
				});
    });   
            });
        </script>
        
    <script><!-- 
      FB.init({appId: "167819743335514", status: true, cookie: true});

      function postToFeed() {

        // calling the API ...
        var obj = {
          method: 'feed',
          link: '${my_domain}/movie/${singlePageMain.itemId}.action',
          picture: '${singlePageMain.itemPic}',
          name: 'About this movie',
          caption: '${singlePageMain.itemName}',
          description: '${singlePageMain.itemBrief_short}'
        };
		if(${markWatch}==1){
			obj.name = 'I want to watch this movie';
		}
		if(${markWatch}==2){
			obj.name = 'I\'v watched this movie';
		}
        function callback(response) {
          //document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }

        FB.ui(obj, callback);
      }
    --></script>
    <script type="text/javascript">
		function get(){
			document.getElementById("aa").style.display="block";
			document.getElementById("bb").style.display="none";
		}
		function bu(){
			document.getElementById("bb").style.display="block";
			document.getElementById("aa").style.display="none";
		}					
    </script> 
</body>
</html>                                                                                                   