<%@ page language="java" import="java.util.*,config.GlobleConfig,model.User" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			String size=(String) request.getAttribute("size");
			request.setAttribute("path1",GlobleConfig.pathPath);
			request.setAttribute("path2",GlobleConfig.pathPath1);
			User user=(User)session.getAttribute("user");
			
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>Upload_pics</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" media="screen,projection"
			href="${path1}activity/font/font.css" />
		<link rel="stylesheet" type="text/css" media="screen,projection"
			href="${path1}activity/css/style.css" />
			    <link href="${path1}activity/css/browser.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${path1}js/jquery-1.6.2.min.js"></script>			
		<script language="javascript">
	function get11() {
		$("#div11").show();
		$("#div12").hide();
	}
	function get12() {
		$("#div11").hide();
		$("#div12").show();
	}
		function get11() {
		$("#div11").show();
		$("#div12").hide();
	}
	function get22() {
		$("#div21").hide();
		$("#div22").show();
	}
		function get21() {
		$("#div21").show();
		$("#div22").hide();
	}
	function get32() {
		$("#div31").hide();
		$("#div32").show();
	}
		function get31() {
		$("#div31").show();
		$("#div32").hide();
	}
	function get32() {
		$("#div31").hide();
		$("#div32").show();
	}
		function get41() {
		$("#div41").show();
		$("#div42").hide();
	}
	function get42() {
		$("#div41").hide();
		$("#div42").show();
	}
		function get51() {
		$("#div51").show();
		$("#div52").hide();
	}
	function get52() {
		$("#div51").hide();
		$("#div52").show();
	}
		function get61() {
		$("#div61").show();
		$("#div62").hide();
	}
	function get62() {
		$("#div61").hide();
		$("#div62").show();
	}
	
			
</script>
  <style>
	.file {position:relative;right:-30px;top:4px;
	       width:0px;height:30px;filter:alpha(opacity=0);
			-moz-opacity:0;opacity:0;}
	</style>
	</head>

	<body>
		<div id="wrapper">
			<!--start wrapper-->
			<div id="header">
				<!--start header-->
				<div class="logo">
					<a href="${path2}activity/index.action"><img
							src="${path1}activity/img/logo.png" alt="" width="59"
							height="65" />
					</a>
				</div>
				<div id="header_rgt">
					<!--start header_rgt-->
					<div id="menu_bg">
						<div id="menu_lft">
							<div id="menu_rgt">
								<ul>
									<li class="current_page_item">
										<a href="${path2}activity/index.action">CITY</a>
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
										<a href="${path2}user/my.action" title="MY TRIBUS">MY TRIBUS</a>
									</li>
								</ul>
								<div class="header_search">
									<form action="#">
										<p class="txt_header">
											<input type="text" />
										</p>
										<p class="submit_header">
											<input type="submit" value=" " />
										</p>
									</form>
								</div>
								<div class="header_icon_area">
									<span class="space_btm"><a href="#"><img
												src="${path1}activity/img/icon_header1.png" alt=""
												width="10" height="11" />
									</a>
									</span>
									<span><a href="#"><img
												src="${path1}activity/img/icon_header2.png" alt=""
												width="12" height="13" />
									</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--//end #header_rgt-->
			</div>
			<!--//end #header-->
			<div id="main_area">
				<!--start main_area-->
				<div id="saerch_area">
					<!--start saerch_area-->
					<div id="search_bg" class="space_lft">
						<!--start search_bg-->
						<form action="${path2}activity/search.action">
                    	<p class="search_text"><input id="txt1" name="searchCondition" type="text" value="Seach for event name and city" onclick="if(this.value=='Seach for event name and city')(this.value='')"  onblur="if(this.value=='')(this.value='Seach for event name and city')" /></p>
                        <p class="search_submit"><input type="submit" value=" " /></p>
                    </form>
					</div>
					<!--//end #search_bg-->
					<div id="social_media">
						<!--start social_media-->
						<div id="social_lftcol">
							
						</div>
						<div id="social_box">
							<!--start social_box-->
							<div id="message">
								<a href="${path2}userMail/box/0/0.action"><img src="${path1}activity/img/icon_message1.jpg" alt="" width="22" height="22" /><c:if test="${unreadMail > 0}">
								<span>${unreadMail}</span>
							</c:if></a>
                            <a href="${path2}user/about.action"><img src="${path1}activity/img/icon_message2.jpg" alt="" width="22" height="22" /></a>
                            <a href="${path2}user/police.action"><img src="${path1}activity/img/icon_message3.jpg" alt="" width="22" height="22" /></a>
                            <a href="${path2}user/logout.action"><img src="${path1}activity/img/icon_message4.jpg" alt="" width="22" height="22" /></a>
							</div>
							<div class="address">
								<h3><%if(user!=null){ %><a href="${path2}user/my.action"><%=user.getUserAlias()%></a><%}else{ %><a href="${path2}user/login.action">login</a><%} %></h3>
								<span>${userProf.profCity}</span>
							</div>
						</div>
						<!--//end #social_box-->
					</div>
					<!--//end #social_media-->
				</div>
				<!--//end #saerch_area-->
				<div id="common_maincontent">
					<!--start common_maincontent-->
					<div id="edit_album_content">
						<!--start edit_album_content-->
						<div class="edit_album_widget">
							<!--start edit_album_widget-->
							<h2>
								Upload Pictures
							</h2>
							
							
							<div class="frame" id="container_1">
								<div class="icon_edit">
									<img src="${path1}activity/img/icon_edit.jpg" alt=""
										width="19" height="19" />
								</div>
							</div>
							<form method="post" name="form12" id="form_upload1"
				action="${path2}uploadForm/uploadAction.action"
				enctype="multipart/form-data" target="hidden_frame_1">

				
				<!-- input type="submit" value="submit" -->
				<span id="msg"></span>				
				<iframe name='hidden_frame_1' id="hidden_frame_1" style='display: none'></iframe>
			
							
							
									
			 <div class="persoanal_inp_field">
                                	<p class="inp_search">
									<input type="file" name="myfile" class="file" value=""  onchange="$('#form_upload1').submit();"  />	
									</p>
                              
                                	
                                </div>
			
		<input type="hidden" value="1" name="div_container_number" />
		</form>
							
								<!-- input type="text" id="btn-logo1" value=""/ -->
							</p>
							
							<div id="div11" <%if(!size.equals("0")){ %>style="display: none"<%} %>>
								
									
									<input type="hidden" name="hidden_para1_small" id="hidden_para1_small" value="" />
									<input type="hidden" name="hidden_para1_middle" id="hidden_para1_middle" value="" />
									<input type="hidden" name="hidden_para1_big" id="hidden_para1_big" value="" />
									<input type="text" name="albumName1" id="albumName1"/>

									<%if(!size.equals("0")){ %><a href="javascript:get12()">Album Existed</a><%}else {%>Name<%} %>
									
							</div>
							<%if(!size.equals("0")){ %>
							<div id="div12" class="edit_drop">
								<select name="albumId_select1" id="albumId_select1">
									<c:forEach items="${activityAlbumList}" var="item">
										<option value=${item.albumId}>
											${item.albumName}
										</option>
									</c:forEach>
								</select>
								<a href="javascript:get11()">New Album</a>
								
							</div><%} %>
							<p class="edit_message">
								<textarea name="picDescription1" id="picDescription1" rows="10" cols="10"
									onclick="if(this.value=='Introduction')(this.value='')"
									onblur="if(this.value=='')(this.value='Introduction')">Introduction</textarea>
							</p>
						</div>
										
						
						<!--//end .edit_album_widget-->
						
						 <div class="edit_album_widget"><!--start edit_album_widget-->
                    	<div class="frame" id="container_2">
                        	<div class="icon_edit"><img src="${path1}activity/img/icon_edit.jpg" alt="" width="19" height="19" /></div>
                        </div>
                        
                        <form method="post" name="form12" id="form_upload2"
				action="${path2}uploadForm/uploadAction.action"
				enctype="multipart/form-data" target="hidden_frame_2">

				
				<!-- input type="submit" value="submit" -->
				<span id="msg"></span>
				<iframe name='hidden_frame_2' id="hidden_frame_2" style='display: none'></iframe>
			
                       
                        <input type="file" name="myfile"  value="browser pic"  class="browser" onchange="$('#form_upload2').submit();"   /></p>
                        <input type="hidden" value="2" name="div_container_number" />
                        		</form>
                        		<div id="div21" <%if(!size.equals("0")){ %> style="display: none"<%} %>>
								
									
									<input type="hidden" name="hidden_para2_small" id="hidden_para2_small" value="" />
									<input type="hidden" name="hidden_para2_middle" id="hidden_para2_middle" value="" />
									<input type="hidden" name="hidden_para2_big" id="hidden_para2_big" value="" />
									<input type="text" name="albumName2" id="albumName2"/>

									<%if(!size.equals("0")){ %><a href="javascript:get22()">Album Existed</a><%}else{ %>Name<%} %>
									
							</div><%if(!size.equals("0")){ %>
							<div id="div22" class="edit_drop">
								<select name="albumId_select2" id="albumId_select2">
									<c:forEach items="${activityAlbumList}" var="item">
										<option value=${item.albumId}>
											${item.albumName}
										</option>
									</c:forEach>
								</select>
								<a href="javascript:get21()">New Album</a>
								
							</div><%} %>
                        <p class="edit_message">
                        	<textarea name="picDescription2" id="picDescription2" rows="10" cols="10" onclick="if(this.value=='Introduction')(this.value='')" onblur="if(this.value=='')(this.value='Introduction')">Introduction</textarea>
                        </p>
                    </div><!--//end .edit_album_widget-->
						
						<div class="edit_album_widget padding_rgt_null"><!--start edit_album_widget-->
                    	<div class="frame" id="container_3">
                        	<div class="icon_edit"><img src="${path1}activity/img/icon_edit.jpg" alt="" width="19" height="19" /></div>
                        </div>
                        
                        
                        <form method="post" name="form12" id="form_upload3"
				action="${path2}uploadForm/uploadAction.action"
				enctype="multipart/form-data" target="hidden_frame_3">

				
				<!-- input type="submit" value="submit" -->
				<span id="msg"></span>
				<iframe name='hidden_frame_3' id="hidden_frame_3" style='display: none'></iframe>
			
                        
                        
                        
                      <input type="file" name="myfile"   value="browser pic"  class="browser" onchange="$('#form_upload3').submit();"   /></p>
                        <input type="hidden" value="3" name="div_container_number" />
                        </form>
                       							<div id="div31" <%if(!size.equals("0")){ %>style="display: none"<%} %>>
								
									
									<input type="hidden" name="hidden_para3_small" id="hidden_para3_small" value="" />
									<input type="hidden" name="hidden_para3_middle" id="hidden_para3_middle" value="" />
									<input type="hidden" name="hidden_para3_big" id="hidden_para3_big" value="" />
									<input type="text" name="albumName3" id="albumName3"/>

<%if(!size.equals("0")){ %>									<a href="javascript:get32()">Album Existed</a><%}else{ %>Name<%} %>
									
							</div><%if(!size.equals("0")){ %>
							<div id="div32" class="edit_drop">
								<select name="albumId_select3" id="albumId_select3">
									<c:forEach items="${activityAlbumList}" var="item">
										<option value=${item.albumId}>
											${item.albumName}
										</option>
									</c:forEach>
								</select>
								<a href="javascript:get31()">New Album</a>
								
							</div><%} %>
                        <p class="edit_message">
                        	<textarea name="picDescription3" id="picDescription3" rows="10" cols="10" onclick="if(this.value=='Introduction')(this.value='')" onblur="if(this.value=='')(this.value='Introduction')">Introduction</textarea>
                        </p>
                    </div><!--//end .edit_album_widget-->
						
						<div class="clear"></div>
						
						 <div class="edit_album_widget"><!--start edit_album_widget-->
                    	<div class="frame" id="container_4">
                        	<div class="icon_edit"><img src="${path1}activity/img/icon_edit.jpg" alt="" width="19" height="19" /></div>
                        </div>
                        
                        
                        
                        <form method="post" name="form12" id="form_upload4"
				action="${path2}uploadForm/uploadAction.action"
				enctype="multipart/form-data" target="hidden_frame_4">

				
				<!-- input type="submit" value="submit" -->
				<span id="msg"></span>
				<iframe name='hidden_frame_4' id="hidden_frame_4" style='display: none'></iframe>
			
                       <input type="file" name="myfile"  value="browser pic"  class="browser" onchange="$('#form_upload4').submit();"   /></p>
                         <input type="hidden" value="4" name="div_container_number" />
                        </form>
                       							<div id="div41" <%if(!size.equals("0")){ %>style="display: none"<%} %>>
								
									
									<input type="hidden" name="hidden_para4_small" id="hidden_para4_small" value="" />
									<input type="hidden" name="hidden_para4_middle" id="hidden_para4_middle" value="" />
									<input type="hidden" name="hidden_para4_big" id="hidden_para4_big" value="" />
									<input type="text" name="albumName4" id="albumName4"/>
<%if(!size.equals("0")){ %>
									<a href="javascript:get42()">Album Existed</a><%}else{ %>Name<%} %>
									
							</div><%if(!size.equals("0")){ %>
							<div id="div42" class="edit_drop">
								<select name="albumId_select4" id="albumId_select4">
									<c:forEach items="${activityAlbumList}" var="item">
										<option value=${item.albumId}>
											${item.albumName}
										</option>
									</c:forEach>
								</select>
								<a href="javascript:get41()">New Album</a>
								
							</div><%} %>
                        <p class="edit_message">
                        	<textarea name="picDescription4" id="picDescription4" rows="10" cols="10" onclick="if(this.value=='Introduction')(this.value='')" onblur="if(this.value=='')(this.value='Introduction')">Introduction</textarea>
                        </p>
                    </div><!--//end .edit_album_widget-->
                    <div class="edit_album_widget"><!--start edit_album_widget-->
                    	<div class="frame" id="container_5">
                        	<div class="icon_edit"><img src="${path1}activ${path1}it.jpg" alt="" width="19" height="19" /></div>
                        </div>
                        
                        
                        <form method="post" name="form12" id="form_upload5"
				action="${path2}uploadForm/uploadAction.action"
				enctype="multipart/form-data" target="hidden_frame_5">

				
				<!-- input type="submit" value="submit" -->
				<span id="msg"></span>
				<iframe name='hidden_frame_5' id="hidden_frame_5" style='display: none'></iframe>
			
                      <input type="file" name="myfile" value="browser pic"  class="browser"  onchange="$('#form_upload5').submit();"   /></p>
                         <input type="hidden" value="5" name="div_container_number" />
                        </form>
                        							<div id="div51" <%if(!size.equals("0")){ %> style="display: none"<%} %>>
								
									
									<input type="hidden" name="hidden_para5_small" id="hidden_para5_small" value="" />
									<input type="hidden" name="hidden_para5_middle" id="hidden_para5_middle" value="" />
									<input type="hidden" name="hidden_para5_big" id="hidden_para5_big" value="" />
									<input type="text" name="albumName5" id="albumName5"/>
<%if(!size.equals("0")){ %>
									<a href="javascript:get52()">Album Existed</a><%}else{ %>Name<%} %>
									
							</div><%if(!size.equals("0")){ %>
							<div id="div52" class="edit_drop">
								<select name="albumId_select5" id="albumId_select5">
									<c:forEach items="${activityAlbumList}" var="item">
										<option value=${item.albumId}>
											${item.albumName}
										</option>
									</c:forEach>
								</select>
								<a href="javascript:get51()">New Album</a>
								
							</div><%} %>
                        <p class="edit_message">
                        	<textarea  name="picDescription5" id="picDescription5" rows="10" cols="10" onclick="if(this.value=='Introduction')(this.value='')" onblur="if(this.value=='')(this.value='Introduction')">Introduction</textarea>
                        </p>
                    </div><!--//end .edit_album_widget-->
                    <div class="edit_album_widget padding_rgt_null"><!--start edit_album_widget-->
                    	<div class="frame" id="container_6">
                        	<div class="icon_edit"><img src="${path1}activity/img/icon_edit.jpg" alt="" width="19" height="19" /></div>
                        </div>
                        
                        
                        
                        <form method="post" name="form12" id="form_upload6"
				action="${path2}uploadForm/uploadAction.action"
				enctype="multipart/form-data" target="hidden_frame_6">

				
				<!-- input type="submit" value="submit" -->
				<span id="msg"></span>
				<iframe name='hidden_frame_6' id="hidden_frame_6" style='display:none'></iframe>
			
                      <input type="file" name="myfile"  value="browser pic"  class="browser" onchange="$('#form_upload6').submit();"   /></p>
                        <input type="hidden" value="6" name="div_container_number" />
                        </form>
                       							<div id="div61" <%if(!size.equals("0")){ %>style="display: none"<%} %>>
								
									
									<input type="hidden" name="hidden_para6_small" id="hidden_para6_small" value="" />
									<input type="hidden" name="hidden_para6_middle" id="hidden_para6_middle" value="" />
									<input type="hidden" name="hidden_para6_big" id="hidden_para6_big" value="" />
									<input type="text" name="albumName6" id="albumName6"/>
<%if(!size.equals("0")){ %>
									<a href="javascript:get62()">Album Existed</a><%}else{ %>Name<%} %>
									
							</div><%if(!size.equals("0")){ %>
							<div id="div62" class="edit_drop">
								<select name="albumId_select6" id="albumId_select6">
									<c:forEach items="${activityAlbumList}" var="item">
										<option value=${item.albumId}>
											${item.albumName}
										</option>
									</c:forEach>
								</select>
								<a href="javascript:get61()">New Album</a>
								
							</div><%} %>
                        <p class="edit_message">
                        	<textarea name="picDescription6" id="picDescription6" rows="10" cols="10" onclick="if(this.value=='Introduction')(this.value='')" onblur="if(this.value=='')(this.value='Introduction')">Introduction</textarea>
                        </p>
                    </div><!--//end .edit_album_widget-->
                    <div class="clear"></div>
						
						<c:choose><c:when test="${flag==1}">
						
						<div class="save_edit">
							<input type="button" id="save_button" name="Save" value="Save" disabled=true onclick="javascript:getValues();">
						</div>
					</c:when>
					</c:choose>
					<div id="footer">
					<p>
						Copyright @ Tribus.us 2012.
						<span>All rights reserved</span>
					</p>
				</div>
					</div>
					<!--//end #edit_album_content-->
					
				</div>
									
									<script type="text/javascript">
									function getValues(){
									
										$("#desc1").attr('value',$("#picDescription1").val());
										$("#desc2").attr('value',$("#picDescription2").val());
										$("#desc3").attr('value',$("#picDescription3").val());
										$("#desc4").attr('value',$("#picDescription4").val());
										$("#desc5").attr('value',$("#picDescription5").val());
										$("#desc6").attr('value',$("#picDescription6").val());
							
									
										$("#albumId1").attr('value',$("#albumId_select1").val());
										$("#albumId2").attr('value',$("#albumId_select2").val());
										$("#albumId3").attr('value',$("#albumId_select3").val());
										$("#albumId4").attr('value',$("#albumId_select4").val());
										$("#albumId5").attr('value',$("#albumId_select5").val());
										$("#albumId6").attr('value',$("#albumId_select6").val());																			
									
										
										$("#pic_link1_small").attr('value',$("#hidden_para1_small").val());
										$("#pic_link2_small").attr('value',$("#hidden_para2_small").val());
										$("#pic_link3_small").attr('value',$("#hidden_para3_small").val());
										$("#pic_link4_small").attr('value',$("#hidden_para4_small").val());
										$("#pic_link5_small").attr('value',$("#hidden_para5_small").val());
										$("#pic_link6_small").attr('value',$("#hidden_para6_small").val());
										
										$("#pic_link1_middle").attr('value',$("#hidden_para1_middle").val());
										$("#pic_link2_middle").attr('value',$("#hidden_para2_middle").val());
										$("#pic_link3_middle").attr('value',$("#hidden_para3_middle").val());
										$("#pic_link4_middle").attr('value',$("#hidden_para4_middle").val());
										$("#pic_link5_middle").attr('value',$("#hidden_para5_middle").val());
										$("#pic_link6_middle").attr('value',$("#hidden_para6_middle").val());
										
										$("#pic_link1_big").attr('value',$("#hidden_para1_big").val());
										$("#pic_link2_big").attr('value',$("#hidden_para2_big").val());
										$("#pic_link3_big").attr('value',$("#hidden_para3_big").val());
										$("#pic_link4_big").attr('value',$("#hidden_para4_big").val());
										$("#pic_link5_big").attr('value',$("#hidden_para5_big").val());
										$("#pic_link6_big").attr('value',$("#hidden_para6_big").val());
										
								
									
										$("#albumNamee1").attr('value',$("#albumName1").val());
										$("#albumNamee2").attr('value',$("#albumName2").val());
										$("#albumNamee3").attr('value',$("#albumName3").val());
										$("#albumNamee4").attr('value',$("#albumName4").val());
										$("#albumNamee5").attr('value',$("#albumName5").val());
										$("#albumNamee6").attr('value',$("#albumName6").val());
									
										
										//$("#save_button").attr("disable","true");
										
										/**
										*
										*/
										$("#hidden_form").submit();
									}
									</script>
									
									<form method="post" action="${path2}activity/addPic.action?activityId=${activityId}" id="hidden_form">
									
										
										<input type="hidden" name="desc1" id="desc1" value="" />
										<input type="hidden" name="albumId1" id="albumId1" value="" />
										<input type="hidden" name="pic_link1_small" id="pic_link1_small" value="" />
										<input type="hidden" name="pic_link1_middle" id="pic_link1_middle" value="" />
										<input type="hidden" name="pic_link1_big" id="pic_link1_big" value="" />
										<input type="hidden" name="albumNamee1" id="albumNamee1" value=""/> 
										
										<input type="hidden" name="desc2" id="desc2" value="" />
										<input type="hidden" name="albumId2" id="albumId2" value="" />
										<input type="hidden" name="pic_link2_small" id="pic_link2_small" value="" />
										<input type="hidden" name="pic_link2_middle" id="pic_link2_middle" value="" />
										<input type="hidden" name="pic_link2_big" id="pic_link2_big" value="" />
										<input type="hidden" name="albumNamee2" id="albumNamee2" value=""/>
										
										<input type="hidden" name="desc3" id="desc3" value="" />
										<input type="hidden" name="albumId3" id="albumId3" value="" />
										<input type="hidden" name="pic_link3_small" id="pic_link3_small" value="" />
										<input type="hidden" name="pic_link3_middle" id="pic_link3_middle" value="" />
										<input type="hidden" name="pic_link3_big" id="pic_link3_big" value="" />
										<input type="hidden" name="albumNamee3" id="albumNamee3" value=""/>
										
										<input type="hidden" name="desc4" id="desc4" value="" />
										<input type="hidden" name="albumId4" id="albumId4" value="" />
										<input type="hidden" name="pic_link4_small" id="pic_link4_small" value="" />
										<input type="hidden" name="pic_link4_middle" id="pic_link4_middle" value="" />
										<input type="hidden" name="pic_link4_big" id="pic_link4_big" value="" />
										<input type="hidden" name="albumNamee4" id="albumNamee4" value=""/>
										
										<input type="hidden" name="desc5" id="desc5" value="" />
										<input type="hidden" name="albumId5" id="albumId5" value="" />
										<input type="hidden" name="pic_link5_small" id="pic_link5_small" value="" />
										<input type="hidden" name="pic_link5_middle" id="pic_link5_middle" value="" />
										<input type="hidden" name="pic_link5_big" id="pic_link5_big" value="" />
										<input type="hidden" name="albumNamee5" id="albumNamee5" value=""/>
										
										<input type="hidden" name="desc6" id="desc6" value="" />
										<input type="hidden" name="albumId6" id="albumId6" value="" />
										<input type="hidden" name="pic_link6_small" id="pic_link6_small" value="" />
										<input type="hidden" name="pic_link6_middle" id="pic_link6_middle" value="" />
										<input type="hidden" name="pic_link6_big" id="pic_link6_big" value="" />
									    <input type="hidden" name="albumNamee6" id="albumNamee6" value=""/>
									    
									</form>

									
				<!--//end #common_maincontent-->
				
			</div>
			<!--//end #main_area-->
		</div>
		<!--//end #wrapper-->
	</body>
</html>