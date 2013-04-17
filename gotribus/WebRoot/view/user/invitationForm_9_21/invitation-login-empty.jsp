<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c" %><%
%><%@ page import="config.GlobleConfig" %><%
	request.setAttribute("domain",GlobleConfig.localhost);
	request.setAttribute("no_view_url",GlobleConfig.show_local);
 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>welcome! Tribus is a place you can have fun!</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain}user/invitationForm_9_21/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${domain}user/fancybox/jquery.fancybox-1.3.4.css" media="screen" /> 
    <script type="text/javascript" src="${domain }js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="${domain}user/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${domain}user/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<!-- facebook -->
	<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>	
	<!-- md5 -->
    <script type="text/javascript" src="${domain }js/md5.js"></script>
    <script type="text/javascript">	
		

		var face_flag = false;
		var i = 0;

		function check_register(){		   
		   $("input").each(
	   		function(){
				i++;			
				if((this.required == true || this.required == "true") && $.trim(this.value) == ""){
					i = 0;
					alert("please fill in a proper "+this.name+" ^_^");
					return false;
				}
				if(this.name == "userEmail" && !IsEmail(this.value)){
	  				i=0;
					alert("please fill in a proper email ^_^");
					return false;
				}
				if( (this.isNumber == true || this.isNumber == "true") && !$.isNumeric(this.value)){
                    i=0;
					alert("please fill in a proper number ^_^");		
					return false;
				}
				//alert(MD5(this.value));
				if(this.name == "userPw"){ this.value = MD5(this.value);}				
			});								
				if(i>=4){$("#form_res").submit();}
    	}

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
					if(i>=3){$("#form_normal").submit();}
    	}
    	
    	    	    	
	    function IsEmail(email) {
		  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		  return regex.test(email);
		}

		var flag = true;
		$(document).ready(function(){		
			
			<c:if test="${ft != 1}">
			$("#about").fancybox({
				'overlayColor'		: '#000',
				'overlayOpacity'	: 0.6,
				'width'				: '205%',
				'autoScale'			: false
			});
			

			$("#about").click();
			</c:if>


			$("input[name=userPw]").focus( function() {
					this.value = "";
					this.type = "password";
				});	

			var windowobj = $(window);
	    	var browserwidth = windowobj.width();
			var browserheight = windowobj.height();
			//center
			if (!$.browser.safari || $.browser.version < '600.0') {
				$(".welcome_white_box").css("top",(browserheight - 540) / 2);
				$(".welcome_white_box").css("left",(browserwidth - 400) / 2);
			} else if ($.browser.safari && $.browser.version > '600.0') {
				$(".welcome_white_box").css("top",(browserheight - 440) / 2);
				$(".welcome_white_box").css("left",(browserwidth - 400) / 2);
			}
			
				$('#pwd').keydown(function(event) {
  					if (event.which == 13) {
     					check();
   					}      
				});
		
				$("#pwd").focus( function() {
					this.value = "";
					this.type = "password";
				});   									
				
								
				$(".remind_me").click(function() {
	    			switch ($(this).find("a").attr("class")) {
	    				case 'unselected':
								flag = false;
								$("#remember").attr("value",1);
	    						$(this).find("a").attr("class","selected");
	    						break;
	    				case 'selected':
								flag = true;
								$("#remember").attr("value",0);
	    						$(this).find("a").attr("class","unselected");
	    						break;
	    			}
		    	});
				<c:if test="${isRem == 1}">
					flag = false;
					$("#remember").attr("value",1);
					$(".remind_me").find("a").attr("class","selected");
				</c:if>
				
				/**
				
				

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
				
				**/

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
	<div class="welcome_white_box"><!--start welcome_white_box-->   
        	<div class="welcome_logo">
			<a href="#"><img src="${domain}user/invitationForm_9_21/img/logo_welcome.png" alt="" width="94" height="82" /></a>
			</div>
            <h2 class="title_welcome">Welcome to goTribus!</h2>
            <p class="dot"></p>

			<form action="login.action" method="post" id="form_normal">
			<input type="hidden" name="remember" id="remember" value="${isRem}" />
            <div class="user_account"><!--start user_account-->
            	<!-- <p class="welcome_txt"><input class="email_input" name="email" required="false" type="text" value="${email}"  -->
				<p class="welcome_txt"><input class="email_input" name="email" required="false" type="text" value="fuzan@163.com"
				<c:if test="${email == 'username'}">
				onclick="if(this.value=='${email}')(this.value='')"  
				</c:if>
				
				onblur="if(this.value=='')(this.value='${email}')" /></p>			
				
				<div class="info_email">	
				<c:if test="${message_empty != null}">
					your email cannot be empty!
				</c:if>
				
				<c:if test="${message_not_acti != null}">
					Oops, wrong Email or password!
				</c:if>
				</div>

				<p class="welcome_txt2"><input class="pwd_input" type="text"
					name="userPw" id="pwd"
				value="123" onclick="if(this.value=='password')(this.value='')"  onblur="if(this.value=='')(this.value='password')" /></p>			
				<div class="enter"><a href="javascript: check();">ENTER</a></div>
				
				<div class="info_pwd">
				<c:if test="${message_name_error != null}">
				Oops, wrong Email or password!
				</c:if>
				</div>

                <span class="remind_me"><a href="#" class="unselected">Remember Me</a></span>
                <span class="forgot"><a href="#">Forgot your password?</a></span>
               	<p class="log_fb"><a href="javascript: flogin();"><img src="${domain}user/invitationForm_9_21/img/log_with_fb.png" alt="" width="176" height="41" /></a></p>            
            </div><!--//end .user_account-->
			</form>


            <p class="dot"></p>
			<form action="registerAction.action" method="post" id="form_res">
            <div class="user_account"><!--start user_account-->
            	<p class="welcome_txt"><input class="email_input" type="text" name="userEmail" value="email" onclick="if(this.value=='email')(this.value='')"  onblur="if(this.value=='')(this.value='email')" /></p>			
				
				<div class="info_email">
				<c:if test="${message_used != null}">
				your email is already registered!
				</c:if>
				
				<c:if test="${message_name_empty != null}">
				your email cannot be empty!
				</c:if>
				</div>

				<p class="welcome_txt2"><input class="pwd_input" type="text" name="userPw" value="password" onclick="if(this.value=='password')(this.value='')"  onblur="if(this.value=='')(this.value='password')" /></p>
				<div class="enter"><a href="javascript: check_register();">JOIN</a></div>  
				
				<div class="info_pwd">
				<c:if test="${message_short != null}">
            	password should longer 6!
				</c:if>
				</div>

            </div><!--//end .user_account-->   			
			<p class="copyright">&copy; 2012 goTribus</p>            
        </form>
		<a id="about" href="${domain}user/img/ABOUT_PAGE.jpg" title="about page"></a>
    </div><!--//end #welcome_white_box-->

	<form action="${no_view_url}user/loginFace.action" id="face_form">
						<input type="hidden" name="face_email" value="" />
						<input type="hidden" name="face_name" value="" />
						<input type="hidden" name="uid" value="" />
						<input type="hidden" name="pic_big" value="" />
						<input type="hidden" name="hometown" value="" />
						<input type="hidden" name="about_me" value="" />
     		</form>
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