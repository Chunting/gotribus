package util;

import java.io.File;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.io.FileUtils;
  
public class Mail{  
      
    private String host = "mail.gotribus.com";  
    
    private String username = "support@gotribus.com";  
      
    private String password = "12345678";  
      
    private String mail_head_name = "this is head of this mail";  
  
    private String mail_head_value = "this is head of this mail";  
  
    private String mail_to = "zfu7@hawk.iit.edu";
    
    //private String mail_to = "zfu7@hawk.iit.edu";  
  
    private String mail_from = "support@gotribus.com";  
  
    private String mail_subject = "this is the subject of this test mail";  
  
    //private String mail_body = ;  
  
    private String personalName = "goTribus";  
            
    private String replyEmail = "";
    
    private String name = "Fiona";
    
    private String url = "http://";
  
    private String getMailBody(String name,String url,String replyEmail){
    	String mail_body = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">"+
        "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\">"+
        "<head>"+
        "	<meta http-equiv=\"Content-Type\" content=\"text/html;charset=iso-8859-1\" />"+
        "<title>Welcometogo</title>"+
        "<meta http-equiv=content-type content=\"text/html;charset=iso-8859-1\">"+
        "<meta name=\"Generator\" content=\"Click to Convert\">"+
        "<meta name=\"Author\" content=\"w b\">"+
        "<meta name=\"Title\" content=\"Welcome to go-Tribus, Fiona \">"+
        "</head>"+
        "<body bgcolor=\"#ffffff\" text=\"#000000\" link=\"#0000FF\" Vlink=\"#660099\" style=\"margin:0;padding:0;background-color:white;color:black;\">"+
        "<nobr>"+
        "<table width=\"100%\" STYLE=\"position:relative\"><tr><td>"+
        "<nobr>"+
        "<div class=\"ts1p2\" style=\"position:absolute;left:95px;top:26px;\"><span class=\"ft1p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:44px;font-family:arial,sans-serif;color:#00AEEF;\">"+
        "<img style=\"left:11px;top:11px\" src=\"http://gotribus.com/view/pic/background1.png\" width=\"71\" height=\"70\" "+
        "border=\"0\" alt=\"\">"+
        "Welcome to goTribus, "+      name     +"&nbsp; </span></div>"+
        "<div class=\"ts1p8\" style=\"position:absolute;left:31px;top:133px;\"><span class=\"ft2p1\" "+
        "style=\"font-style:italic;font-weight:normal;font-size:18px;font-family:arial,sans-serif;color:#000000;\">"+
        "<a href=\""+              url        +"\" style=\"color: blue;\">"+
        "Thanks for signing up, please verify your "+
        "email address here."+
        "</a></span></div><br/><br/><br/><br/>"+
        "<div class=\"ts1p14\" style=\"position:absolute;left:31px;top:207px;\">"+
        "	<span class=\"ft4p1\" "+
        "style=\"font-style:normal;font-weight:normal;font-size:18px;font-family:arial,sans-serif;color:#808080;\">goTribus could help you find the friends who share the"+
        "	<span class=\"ft5p1\" style=\"color:#00AEEF;\">similar interests</span>"+
        "	with you, easier than ever before.&nbsp; </span></div>"+
        "<div class=\"ts1p20\" style=\"position:absolute;left:31px;top:231px;\">"+
        "<span class=\"ft4p1\" "+
        "style=\"font-style:normal;font-weight:normal;font-size:18px;font-family:arial,sans-serif;color:#808080;\">And we "+
        "always believe this relationship could build deep connection with others and extend your ordinary social "+
        "circle.&nbsp; </span></div>"+
        "<div class=\"ts1p24\" style=\"position:absolute;left:31px;top:280px;\"><span class=\"ft3p1\" "+
        "style=\"font-style:normal;font-weight:normal;font-size:18px;font-family:arial,sans-serif;color:#000000;\">&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;</span></div><br/><br/><br/>"+
        "<div class=\"ts1p28\" style=\"position:absolute;left:31px;top:351px;\">"+
        "<span class=\"ft6p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:18px;font-family:arial,sans-serif;color:#000000;\">Two things to "+
        "start your journey:&nbsp; </span></div>"+
        "<div class=\"ts1p32\" style=\"position:absolute;left:31px;top:400px;\">"+
        "<span class=\"ft6p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:18px;font-family:arial,sans-serif;color:#000000;\">Establish who you are "+
        "<span class=\"ft7p1\" style=\"color:#808080;\">here by marking things you love, either a CD or a book.</span>&nbsp; "+
        "</span></div><br/><br/><br/><br/>"+
        "<div class=\"ts1p36\" style=\"position:absolute;left:31px;top:424px;\">"+
        "<span class=\"ft6p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:18px;font-family:arial,sans-serif;color:#000000;\">And,&nbsp; </span></div><br/><br/><br/>"+
        "<div class=\"ts1p38\" style=\"position:absolute;left:31px;top:448px;\">"+
        "<span class=\"ft6p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:18px;font-family:arial,sans-serif;color:#000000;\">Connect to your Facebook Account "+
        "<span class=\"ft7p1\" style=\"color:#808080;\">to share with your friends.</span> </span></div>"+
        "<br/><br/><br/><br/>"+
        "<div class=\"ts1p43\" style=\"position:absolute;left:31px;top:522px;\">"+
        "<span class=\"ft8p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:18px;font-family:arial,sans-serif;color:#00AEEF;\">Coming Soon "+
        "in Weeks!&nbsp; </span></div>"+
        "<div class=\"ts1p45\" style=\"position:absolute;left:31px;top:546px;\">"+
        "<span class=\"ft6p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:18px;font-family:arial,sans-serif;color:#000000;\">goTribus Facebook App </span></div><br/><br/><br/>"+
        "<div class=\"ts1p47\" style=\"position:absolute;left:31px;top:570px;\">"+
        "<span class=\"ft6p1\" "+
        "style=\"font-style:normal;font-weight:bold;font-size:18px;font-family:arial,sans-serif;color:#000000;\">Know how "+
        "common between you and your Facebook friends </span></div>"+
        "<div class=\"ts1p52\" style=\"position:absolute;left:31px;top:644px;\">"+
        "<span class=\"ft3p1\" "+
        "style=\"font-style:normal;font-weight:normal;font-size:18px;font-family:arial,sans-serif;color:#000000;\">&#45;&#45;&"+
        "#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#4"+
        "5;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;"+
        "&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#"+
        "45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45"+
        ";&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&"+
        "#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#4"+
        "5;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;</span></div><br/><br/><br/><br/>"+
        "<div class=\"ts1p55\" style=\"position:absolute;left:31px;top:684px;\">"+
        "<span class=\"ft9p1\" "+
        "style=\"font-style:normal;font-weight:normal;font-size:13px;font-family:arial,sans-serif;color:#000000;\">This email "+
        "was sent by request to *"+               replyEmail              +" </span></div>"+
        "<div class=\"ts1p58\" style=\"position:absolute;left:31px;top:726px;\">"+
        "<span class=\"ft9p1\" "+
        "style=\"font-style:normal;font-weight:normal;font-size:13px;font-family:arial,sans-serif;color:#000000;\">&copy;2012 "+
        "goTribus.&nbsp; All Rights Reserved. </span></div>"+
        "<div class=\"ts1p64\" style=\"position:absolute;left:31px;top:745px;\">"+
        "<span class=\"ft9p1\" "+
        "style=\"font-style:normal;font-weight:normal;font-size:13px;font-family:arial,sans-serif;color:#000000;\">Privacy "+
        "Policy&nbsp; Terms and Conditions </span></div>"+
        "</td></tr></table></body></html>"+            
        "";
	
    	return mail_body;
    }
    
        

    
    
    
    public String getReplyEmail() {
		return replyEmail;
	}

	public void setReplyEmail(String replyEmail) {
		this.replyEmail = replyEmail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	/** 
     * 
     */  
    public void send() throws Exception{  
        try{  
            Properties props=new Properties();  
            Authenticator auth = new Email_Autherticator(); // 
            props.put("mail.smtp.host", host);  
            props.put("mail.smtp.auth", "true");  
            Session session = Session.getDefaultInstance(props, auth);  
    
            //
            MimeMessage message = new MimeMessage(session);  
            
            //message.setContent("foobar, "application/x-foobar"); //  
            message.setSubject(mail_subject); //
                                    
            Multipart mainPart = new MimeMultipart();    
            //    
            BodyPart html = new MimeBodyPart();    
            // 
            html.setContent(getMailBody(this.name,this.url,this.mail_to), "text/html;charset=iso-8859-1");    
            mainPart.addBodyPart(html); 
            //
            message.setContent(mainPart,"text/html;charset=iso-8859-1"); 
            
            //message.setContent(mail_body,"text/html"); //                                      
            message.setHeader(mail_head_name, mail_head_value); //  
              
            message.setSentDate(new Date()); //
            Address address = new InternetAddress(mail_from, personalName);  
            message.setFrom(address); //  
            Address toAddress = new InternetAddress(mail_to); //  
            message.addRecipient(Message.RecipientType.TO, toAddress);  
            Transport.send(message); //
            //System.out.println("send success!");  
        }catch (Exception ex){  
            ex.printStackTrace();  
            throw new Exception(ex.getMessage());  
        }  
    }  
  
    /** 
     * 
     */  
    public class Email_Autherticator extends Authenticator{  
        public Email_Autherticator(){  
            super();  
        }  
  
        public Email_Autherticator(String user, String pwd){  
            super();  
            username = user;  
            password = pwd;  
        }  
  
        public PasswordAuthentication getPasswordAuthentication(){  
            return new PasswordAuthentication(username, password);  
        }  
    }

	public String getMail_head_name() {
		return mail_head_name;
	}

	public void setMail_head_name(String mail_head_name) {
		this.mail_head_name = mail_head_name;
	}

	public String getMail_head_value() {
		return mail_head_value;
	}

	public void setMail_head_value(String mail_head_value) {
		this.mail_head_value = mail_head_value;
	}

	public String getMail_to() {
		return mail_to;
	}

	public void setMail_to(String mail_to) {
		this.mail_to = mail_to;
	}

	public String getMail_from() {
		return mail_from;
	}

	public void setMail_from(String mail_from) {
		this.mail_from = mail_from;
	}

	public String getMail_subject() {
		return mail_subject;
	}

	public void setMail_subject(String mail_subject) {
		this.mail_subject = mail_subject;
	}

	public String getPersonalName() {
		return personalName;
	}

	public void setPersonalName(String personalName) {
		this.personalName = personalName;
	}  
  
    public static void main(String[] args){  
        Mail sendmail = new Mail();  
        try{          	        	        
	            sendmail.setReplyEmail("fau@173.com");
	            sendmail.setName("fau");
	            sendmail.setUrl("http://gotribus.com/user/registerConfirm.action?user=123");
	            //sendmail.setMail_body(sendmail.getMailBody(sendmail.getName(), sendmail.getUrl(), sendmail.getMail_to()));
				sendmail.send();             
        }catch (Exception ex){  
            ex.printStackTrace();  
        }  
    }             
}  