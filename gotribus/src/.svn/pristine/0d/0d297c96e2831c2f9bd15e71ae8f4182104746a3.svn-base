package util;

import java.io.BufferedReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.MessageFormat;

public class GetLatLong {


	/**
	 * 利用googlemap api 通过 HTTP 进行地址解析
	 * 
	 * @param address
	 *            地址
	 * @return HTTP状态代码,精确度（请参见精确度常数）,纬度,经度
	 */
	public String[] getLatlng(String address) {
		String ret = "";
		String[] names=new String[4];
		if (address != null && !address.equals("")) {
			try {
				address = URLEncoder.encode(address, "UTF-8");// 进行这一步是为了避免乱码
			} catch (UnsupportedEncodingException e1) {
			}
			// q 是查询的目标地址，output 是响应格式，key 是要使用此 Web 服务的关键字字符串
			// 在此响应内，200 是 HTTP 状态代码，表明解析成功；4 是精度常量；41.879535 是经度；-87.624333
			// 是纬度。

			String[] arr = new String[4];
			arr[0] = address;
			arr[1] = "csv";
			arr[2] = "true";
			arr[3] = "ABQIAAAAzr2EBOXUKnm_jVnk0OJI7xSosDVG8KKPE1-m51RBrvYughuyMxQ-i1QfUnH94QxWIa6N4U6MouMmBA";
			// http://maps.google.com/maps/geo?q=Chicago&output=cvs&key=ABQIAAAAzr2EBOXUKnm_jVnk0OJI7xSosDVG8KKPE1-m51RBrvYughuyMxQ-i1QfUnH94QxWIa6N4U6MouMmBA
			String url = MessageFormat
					.format(
							"http://maps.google.com/maps/geo?q={0}&output={1}&sensor={2}&key={3}",
							arr);
			URL urlmy = null;
			try {
				urlmy = new URL(url);
				HttpURLConnection con = (HttpURLConnection) urlmy
						.openConnection();
				con.setFollowRedirects(true);
				con.setInstanceFollowRedirects(false);
				con.connect();
				BufferedReader br = new BufferedReader(new InputStreamReader(
						con.getInputStream(), "UTF-8"));
				String s = "";
				StringBuffer sb = new StringBuffer("");
				while ((s = br.readLine()) != null) {
					sb.append(s + "");
				}
				ret = "" + sb;
				names = ret.split("\\,");
			} catch (MalformedURLException e) {
			} catch (IOException e) {
			}
		}
		return names;
	}
}