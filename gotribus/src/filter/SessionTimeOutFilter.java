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
import javax.servlet.http.HttpSession;

public class SessionTimeOutFilter implements Filter{

//	@Override
//	public void destroy() {		
//		
//	}

//	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse resp = (HttpServletResponse)res;
		
		String uri = request.getRequestURI();		
		
		HttpSession session = request.getSession(false);
		
		if(uri.contains("invitationForm.action")
				 ||uri.contains("login.action")
				 ||uri.contains("index.action")
				){					
			chain.doFilter(request, resp);		  
		}else{
			System.out.println("-------new fileter------------");
			if(session != null && !session.isNew()) {
				System.out.println("-------new fileter--------here----");
				resp.sendRedirect("/user/invitationForm.action");
			}
		}						   
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

//	@Override
//	public void init(FilterConfig arg0) throws ServletException {
//		// TODO Auto-generated method stub
//		
//	}

}
