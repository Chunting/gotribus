package controller;
import java.io.IOException;  
import java.io.InputStream;  
import java.net.MalformedURLException;  
import java.net.URL;  
import java.net.URLConnection;  
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;  
import java.util.Iterator;
import java.util.List;
import java.util.Map;  
  
import model.Book;

import org.dom4j.Document;  
import org.dom4j.DocumentException;  
import org.dom4j.Element;
import org.dom4j.io.SAXReader;  
  
import org.w3c.dom.DOMException;  
  
public class BookXML {
	//远程WebService接口url  
   // private static String NETDATA_URL = "http://ecs.amazonaws.com/onca/xml?AWSAccessKeyId=AKIAJPAQXHDZAZJX5H4A&AssociateTag=qiumi-20&Keywords=american&Operation=ItemSearch&ResponseGroup=Large&SearchIndex=Books&Service=AWSECommerceService&Timestamp=2013-02-20T12%3A05%3A11.000Z&Signature=7wYaD40ELum0xNnlxAiuDwqfqgoLEvbzVnOlOqPh8zE%3D";  
    private static List<Book> listBook=new ArrayList<Book>();
    
    @SuppressWarnings("unchecked")
    BookXML(String netdata_url) throws ParseException{
    	
    	 Document document = getProvinceDocument(netdata_url);  
         //  Element el= document.getRootElement();
           Element foo = document.getRootElement();
           Element Items=foo.element("Items");
           List<Element> allChildren = Items.elements("Item");
           Iterator<Element> ItemIt= allChildren.iterator();
           int j=0;
           listBook.clear();
           while(ItemIt.hasNext()){
        	   Book book=new Book();
        	   Element Item=ItemIt.next();
        	   book.setBookId(j++);
        	   
        	   //Get the URL of the lager image 
        	   Element LagImg=Item.element("LargeImage");
        	   String URL=LagImg.element("URL").getText();
        	   book.setBookPic(URL);
        	   System.out.println("URL : " + URL);
        	   
        	   
        	   Element Itemattr=Item.element("ItemAttributes");
        	   
        	   // Get the name(s) or creator(s) of the book
        	   List<Element> Authors=Itemattr.elements("Author");
        	   String Author="";
        	   for(Iterator<Element> Auth=Authors.iterator();Auth.hasNext();){
    				Element author=Auth.next();
    				if(author.getName().equals("Author")){
    					Author+=author.getText()+"   ";
    				}
        	   }
        	  
        	   
        	   if(Authors.isEmpty()){
        		   Authors=Itemattr.elements("Creator");
            	   for(Iterator<Element> Auth=Authors.iterator();Auth.hasNext();){
        				Element author=Auth.next();
        				if(author.getName().equals("Creator")){
        					Author+=author.getText()+"   ";
        				}
            	   }
        		   
        	   }
        	   book.setBookAuthor(Author);
        	   System.out.println("Author : " + Author);
        	   
        	   // Get the ISBN of the book 
        	   
        	   Element ElISBN=Itemattr.element("ISBN");
        	   if(ElISBN!=null){
        		   String ISBN=ElISBN.getText();
        		   book.setBookISBN(ISBN);
        		   System.out.println("ISBN : " + ISBN);
        	   }
        	   
        	   Element ElPages=Itemattr.element("NumberOfPages");
        	   if(ElPages!=null){
        		   String Page=ElPages.getText();
        		   book.setBookPages(Integer.parseInt(Page));
        		   System.out.println("Pages : "+ Integer.parseInt(Page));
        	   }
        	   
        	   Element ElDate=Itemattr.element("ReleaseDate");
        	   if(ElDate!=null){
        		   String ReleaseDate=ElDate.getText();
        		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
        		   java.util.Date date=sdf.parse(ReleaseDate);
        		   book.setBookPublishDate(date);
        		   System.out.println("ReleaseDate : "+ ReleaseDate);
        	   }
        	   
        	   Element ElTitle=Itemattr.element("Title");
        	   if(ElTitle!=null){
        		   String Title=ElTitle.getText();
        		   book.setBookName(Title);
        		   System.out.println("Title : "+ Title);
        	   }  
        	   
        	   Element ElPublisher=Itemattr.element("Publisher");
        	   if(ElPublisher!=null){
        		   String Publisher=ElPublisher.getText();
        		   book.setBookPublisher(Publisher);
        		   System.out.println("Publisher : "+ Publisher);
        	   }   
        	   listBook.add(book);
        	   book=null;
           }
    }
    /*
	public static void main(String[] args) throws Exception{  
        Document document = getProvinceDocument(NETDATA_URL);  
     //  Element el= document.getRootElement();
       Element foo = document.getRootElement();
       Element Items=foo.element("Items");
       List<Element> allChildren = Items.elements("Item");
       Iterator<Element> ItemIt= allChildren.iterator();
       int j=0;
       while(ItemIt.hasNext()){
    	   Book book=new Book();
    	   Element Item=ItemIt.next();
    	   book.setBookId(j++);
    	   
    	   //Get the URL of the lager image 
    	   Element LagImg=Item.element("LargeImage");
    	   String URL=LagImg.element("URL").getText();
    	   book.setBookPic(URL);
    	   System.out.println("URL : " + URL);
    	   
    	   
    	   Element Itemattr=Item.element("ItemAttributes");
    	   
    	   // Get the name(s) or creator(s) of the book
    	   List<Element> Authors=Itemattr.elements("Author");
    	   String Author="";
    	   for(Iterator<Element> Auth=Authors.iterator();Auth.hasNext();){
				Element author=Auth.next();
				if(author.getName().equals("Author")){
					Author+=author.getText()+"   ";
				}
    	   }
    	  
    	   
    	   if(Authors.isEmpty()){
    		   Authors=Itemattr.elements("Creator");
        	   for(Iterator<Element> Auth=Authors.iterator();Auth.hasNext();){
    				Element author=Auth.next();
    				if(author.getName().equals("Creator")){
    					Author+=author.getText()+"   ";
    				}
        	   }
    		   
    	   }
    	   book.setBookAuthor(Author);
    	   System.out.println("Author : " + Author);
    	   
    	   // Get the ISBN of the book 
    	   
    	   Element ElISBN=Itemattr.element("ISBN");
    	   if(ElISBN!=null){
    		   String ISBN=ElISBN.getText();
    		   book.setBookISBN(ISBN);
    		   System.out.println("ISBN : " + ISBN);
    	   }
    	   
    	   Element ElPages=Itemattr.element("NumberOfPages");
    	   if(ElPages!=null){
    		   String Page=ElPages.getText();
    		   book.setBookPages(Integer.parseInt(Page));
    		   System.out.println("Pages : "+ Integer.parseInt(Page));
    	   }
    	   
    	   Element ElDate=Itemattr.element("ReleaseDate");
    	   if(ElDate!=null){
    		   String ReleaseDate=ElDate.getText();
    		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
    		   java.util.Date date=sdf.parse(ReleaseDate);
    		   book.setBookPublishDate(date);
    		   System.out.println("ReleaseDate : "+ ReleaseDate);
    	   }
    	   
    	   Element ElTitle=Itemattr.element("Title");
    	   if(ElTitle!=null){
    		   String Title=ElTitle.getText();
    		   book.setBookName(Title);
    		   System.out.println("Title : "+ Title);
    	   }  
    	   
    	   Element ElPublisher=Itemattr.element("Publisher");
    	   if(ElPublisher!=null){
    		   String Publisher=ElPublisher.getText();
    		   book.setBookPublisher(Publisher);
    		   System.out.println("Publisher : "+ Publisher);
    	   }   
    	   listBook.add(book);
    	   book=null;
       }
    }  
      */
    /*返回一个Document对象*/  
    public static Document getProvinceDocument(String netXMLDataURL){     
        Document document = null;  
        SAXReader reader = new SAXReader();  
        Map<String, String> map = new HashMap<String, String>();  
        reader.getDocumentFactory().setXPathNamespaceURIs(map);  
        try{  
            InputStream inputStream = getSoapInputStream(netXMLDataURL);    //具体webService相关  
            document = reader.read(inputStream);  
            inputStream.close();  
        }catch(DOMException e){  
            e.printStackTrace();  
            return null;  
        }catch(IOException e){  
            e.printStackTrace();  
            return null;  
        }catch (DocumentException e){  
            e.printStackTrace();  
        }  
        return document;  
    }  
      
    /*返回InputStream对象*/  
    public static InputStream getSoapInputStream(String url){  
        InputStream inputStream = null;  
        try{  
            URL urlObj = new URL(url);  
            URLConnection urlConn = urlObj.openConnection();  
            /*参数具体WebService基于http://webservice.webxml.com.cn/WebServices/WeatherWS.asmx?op=getRegionProvince*/  
            urlConn.setRequestProperty("Host", "ecs.amazonaws.com");  
            urlConn.setRequestProperty("Content-Type", "text/xml; charset=GB2312");  
            urlConn.setRequestProperty("SOAPAction", "http://WebXml.com.cn/getRegionProvince");  
            urlConn.connect();  
            inputStream = urlConn.getInputStream();  
        }catch(MalformedURLException e){  
            e.printStackTrace();  
        }catch(IOException e){  
            e.printStackTrace();  
        }  
        return inputStream;  
    }

	public static List<Book> getListBook() {
		return listBook;
	}  

}
