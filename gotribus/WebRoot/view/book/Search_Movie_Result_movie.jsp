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
	<title>Tribus_Search_Book_Result_book</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${my_local }/movie/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${my_local }/movie/style.css" />
    <link rel="shortcut icon" href="http://www.gotribus.com/view/images/LOGO_32.png"/>
	<script type="text/javascript" src="${my_local }/book/jssha2/sha2.js"></script>
	<script type="text/javascript">
		var apikey = "AKIAJPAQXHDZAZJX5H4A";
		var secretAccessKey = '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';
//		var AssociateTag = 'qiumi-20';
//		var searchName = '<c:out value="${searchName}" />';
		var searchName = '';
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
			alert("signedUrl: "+search.value);
			var signedUrl = document.getElementById('signedUrl');
			signedUrl.value = invokeRequest();
			
		//	};
		}
			/*
		window.onload = function() {
			var signedUrl = document.getElementById('signedUrl');
			signedUrl.value = invokeRequest();
		};	
*/		
</script>
</head>

<body style="margin:0 0 0 -16px;">
	<div id="wrapper"><!--start wrapper-->
		
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="index.html"><img src="${my_local }/movie/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="${my_domain}/activity/index.action">EVENT</a></li>
                    	<li><a href="${my_domain }/movie/movieHomePage.action" title="MOVIE">MOVIE</a></li>
                        <li class="current_page_item"><a href="${my_domain }/book/bookHomePage.action" title="BOOK">BOOK</a></li>
                        <li><a href="${my_domain }/music/musicHomePage.action" title="MUSIC">MUSIC</a></li>
                        <li><a id="bb" onMouseOver="get()" style="display:block" href="${my_domain}/user/my.action" title="MY TRIBUS">MY TRIBUS</a>
						<a id="aa" onMouseOut="bu()" style="font-size:24px; display:none" href="${my_domain}/user/my.action" title="MY TRIBUS">MyTRIBUS</a></li>
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
                	<form action="${my_domain }/book/search/1.action" id="single_search_bar" name="single_search_bar" onClick="getsignedUrl()">
                    	<p class="search_text"><input name="single_search_name" type="text" value="${searchName}" onclick="(this.value='')"  onblur="if(this.value=='')(this.value='${searchName}')" /></p>
                        <p><input type="text"  style="display:none;" id="signedUrl" name= "signedUrl"/></p>
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
            <div id="common_maincontent"><!--start common_maincontent-->
            	<div id="main_search_content"><!--start main_search_content-->
                	<div id="search_lftcol"><!--start search_lftcol-->
                    	<div class="search_title"><!--start search_title-->
                        	<h2>SEARCH: <c:out value="${searchName}" /></h2>
                            <div class="book_btn">
                            	<a class="select_book" href="#">Books</a>
                                <a href="${my_domain }/book/search/2.action?single_search_name=${searchName }">Celebrities</a>
                                <a href="${my_domain }/book/search/3.action?single_search_name=${searchName }">Tribus Lists</a>
                            </div>
                        </div><!--//end .search_title-->
                        <div id="gallery_book"><!--start gallery_book-->
                        	<c:forEach items="${searchResults}" var="thisResult">
                        	<div class="book_feature">
                            	<a href="${my_domain }/book/${thisResult.itemId}.action"><img src="${thisResult.itemPic }" alt="" width="122" height="184" /></a>
                                <h3><a href="${my_domain }/book/${thisResult.itemId}.action"><c:out value="${thisResult.itemName}" /></a></h3>
                                <span><c:out value="${thisResult.itemRate}" /></span>
                            </div>
                            </c:forEach>
                            <div class="clear"></div>
                        </div><!--//end #gallery_book-->
                        <div id="follower_apgi" class="space_pagi">
							${pageStr} 
                        </div>
                    </div><!--//end #search_lftcol-->
                <div id="review_side_bar"><!--start review_side_bar-->
                	<div class="review_btn_add"><a href="${my_domain }/book/createBook.action">Add It</a></div>
                </div><!--//end review_side_bar-->
                 <div class="clear"></div>
                </div><!--//end #main_search_content-->
            </div><!--//end #common_maincontent-->
            <div id="footer"><p> &copy;2012 goTribus |<span>All rights reserved</span> <a href="http://gotribus.com/user/about.action" target="_blank">About</a> <a href="http://gotribus.com/user/police.action" target="_blank">Term of Use</a></p></div>
            <div id="back_to_top"><a href="#top"></a></div>
            <script src="${my_local }/movie/js/jquery-1.8.0.min.js" type="text/javascript"></script>
            <script src="${my_local }/movie/js/back_to_top.js" type="text/javascript"></script>
            <script src="${my_local }/movie/js/smoothscroll.js" type="text/javascript"></script>
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
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
</body>
</html>                                                                                                   