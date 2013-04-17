<%@ page language="java"
	import="java.util.*,model.User,model.ActivityPic,model.Activity,model.ActivityAlbum,model.ActivityClassified,vo.ActivityGoingMax,vo.UserComment,config.GlobleConfig"
	pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%><%
	request.setAttribute("path2",GlobleConfig.pathPath1);
	request.setAttribute("path1",GlobleConfig.pathPath);
	User user=(User)request.getAttribute("user");
	User user1=(User) session.getAttribute("user");
	ActivityAlbum activityAlbum=(ActivityAlbum)request.getAttribute("activityAlbum");
	String brief="";
		String wish=(String)request.getAttribute("wish");
	
	if(activityAlbum.getAlbumDescription()!=null){
	 brief=activityAlbum.getAlbumDescription().split("\\.")[0];}
	List<ActivityPic> activityPic=(List)request.getAttribute("activityPics");
	String picPath=activityPic.get(0).getPicPath_big();
	brief+="...";
	%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${activityAlbum.albumName}</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="${path1}activity/font/font.css" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="${path1}activity/style.css" />
    <script type="text/javascript" src="${path1}js/jquery-1.6.2.min.js"></script>
    <script type="text/javascript">
     function submit(){
  resourceId=${activityId};
  typeId=document.getElementById("tribusClassify").value;
   document.form10.action="${path2}/user/addTribusList/city/"+typeId+"/"+rescourceId;
 document.form10.submit();
  closePop();
  }
function get(){

document.getElementById("aa").style.display="block";
document.getElementById("bb").style.display="none";

}
function bu(){

document.getElementById("bb").style.display="block";
document.getElementById("aa").style.display="none";
}
 function WishList(url){
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
        alert("Cannot create XMLHttpRequest object instance！");
        return false;
    }
    http_request.onreadystatechange = getResultWishList;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);	
    }
    
    function getResultWishList(){
        if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById("wishList").innerHTML=http_request.responseText;;	//设置提示内容
 
        } else {     													// 请求页面有错误
            alert("The service you requested is unavalible now！");
        }
    }
    }
    </script>
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="${path2 }activity/index.action"><img src="${path1}activity/img/logo.png" alt="" width="59" height="65" /></a></div>
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
                    	<form action="${path2}user/searchAll.action">
                        	<p class="txt_header"><input id="search" name="search" type="text" /></p>
                            <p class="submit_header"><input type="submit" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="${path1 }activity/img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="${path2 }user/editForm.action"><img src="${path1 }activity/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
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
                        	<a href="${path2}userMail/box/0.action"><img src="${path1}activity/img/icon_message1.jpg" alt="" /><c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if></a>
                            <a href="${path2}user/about.action"><img src="${path1}activity/img/icon_message2.jpg" alt="" /></a>
                            <a href="${path2}user/police.action"><img src="${path1}activity/img/icon_message3.jpg" alt="" /></a>
                            <a href="${path2}user/logout.action"><img src="${path1}activity/img/icon_message4.jpg" alt="" /></a>
                        </div>
                        <div class="address">
                        	<h3>&nbsp;
                        	<%if(user1!=null){ %><a href="user/my.action"><%=user1.getUserAlias()%></a><%}else{ %><a href="user/loginForm.action">login</a><%} %></h3>
                            <span>${userProf.profCity}</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="common_maincontent"><!--start common_maincontent-->
            	<div id="album_content"><!--start album_content-->
                	<div id="album_type">
                    	<ul>
                        	<li class="album"></li>  
                           
                            <li><c:choose><c:when test="${flag==1}"><a href="${path2}activity/addPicIndex.action?activityId=${activityId}">Upload New Picture</a></c:when></c:choose></li>
                        </ul>
                    </div>
                    <div id="gallery"><!--start gallery-->
                    	<h2>${activityAlbum.albumName}</h2>
                        <div id="album_img">
                            <c:forEach items="${activityPics}" var="item">
                            <a href="${path2}activity/showPic.action?activityPicId=${item.picId}&albumName=${activityAlbum.albumName}&activityId=${activityId}&albumId=${albumId}"><img src="${item.picPath}" alt="" width="192" height="192"/></a>
</c:forEach>
                        </div>
                        <div id="slbum_descript">
                        	<p>${activityAlbum.albumDescription }</p>
                        </div>
                        <div id="album_pagination_area">
                        	
                        	<div id="album_pagi">
                        	 <c:choose>
                            	 <c:when test="${resultSize != 0}">
                                 <a href="${path2}activity/showPicList.action?albumId=${activityAlbum.albumId}&page=<c:choose><c:when test="${current-1 == 0}">1</c:when><c:otherwise>${current-1}</c:otherwise></c:choose>" class="prev"></a>
                                 <c:forEach items="${pageNumbers}" var="item">  
                                   
                                        <a href="${path2}activity/showPicList.action?albumId=${activityAlbum.albumId}&page=${item}">
                                        ${item}
                                      </a>&nbsp
                                </c:forEach>
                                  <a href="${path2}activity/showPicList.action?albumId=${activityAlbum.albumId}&page=<c:choose><c:when test="${current == maxPage}">${maxPage}</c:when><c:otherwise>${current+1}</c:otherwise></c:choose>" class="next"></a>
                           </c:when>
                           </c:choose>
                            </div>
                            <div id="album_social">
                            	<div id='fb-root'></div>
    <script src='http://connect.facebook.net/en_US/all.js'></script>
    <a onclick='postToFeed(); return false;'><img src="${path1}activity/img/icon_facebook.jpg" alt="" /></a>
                                <a href="#"><img src="${path1}activity/img/icon_tweet.jpg" alt="" /></a>
                               <p id='msg'></p>
                                <script> 
      FB.init({appId: "167819743335514", status: true, cookie: true});

      function postToFeed() {
var str=location.href;
        // calling the API ...
        var obj = {
          method: 'feed',
          link: str,
         
          name: "${activityAlbum.albumName}",
         picture:'<%=picPath%>',
          description: "<%=brief%>"
        };

        function callback(response) {
         
        }

        FB.ui(obj, callback);
      }
    
    </script> 
                                <span><a id="wishList"   href="javascript:WishList('${path2}user/addWishList/city/${activityId}.action')"><%if(wish!=null&&wish.equals("ok")){%>Already Added<%}else{%>+ Track List<%}%></a></span>
                                <span><a href="javascript:void(0)" onClick="showPop()">+Tribus List</a></span>
                                <small></small>
                            </div>
                        </div>
                    </div><!--//end #gallery-->
                </div><!--//end #album_content-->
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
            <form id="form10" name="form10" action="" method="post">
            	<p>
                	 <select id="tribusClassify" name="tribusClassify" >	
                    <c:forEach items="${tribusClassify}" var="item">
                        <option value="${item.id}">${item.name}</option>
                      </c:forEach>
                    </select>
                </p>
                <p><textarea rows="10" cols="10" onclick="if(this.value=='Description...')(this.value='')" onblur="if(this.value=='')(this.value='Description...')" >Description...</textarea></p>
                <div class="pop_btn"><a href="javascript:void(0)" onClick="submit()">Add</a></div>
             <div class="pop_btn1"><a href="${path2}tribuslist/add.action">Create </a></div>
            </form>
        </div><!--//end #light_box_bg-->
    </div><!--//end #light_box_wrapper-->
	<script type="text/javascript" src="${path1 }activity/css/js/jquery.min.js"></script>
    <script src="${path1 }activity/css/js/smoothscroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path1 }activity/css/js/code.js"></script>


</body>
</html>                                                                                                   