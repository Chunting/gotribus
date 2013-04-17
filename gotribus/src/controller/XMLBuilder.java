package controller;
import java.io.File;
import java.io.IOException;

import java.io.InputStream;

import java.net.MalformedURLException;

import java.net.URL;

import java.net.URLConnection;

import java.io.FileNotFoundException;

import java.io.FileOutputStream;

import java.io.PrintWriter;

import org.w3c.dom.Document;

import org.w3c.dom.DOMException;

import org.xml.sax.SAXException;

import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.parsers.DocumentBuilderFactory;

import java.text.SimpleDateFormat;
import java.util.*; 

import org.jdom2.*;
import org.jdom2.input.SAXBuilder; 

import vo.SearchResult;

//import controller.Book;
import model.Book;
public class XMLBuilder {
	private static String SERVICES_HOST = "ecs.amazonaws.com";
	
	static List<String> listURL=new ArrayList<String>();
	static List<String> listAuthor=new ArrayList<String>();
	static List<String> listPage=new ArrayList<String>();
	static List<String> listTitle=new ArrayList<String>();
	static List<String> listDate=new ArrayList<String>();
	public static List<Book> listBook=new ArrayList<Book>();
	static List<SearchResult> searchResults = new ArrayList<SearchResult>();
	
	
	public XMLBuilder(String XMLPath, String localPath){
		XMLtest(XMLPath, localPath);
		Reader(localPath);
	}
	

	public static void XMLtest(String nETDATA_URL1,
			String lOCAL_PC_SAVEFILE_URL1) {
		// TODO Auto-generated method stub
		Document document = getProvinceCode(nETDATA_URL1);
		helloOK(document, lOCAL_PC_SAVEFILE_URL1);
		
	}
	/*返回一个Document对象*/
	public static Document getProvinceCode(String netXMLDataURL){
		Document document = null;
		if(netXMLDataURL!=null){
		
		DocumentBuilderFactory documentBF = DocumentBuilderFactory.newInstance();
		documentBF.setNamespaceAware(true);
		try{
			DocumentBuilder documentB = documentBF.newDocumentBuilder();
			InputStream inputStream = getSoapInputStream(netXMLDataURL);    //具体webService相关
			document = documentB.parse(inputStream);
			inputStream.close();
		}catch(DOMException e){
			e.printStackTrace();
			return null;
		}catch(ParserConfigurationException e){
			e.printStackTrace();
			return null;
		}catch (SAXException e){
			e.printStackTrace();
			return null;
		}catch(IOException e){
			e.printStackTrace();
			return null;
		}
		}
		return document;
	}
	/*返回InputStream对象*/
	public static InputStream getSoapInputStream(String url){
		InputStream inputStream = null;
		try{
			URL urlObj = new URL(url);
			URLConnection urlConn = urlObj.openConnection();
			urlConn.setRequestProperty("Host", SERVICES_HOST);    //具体webService相关
			urlConn.connect();
			inputStream = urlConn.getInputStream();
		}catch(MalformedURLException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		return inputStream;
	}
	/*访问远程(WebService)xml数据后返回的xml格式字符串并生成为本地文件*/
	public static void helloOK(Document document, String savaFileURL){
		TransformerFactory transF = TransformerFactory.newInstance();
		try{
			Transformer transformer = transF.newTransformer();
			DOMSource source = new DOMSource(document);
			transformer.setOutputProperty(OutputKeys.ENCODING, "GB2312");
			transformer.setOutputProperty(OutputKeys.INDENT, "YES");
			PrintWriter pw = new PrintWriter(new FileOutputStream(savaFileURL));
			StreamResult result = new StreamResult(pw);
			transformer.transform(source, result);
			System.out.println("Success in building File Bookxml!  "+savaFileURL);
		}catch(TransformerConfigurationException e){
			System.out.println(e.getMessage());
		}catch(IllegalArgumentException e){
			System.out.println(e.getMessage());
		}catch(FileNotFoundException e){
			System.out.println(e.getMessage());
		}catch(TransformerException e){
			System.out.println(e.getMessage());
			}
		}
	
	public static List<String> Reader(String XMLPath) { 
		String URL=null;
		String Author=null;
		//Book book=new Book();
		SearchResult sr = new SearchResult();
		try { 
			SAXBuilder builder = new SAXBuilder(); 
			org.jdom2.Document doc = builder.build(new File(XMLPath)); 
			Element foo = doc.getRootElement(); 
			List<Element> allChildren = foo.getChildren(); 
			List<Element> Items = ((Element)allChildren.get(1)).getChildren();
			for(int j=4;j<Items.size();j++){
				Book book=new Book();
				Element books = (Element) Items.get(j);
				List<Element> Item=books.getChildren();
				for(Iterator<Element> iter=Item.iterator();iter.hasNext();){
					Element El=(Element) iter.next();
					book.setBookId(j-4);
				
					if(El.getName().equals("LargeImage")){
						URL=El.getChildren().get(0).getText();
						
						
						//sr.setItemPic(URL);
						book.setBookPic(URL);
						listURL.add(URL);
						//System.out.println("URL : " + URL);
					}
					
					if(El.getName().equals("ItemAttributes")){
						Author="";
						List<Element> Authors = El.getChildren(); 
						for(Iterator<Element> Auth=Authors.iterator();Auth.hasNext();){
							Element author=Auth.next();
							if(author.getName().equals("Author")||author.getName().equals("Creator")){
								Author+=author.getText()+"   ";
							}
							if(author.getName().equals("NumberOfPages")){
							//	System.out.println("Pages: "+author.getText());
								
								listPage.add(author.getText());
								book.setBookPages(Integer.parseInt(author.getText()));
								
								
							}
							if(author.getName().equals("Title")){
								//System.out.println("Title: "+author.getText());
								listTitle.add(author.getText());
								book.setBookName(author.getText());
								
								
								sr.setItemName(author.getText());
								
								
								}
							if(author.getName().equals("ReleaseDate")){
							//	System.out.println("ReleaseDate: "+author.getText());
								listDate.add(author.getText());
								SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
								
								java.util.Date date=sdf.parse(author.getText()); 
								book.setBookPublishDate(date);
								//book.setPublishDate(author.getText());
								
								}
						}
						//System.out.println("Author : " + Author);
						listAuthor.add(Author);
						book.setBookAuthor(Author);
						
					}
				}
				listBook.add(book);
				
			}
			
			} catch (Exception e) { 
			e.printStackTrace(); 
			} 
			return listURL;
}
}
