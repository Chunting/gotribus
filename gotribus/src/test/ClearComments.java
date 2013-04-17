package test;

import java.io.File;

import org.apache.commons.io.FileUtils;

public class ClearComments {
	public static void main (String[] args) throws java.lang.Exception
    {
		String a = "";
		a = null;
		a = FileUtils.readFileToString(new File("D:\\我的文档\\test\\tribus\\src\\controller\\ActivityController.java"),"gbk");		
        String s = null;
        s = a.replaceAll("//.*?\n","\n");               
        FileUtils.writeStringToFile(new File("D:\\a.java"), s,"utf-8");        
    }
}
