<%@ page language="java" import="java.util.*,model.User,config.GlobleConfig" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/tld/fmt-rt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String wish=(String)request.getAttribute("wish");
			String tribus=(String)request.getAttribute("tribus");
			
String followed=(String)request.getAttribute("followed");
			String joined=(String)request.getAttribute("joined");
			

			
			String owner=(String)request.getAttribute("owner");
			
			int i=0;
			User user=(User)session.getAttribute("user");
			Integer flag=(Integer)request.getAttribute("flagg");
			
			List activityAlbumList=(List)request.getAttribute("activityAlbum");
				
	request.setAttribute("path1",GlobleConfig.pathPath);
	request.setAttribute("path2",GlobleConfig.pathPath1);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>My JSP 'market.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/css/css3.css" />
    <script type="text/javascript" src="${path1}js/jquery-1.6.2.min.js"></script>	
         <script type="text/javascript" src="${path1}activity/css/js/jquery.min.js"></script>
    <script src="${path1}activity/css/js/easy-editable-text.js" type="text/javascript"></script>
	<script type="text/javascript" src="${path1}activity/css/js/code.js"></script>
    <script src="${path1}activity/css/js/latest.js" type="text/javascript"></script>
    <script src="${path1}activity/css/js/box.slider.js" type="text/javascript"></script>
    <script src="${path1}activity/css/js/smoothscroll.js" type="text/javascript"></script>
	<script src="${path1}activity/css/js/jquery.raty.js" type="text/javascript"></script>
  <script type="text/javascript">
       
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
        alert("不能创建XMLHttpRequest对象实例！");
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
            alert("您所请求的页面有错误！");
        }
    }
    }
    
    
 function TribusList(url){
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
    http_request.onreadystatechange = getResultTribusList;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);	
    }
    
   function  getResultTribusList(){
        if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById("tribusList").innerHTML=http_request.responseText;;	//设置提示内容
 
        } else {     													// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
    }
       function check(){
    	if(document.getElementById("commentContent").value == ""){
    		alert("empty comment");
    	}if(document.getElementById("commentContent").value == "Name Says : ..."){
    		alert("empty comment");
    	}else{
    		document.getElementById("formComment").submit();
    	}
    	
    }
    
    function followActivity(url){
    
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
    http_request.onreadystatechange = getResult;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);		
    
    }
function getResult() {
    if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById("bt1").innerHTML=http_request.responseText;;	//设置提示内容
             if(http_request.responseText=="unFollow"){
              document.getElementById("bt1").style.color="grey";
             }else{
             document.getElementById("bt1").style.color="#00B0D8";
             }
        } else {     													// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
}
  function joinActivity(url){
    
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
    http_request.onreadystatechange = getResult1;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);		
    
    }
    function getResult1() {
    if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById("bt2").innerHTML=http_request.responseText;;	//设置提示内容
 if(http_request.responseText=="unJoin"){
              document.getElementById("bt2").style.color="grey";
             }else{
             document.getElementById("bt2").style.color="#00B0D8";
             }
        } else {     													// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }		  
} 
  </script>
  </head>
  
  <body>
<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="${path2}activity/index.action"><img src="${path1}activity/img/logo.png" alt="" width="59" height="65" /></a></div>
            <div id="header_rgt"><!--start header_rgt-->
            	<div id="menu_bg"><div id="menu_lft"><div id="menu_rgt">
                    <ul>
                    	<li><a href="${path2}activity/index.action">CITY</a></li>
                    	<li><a href="${path2}movie/movieHomePage.action" title="MOVIE">MOVIE</a></li>
                        <li><a href="${path2}book/book/HomePage.action" title="BOOK">BOOK</a></li>
                        <li><a href="${path2}music/music/HomePage.action" title="MUSIC">MUSIC</a></li>
                        <li class="${path2}user/my.action"><a href="#" title="MY TRIBUS">MY TRIBUS</a></li>
                    </ul>
                   <div class="header_search">
                    	<form action="${path2}user/searchAll.action">
                        	<p class="txt_header"><input id="search" name="search" type="text" /></p>
                            <p class="submit_header"><input type="submit" value=" " /></p>
                        </form>
                    </div>
                    <div class="header_icon_area">
                    	<span class="space_btm"><a href="#"><img src="${path1}activity/img/icon_header1.png" alt="" width="10" height="11" /></a></span>
                        <span><a href="${path2}user/editForm.action"><img src="${path1}activity/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg" class="space_lft"><!--start search_bg-->
                	<form action="${path2}activity/search.action">
                    	<p class="search_text"><input id="searchCondition" name="searchCondition" type="text" value="Seach activity, activity time, activity location" onClick="if(this.value=='Seach activity, activity time, activity location')(this.value='')"  onblur="if(this.value=='')(this.value='Seach activity, activity time, activity location')" /></p>
                        <p class="search_submit"><input type="submit" value=" " /></p>
                    </form>
                </div><!--//end #search_bg-->
                <div id="social_media"><!--start social_media-->
                	<div id="social_lftcol">
                    	<a href="#"><img src="${path1}activity/img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                        <a href="#"><img src="${path1}activity/img/icon_tweet.jpg" alt="" width="24" height="24" /></a>
                    </div>
                    <div id="social_box"><!--start social_box-->
                    	<div id="message">
                        	<a href="${path2}userMail/box/0.action"><img src="${path1}activity/img/icon_message1.jpg" alt="" width="22" height="22" /><c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if></a>
                            <a href="${path2}user/about.action"><img src="${path1}activity/img/icon_message2.jpg" alt="" width="22" height="22" /></a>
                            <a href="${path2}user/police.action"><img src="${path1}activity/img/icon_message3.jpg" alt="" width="22" height="22" /></a>
                            <a href="${path2}user/logout.action"><img src="${path1}activity/img/icon_message4.jpg" alt="" width="22" height="22" /></a>
                        </div>
                        <div class="address">
                        	<h3>
									<%if(user==null){%><a href="${path2}user/loginForm.action">login</a>
									<%}else{ %>
									<a href="${path2}user/my.action"><%=user.getUserAlias()%>
										<%} %> </a>
								</h3>
								    <span>${userProf.profCity}</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="common_maincontent"><!--start common_maincontent-->
                <div id="review_lftcol"><!--start review_lftcol-->
                    <div id="product_area"><!--start product_area-->
                    	<h2>${activityInfo.activityName}</h2>
                        <div id="product_twocol"><!--start product_twocol-->
                        	<div id="product_lftcol"><img src="${activityInfo.activityPic}" alt="" width="317" height="317" /></div>
                            <div id="product_rgtcol"><!--start product_rgtcol-->
                            	<p>Start Date: <fmt:formatDate value="${activityInfo.activityStartTime}" type="date" dateStyle="medium"/> <br />End Date: <fmt:formatDate value="${activityInfo.activityFinishTime}" type="date" dateStyle="medium"/> <br />PLace: ${activityInfo.activityCity} ${activityInfo.activityStreet} ${activityInfo.activityState}<br />Starter:${user.userAlias }<br />
                               Type: ${activityClassified}<br />Fees: None</p>
                                 <div class="king_wish">
                                	<a id="wishList"   href="javascript:WishList('${path2}user/addWishList/city/${activityId}.action')"><%if(wish!=null&&wish.equals("ok")){%>Already Added<%}else{%>+ Wish List<%}%></a>
                                    <a id="tribusList"  href="javascript:TribusList('${path2}user/addTribusList/city/${activityId}.action')"><%if(tribus!=null&&tribus.equals("ok")){%>Already Added<%}else{%>+ Tribus List<%}%></a>
                                </div>
                                <div class="king_social">
                                	<a href="#"><img src="${path1}activity/img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                                    <a href="#"><img src="${path1}activity/img/icon_tweet.jpg" alt="" width="24" height="24" /></a>
                                </div>
                                
                               <div class="king_done"><%if(owner==null) {%>
                                	<a id="bt1"  class="selectOne" href="javascript:followActivity('${path2}activity/followActivity.action?activityId=${activityId}')"><%if(followed.equals("true")){%><span style="color:grey">Unfollow</span><%}else{%>Follow<%}%></a>
                                    <a id="bt2"  class="selectTwo click_done" href="javascript:joinActivity('${path2}activity/joinActivity.action?activityId=${activityId}')"><%if(joined.equals("true")){%><span style="color:grey">Unjoin</span><%}else{%>Join<%}%></a>
                               <%}else{ %>You are the host<%} %>
                                </div>
                            </div><!--//end #product_rgtcol-->
                        </div><!--//end #product_twocol-->
                    </div><!--//end #product_area-->
                    <div id="brief_main"><!--start brief_main-->
                    	<div class="brief_activity"><!--start brief_activity-->
                        	<h2>Brief Introduction</h2>
                            <div class="comment_box"><!--start comment_box-->
                               <div class="brief_content">
                                	<p>
                                	${activityInfo.activityDetail}</p>
                                    <div class="icon_brief"><img src="${path1}activity/img/icon_plus.jpg" alt="" width="20" height="20" /></div>
                                </div>
                            </div><!--//end .comment_box-->
                        </div><!--//end .brief_activity-->
                       


      <div class="gallery_row_exchange"><!--start gallery_row-->
                        	<h2><%if(activityAlbumList.size()!=0) {%><a href="${path2}activity/album.action?activityId=${activityId}"><%}%>Activity Album</a></h2>
                            <div class="gallery_upload"><c:choose><c:when test="${flagg==1}"> <a href="${path2}activity/addPicIndex.action?activityId=${activityId}">Upload Yours</a></c:when></c:choose></div>
                                <%if(activityAlbumList.size()!=0) {%>
                            <div class="img_galley">
                            	<ul id="slider1"><li>
                            	
                            	 <c:forEach items="${activityAlbum}" var="item">
                                <div class="img_widget">
                                	 
                            <a href="${path2}activity/showPicList.action?albumId=${item.albumId}"><img src="${item.albumCover}" width="103"
								height="103" /> 
								 </a>
                               
                              <h3><a href="${path2}activity/showPicList.action?albumId=${item.albumId}">${item.albumName}</a></h3>
                                </div>
                                </c:forEach>
                               
                                <div class="clear"></div>
                               </li></ul>
                            </div>
                            <%} %>
                        </div><!--//end #gallery_row-->
                    </div><!--//end #brief_main-->
                    <div id="comment_box_brief"><!--start comment_box_brief-->
                          <%if(session.getAttribute("user")!=null){ %>
                      
                        <div class="comment_box"><!--start comment_box-->
                            <div class="arrow_author2"></div>
                            <div class="comment_first_content"><!--start comment_first_content-->
                                <div class="pic_author">
                                    <div class="arrow_author1"></div>
                                    <img src="" alt="" width="73" height="73" />
                                </div>
                                <form id="formComment" name="formComment" method="post" action="${path2}activity/addComment.action?activityId=${activityId}">
                                <div class="author_total_rgt">
                                    <div class="author_speech">
                                        <textarea id="commentContent" name="commentContent" rows="10" cols="10" onClick="if(this.value=='Name Says : ...')(this.value='')"  onblur="if(this.value=='Name Says : ...')(this.value='')">Name Says : ...</textarea>
                                    </div>
                                    <div class="author_icon">
                                        <span><img src="${path1}activity/img/icon_album.jpg" alt="" width="20" height="19" /></span>
                                        <div class="btn_done"><a href="javascript: check();">Done</a></div>
                                    </div>
                                </div>
                                </form>
                            </div><!--//end .comment_first_content-->
                        </div><!--//end .comment_box-->
                        <%} %>
                     
                        
                      
                          
                       
                        <c:forEach items="${userCommentList}" var="item" varStatus="in">
                        
                            <c:choose>
                       <c:when test="${in.index %2!=0}">
                         <div class="comment_box bg_differ"><!--start comment_box-->
                       </c:when>
                       <c:otherwise>
                       <div class="comment_box"><!--start comment_box-->
                       </c:otherwise>
                       </c:choose>
                            <div class="comment_scnd_content"><!--start comment_scnd_content-->
                                <div class="pic_author">
                                  <a href="${path2}user/my.action"><img src="${item.userPic}" width="72" height="72" /></a>
                                </div>
                                <div class="author_total_rgt">
                                    <div class="author_speech">
                                        <h3><a href="${path2}user/my.action">${item.userName}</a></h3>
                                        <p>${item.commentContent}</p>
                                        <span><fmt:formatDate value="${item.commentDate}" type="date" dateStyle="medium"/> </span>
                                    </div>
                                </div>
                            </div><!--//end .comment_scnd_content-->
                        </div><!--//end .comment_box-->
                       </c:forEach> 
                        
                    </div><!--//end #comment_box_brief-->
                    <div id="comment_pagination">
                        <a href="#" class="prev"></a>
                       <c:forEach items="${pageNumbers}" var="item">  
             <a href="${path2}activity/info.action?activityId=${activityId}&page=${item}">
             ${item}
             </a>
             </c:forEach>
                        <a href="#" class="next"></a>
                    </div>
                </div><!--//end #review_lftcol-->
                <div class="clear"></div>


            </div><!--//end #common_maincontent-->
            <div id="footer"><p>Copyright @ Tribus.us 2012.      <span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
   



   
  </body>
</html>
