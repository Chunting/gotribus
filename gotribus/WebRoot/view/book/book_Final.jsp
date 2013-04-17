<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" import="config.*"%>
<%
	request.setAttribute("my_local",GlobleConfig.my_local);
	request.setAttribute("my_domain",GlobleConfig.my_domain);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Tribus_Book_movie</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${my_local }/book/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${my_local }/book/style.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${my_local }/book/css/css3.css" />
    <link rel="shortcut icon" href="http://www.gotribus.com/view/images/LOGO_32.png"/>
    <!--[if lt IE 10]>
   		<script src="js/PIE.js" type="text/javascript"></script>
    <![endif]-->
	<script type="text/javascript" src="${my_local }/book/jssha2/sha2.js"></script>
	<script type="text/javascript">
		var apikey = "AKIAJPAQXHDZAZJX5H4A";
		var secretAccessKey = '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';
//		var AssociateTag = 'qiumi-20';
		var searchName = '';
//		var searchName = '<c:out value="${searchName}" />';
		function invokeRequest() {
		    var unsignedUrl = 'http://ecs.amazonaws.com/onca/xml?Service=AWSECommerceService&Operation=ItemSearch&ResponseGroup=Large&SearchIndex=Books&AssociateTag=qiumi-20&Keywords='+searchName;
			var lines = unsignedUrl.split("\n");
			unsignedUrl = "";
			for (var i in lines) { unsignedUrl += lines[i]; }
		
		    // find host and query portions
		    var urlregex = new RegExp("^http:\\/\\/(.*)\\/onca\\/xml\\?(.*)$");
		    var matches = urlregex.exec(unsignedUrl);
		
			if (matches == null) {
			  alert("Could not find PA-API end-point in the URL. Please ensure the URL looks like the example provided.");
			  return;
			}
		
		    var host = matches[1].toLowerCase();
		    var query = matches[2];
		
		    // split the query into its constituent parts
		    var pairs = query.split("&");
		
		    // remove signature if already there
		    // remove access key id if already present 
		    //  and replace with the one user provided above
		    // add timestamp if not already present
		    pairs = cleanupRequest(pairs);
		        
		    // encode the name and value in each pair
		    pairs = encodeNameValuePairs(pairs);
		        
		    // sort them and put them back together to get the canonical query string
		    pairs.sort();
		
		    var canonicalQuery = pairs.join("&");
		    var stringToSign = "GET\n" + host + "\n/onca/xml\n" + canonicalQuery;
		
		    // calculate the signature
		    var secret = getSecretAccessKey();
		    var signature = sign(secret, stringToSign);
		        
		    // assemble the signed url
		    var signedUrl = "http://" + host + "/onca/xml?" + canonicalQuery + "&Signature=" + signature;
		
		    return signedUrl;
		//    alert(signedUrl);
		}
		
		function encodeNameValuePairs(pairs) {
		        for (var i = 0; i < pairs.length; i++) {
		          var name = "";
		          var value = "";
		          
		          var pair = pairs[i];
		          var index = pair.indexOf("=");
		
		          // take care of special cases like "&foo&", "&foo=&" and "&=foo&" 
		          if (index == -1) {
		            name = pair;
		          } else if (index == 0) {
		            value = pair;
		          } else {
		            name = pair.substring(0, index);
		            if (index < pair.length - 1) {
		              value = pair.substring(index + 1);
		            }
		          }
		          
			  // decode and encode to make sure we undo any incorrect encoding
		          name = encodeURIComponent(decodeURIComponent(name));
		
			  value = value.replace(/\+/g, "%20");
		          value = encodeURIComponent(decodeURIComponent(value));
		
		          pairs[i] = name + "=" + value;
		        }
		        
		        return pairs;
		}
		      
		function cleanupRequest(pairs) {
		        var haveTimestamp = false;
			var haveAwsId = false;
		        var accessKeyId =  getAccessKeyId();
		        
		        var nPairs = pairs.length;
		        var i = 0;
		        while (i < nPairs) {
		          var p = pairs[i];
		          if (p.search(/^Timestamp=/) != -1) {
		            haveTimestamp = true;
		          } else if (p.search(/^(AWSAccessKeyId|SubscriptionId)=/) != -1) {
		            pairs.splice(i, 1, "AWSAccessKeyId=" + accessKeyId);
			    haveAwsId = true;
		          } else if (p.search(/^Signature=/) != -1) {
		            pairs.splice(i, 1);
		            i--;
		            nPairs--;
		          }
		          i++;
		        }
		
		        if (!haveTimestamp) {
		          pairs.push("Timestamp=" + getNowTimeStamp());
		        }
		
			if (!haveAwsId) {
			  pairs.push("AWSAccessKeyId=" + accessKeyId);
			}
		        return pairs;
		}
		      
		function sign(secret, message) {
		        var messageBytes = str2binb(message);
		        var secretBytes = str2binb(secret);
		        
		        if (secretBytes.length > 16) {
		            secretBytes = core_sha256(secretBytes, secret.length * chrsz);
		        }
		        
		        var ipad = Array(16), opad = Array(16);
		        for (var i = 0; i < 16; i++) { 
		            ipad[i] = secretBytes[i] ^ 0x36363636;
		            opad[i] = secretBytes[i] ^ 0x5C5C5C5C;
		        }
		
		        var imsg = ipad.concat(messageBytes);
		        var ihash = core_sha256(imsg, 512 + message.length * chrsz);
		        var omsg = opad.concat(ihash);
		        var ohash = core_sha256(omsg, 512 + 256);
		        
		        var b64hash = binb2b64(ohash);
		        var urlhash = encodeURIComponent(b64hash);
		        
		        return urlhash;
		}
		      
		      Date.prototype.toISODate =
			      new Function("with (this)\n    return " +
				 "getFullYear()+'-'+addZero(getMonth()+1)+'-'" +
				 "+addZero(getDate())+'T'+addZero(getHours())+':'" +
				 "+addZero(getMinutes())+':'+addZero(getSeconds())+'.000Z'");
		
		function addZero(n) {
			  return ( n < 0 || n > 9 ? "" : "0" ) + n;
		}
		
		function getNowTimeStamp() {
			  var time = new Date();
			  var gmtTime = new Date(time.getTime() + (time.getTimezoneOffset() * 60000));
			  return gmtTime.toISODate() ;
		}
		
		function getAccessKeyId() {
		    return apikey;
		}
		      
		function getSecretAccessKey() {
		    return secretAccessKey;        
		}

		function getsignedUrl(){
			var submit = document.getElementById('submit');
			var search = document.getElementById('search');
		//	submit.onclick = function() {
			searchName = search.value;
			var signedUrl = document.getElementById('signedUrl');
			signedUrl.value = invokeRequest();
			//alert("signedUrl: "+signedUrl.value);
		//	};
		}
		
		
		
		
		/**
		window.onload = function() {
			var submit = document.getElementById('submit');
			var search = document.getElementById('search');
			submit.onclick = function() {
				searchName = search.value;
				var signedUrl = document.getElementById('signedUrl');
				signedUrl.value = invokeRequest();
				//alert("signedUrl: "+signedUrl.value);
			};
			
		};
**/		
	</script>
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
		
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html"><img src="${my_local}/book/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="${my_domain}/activity/index.action">EVENT</a></li>
                    	<li><a href="${my_domain }/movie/movieHomePage.action" title="MOVIE">MOVIE</a></li>
                        <li class="current_page_item"><a href="${my_domain }/book/bookHomePage.action" title="BOOK">BOOK</a></li>
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
                    	<span class="space_btm"><a href="#"><img src="${my_local}/book/img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="${my_domain }/user/editForm.action"><img src="${my_local}/book/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg" class="space_lft"><!--start search_bg-->
                	<form action="${my_domain }/book/search/1.action" id="single_search_bar" name="single_search_bar" target="_blank" onClick="getsignedUrl()">
                    	<p class="search_text"><input id="search" name="single_search_name" type="text" value="Seach for book, celebrity, tribus list" onclick="if(this.value=='Seach for book, celebrity, tribus list')(this.value='')"  onblur="if(this.value=='')(this.value='Seach for book, celebrity, tribus list')" /></p>
						<p><input type="text"  style="display:none;" id="signedUrl" name= "signedUrl"/></p>
                        <p class="search_submit"><input type="submit" value=" " id="submit" /></p>
                    </form>
                </div><!--//end #search_bg-->
                <div id="social_media"><!--start social_media-->
                	<div id="social_lftcol">
                    	<a href="https://www.facebook.com/TheTribus"><img src="${my_local}/book/img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                        <a href="#"><img src="${my_local}/book/img/icon_tweet.jpg" width="24" height="24" alt="" /></a>
                    </div>
                    <div id="social_box"><!--start social_box-->
                    	<div id="message">
                        	<a href="${my_domain }/userMail/box/0.action"><img src="${my_local}/book/img/icon_message1.jpg" alt="" width="22" height="22" /><c:if test="${unreadMail > 0}"><span><c:out value="${unreadMail}"/></span></c:if></a>
                         
                            <a href="${my_local }/user/logout.action"><img src="${my_local}/book/img/icon_message4.jpg" alt="" width="22" height="22" /></a>
                        </div>
                        <div class="address">
                        	<h3><a href="${my_domain }/user/my.action"><c:out value="${userName}" /></a></h3>
                            <span><c:out value="${userCity }" /></span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="main_content"><!--start main_content-->
            	<div id="content"><!--start content-->
                	<div id="content_book_final"><!--start content_book_final-->
                    	<div id="book_gallery_area"><!--start book_gallery_area-->
                        	<div class="book_gallery_lftcol"><!--start book_gallery_lftcol-->
                            	<h2>New Fiction</h2>
                            	<div class="book_gallery">
                                	<c:forEach items="${booksByTag1}" var="thisBook"> 
                                	<a href="${my_domain}/book/${thisBook.bookId }.action"><img src="${thisBook.bookPic }" alt="" width="78" height="120" /></a>
                                	</c:forEach>
                                </div>
                            </div><!--//end #book_gallery_lftcol-->
                            <div class="book_gallery_lftcol"><!--start book_gallery_lftcol-->
                            	<h2>New Non-Fiction</h2>
                            	<div class="book_gallery">
                                	<c:forEach items="${booksByTag2}" var="thisBook"> 
                                	<a href="${my_domain}/book/${thisBook.bookId }.action"><img src="${thisBook.bookPic }" alt="" width="78" height="120" /></a>
                                	</c:forEach>
                                </div>
                            </div><!--//end #book_gallery_lftcol-->
                            <div class="clear"></div>
                        </div><!--//end #book_gallery_area-->
                        <div id="book_rating"><!--start book_rating-->
                        	<h2>Friend's Footprint</h2>
                        	<ul id="slider1"><li>
                        	<c:forEach items="${homePageFriendRecommends}" var="thisRecommend" varStatus="fr">
                        	<div class="book_rating_lftcol"><!--start book_rating_lftcol-->
                            	<div class="rating_lftcol_cont">
                                	<div class="rating_book"><a href="${my_domain }/book/${thisRecommend.itemId }.action"><img src="${thisRecommend.itemPic }" alt="" width="120" height="185" /></a></div>
                                    <div class="book_rating_info">
                                    	<div class="book_icon">
                                    		<p><a href="${my_domain }/book/${thisRecommend.itemId }.action"><c:out value="${thisRecommend.itemName}" /></a></p>
                                        	<span>Rating:</span>
                                            <c:choose>
		                                		<c:when test="${thisRecommend.rating>=0.5 && thisRecommend.rating<1.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                               </c:when>
				                               <c:when test="${thisRecommend.rating>=1.5 && thisRecommend.rating<2.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                               </c:when>
				                               <c:when test="${thisRecommend.rating>=2.5 && thisRecommend.rating<3.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                               </c:when>
				                               <c:when test="${thisRecommend.rating>=3.5 && thisRecommend.rating<4.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                               </c:when>
				                               <c:when test="${thisRecommend.rating>=4.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star1.jpg" alt="" width="20" height="19" /></a>
				                               </c:when>
				                               <c:otherwise>
				                               		<a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/blue_star2.jpg" alt="" width="20" height="19" /></a>
				                               </c:otherwise>
				                           	</c:choose>
		                                    <c:out value="${singlePageMain.itemAveGrade}" />
                                        </div>
                                        <h5><a href="${my_domain }/user/friendHome/${thisRecommend.friendId }.action"><c:out value="${thisRecommend.friendName}" /></a> Saw it </h5>
                                        <small><c:out value="${thisRecommend.timeSpan}" /> ago</small>
                                        <div class="zoom"></div>                                    
                                    </div>
                               </div>
                            </div><!--//end .book_rating_lftcol-->
                            </c:forEach>
                            <div class="clear"></div>
                            </li></ul>
                        </div><!--//end #book_rating-->
                    <c:forEach items="${homePageReviews }" var="thisReview" varStatus="r">
                    <c:if test="${r.index == 0 }">
                    <div class="review_box"><!--start review_box-->
                        <h2>Review</h2>
                        <div class="review_title_area"><!--start review_title_area-->
                            <div class="review_small_img">
                                <a href="${my_domain }/user/friendHome/${thisReview.userId }.action"><img class="profile" src="${thisReview.userPic}" alt="" width="31" height="31" /></a>
                                <a href="#"><img src="${my_local}/book/img/black_arrow.jpg" alt="" width="9" height="16" /></a>
                            </div>
                            <div class="review_title_rgt">
                                <h3><a href="${my_domain }/review/bookReview/${thisReview.commentId }.action"><c:out value="${thisReview.commentTitle}" /></a></h3>
                                 <span><a class="userName" href="${my_domain }/user/friendHome/${thisReview.userId }.action"><c:out value="${thisReview.userName}" /></a></span>
                            </div>
                        </div><!--//end .review_title_area-->
                        <div class="rating_feature"><!--strat rating_feature-->
                            <div class="review_featureimg"><img src="${thisReview.itemPic}" alt="" width="38" height="53" /></div>
                            <div class="rating_feature_descript">
                                <p><c:out value="${thisReview.itemName}" /><br/>
									<c:out value="${thisReview.commentContent}" /></p>
                            </div>
                            <div class="rating_star">
                                <div class="rating_star_lft">
												<c:choose>
		                                		<c:when test="${thisReview.userRate>=0.5 && thisReview.userRate<1.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=1.5 && thisReview.userRate<2.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=2.5 && thisReview.userRate<3.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=3.5 && thisReview.userRate<4.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=4.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:otherwise>
				                               		<a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:otherwise>
				                           	</c:choose>
                                </div>
                                <div class="rating_star_rt"><a href="${my_domain }/review/bookReview/${thisReview.commentId }.action"><img src="${my_local}/book/img/tripple_arrow4.png" alt="" width="27" height="9" /></a></div>
                            </div>
                        </div><!--//end .rating_feature-->
                    </div><!--//end .review_box-->
                    </c:if> 
                    
                    <c:if test="${r.index > 0 }">
                    <div class="review_box"><!--start review_box-->
                        <div class="review_title_area"><!--start review_title_area-->
                            <div class="review_small_img">
                                <a href="${my_domain }/user/friendHome/${thisReview.userId }.action"><img class="profile" src="${thisReview.userPic}" alt="" width="31" height="31" /></a>
                                <a href="#"><img src="${my_local}/book/img/black_arrow.jpg" alt="" width="9" height="16" /></a>
                            </div>
                            <div class="review_title_rgt">
                                <h3><a href="${my_domain }/review/bookReview/${thisReview.commentId }.action"><c:out value="${thisReview.commentTitle}" /></a></h3>
                                <span><a class="userName" href="${my_domain }/user/friendHome/${thisReview.userId }.action"><c:out value="${thisReview.userName}" /></span></a></span>
                            </div>
                        </div><!--//end .review_title_area-->
                        <div class="rating_feature"><!--strat rating_feature-->
                            <div class="review_featureimg"><img src="${thisReview.itemPic}" alt="" width="38" height="53" /></div>
                            <div class="rating_feature_descript">
                                <p><c:out value="${thisReview.itemName}" /><br/>
									<c:out value="${thisReview.commentContent}" /></p>
                            </div>
                            <div class="rating_star">
                                <div class="rating_star_lft">
												<c:choose>
		                                		<c:when test="${thisReview.userRate>=0.5 && thisReview.userRate<1.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=1.5 && thisReview.userRate<2.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=2.5 && thisReview.userRate<3.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=3.5 && thisReview.userRate<4.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:when test="${thisReview.userRate>=4.5}">
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star1.png" alt="" width="12" height="12" /></a>
				                               </c:when>
				                               <c:otherwise>
				                               		<a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                                    <a href="#"><img src="${my_local}/movie/img/icon_star2.png" alt="" width="12" height="12" /></a>
				                               </c:otherwise>
				                           	</c:choose>
                                </div>
                                <div class="rating_star_rt"><a href="${my_domain }/review/bookReview/${thisReview.commentId }.action"><img src="${my_local}/book/img/tripple_arrow4.png" alt="" width="27" height="9" /></a></div>
                            </div>
                        </div><!--//end .rating_feature-->
                    </div><!--//end .review_box-->
                    </c:if>
                    </c:forEach>
                    <div class="more_review">
                        <a href="${my_domain }/review/book.action">More reviews <img src="${my_local}/book/img/tripple_arrow3.jpg" alt="" /></a>
                    </div>
                </div><!--//end #content_book_final-->
                </div><!--//end #content-->
                <div id="side_bar"><!--start side_bar-->
                    <div class="widget"><!--start widget-->
                    	<h2>You May Like</h2>
                    	<c:forEach items="${guessYouLike}" var="thisLike">
                        <div class="widget_gallery">
                        	<img src="${thisLike.activityPic}" alt="" width="222" height="133" />
                            <h3><a href="${my_domain}/activity/info.action?activityId=${thisLike.activityId }"><c:out value="${thisLike.activityName}" />. ..</a></h3>
                        </div>
                        </c:forEach>
                    </div><!--//end .widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Tag</h2>
                        <div class="widget_info">
                        	<p class="upper"><a href="${my_domain }/book/searchByTag/art.action">Arts</a>  <a  href="${my_domain }/book/searchByTag/biography.action">Biography</a>  <a href="${my_domain }/book/searchByTag/business.action">Business</a><br />
                            <a href="${my_domain }/book/searchByTag/comic.action">Comics</a>  <a href="${my_domain }/book/searchByTag/fiction.action">Fiction</a>  <a href="${my_domain }/book/searchByTag/health.action">Health</a><br/>
                        	<a href="${my_domain }/book/searchByTag/literature.action">Literature</a>  <a href="${my_domain }/book/searchByTag/rock.action">Rock</a>  <a href="${my_domain }/book/searchByTag/mystery.action">Mystery</a><br />
                       		<a href="${my_domain }/book/searchByTag/romance.action">Romance</a>  <a href="${my_domain }/book/searchByTag/travel.action">Travel</a> <a href="${my_domain }/book/searchByTag/other.action">Others</a></p>
                        </div>
                    </div><!--//end .widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Top Book List</h2>
                        <div class="widget_info">
                        	<ul>
                            	<li><a href="${my_domain }/tribuslist/list/${tribusList[0].resourceId }.action"><c:out value="${tribusList[0].resourceName}" /></a></li>
                                <li><a href="${my_domain }/tribuslist/list/${tribusList[1].resourceId }.action"><c:out value="${tribusList[1].resourceName}" /></a></li>
                                <li class="color1"><a href="${my_domain }/tribuslist/list/${tribusList[2].resourceId }.action"><c:out value="${tribusList[2].resourceName}" /></a></li>
                                <li class="color1"><a href="${my_domain }/tribuslist/list/${tribusList[3].resourceId }.action"><c:out value="${tribusList[3].resourceName}" /></a></li>
                                <li><a href="${my_domain }/tribuslist/list/${tribusList[4].resourceId }.action"><c:out value="${tribusList[4].resourceName}" /></a></li>
                                <li><a href="${my_domain }/tribuslist/list/${tribusList[5].resourceId }.action"><c:out value="${tribusList[5].resourceName}" /></a></li>
                                <li><a href="${my_domain }/tribuslist/list/${tribusList[6].resourceId }.action"><span><c:out value="${tribusList[6].resourceName}" /></span></a></li>
                                <li><a href="${my_domain }/tribuslist/list/${tribusList[7].resourceId }.action"><span><c:out value="${tribusList[7].resourceName}" /></span></a></li>
                            </ul>
                        </div>
                    </div><!--//end .widget-->
                </div><!--//end #side_bar-->
            </div><!--//end #main_content-->
            <div id="footer"><p> &copy;2012 goTribus |<span>All rights reserved</span> <a href="http://gotribus.com/user/about.action" target="_blank">About</a> <a href="http://gotribus.com/user/police.action" target="_blank">Term of Use</a></p></div>
            <div id="back_to_top"><a href="#top"></a></div>
            <script src="${my_local }/book/js/jquery-1.8.0.min.js" type="text/javascript"></script>
            <script src="${my_local }/book/js/back_to_top.js" type="text/javascript"></script>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
    <script src="${my_local }/book/js/smoothscroll.js" type="text/javascript"></script>
    <script src="${my_local }/book/js/latest.js" type="text/javascript"></script>
    <script src="${my_local }/book/js/box.slider.js" type="text/javascript"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
		$('#slider1').bxSlider();
	  });
	</script>
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