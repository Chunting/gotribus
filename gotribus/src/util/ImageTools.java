package util;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.ImageOutputStream;

import org.apache.commons.io.DirectoryWalker;
import org.apache.commons.io.FileUtils;

public class ImageTools {

    private static final int small_long = 180;    
    private static final int small_width = 170;
    
    
    private static final int middle_long = 500;
    private static final int middle_width = 380;
    
    private static final int big_long = 350;
    private static final int big_width = 317;
       
    /****
     * Modified by Chunting
     * Date: 2013-03-14
     * cutting(file,-1,-1);
     * @param file
     * @return
     */
    public static File cuttingBig(File file){
    	try {
			return cutting(file,big_long,big_width);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
     

    public static File cuttingMidd(File file){
    	try {
		 	return cutting(file,middle_long,middle_width);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
    

    public static File cuttingSmall(File file){
    	try {
			return cutting(file,small_long,small_width);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
    
    
    public static File copyCutM(File file){
    	try {
    		
    		String endName = file.getName();
            endName = endName.substring(endName.lastIndexOf(".") + 1);
    	    String path = file.getAbsolutePath();
            
            //path = path.substring(0, path.lastIndexOf("\\"));
            path = path.substring(0, path.lastIndexOf("/"));
            
            File newFile = new File(path);                                               
            newFile = new File(path, file.getName().replaceAll("."+endName,"")+"_103_103."+endName);
        
    		
			FileUtils.copyFile(file, newFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    }
    
    
    
    public static File copyCut(File file){
    	try {
    		
    		String endName = file.getName();
            endName = endName.substring(endName.lastIndexOf(".") + 1);
    	    String path = file.getAbsolutePath();
            
            //path = path.substring(0, path.lastIndexOf("\\"));
            path = path.substring(0, path.lastIndexOf("/"));
            
            File newFile = new File(path);                                               
            newFile = new File(path, file.getName().replaceAll("."+endName,"")+"_64_64."+endName);
        
    		
			FileUtils.copyFile(file, newFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    }
    
	/**
	 * 
	 * @param file
	 * @param x start point x-axis
	 * @param y start point y-axis
	 * @param width extend from x point
	 * @param height extend from y point
	 * @return
	 */
    public static File cutting(File file,int _wid_s, int _long_s) throws IOException {
                    
            ImageOutputStream out  = null;
            Iterator<ImageReader> readers = null;
            ImageReader reader = null;
            InputStream is = null;
            ImageInputStream iis = null;
            
            try {
            	
            	BufferedImage input = ImageIO.read(file);
                int _wid = input.getWidth();
                int _long = input.getHeight();
        
                int _wid_start = (_wid - _wid_s) / 2;
                int _long_start = (_long - _long_s) / 2;
                
                    String endName = file.getName();
                    endName = endName.substring(endName.lastIndexOf(".") + 1);
                    readers = ImageIO.getImageReadersByFormatName(endName);
                    
                    reader = (ImageReader) readers.next();
                    is = new FileInputStream(file);
                    iis = ImageIO.createImageInputStream(is);
                    reader.setInput(iis, true);
                    ImageReadParam param = reader.getDefaultReadParam();
                    Rectangle rect = new Rectangle(_wid_start, _long_start, _wid_s, _long_s);
                    
                    if(_long_start < 0 || _wid_start<0){
                    	return file;
                    }
                    
                    //int _wid_s, int _long_s
                    if(_wid_s < 0 && _long_s < 0){
                    	return file;
                    }else{                    		
                    	
                        param.setSourceRegion(rect);
                        
                        BufferedImage bi = reader.read(0, param);
                        String path = file.getAbsolutePath();
                        System.out.println("Path: "+path);
                        //path = path.substring(0, path.lastIndexOf("\\"));
                        path = path.substring(0, path.lastIndexOf("\\"));
                      
                        
                        File newFile = new File(path);                                               
                        newFile = new File(path, file.getName().replaceAll("."+endName,"")+"_" + _wid_s + "_" + _long_s + "."+endName);
                        
                        out = ImageIO.createImageOutputStream(new FileOutputStream(newFile));
                        ImageIO.write(bi, endName, out);
                        
                        file = newFile;
                        
                        return newFile;
                    }
                    
            } catch (Exception e) {
                    e.printStackTrace();
            } finally{
                    if(out!=null)
                            out.close();
                    if(iis!=null)
                            iis.close();
                    if(is!=null)
                            is.close();
            }
            
            return file;
    }

	public static void main(String args[]) throws IOException {

        String file = "";//"D:\\大自然漂亮\\MV5BNDYzNTUzMTMwMV5BMl5BanBnXkFtZTcwNTQ5NzkwNQ@@._V1_.jpg";
        BufferedImage input = ImageIO.read(new File(file));
        int _wid = input.getWidth();
        int _long = input.getHeight();

        int _wid_s = 500;
        int _long_s = 700;

        int _wid_start = (_wid - _wid_s) / 2;
        int _long_start = (_long - _long_s) / 2;

        System.out.println(_wid_start);
        System.out.println(_long_start);
        System.out.println(new File(file).getName());
        //cuttingBig(new File(file));
        
        cuttingMidd(new File(file));
        cuttingSmall(new File(file));
        
        ImageTools is = new ImageTools();
        //copyCut(new File(file));
    //    is.pathWalker(new File("C:\\Documents and Settings\\Administrator\\My Documents"));
	}
	
	public void pathWalker(File startDir){		
		TribusFileWalker tw = new TribusFileWalker();
		tw.doWalker(startDir);		
	}
	
	class TribusFileWalker extends DirectoryWalker{

		public void doWalker(File start){
			try {
				walk(start,null);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		@Override
		protected void handleFile(File file, int depth, Collection results)
				throws IOException {
			if(file.getName().contains(".jpg") ||
					file.getName().contains(".png")		
			){								
				ImageTools.copyCutM(file);
				ImageTools.copyCut(file);
			}
			
		}
				
	}
}