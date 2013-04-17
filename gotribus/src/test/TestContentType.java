package test;

import java.io.File;

import javax.activation.FileDataSource;
import javax.activation.MimetypesFileTypeMap;

public class TestContentType {
	public static void main(String[] a){
		
		String mime[] = new String[]{"image/bmp","image/x-windows-bmp","image/jpeg","image/pjpeg","image/png",""}; 
		
		File f = new File("C:\\Documents and Settings\\Administrator\\My Documents\\new\\LOGO_32.png");
		
		//File f1 = new File("D:\\PhpStorm-3.0.3.exe");		
		File f1 = new File("C:\\Documents and Settings\\Administrator\\My Documents\\new\\bgr_welcome.jpg");
		
		FileDataSource ds = new FileDataSource(f);  
        String contentType = ds.getContentType();  
        System.out.println("The MIME type of the fil is: " + contentType);  

		
		System.out.println(new MimetypesFileTypeMap().getContentType(f));
	}
}
