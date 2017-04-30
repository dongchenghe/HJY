package pers.hjy.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pers.hjy.bean.User;


/**
 * Servlet Filter implementation class UserLoginFilter
 */
@WebFilter("/UserLoginFilter")
public class UserLoginFilter implements Filter {
	String withoutjsp;
    /**
     * Default constructor. 
     */
    public UserLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		String url = ((HttpServletRequest)request).getServletPath();
		String[] withJspArr = withoutjsp.split(",");
		int a = url.lastIndexOf("/");
		String jspname = url.substring(a+1);
		boolean isLu=true;
		for(String aa:withJspArr){
			if(jspname.equals(aa)){
				isLu = false;
			}
		}
		if(isLu){
			
		}else{
		 	User name = (User)session.getAttribute("user");
			if(name==null){
				request.getRequestDispatcher("ToServlet?jspname=login").forward(request, response);
			}
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		//String withoutjsp = fConfig.getInitParameter("file_jsp");
		withoutjsp = fConfig.getInitParameter("do_jsp");
	}

}
