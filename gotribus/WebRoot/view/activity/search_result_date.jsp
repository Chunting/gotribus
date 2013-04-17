<%@ page language="java" import="java.util.*,model.User,vo.SuperActivity,config.GlobleConfig" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/tld/fmt-rt.tld" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<SuperActivity> activityList=(List<SuperActivity>)request.getAttribute("activityList");
		User user=(User)session.getAttribute("user");	
		String condition=(String)request.getAttribute("condition");
		String owner=(String)request.getAttribute("owner");
	String day=(String)request.getAttribute("day");
	String month=(String)request.getAttribute("month");
request.setAttribute("path1",GlobleConfig.pathPath);
request.setAttribute("path2",GlobleConfig.pathPath1);
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Search Result</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/style.css" />
    
    <script type="text/javascript">
function search(){
var a =document.getElementById("txt1");
window.location.href="${path2}activity/search.action?searchCondition="+a.value;
}


var event1=null;
var event2=null;
 function followActivity(url,id){
  event1=id;

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
    http_request.onreadystatechange = getResult;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);		

    }
function getResult() {
    if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById(event1+"").value=http_request.responseText;	//设置提示内容

        } else {     													// 请求页面有错误
            alert("The service you requested is unavalible now！");
        }
    }
}

    var event2=null;
 function TribusList(url,id){
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
        alert("Cannot create XMLHttpRequest object instance！");
        return false;
    }
    http_request.onreadystatechange = getResultTribusList;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);	
    }
    
  function   getResultTribusList(){
        if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById(event2+"").innerHTML=http_request.responseText;;	//设置提示内容
 
        } else {     													// 请求页面有错误
            alert("The service you requested is unavalible now！");
        }
    }
    }
    
    
    
    
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
        alert("Cannot create XMLHttpRequest object instance！");
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
            alert("The service you requested is unavalible now！");
        }
    }
    }
  function joinActivity(url,id1,id2){
    event1=id1;
    event2=id2;

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
    http_request.onreadystatechange = getResult1;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);		
    
    }
    function getResult1() {
    if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById(event1+"").innerHTML="+  "+http_request.responseText;	//设置提示内容
if(http_request.responseText=="unJoin"){
document.getElementById(event2).innerHTML="+  Unfollow";
}
        } else {     													// 请求页面有错误
            alert("The service you requested is unavalible now！");
        }
    }
}

  function followActivity(url,id){
    event1=id;

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
    http_request.onreadystatechange = getResult2;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);		
    
    }
    function getResult2() {
    if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById(event1+"").innerHTML="+  "+http_request.responseText;	//设置提示内容

        } else {     													// 请求页面有错误
            alert("The service you requested is unavalible now！");
        }
    }
}
function setAtt(id){
  document.getElementById("hiddenField").value=id;
  
  }
 function submit(){
  resourceId=document.getElementById("hiddenField").value;
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
</script>
</head>

<body>
	<div id="wrapper"><!--start wrapper-->
    	<div id="header"><!--start header-->
        	<div class="logo"><a name="top" href="${path2}activity/index.action"><img src="${path1}activity/img/logo.png" alt="" width="59" height="65" /></a></div>
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
                    	<span class="space_btm"><a href="#"><img src="${path1}activity/img/icon_header1.png" alt="" /></a></span>
                        <span><a href="${path2}user/editForm.action"><img src="${path1}activity/img/icon_header2.png" alt="" /></a></span>
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
                        	<a href="${path2}userMail/box/0.action"><img src="${path1}activity/img/icon_message1.jpg" alt="" width="22" height="22" /><c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if></a>
                            <a href="${path2}user/about.action"><img src="${path1}activity/img/icon_message2.jpg" alt="" width="22" height="22" /></a>
                            <a href="${path2}user/police.action"><img src="${path1}activity/img/icon_message3.jpg" alt="" width="22" height="22" /></a>
                            <a href="${path2}user/logout.action"><img src="${path1}activity/img/icon_message4.jpg" alt="" width="22" height="22" /></a>
                        </div>
                        <div class="address">
                        	<h3>&nbsp;
                        	<%if(user!=null){ %><a href="${path2}user/my.action"><%=user.getUserAlias()%></a><%}else{ %><a href="${path2}user/login.action">login</a><%} %></h3>
                            <span>${userProf.profCity}</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="common_maincontent"><!--start common_maincontent-->
            	<div id="main_search_content"><!--start main_search_content-->
                	<div id="search_lftcol"><!--start search_lftcol-->
                    	<div class="search_title"><!--start search_title-->
                        	<h2>SEARCH: ACTIVITY</h2>
                            <div class="user_btn">
                            	
                                <%if(user!=null){ %><a href="${path2}activity/activityCreatInit.action" class="user_scnd">Create New</a><%} %>
                            </div>
                        </div><!--//end .search_title-->
                        <c:forEach items="${activityList}" var="item" varStatus="index">    
                        <div class="search_post"><!--start search_post-->
                        	<div class="search_post_lft"><a href="${path2}activity/info.action?activityId=${item.activity.activityId} "><img src=${item.activity.activityPic} alt="" width=134 height=179/></a></div>
                            <div class="search_info"><!--start search_info-->
                            	<h2><a href="${path2}activity/info.action?activityId=${item.activity.activityId} ">${item.activity.activityName }</a></h2>
                                <p>${item.activity.activityCity } ,${item.activity.activityStreet }<br />Start Date: <fmt:formatDate value="${item.activity.activityStartTime}" type="date" dateStyle="medium"/> <br />End Date: <fmt:formatDate value="${item.activity.activityFinishTime}" type="date" dateStyle="medium"/></p>
                                <span><a href="${path2}activity/info.action?activityId=${item.activity.activityId} "><img src="${path1}activity/img/tripple_arrow3.jpg" alt=""  width="25" height="8"/></a></span>
                                <ul>
                                	<li>
				                    <c:choose>
                                    <c:when test="${item.owner eq null}" >
                                	
                                	 <a id="at${index.index }"  href="javascript:joinActivity('${path2}activity/joinActivity.action?activityId=${item.activity.activityId }','at${index.index }','bt${index.index }')"><c:choose><c:when test="${item.joined eq true}">+ Unjoin</c:when> <c:otherwise>+ Join</c:otherwise></c:choose>
                                	</c:when >
                                	    <c:otherwise>
                                            You start it
                                          </c:otherwise>
                                          </c:choose></li>
                                    <li><a id="wishList${index.index}"   href="javascript:WishList('${path2}user/addWishList/city/${item.activity.activityId}.action','wishList${index.index}')">
                                    
                                    <c:choose><c:when test="${item.wish eq 'ok'}">
                                    Already Added
                                    </c:when>
                                    <c:otherwise>
                                    + Track List
                                    </c:otherwise>
                                    </c:choose>
                                    
                                    </a></li>
                                                        <li><a href="javascript:void(0)" onClick="setAtt(${item.activity.activityId}),showPop()">+ Tribus List</a></li>
                                                    
                                                    </ul>
                                                  <input type="hidden" id="hiddenField"  name="hiddenField" />
                            </div><!--//end .search_info-->
                        </div><!--//end .search_post-->
                       
                       </c:forEach>
                      
                      
                       <div id="follower_apgi">
 <c:choose>
 <c:when test="${resultSize != 0}">
 
             <a href="${path2}activity/searchByDay.action?page=<c:choose><c:when test="${current-1 == 0}">1</c:when><c:otherwise>${current-1}</c:otherwise></c:choose>&day=<%=day%>&&month=<%=month%>" class="prev"></a>
              <c:forEach items="${pageNumbers}" var="item">
            <a href="${path2}activity/searchByDay.action?page=${item}&day=<%=day%>&&month=<%=month%>">
             
             ${item}
             </a>&nbsp
            </c:forEach>
            
          <a href="${path2}activity/searchByDay.action?page=<c:choose><c:when test="${current == maxPage}">1</c:when><c:otherwise>${current+1}</c:otherwise></c:choose>&day=<%=day%>&&month=<%=month%>" class="next"></a>
                    	</c:when>
 </c:choose>
                    	</div>
                    </div><!--//end #search_lftcol-->
                   
                </div><!--//end #main_search_content-->
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
            <form name="form10" id="form10" action="" method="post">
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
   
   