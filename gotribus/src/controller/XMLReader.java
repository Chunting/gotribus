package controller;
import java.io.*; 
import java.util.*; 
import org.jdom2.*;
import org.jdom2.input.SAXBuilder; 
public class XMLReader {
	public static void Reader(String XMLPath) { 
	//long lasting = System.currentTimeMillis();
	try { 
		int j=0;
		SAXBuilder builder = new SAXBuilder(); 
		Document doc = builder.build(new File(XMLPath)); 
		Element foo = doc.getRootElement(); 
		System.out.println("RootElement: " + foo.getName()); 
		System.out.println("Children Size: " + foo.getChildren().size());
		System.out.println("ContentSize: " + foo.getContentSize());
		List allChildren = foo.getChildren(); 
		for(j=1;j<allChildren.size();j++) { 
			System.out.println("Item Size : " + ((Element)allChildren.get(j)).getChildren().size());
		//	System.out.print("HTTPHeaders: " + ((Element)allChildren.get(j)).getChild("HTTPHeaders").getText()); 
		//	System.out.println(" RequestId:" + ((Element)allChildren.get(j)).getChild("RequestId").getText());
			} 
		} catch (Exception e) { 
		e.printStackTrace(); 
		} 
	//System.out.println("运行时间：" + (System.currentTimeMillis() - lasting) + " 毫秒"); 
	} 
}


