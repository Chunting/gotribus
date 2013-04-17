<%@ page language="java"
	import="java.util.*,model.User,model.Activity,model.ActivityClassified,vo.ActivityGoingMax,vo.UserComment,config.GlobleConfig"
	pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
      Calendar ca = Calendar.getInstance();
      int year = ca.get(Calendar.YEAR);//获取年份
      int month=ca.get(Calendar.MONTH)+1;//获取月份
      int day=ca.get(Calendar.DATE);//获取日
	List<Activity> hottestActivityList =(List<Activity>)request.getAttribute("hottestActivityList");
	Activity latestActivity=(Activity)request.getAttribute("latestActivity");
	int year11;
	int month11;
	int day11;
	
	
	int year22;
	int month22;
	int day22;
	if(latestActivity!=null){
	year11=latestActivity.getActivityStartTime().getYear()+1900;
	 month11=latestActivity.getActivityStartTime().getMonth()+1;
	 day11=latestActivity.getActivityStartTime().getDate();
	
	
	 year22=latestActivity.getActivityFinishTime().getYear()+1900;
	 month22=latestActivity.getActivityFinishTime().getMonth()+1;
	 day22=latestActivity.getActivityFinishTime().getDate();
	}else{
	
	 year11=0;
	 month11=0;
	 day11=0;
	
	
	 year22=0;
	 month22=0;
	 day22=0;
	}
	
	List<ActivityGoingMax> activityGoingMaxList=(List<ActivityGoingMax>)request.getAttribute("activityGoingMaxList");
	//List<UserComment> commentListRandom=(List<UserComment>)request.getAttribute("commentListRandom");
	List<ActivityClassified> activityTagsList= (List<ActivityClassified>)request.getAttribute("activityTagsList");
	User u=(User)session.getAttribute("user");
	int day1=0;
	if(latestActivity!=null){
	day1=latestActivity.getActivityStartTime().getDate();}
request.setAttribute("path2",GlobleConfig.pathPath1);
	request.setAttribute("path1",GlobleConfig.pathPath);
	
	List days=(List<Integer>)request.getAttribute("days");
	
	int size1=0;
	if(request.getAttribute("size")!=null){
	size1=(Integer)request.getAttribute("size");
	}
	
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Welcome <%=u.getUserAlias()%></title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
		<link rel="stylesheet" type="text/css" media="screen,projection"
			href="font/font.css" />
		<link rel="stylesheet" type="text/css" media="screen,projection"
			href="style.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${path1}activity/css/slider.css" />
    
    
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
function search(){
var a =document.getElementById("txt1");
window.location.href="${path2}activity/search.action?searchCondition="+a.value;
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
<style type="text/css">
.STYLE1 {color: #FF0000}
</style>
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
                        <span><a href="${path2 }user/editForm.action"><img src="${path1 }activity/img/icon_header2.png" alt="" width="12" height="13" /></a></span>
                    </div>
                </div></div></div>
            </div><!--//end #header_rgt-->
        </div><!--//end #header-->
        <div id="main_area"><!--start main_area-->
        	<div id="saerch_area"><!--start saerch_area-->
            	<div id="search_bg"><!--start search_bg-->
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
                        	<h3 >&nbsp;
									<%if(u==null){%><a href="${path2}user/loginForm.action">login</a>
									<%}else{ %>
									<a href="${path2}user/my.action"><%=u.getUserAlias()%>
										</a><%} %> 
								</h3>
								<span  >${userProf.profCity}</span>
                        </div>
                    </div><!--//end #social_box-->
                </div><!--//end #social_media-->
            </div><!--//end #saerch_area-->
            <div id="main_content"><!--start main_content-->
            	<div id="content"><!--start content-->
            		<%if(hottestActivityList.size()!=0) {%>
                	<div id="banner">
                        <div class="">
                            <div class="sliderContent">
                                <div class="item">
                                    <a
								href="${path2}activity/info.action?activityId=<%=hottestActivityList.get(0).getActivityId()%>"><img
									src="<%=hottestActivityList.get(0).getActivityPic_big() %>"
									width="729" height="479" /> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="banner_title">
                    	 <h2><%=hottestActivityList.get(0).getActivityName() %></h2>
                         <h2><%=hottestActivityList.get(0).getActivityCity() %>,<%=hottestActivityList.get(0).getActivityState() %></h2>
                    </div>
                    <%} %>
                    <div class="event_box"><!--start event_box-->
                    	<div class="event_bg"><div class="event_top"><div class="event_btm">
                        	<div class="event_lftcol"><img src="${path1}activity/img/icon_star.jpg" alt="" width="38" height="37" /></div>
                            <div class="event_rgtcol">
                            	<h3>Your coming Events</h3>
                                <p><%if(latestActivity==null){ %>Oops,nothing for this month,EXPLORE NOW!<%}else{ %><a
													href="${path2}activity/info.action?activityId=<%=latestActivity.getActivityId() %>"><%=year11%>-<%=month11%>-<%=day11%>&nbsp~&nbsp<%=year22%>-<%=month22%>-<%=day22%>&nbsp<%=latestActivity.getActivityName() %>
													<%} %> </a></p>
                            </div>
                        </div></div></div>
                    </div><!--//end .event_box-->
                    <div class="calender"><!--start calender-->
                    	
                    	<div class="prev_home"><a href="javascript:void(0);"></a></div>
                        <ul>
                        	<%for(int i=1;i<29;i++){ %>
								<%if(days!=null&&days.contains(i)){%>
								<li >
									<a style="color:red"  href="${path2}activity/searchByDay.action?day=<%=i%>&month=<%=month%>"><%if(i<=9){%>0<%}%><%=i%></a>
								</li>
								<%}else{ %>
								<li><%if(day==i){ %> <u><%}%><a href="javascript:void(0);"><%if(i<=9){%>0<%}%><%=i %></a><%if(day==i){ %> </u><%}%></li>
								<%} %>
								<%} %>
								<% if((year%400==0)||((year%100!=0)&&(year%4==0))){//如果是闰年
   if(month==2){//如果是闰年的二月必有29%>
								<%if(days!=null&&days.contains(29)){%>
								<li >
									<a style="color:red" href="${path2}activity/searchBy.action?day=<%=29%>&month=<%=month%>"><%=29%></a>
								</li>
								<%}else{ %>
								<li><%if(day==29){ %> <u><%}%><a href="javascript:void(0);"><%=29 %></a><%if(day==29){ %> </u><%}%></li>
								<%} }}%>
								<%if(month!=2){//如果不是二月 必有29、30%>
								<%if(days!=null&&days.contains(29)){%>
								<li >
									<a style="color:red" href="${path2}activity/searchByDay.action?day=<%=29%>&month=<%=month%>"><%=29%></a>
								</li>
								<%}else{ %>
								<li><%if(day==29){ %> <u><%}%><a href="javascript:void(0);"><%=29 %></a><%if(day==29){ %> </u><%}%></li>
								<%}
								if(days!=null&&days.contains(30)){%>
								<li>
									<a style="color:red"  href="${path2}activity/searchByDay.action?day=<%=30%>&month=<%=month%>"><%=30%></a>
								</li>
								<%}else{ %>
								<li><%if(day==30){ %> <u><%}%><a href="javascript:void(0);"><%=30 %></a><%if(day==30){ %> </u><%}%></li>
								<%} 
								 }%>

								<%if((month==1)||(month==3)||(month==5)||(month==7)||(month==8)||(month==10)||(month==12) ){System.out.println(month);%>
								<%if(days!=null&&days.contains(31)){%>
								<li>
									<a style="color:red"  href="${path2}activity/searchByDay.action?day=<%=31%>&month=<%=month%>"><%=31%></a>
								</li>
								<%}else{ %>
								<li><%if(day==31){ %> <u><%}%><a href="javascript:void(0);"><%=31 %></a><%if(day==31){ %> </u><%}%></li>
								<%} }%>
                        </ul>
                        <div class="month"><span><%=new Date().toString().substring(4, 7)%></span></div>
                        <div class="next_home"><a href="javascript:void(0)"></a></div>
                    </div><!--//end .calender-->
                    <div class="ranger"><img src="${path1 }activity/img/bgr_ranger.png" alt="" width="615" height="16" /></div>
<c:choose>
							<c:when test="${flag==1}">
                  
                   <div class="event_btn">
									<a href="${path2}activity/activityCreatInit.action"><span><span>Create Event</span> </span> </a>
								</div>
							</c:when>
						</c:choose>
                    <div id="common_content_area"><!--start common_content_area-->
                    
                    	

							<c:forEach items="${commentListRandom}" var="item" varStatus="i">
                      
                        <div class="common_box"><!--start common_box-->
                        <%if(size1!= 1) {%>
                        <c:choose>
                        <c:when test="${i.index == 0}">
                        
                        <div class="title">
											<h2>
												Friend Footprint
											</h2>
					    </div>
                        
                        </c:when>
                        </c:choose>
                        <%}else{%>
                        
                        <c:choose>
                        <c:when test="${i.index == 0}">
                        
                        <div class="title">
											<h2>
												Recommendation
											</h2>
					    </div>
                        
                        </c:when>
                        </c:choose>
                        <%} %>
                        	<div class="common_box_bg"><div class="common_box_top"><div class="common_box_btm">
                            	<div class="scnd_feature"><!--start scnd_feature-->
                                	<div class="red_arrow_home"></div>
                                	<div class="scnd_feature_lft"><!--start scnd_feature_lft-->
                                    	<a href="${path2}activity/info.action?activityId=${item.activity.activityId }"><img
																src="${item.activity.activityPic}" alt="" width=137
																height=187 /> </a>
                                        <div class="feature_info">
                                        	<div class="feature_txt">
                                            	<p>
                                            	<a	href="${path2}activity/info.action?activityId=${item.activity.activityId}">${item.activity.activityName}</a>
																	<br />
																	${item.activity.activityCity}&nbsp
																	${item.activity.activityStreet}
																	<br />
																	${item.activity.activityState }&nbsp
																	<br />
																	Fee: $ ${item.activity.activityFeesFrom } <c:choose><c:when test="${!empty item.activity.activityFeesTo}">~ $ ${item.activity.activityFeesTo }</c:when></c:choose> each
                                            	
                                            	</p>
                                            </div>
                                            <div class="feature_social">
                                                <div class="feature_icon">
                                                     
    <script src='http://connect.facebook.net/en_US/all.js'></script>
                                	
                                                    <a onclick='postToFeed(); return false;'><img src="${path1}activity/img/icon_facebook.jpg" alt="" width="24" height="24" /></a>
                                                    <a ><img src="${path1}activity/img/icon_tweet.jpg" alt="" width="24" height="24"  /></a>
                                                <p id='msg'></p>
                                                 <script> 
      FB.init({appId: "167819743335514", status: true, cookie: true});

      function postToFeed() {
var str='http://gotribus.com/activity/info.action?activityId=${item.activity.activityId}';
        // calling the API ...
        var obj = {
          method: 'feed',
          link: str,
          picture: '${item.activity.activityPic_big}',
          name: "${item.activity.activityName}",
         
          description: "${item.brief}"
        };

        function callback(response) {
          
        }

        FB.ui(obj, callback);
      }
    
    </script> 
                                                </div>
                                                <div class="feature_list">
                                                    <ul>
                                                        <li><a id="wishList${i.index}"   href="javascript:WishList('${path2}user/addWishList/city/${item.activity.activityId}.action','wishList${i.index}')">${item.wish}</a></li>
                                                        <li><a href="javascript:void(0)" onClick="setAtt(${item.activity.activityId}),showPop()">+ Tribus List</a></li>
                                                    
                                                    </ul>
                                                  <input type="hidden" id="hiddenField"  name="hiddenField" />
                                                </div>
                                        	</div>
                                        </div>
                                    </div><!--//end .scnd_feature_lft-->
                                    <div class="scnd_feature_rgt">
                                    	<ul>
                                        	<c:forEach items="${item.userComments}" var="item">
																<li>
																	<span><a href="${path2}user/friendHome/${item.userId}.action"><img
																				src="${item.userPic}" alt="" width=41 height=39 />
																	</a> </span><small>: ${item.userComment}</small>
																</li>
															</c:forEach>
                                        </ul>
                                    </div>
                                </div><!--//end .scnd_feature-->
                            </div></div></div>
                        </div><!--//end .common_box-->
                        
                        	</c:forEach>
							<div id='fb-root'></div>
                    </div><!--//end #common_content_area-->
                </div><!--//end #content-->
                <div id="side_bar"><!--start side_bar-->
                	<!--//end .blue_widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Top News</h2>
                    	<c:forEach items="${activityGoingMaxList}" var="item">
                        <div class="bar_widget">
                        	<a href="${path2}activity/info.action?activityId=${item.activityId }"><img
											src="${item.picPath}" width="65" height="96" /> </a>
                            <div class="bar_info">
                            	<h3><a href="${path2}activity/info.action?activityId=${item.activityId }">${item.activityName
												} </h3>
                                <span>Starter: ${item.userName }</span>
                                <p>Open:${item.activityStartTime }
											<br /></p>
                                <div class="join"><small>${item.numbers} (people)</small>      <a>Join in</a></div>
                            </div>
                            
                        </div>
                         </c:forEach>
                    </div><!--//end .widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Tag</h2>
                        <div class="widget_info">
                        	<p><c:forEach items="${activityTagsList}" var="tags">
                        	
                        	<a href="${path2}activity/searchByTag.action?tagName=${tags.classifiedName}">
                        		${tags.classifiedName}
                        	</a>/
                        	
                        	</c:forEach></p>
                        </div>
                    </div><!--//end .widget-->
                    <div class="widget"><!--start widget-->
                    	<h2>Top City</h2>
                        <div class="widget_info">
                        	<ul>
                            	<c:forEach items="${topTribusCity}" var="item">
										<li>
											<a href="${path2}activity/byCityTag.action?city=${item}">${item}</a>
										</li>
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
  <script src="${path1}activity/js/jquery.min.js" type="text/javascript"></script>
	<script src="${path1}activity/js/mobilyslider.js" type="text/javascript"></script>
    <script src="${path1}activity/js/fade.js" type="text/javascript"></script>
    <script src="${path1}activity/js/smoothscroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path1}activity/js/code.js"></script>

</body>
</html>                                                                                                   