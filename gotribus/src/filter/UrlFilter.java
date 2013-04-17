package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		 
		HttpServletRequest hsq = (HttpServletRequest)arg0;
		HttpServletResponse hs = (HttpServletResponse)arg1;
		String uri = hsq.getRequestURI();		
		
		
		if(uri.contains("user/loginForm") ||
				uri.contains("user/login")||
				uri.contains("user/invitationForm")||
				uri.contains("user/register")||
				uri.contains("view")){
			arg2.doFilter(arg0, arg1);	
		}else if( uri.contains("movie")
				|| uri.contains("user")
				||uri.contains("music")
				||uri.contains("book")
				||uri.contains("activity")
				){
			
			if(hsq.getSession(false) == null || hsq.getSession(false).getAttribute("user") == null){			
				hs.sendRedirect("/user/loginForm.action");
			}else{
				arg2.doFilter(arg0, arg1);	
			}			
		}else{
			arg2.doFilter(arg0, arg1);
		}		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
