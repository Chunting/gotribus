<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c" %><%
%><%@ page import="config.GlobleConfig" %><%
	request.setAttribute("domain",GlobleConfig.localhost);
	request.setAttribute("no_view_url",GlobleConfig.show_local);
 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Welcome to tribus , this is a place have fun ! </title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/css/style.css" />
   <link rel="shortcut icon" href="http://www.gotribus.com/view/images/LOGO_32.png"/>
 	<!--link rel="stylesheet" href="${domain}user/fancybox/fancy_style.css" /-->		
	<link rel="stylesheet" type="text/css" href="${domain}user/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
    <!-- Jquery -->
	<script type="text/javascript" src="${domain }js/jquery-1.6.2.min.js"></script>
	
	<!-- fancy box -->
	<script type="text/javascript" src="${domain}user/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${domain}user/fancybox/jquery.fancybox-1.3.4.pack.js"></script>

	<!-- facebook -->
	<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>	

	<!-- md5 -->
    <script type="text/javascript" src="${domain }js/md5.js"></script>
    <script type="text/javascript">
	
		var face_flag = false;
		var i = 0;
    	function check(){		   
		   $("input").each(
	   		function(){
				i++;			
				if((this.required == true || this.required == "true") && $.trim(this.value) == ""){
				}
				if(this.name == "email" && !IsEmail(this.value)){
                    i=0;
					alert("please fill in a proper email ^_^");
					return false;
				}
				if( (this.isNumber == true || this.isNumber == "true") && !$.isNumeric(this.value)){
                    i=0;
					alert("please fill in a integer ^_^");		
					return false;
				}							
				if(this.name == "userPw"){ this.value = MD5(this.value);}								
			});	
			if($('#term').css('background-image').indexOf('un_select') > -1){
				alert("Please confirm our term !");
				return false;
			}
					if(i>=3){$("#form_normal").submit();}
    	}
    	
    	    	    	
	    function IsEmail(email) {
		  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		  return regex.test(email);
		}
		
		var flag = true;
		$(document).ready(function(){						
				

			$("#about").fancybox({
				'overlayColor'		: '#000',
				'overlayOpacity'	: 0.6,
				'width'				: '750'
			});
			

			$("#about").click();

				$('#pwd').keydown(function(event) {
  					if (event.which == 13) {
     					check();
   					}      
				});
		
				$("#pwd").focus( function() {
					this.value = "";
					this.type = "password";
				});   									
				
							
				$("#term").css("background-image","url(${domain}user/img/un_select.jpg)");
				$("#term").click(function(){
					if($('#term').css('background-image').indexOf('un_select') > -1){						
						$(this).css("background-image","url(${domain}user/img/blue_round.jpg)");					
					}else{						
						$(this).css("background-image","url(${domain}user/img/un_select.jpg)");						
					}
				});
				

		        $("#remb").css("background-image","url(${domain}user/img/un_select.jpg)");
				$("#remb").click(function(){
					if(flag){
						flag = false;
						$("#remember").attr("value",1);
						$(this).css("background-image","url(${domain}user/img/blue_round.jpg)");						
					}else{
						flag = true;
						$("#remember").attr("value",0);
						$(this).css("background-image","url(${domain}user/img/un_select.jpg)");						
					}
				});
				
				<c:if test="${isRem == 1}">
					flag = false;
					$("#remember").attr("value",1);
					$("#remb").css("background-image","url(${domain}user/img/blue_round.jpg)");
				</c:if>									

				/*************** FB  **/
		
				/*************** FB ****/
		});
		
		function flogin(){

			face_flag = true;
				FB.login(
					function(response) {},
				    { scope: 'publish_actions,user_about_me,email' }
				);		

		}
    </script>
</head>

<body class="welcome_bg">
<!-- FB div start -->
<div id="fb-root"></div>
<!-- FB div end -->
	<div class="welcome_white_box"><br /><br /><!--start welcome_white_box-->
    	<form action="login.action" method="post" id="form_normal">
        	<div class="welcome_logo">
        	<a href="#"><img src="${domain }user/img/logo_welcome.jpg" alt="" /></a></div>
            <h2 class="title_welcome">Let's go Tribus</h2>
            <div class="user_account"><!--start user_account-->            
            	<p class="welcome_txt">


<c:if test="${i_name == null}">
<input type="text" name="email" required="false" value="${email}" 
onclick="if(this.value=='${email}')(this.value='')"  onblur="if(this.value=='')(this.value='${email}')" />
</c:if>


<c:if test="${i_name != null}">
<input type="text" name="email" required="false" value="${i_name}" 
onclick="if(this.value=='${i_name}')(this.value='')"  onblur="if(this.value=='')(this.value='${i_name}')" />
</c:if>

</p>			
<p class="welcome_txt">	
	<input type="hidden" name="remember" id="remember" value="${isRem}" />
<input type="text" required="false" name="userPw" id="pwd" value="password" /></p>
			<span class="remind_me">							
			</span>
             <span class="remind_me"><a href="#" id="remb">Remember Me</a></span>        

			 <span class="remind_me"><a href="#" id="term">Agree with our term</a></span> 

                <div class="enter"><a href="javascript: check();"><b>ENTER</b></a></div>
                <div class="or_sign_by">
                	<p>Or sign in with: 
					<a href="javascript: flogin();">
						<img src="${domain }user/img/icon_facebook.jpg" alt="" />
					</a>
					</p>
                    <p><a href="#">By agree with our term </a></p>
                    <!--p><a href="error_input.action">Forgot your password?</a></p-->
                </div>
            </div><!--//end .user_account-->
            <div id="request_invitation"  align="center">            			
			<!--img src="c_n.jpg" width="95px" height="18px"/-->
			&copy; 2012 goTribus			
            </div>            
            <c:if test="${message != null}">	            			            		
	            		<div class="error space_error">                
                			<span>!!! ${message} </span>
            			</div>	        					            		
            </c:if>
        </form>         
			<form action="${no_view_url}user/loginFace.action" id="face_form">
						<input type="hidden" name="face_email" value="" />
						<input type="hidden" name="face_name" value="" />
						<input type="hidden" name="uid" value="" />
						<input type="hidden" name="pic_big" value="" />
						<input type="hidden" name="hometown" value="" />
						<input type="hidden" name="about_me" value="" />
     		</form>
    </div><!--//end #welcome_white_box-->    

		<a id="about" href="${domain}user/img/ABOUT_PAGE.jpg" title="about page"></a>
</body>
<script type="text/javascript">
		//************************* Face book login
        window.fbAsyncInit = function() {
          FB.init({
            appId      : '167819743335514', // App ID
            channelUrl : 'http://gotribus.com/channel.html', // Channel File
            status     : true, // check login status
            cookie     : true, // enable cookies to allow the server to access the session
            xfbml      : true  // parse XFBML
          });
        };
		//************************* Face book login end
		
		FB.Event.subscribe('auth.authResponseChange', function(response) {
			var tok = response.authResponse.accessToken;
			if($.trim(tok)!=""){						
			$.getJSON(  								
				"https://graph.facebook.com/fql?q=select email,name , uid, pic_big ,hometown_location,about_me from user where uid=me()&access_token="+tok, 
				function(data) {  
					if($.trim(data.data[0].name) != "" && face_flag){
					
						var email = data.data[0].email;
						$("input[name=face_email]").attr("value",email);
					    
						var uid = data.data[0].uid;
						$("input[name=uid]").attr("value",uid);

						var pic_big = data.data[0].pic_big;
						$("input[name=pic_big]").attr("value",pic_big);

						var hometown_location = data.data[0].homwtown_location;
						$("input[name=hometown]").attr("value",hometown_location);

						var about_me = data.data[0].about_me;
						$("input[name=about_me]").attr("value",about_me);

						var name = data.data[0].name;
						$("input[name=face_name]").attr("value",name);

						$("#face_form").submit();
//						document.write("${no_view_url}user/loginFace/"+email+"/"+name+"/"+uid+"/"+pic_big+"/"+hometown_location+"/"+about_me+".action");
						//window.location.href = "${no_view_url}user/loginFace/"+email+"/"+name+"/"+uid+"/"+pic_big+"/"+hometown_location+"/"+about_me+"/.action";
					}
				}  
			 );
			}
		}
		);

</script>
</html>                                                                                                  