<%@ page language="java"
	import="java.util.*,model.User,vo.MyActivity,model.Activity,model.ActivityClassified,vo.ActivityGoingMax,vo.UserComment,config.GlobleConfig"
	pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%><%
	List<User> friends=(List<User>) request.getAttribute("friends");
User user=(User)session.getAttribute("user");
List<MyActivity> activity=(List<MyActivity>) request.getAttribute("activityList");
String detail=null;
String condition=(String)request.getAttribute("condition");
	request.setAttribute("path2",GlobleConfig.pathPath1);
	request.setAttribute("path1",GlobleConfig.pathPath);
	%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>My Activity</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="font/font.css" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="style.css" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="css/css3.css" />
    <!--[if lt IE 10]>
   		<script src="js/PIE.js" type="text/javascript"></script>
    <![endif]-->


 <script type="text/javascript">
function search(){
var a =document.getElementById("txt1");
window.location.href="${path2}activity/search.action?searchCondition="+a.value;
}


var event1=null;
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
  function joinActivity(url,id){
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
    http_request.onreadystatechange = getResult1;							//调用返回结果处理函数
    http_request.open('GET', url, true);								//创建与服务器的连接
    http_request.send(null);		
    
    }
    function getResult1() {
    if (http_request.readyState == 4) {     							// 判断请求状态
        if (http_request.status == 200) {     							// 请求成功，开始处理返回结果
            document.getElementById(event1+"").value=http_request.responseText;	//设置提示内容

        } else {     													// 请求页面有错误
            alert("The service you requested is unavalible now！");
        }
    }
}
 
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
        	<div class="logo"><a name="top" href="${path2}activity/index.action"><img src="${path1 }activity/img/logo.png" alt="" width="59" height="65" /></a></div>
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
                        <span><a href="${path2}user/editForm.action"><img src="${path1 }activity/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
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
                        	<%if(user!=null){ %><a href="${path2}user/friendHome/<%=user.getUserId()%>.action"><%=user.getUserAlias()%></a><%}else{ %><a href="${path2}user/loginForm.action">login</a><%} %></h3>
                            <span>${userProf.profCity}</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="main_content"><!--start main_content-->
            	<div id="content"><!--start content-->
                	<div id="title_my_activity"><!--start title_my_activity-->
                    	<h2>More Activity</h2>
                    	<div id="fiona_inner">
                           <%if(user!=null){ %><a href="${path2}user/friendHome/<%=user.getUserId()%>.action"><img src="<%=user.getUserPic()%>" alt="" width="70" height="70"/></a><%}else{%>   <img src="${path1}activity/img/pic_activity.jpg" alt="" /><%} %>
                            <div class="activity_rgt">
                                
                            </div>
                        </div>
                    </div><!--//end #title_my_activity-->
                   <%for(int i=0;i<activity.size();i++) {%>
                                   <div class="activity_common_box"><!--start activity_common_box-->
                    	<div class="activity_bg"><div class="activity_top"><div class="activity_btm">
                        	<div class="scnd_activity_cont"><!--start scnd_activity_cont-->
                            	<div class="red_arrow"></div>
                            	<div class="activity_feature_lft"><!--start activity_feature_lft-->
                            	
                                	<a href="${path2}activity/info.action?activityId=<%=activity.get(i).getActivity().getActivityId() %>"><img src="<%=activity.get(i).getActivity().getActivityPic() %>" alt="" width=118 height=161/></a>
                                    <div class="activity_descript"><!--start activity_descript-->
                                    
                                    <div class="descript_info">
                                        	<p><a href="${path2}activity/info.action?activityId=<%=activity.get(i).getActivity().getActivityId() %>"><%=activity.get(i).getActivity().getActivityName() %></a>
                                        	<br /> Start: <%=activity.get(i).getActivity().getActivityStartTime().getYear()+1900 %>-<%=activity.get(i).getActivity().getActivityStartTime().getMonth()+1 %>-<%=activity.get(i).getActivity().getActivityStartTime().getDate() %><br /> 
                                        	End:   &nbsp<%=activity.get(i).getActivity().getActivityFinishTime().getYear()+1900 %>-<%=activity.get(i).getActivity().getActivityFinishTime().getMonth()+1 %>-<%=activity.get(i).getActivity().getActivityFinishTime().getDate() %><br /> 
                                        	</p>
                                            <p>Fee: <%=activity.get(i).getActivity().getActivityFeesFrom()%><%if(activity.get(i).getActivity().getActivityFeesTo()!=null){ %> ~ <%=activity.get(i).getActivity().getActivityFeesTo()%><%} %></p>
                                        </div>
                                        
                                        
                                    	
                                       
                                        <div class="feature_social"><!--start feature_social-->
                                            <div class="activity_icon">
                                                <div id='fb-root'></div>
    <script src='http://connect.facebook.net/en_US/all.js'></script>
    <a onclick='postToFeed(); return false;'><img src="${path1}activity/img/icon_facebook.jpg" alt="" /></a>
         <a href="#"><img src="${path1}activity/img/icon_tweet.jpg" alt="" /></a>
         <p id='msg'></p>
                              <script> 

      FB.init({appId: "167819743335514", status: true, cookie: true});



      function postToFeed() {



        // calling the API ...

        var obj = {

          method: 'feed',

          link: 'https://developers.facebook.com/docs/reference/dialogs/',

          picture: 'http://fbrell.com/f8.jpg',

          name: '<%=activity.get(i).getActivity().getActivityName()%>',

          
<%String brief=activity.get(i).getActivity().getActivityDetail().split("\\.")[0];
brief+="...";%>
          description: "<%=brief%>"

        };



        function callback(response) {

         

        }



        FB.ui(obj, callback);

      }

    

    </script>
                              
                                            </div>
                                            <div class="feature_list">
                                                <ul>
              <li><a id="wishList<%=i %>" href="javascript:WishList('${path2}user/addWishList/city/<%=activity.get(i).getActivity().getActivityId() %>.action','wishList<%=i %>')"><%=activity.get(i).getWish() %></a></li>
                                              <li><a href="javascript:void(0)" onClick="setAtt(<%=activity.get(i).getActivity().getActivityId() %>),showPop()">+ Tribus List</a></li>
                                                 <input type="hidden" id="hiddenField"  name="hiddenField" />
                                                </ul>
                                            </div>
                                        </div><!--//end .feature_social-->
                                    </div><!--//end .activity_descript-->
                                </div><!--//end .activity_feature_lft-->
                                <div class="activity_feature_rgt">
                                	<ul>
                                	<%for(int p=0;p<activity.get(i).getUserComments().size();p++){ %>
                                        <li><span><a href ="${path2}user/friendHome/<%=activity.get(i).getUserComments().get(p).getUserId() %>.action"><img src="<%=activity.get(i).getUserComments().get(p).getUserPic() %>" alt="" width=34 height="34"/></a></span><small>: <%=activity.get(i).getUserComments().get(p).getUserComment() %></small></li>
                                       
                              <% if(p==3){break;}}
                              %>
                                    </ul>
                                </div>
                            </div><!--//end .scnd_activity_cont-->
                        </div></div></div>
                    </div><!--//end .activity_common_box-->
               
               
          <%} %>
               
                                      <div id="follower_apgi">
                                <c:choose>
 <c:when test="${resultSize != 0}">     
                            <a  href="${path2}activity/myActivity.action?page=<c:choose><c:when test="${current-1 == 0}">1</c:when><c:otherwise>${current-1}</c:otherwise></c:choose>" class="prev"></a>
             
              <c:forEach items="${pageNumbers}" var="item">  
             <a href="${path2}activity/myActivity.action?page=${item}">
             ${item}
             </a>
            </c:forEach>
             <a  href="${path2}activity/myActivity.action?page=<c:choose><c:when test="${current == maxNumber}">${maxNumber}</c:when><c:otherwise>${current+1}</c:otherwise></c:choose>" class="next"></a>
                    	</c:when>
                    	</c:choose>
                    	</div>
                </div><!--//end #content-->
               
                <div id="side_bar"><!--start side_bar-->
                    <div class="widget"><!--start widget-->
                    	<h2>Followers</h2>
                        <div class="small_img_widget"><!--start small_img_widget-->
                        	<c:forEach items="${friends}" var="item">
                        	<a href="${path2}user/friendHome/${item.userId }.action"><img src="${item.userPic}" alt="" width=34 height=34/></a>
                          </c:forEach>
                            <div class="clear"></div>
                        </div><!--//end .small_img_widget-->
                      
                    </div><!--//end .widget-->
                   
                   
                    <div class="widget"><!--start widget-->
                    	<h2>Guess You Like</h2>
                    	<c:forEach items="${recommentActivity}" var="item">
                        <div class="widget_gallery">
                        	<a href="${path2}activity/info.action?activityId=${item.activityId }"><img src="${item.activityPic_small}" alt="" width=222 height=133/></a>
                            <h3><a href="${path2}activity/info.action?activityId=${item.activityId}">${item.activityName }</a></h3>
                        </div>
                       </c:forEach>
                       
                     
                    </div><!--//end .widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Top Citys</h2>
                        <div class="widget_info">
                        	<ul>
                        	<c:forEach items="${topTribusCity}" var="item">
                            	<li><a href="${path2}activity/byCityTag.action?city=${item}">${item}</a></li>
                               </c:forEach>
                            </ul>
                         
                        </div>
                    </div><!--//end .widget-->
                </div><!--//end #side_bar-->
            </div><!--//end #main_content-->
           <div id="footer"><p> &copy;2012 goTribus |<span>All rights reserved</span> </p></div>
            <div id="back_to_top"><a href="#top"></a></div>
            <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
            <script src="js/back_to_top.js" type="text/javascript"></script>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
    
    <div id="popup_layer" onClick="closePop()"></div>   
    <div id="light_box_wrapper"><!--start light_box_wrapper-->
        <div id="light_box_bg"><!--start light_box_bg-->
            <div class="pop_up_cross"> <a href="javascript:void(0)" onClick="closePop()"></a></div>
            <h2>Add to list</h2>
            <form name="form10" id="form10" action="" method="post">
                <p>
                    <select id="tribusClassify" name="tribusClassify">	
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