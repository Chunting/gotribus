<%@ page language="java"
	import="java.util.*,model.User,model.Activity,model.ActivityAlbum,model.ActivityClassified,vo.ActivityGoingMax,vo.UserComment,config.GlobleConfig"
	pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%><%
	request.setAttribute("path2",GlobleConfig.pathPath1);
	request.setAttribute("path1",GlobleConfig.pathPath);
	User user=(User)session.getAttribute("user");
	List activityAlbumList=(List)request.getAttribute("activityAlbumList");
	int activityAlbumListSize= activityAlbumList.size();
	
	%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Edit Album</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="font/font.css" />
	<link rel="stylesheet" type="text/css" media="screen,projection"
			href="style.css" />
    <script type="text/javascript" src="${path1}js/jquery-1.6.2.min.js"></script>
<script>
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
                        	<a href="#"><img src="${path1}activity/img/icon_message1.jpg" alt="" /><c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if></a>
                            <a href="#"><img src="${path1}activity/img/icon_message2.jpg" alt="" /></a>
                            <a href="#"><img src="${path1}activity/img/icon_message3.jpg" alt="" /></a>
                            <a href="#"><img src="${path1}activity/img/icon_message4.jpg" alt="" /></a>
                        </div>
                        <div class="address">
                        	<h3>&nbsp;
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
            	<div id="edit_album_content"><!--start edit_album_content-->
                	<c:forEach items="${activityAlbumList}" var="item" varStatus="i">
					<c:choose>
					<c:when test="${i.index%3==2}">
					 <div class="edit_album_widget padding_rgt_null"><!--start edit_album_widget-->
					</c:when>
					<c:otherwise>
					<div class="edit_album_widget"><!--start edit_album_widget-->
					</c:otherwise>
					</c:choose>
					
                    	<h2>${item.albumName }</h2>
                    	<div class="frame">
                        	<a href="${path2}activity/showPicList.action?albumId=${item.albumId}"><img src="${item.albumCover}" alt="" width=192 height=192/></a>
                        	<div class="icon_edit"><img src="${path1}activity/img/icon_edit.jpg" alt="" width=19 height=19/></div>
							
                        </div>
						 <p class="edit_message">
                        	<textarea  <c:choose><c:when test="${flag==0}"> readonly=true </c:when></c:choose> id="picDescription${i.index }" name="picDescription${i.index }" rows="10" cols="10" onclick="if(this.value=='Introduction')(this.value='')" onblur="if(this.value=='')(this.value='Introduction')"><c:choose><c:when test="${item.albumDescription!=null}">${item.albumDescription}</c:when><c:otherwise>Introduction</c:otherwise></c:choose></textarea>
                        </p>
                    </div><!--//end .edit_album_widget-->
                   <c:choose>
					<c:when test="${i.index==2}">
                    <div class="clear"></div>
                    </c:when>
                    </c:choose>
                     <input type="hidden" name="albumId${i.index}" id="albumId${i.index}" value="${item.albumId }" />
                     </c:forEach>

                </div><!--//end #edit_album_content-->
                
                
       
                
            </div>
            
            <script type="text/javascript">
									function getValues(){
									
										$("#desc1").attr('value',$("#picDescription0").val());
										$("#desc2").attr('value',$("#picDescription1").val());
										$("#desc3").attr('value',$("#picDescription2").val());
										$("#desc4").attr('value',$("#picDescription3").val());
										$("#desc5").attr('value',$("#picDescription4").val());
										$("#desc6").attr('value',$("#picDescription5").val());
							
								        $("#albumIdd1").attr('value',$("#albumId0").val());
								        $("#albumIdd2").attr('value',$("#albumId1").val());
								        $("#albumIdd3").attr('value',$("#albumId2").val());
								        $("#albumIdd4").attr('value',$("#albumId3").val());
								        $("#albumIdd5").attr('value',$("#albumId4").val());
								        $("#albumIdd6").attr('value',$("#albumId5").val());
									    
												
									
										$("#hidden_form").submit();
									}
									</script>
									
									<form method="post" action="${path2}activity/editAlbum.action" id="hidden_form">
									
										
										<input type="hidden" name="desc1" id="desc1" value="" />
										<input type="hidden" name="albumIdd1" id="albumIdd1" value="" />
										
										
										<input type="hidden" name="desc2" id="desc2" value="" />
										<input type="hidden" name="albumIdd2" id="albumIdd2" value="" />
										
										<input type="hidden" name="desc3" id="desc3" value="" />
										<input type="hidden" name="albumIdd3" id="albumIdd3" value="" />
										
										<input type="hidden" name="desc4" id="desc4" value="" />
										<input type="hidden" name="albumIdd4" id="albumIdd4" value="" />
										
										<input type="hidden" name="desc5" id="desc5" value="" />
										<input type="hidden" name="albumIdd5" id="albumIdd5" value="" />
										
										<input type="hidden" name="desc6" id="desc6" value="" />
										<input type="hidden" name="albumIdd6" id="albumIdd6" value="" />
										<input type="hidden" name="activityId" id="activityId" value="${activityId}" />
									    
									</form>
            
            
            <!--//end #common_maincontent-->
            </div><!--//end #common_maincontent-->
            <%if(activityAlbumListSize>6){ %>
            <div id="follower_apgi">
                            <a href="#" class="prev"> </a>
                              <c:forEach items="${pageNumbers}" var="item">  
             <a href="${path2}activity/album.action?page=${item}&activityId=${activityId}">
             ${item}
             </a>&nbsp
            
            </c:forEach>
                            <a href="#" class="next"></a>
                    	</div>
                    	<%} %>
         
           
            <div id="back_to_top"><a href="#top"></a></div>
            <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
            <script src="js/back_to_top.js" type="text/javascript"></script>
        </div><!--//end #main_area-->
    </div><!--//end #wrapper-->
         <c:choose><c:when test="${flag==1}">
         <div class="btn_contact_field2" >
                                <br/>
                               	<a href="javascript:getValues();">Save</a>
                               	
                        </div>
</c:when></c:choose>

   
<div id="footer"><p> <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy;2012 goTribus |<span>All rights reserved</span> </p></div>
</body>
</html>                                                                                                   