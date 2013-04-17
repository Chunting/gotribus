<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib uri="/WEB-INF/tld/c-rt.tld" prefix="c" %><%@ page import="config.GlobleConfig" %><%
	request.setAttribute("domain",GlobleConfig.localhost);
	request.setAttribute("no_view_url",GlobleConfig.show_local);
 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Welcome to Gotribus, this is a place have fun !</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />   
	<link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/font/font.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection" href="${domain }user/css/style.css" />
    <link rel="shortcut icon" href="http://www.gotribus.com/view/images/LOGO_32.png"/>
	<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>	
    <script type="text/javascript" src="${domain }js/jquery-1.6.2.min.js"></script>
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
				i=0;
				$('form')[0].reset();
				//return false;
			}						
			if(i>=3){$("#form_normal").submit();}
    	}   	    	
	    function IsEmail(email) {
		  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		  return regex.test(email);
		}
		var flag = true;
		$(document).ready(function(){										
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
    	<form  action="${no_view_url}user/login.action" method="post" id="form_normal">
        	<div class="welcome_logo"><a href="#"><img src="${domain }user/img/logo_welcome.jpg" alt="" width="94" height="82" /></a></div>
            <h2 class="title_welcome">Welcome to Tribus~</h2>
            <div class="user_account"><!--start user_account-->
            	<p class="welcome_txt"><input type="text" name="email" value="username" onclick="if(this.value=='username')(this.value='')"  onblur="if(this.value=='')(this.value='username')" /></p>
				
				<p class="welcome_txt">
				<input type="text" id="pwd" name="userPw" value="password" onclick="if(this.value=='password')(this.value='')"  onblur="if(this.value=='')(this.value='password')" /></p>
                <span class="remind_me"><a href="#" id="remb">Remember Me</a></span>

				<span class="remind_me"><a href="#" id="term">Agree with our term</a></span> 

                <div class="enter"><a href="javascript: check();">Enter &gt;</a></div>
                <div class="or_sign_by">
                	<p>Or sign in with: 
					<a href="javascript: flogin();">
					<img src="${domain}user/img/icon_facebook.jpg" alt="" width="24" height="24" /></a> </p>

					<p><a href="#">By agree with our term </a></p>

                    <!--p><a href="#">Forgot your password?</a></p-->
                </div>
            </div><!--//end .user_account-->
            <div id="request_invitation">
            	<div id="send_request">
                	<label>Register Here</label>
                    <p><input type="text" id="p_i" /></p>
                    <span><a href="javascript:goTo();">Register</a></span>
                </div>
            </div>
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
</body>
<script>
	function goTo(){
		window.location.href = "${no_view_url}user/register.action?i_email="+$("#p_i").val();
	}

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