<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dao.UserDao,util.ImageTools,java.io.*"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
	//UserDao ud = new UserDao();
	//ud.cuttingBookPic()
	//ud.cuttingMoviePic();
	//ud.cuttingMusicPic();
	
	ImageTools it = new ImageTools();
	it.pathWalker(new File("/home/tribus/jvm/apache-tomcat-6.0.35/domains/gotribus.com/ROOT/view/pic/movie/ot/"));
	it.pathWalker(new File("/home/tribus/jvm/apache-tomcat-6.0.35/domains/gotribus.com/ROOT/view/pic/music/"));
 %>
</body>
</html>