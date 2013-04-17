package vo;

import java.io.File;   
import java.io.FileNotFoundException;   
import java.io.IOException;   
import java.io.RandomAccessFile;   
import java.nio.ByteOrder;   
import java.nio.MappedByteBuffer;   
import java.nio.channels.FileChannel;   
import java.util.ArrayList;   
import java.util.HashMap;   
import java.util.List;   
import java.util.Map;   

//import org.apache.log4j.Level;   
  
public class IPSeeker {   
    //IPݿ   
    private String IP_FILE="QQWry.Dat";   
    //ļ   
    private String INSTALL_DIR="f:/qqwry";   
       
       
    // һЩ̶¼ȵȵ   
    private static final int IP_RECORD_LENGTH = 7;   
    private static final byte REDIRECT_MODE_1 = 0x01;   
    private static final byte REDIRECT_MODE_2 = 0x02;   
       
    // ΪcacheѯһipʱȲ鿴cacheԼٲҪظ   
    private Map<String, IPLocation> ipCache;   
    // ļ   
    private RandomAccessFile ipFile;   
    // ڴӳļ   
    private MappedByteBuffer mbb;   
    // ʼĿʼͽľƫ   
    private long ipBegin, ipEnd;   
    // ΪЧʶõʱ   
    private IPLocation loc;   
    private byte[] buf;   
    private byte[] b4;   
    private byte[] b3;   
       
    public IPSeeker(String fileName,String dir)  {   
        this.INSTALL_DIR=dir;   
        this.IP_FILE=fileName;   
        ipCache = new HashMap<String, IPLocation>();   
        loc = new IPLocation();   
        buf = new byte[100];   
        b4 = new byte[4];   
        b3 = new byte[3];   
        try {   
            ipFile = new RandomAccessFile(IP_FILE, "r");   
        } catch (FileNotFoundException e) {   
            // ҲļٳٵǰĿ¼ȫСдļ   
            //     ΪЩϵͳִСдҲipַϢļ   
            String filename = new File(IP_FILE).getName().toLowerCase();   
            File[] files = new File(INSTALL_DIR).listFiles();   
            for(int i = 0; i < files.length; i++) {   
                if(files[i].isFile()) {   
                    if(files[i].getName().toLowerCase().equals(filename)) {   
                        try {   
                            ipFile = new RandomAccessFile(files[i], "r");   
                        } catch (FileNotFoundException e1) {   
//                            LogFactory.log("IPַϢļûҵIPʾܽ޷ʹ",Level.ERROR,e1);   
                            ipFile = null;   
                        }   
                        break;   
                    }   
                }   
            }   
        }    
        // ļɹȡļͷϢ   
        if(ipFile != null) {   
            try {   
                ipBegin = readLong4(0);   
                ipEnd = readLong4(4);   
                if(ipBegin == -1 || ipEnd == -1) {   
                    ipFile.close();   
                    ipFile = null;   
                }              
            } catch (IOException e) {   
//                LogFactory.log("IPַϢļʽдIPʾܽ޷ʹ",Level.ERROR,e);   
                ipFile = null;   
            }              
        }   
    }   
       
       
    /**  
     * һصĲȫ֣õһϵаsӴIPΧ¼  
     * @param s صӴ  
     * @return IPEntry͵List  
     */  
    public List getIPEntriesDebug(String s) {   
        List<IPEntry> ret = new ArrayList<IPEntry>();   
        long endOffset = ipEnd + 4;   
        for(long offset = ipBegin + 4; offset <= endOffset; offset += IP_RECORD_LENGTH) {   
            // ȡIPƫ   
            long temp = readLong3(offset);   
            // temp-1ȡIPĵصϢ   
            if(temp != -1) {   
                IPLocation ipLoc = getIPLocation(temp);   
                // жǷصsӴˣ¼ListУûУ   
                if(ipLoc.getCountry().indexOf(s) != -1 || ipLoc.getArea().indexOf(s) != -1) {   
                    IPEntry entry = new IPEntry();   
                    entry.country = ipLoc.getCountry();   
                    entry.area = ipLoc.getArea();   
                    // õʼIP   
                    readIP(offset - 4, b4);   
                    entry.beginIp = Util.getIpStringFromBytes(b4);   
                    // õIP   
                    readIP(temp, b4);   
                    entry.endIp = Util.getIpStringFromBytes(b4);   
                    // Ӹü¼   
                    ret.add(entry);   
                }   
            }   
        }   
        return ret;   
    }   
       
    public IPLocation getIPLocation(String ip){   
        IPLocation location=new IPLocation();   
        location.setArea(this.getArea(ip));   
        location.setCountry(this.getCountry(ip));   
        return location;   
    }   
       
    /**  
     * һصĲȫ֣õһϵаsӴIPΧ¼  
     * @param s صӴ  
     * @return IPEntry͵List  
     */  
    public List<IPEntry> getIPEntries(String s) {   
        List<IPEntry> ret = new ArrayList<IPEntry>();   
        try {   
            // ӳIPϢļڴ   
            if(mbb == null) {   
                FileChannel fc = ipFile.getChannel();   
                mbb = fc.map(FileChannel.MapMode.READ_ONLY, 0, ipFile.length());   
                mbb.order(ByteOrder.LITTLE_ENDIAN);                
            }   
               
            int endOffset = (int)ipEnd;   
            for(int offset = (int)ipBegin + 4; offset <= endOffset; offset += IP_RECORD_LENGTH) {   
                int temp = readInt3(offset);   
                if(temp != -1) {   
                    IPLocation ipLoc = getIPLocation(temp);   
                    // жǷصsӴˣ¼ListУûУ   
                    if(ipLoc.getCountry().indexOf(s) != -1 || ipLoc.getArea().indexOf(s) != -1) {   
                        IPEntry entry = new IPEntry();   
                        entry.country = ipLoc.getCountry();   
                        entry.area = ipLoc.getArea();   
                        // õʼIP   
                        readIP(offset - 4, b4);   
                        entry.beginIp = Util.getIpStringFromBytes(b4);   
                        // õIP   
                        readIP(temp, b4);   
                        entry.endIp = Util.getIpStringFromBytes(b4);   
                        // Ӹü¼   
                        ret.add(entry);   
                    }   
                }   
            }              
        } catch (IOException e) {   
//            LogFactory.log("",Level.ERROR,e);   
        }   
        return ret;   
    }   
  
    /**  
     * ڴӳļoffsetλÿʼ3ֽڶȡһint  
     * @param offset  
     * @return  
     */  
    private int readInt3(int offset) {   
        mbb.position(offset);   
        return mbb.getInt() & 0x00FFFFFF;   
    }   
  
    /**  
     * ڴӳļĵǰλÿʼ3ֽڶȡһint  
     * @return  
     */  
    private int readInt3() {   
        return mbb.getInt() & 0x00FFFFFF;   
    }   
       
    /**  
     * IPõ  
     * @param ip ipֽʽ  
     * @return ַ  
     */  
    public String getCountry(byte[] ip) {   
        // ipַļǷ   
        if(ipFile == null)    
            return Message.bad_ip_file;   
        // ipתipֽΪַʽ   
        String ipStr = Util.getIpStringFromBytes(ip);   
        // ȼcacheǷѾipĽûļ   
        if(ipCache.containsKey(ipStr)) {   
            IPLocation ipLoc = ipCache.get(ipStr);   
            return ipLoc.getCountry();   
        } else {   
            IPLocation ipLoc = getIPLocation(ip);   
            ipCache.put(ipStr, ipLoc.getCopy());   
            return ipLoc.getCountry();   
        }   
    }   
       
    /**  
     * IPõ  
     * @param ip IPַʽ  
     * @return ַ  
     */  
    public String getCountry(String ip) {   
        return getCountry(Util.getIpByteArrayFromString(ip));   
    }   
       
    /**  
     * IPõ  
     * @param ip ipֽʽ  
     * @return ַ  
     */  
    public String getArea(byte[] ip) {   
        // ipַļǷ   
        if(ipFile == null)    
            return Message.bad_ip_file;   
        // ipתipֽΪַʽ   
        String ipStr = Util.getIpStringFromBytes(ip);   
        // ȼcacheǷѾipĽûļ   
        if(ipCache.containsKey(ipStr)) {   
            IPLocation ipLoc = ipCache.get(ipStr);   
            return ipLoc.getArea();   
        } else {   
            IPLocation ipLoc = getIPLocation(ip);   
            ipCache.put(ipStr, ipLoc.getCopy());   
            return ipLoc.getArea();   
        }   
    }   
       
    /**  
     * IPõ  
     * @param ip IPַʽ  
     * @return ַ  
     */  
    public String getArea(String ip) {   
        return getArea(Util.getIpByteArrayFromString(ip));   
    }   
       
    /**  
     * ipipϢļõIPLocationṹipԱipеõ  
     * @param ip ҪѯIP  
     * @return IPLocationṹ  
     */  
    private IPLocation getIPLocation(byte[] ip) {   
        IPLocation info = null;   
        long offset = locateIP(ip);   
        if(offset != -1)   
            info = getIPLocation(offset);   
        if(info == null) {   
            info = new IPLocation();   
            info.setCountry (  Message.unknown_country);   
            info.setArea(Message.unknown_area);   
        }   
        return info;   
    }      
  
    /**  
     * offsetλöȡ4ֽΪһlongΪjavaΪbig-endianʽû취  
     * ôһת  
     * @param offset  
     * @return ȡlongֵ-1ʾȡļʧ  
     */  
    private long readLong4(long offset) {   
        long ret = 0;   
        try {   
            ipFile.seek(offset);   
            ret |= (ipFile.readByte() & 0xFF);   
            ret |= ((ipFile.readByte() << 8) & 0xFF00);   
            ret |= ((ipFile.readByte() << 16) & 0xFF0000);   
            ret |= ((ipFile.readByte() << 24) & 0xFF000000);   
            return ret;   
        } catch (IOException e) {   
            return -1;   
        }   
    }   
  
    /**  
     * offsetλöȡ3ֽΪһlongΪjavaΪbig-endianʽû취  
     * ôһת  
     * @param offset ʼƫ  
     * @return ȡlongֵ-1ʾȡļʧ  
     */  
    private long readLong3(long offset) {   
        long ret = 0;   
        try {   
            ipFile.seek(offset);   
            ipFile.readFully(b3);   
            ret |= (b3[0] & 0xFF);   
            ret |= ((b3[1] << 8) & 0xFF00);   
            ret |= ((b3[2] << 16) & 0xFF0000);   
            return ret;   
        } catch (IOException e) {   
            return -1;   
        }   
    }      
       
    /**  
     * ӵǰλöȡ3ֽתlong  
     * @return ȡlongֵ-1ʾȡļʧ  
     */  
    private long readLong3() {   
        long ret = 0;   
        try {   
            ipFile.readFully(b3);   
            ret |= (b3[0] & 0xFF);   
            ret |= ((b3[1] << 8) & 0xFF00);   
            ret |= ((b3[2] << 16) & 0xFF0000);   
            return ret;   
        } catch (IOException e) {   
            return -1;   
        }   
    }   
     
    /**  
     * offsetλöȡĸֽڵipַipУȡipΪbig-endianʽ  
     * ļlittle-endianʽת  
     * @param offset  
     * @param ip  
     */  
    private void readIP(long offset, byte[] ip) {   
        try {   
            ipFile.seek(offset);   
            ipFile.readFully(ip);   
            byte temp = ip[0];   
            ip[0] = ip[3];   
            ip[3] = temp;   
            temp = ip[1];   
            ip[1] = ip[2];   
            ip[2] = temp;   
        } catch (IOException e) {   
//            LogFactory.log("",Level.ERROR,e);   
        }   
    }   
       
    /**  
     * offsetλöȡĸֽڵipַipУȡipΪbig-endianʽ  
     * ļlittle-endianʽת  
     * @param offset  
     * @param ip  
     */  
    private void readIP(int offset, byte[] ip) {   
        mbb.position(offset);   
        mbb.get(ip);   
        byte temp = ip[0];   
        ip[0] = ip[3];   
        ip[3] = temp;   
        temp = ip[1];   
        ip[1] = ip[2];   
        ip[2] = temp;   
    }   
       
    /**  
     * ԱipbeginIpȽϣעbeginIpbig-endian  
     * @param ip ҪѯIP  
     * @param beginIp ͱѯIPȽϵIP  
     * @return ȷ0ipbeginIp򷵻1Сڷ-1  
     */  
    private int compareIP(byte[] ip, byte[] beginIp) {   
        for(int i = 0; i < 4; i++) {   
            int r = compareByte(ip[i], beginIp[i]);   
            if(r != 0)   
                return r;   
        }   
        return 0;   
    }   
       
    /**  
     * byte޷бȽ  
     * @param b1  
     * @param b2  
     * @return b1b2򷵻1ȷ0Сڷ-1  
     */  
    private int compareByte(byte b1, byte b2) {   
        if((b1 & 0xFF) > (b2 & 0xFF)) // ȽǷ   
            return 1;   
        else if((b1 ^ b2) == 0)// жǷ   
            return 0;   
        else    
            return -1;   
    }   
       
    /**  
     * ipݣλipҵļ¼һƫ  
     * ʹöַҡ  
     * @param ip ҪѯIP  
     * @return ҵˣؽIPƫƣûҵ-1  
     */  
    private long locateIP(byte[] ip) {   
        long m = 0;   
        int r;   
        // Ƚϵһip   
        readIP(ipBegin, b4);   
        r = compareIP(ip, b4);   
        if(r == 0) return ipBegin;   
        else if(r < 0) return -1;   
        // ʼ   
        for(long i = ipBegin, j = ipEnd; i < j; ) {   
            m = getMiddleOffset(i, j);   
            readIP(m, b4);   
            r = compareIP(ip, b4);   
            // log.debug(Utils.getIpStringFromBytes(b));   
            if(r > 0)   
                i = m;   
            else if(r < 0) {   
                if(m == j) {   
                    j -= IP_RECORD_LENGTH;   
                    m = j;   
                } else    
                    j = m;   
            } else  
                return readLong3(m + 4);   
        }   
        // ѭˣôijضȵģ¼Ϊܵļ¼ǲ   
        //     ϶ǣҪһ£ǣͷؽַľƫ   
        m = readLong3(m + 4);   
        readIP(m, b4);   
        r = compareIP(ip, b4);   
        if(r <= 0) return m;   
        else return -1;   
    }   
       
    /**  
     * õbeginƫƺendƫмλü¼ƫ  
     * @param begin  
     * @param end  
     * @return  
     */  
    private long getMiddleOffset(long begin, long end) {   
        long records = (end - begin) / IP_RECORD_LENGTH;   
        records >>= 1;   
        if(records == 0) records = 1;   
        return begin + records * IP_RECORD_LENGTH;   
    }   
       
    /**  
     * һipҵ¼ƫƣһIPLocationṹ  
     * @param offset Ҽ¼ʼƫ  
     * @return IPLocation  
     */  
    private IPLocation getIPLocation(long offset) {   
        try {   
            // 4ֽip   
            ipFile.seek(offset + 4);   
            // ȡһֽжǷ־ֽ   
            byte b = ipFile.readByte();   
            if(b == REDIRECT_MODE_1) {   
                // ȡƫ   
                long countryOffset = readLong3();   
                // תƫƴ   
                ipFile.seek(countryOffset);   
                // ټһα־ֽڣΪʱطȻǸض   
                b = ipFile.readByte();   
                if(b == REDIRECT_MODE_2) {   
                    loc.setCountry (  readString(readLong3()));   
                    ipFile.seek(countryOffset + 4);   
                } else  
                    loc.setCountry ( readString(countryOffset));   
                // ȡ־   
                loc.setArea( readArea(ipFile.getFilePointer()));   
            } else if(b == REDIRECT_MODE_2) {   
                loc.setCountry ( readString(readLong3()));   
                loc.setArea( readArea(offset + 8));   
            } else {   
                loc.setCountry (  readString(ipFile.getFilePointer() - 1));   
                loc.setArea( readArea(ipFile.getFilePointer()));   
            }   
            return loc;   
        } catch (IOException e) {   
            return null;   
        }   
    }      
       
    /**  
     * һipҵ¼ƫƣһIPLocationṹ˷Ӧڴӳļʽ  
     * @param offset Ҽ¼ʼƫ  
     * @return IPLocation  
     */  
    private IPLocation getIPLocation(int offset) {   
        // 4ֽip   
        mbb.position(offset + 4);   
        // ȡһֽжǷ־ֽ   
        byte b = mbb.get();   
        if(b == REDIRECT_MODE_1) {   
            // ȡƫ   
            int countryOffset = readInt3();   
            // תƫƴ   
            mbb.position(countryOffset);   
            // ټһα־ֽڣΪʱطȻǸض   
            b = mbb.get();   
            if(b == REDIRECT_MODE_2) {   
                loc.setCountry (  readString(readInt3()));   
                mbb.position(countryOffset + 4);   
            } else  
                loc.setCountry (  readString(countryOffset));   
            // ȡ־   
            loc.setArea(readArea(mbb.position()));   
        } else if(b == REDIRECT_MODE_2) {   
            loc.setCountry ( readString(readInt3()));   
            loc.setArea(readArea(offset + 8));   
        } else {   
            loc.setCountry (  readString(mbb.position() - 1));   
            loc.setArea(readArea(mbb.position()));   
        }   
        return loc;   
    }   
       
    /**  
     * offsetƫƿʼֽڣһ  
     * @param offset ¼ʼƫ  
     * @return ַ  
     * @throws IOException  
     */  
    private String readArea(long offset) throws IOException {   
        ipFile.seek(offset);   
        byte b = ipFile.readByte();   
        if(b == REDIRECT_MODE_1 || b == REDIRECT_MODE_2) {   
            long areaOffset = readLong3(offset + 1);   
            if(areaOffset == 0)   
                return Message.unknown_area;   
            else  
                return readString(areaOffset);   
        } else  
            return readString(offset);   
    }   
       
    /**  
     * @param offset ¼ʼƫ  
     * @return ַ  
     */  
    private String readArea(int offset) {   
        mbb.position(offset);   
        byte b = mbb.get();   
        if(b == REDIRECT_MODE_1 || b == REDIRECT_MODE_2) {   
            int areaOffset = readInt3();   
            if(areaOffset == 0)   
                return Message.unknown_area;   
            else  
                return readString(areaOffset);   
        } else  
            return readString(offset);   
    }   
       
    /**  
     * offsetƫƴȡһ0ַ  
     * @param offset ַʼƫ  
     * @return ȡַ?ؿַ  
     */  
    private String readString(long offset) {   
        try {   
            ipFile.seek(offset);   
            int i;   
            for(i = 0, buf[i] = ipFile.readByte(); buf[i] != 0; buf[++i] = ipFile.readByte());   
            if(i != 0)    
                return Util.getString(buf, 0, i, "GBK");   
        } catch (IOException e) {              
//            LogFactory.log("",Level.ERROR,e);   
        }   
        return "";   
    }   
       
    /**  
     * ڴӳļoffsetλõõһ0βַ  
     * @param offset ַʼƫ  
     * @return ȡַ?ؿַ  
     */  
    private String readString(int offset) {   
        try {   
            mbb.position(offset);   
            int i;   
            for(i = 0, buf[i] = mbb.get(); buf[i] != 0; buf[++i] = mbb.get());   
            if(i != 0)    
                return Util.getString(buf, 0, i, "GBK");          
        } catch (IllegalArgumentException e) {   
//            LogFactory.log("",Level.ERROR,e);   
        }   
        return "";      
    }   
}  