
package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.Address;
import pers.hjy.bean.User;
import pers.hjy.service.AddrInterfaceService;
import pers.hjy.service.UserInterfaceService;
import pers.hjy.service.impl.AddrInterfaceImplService;
import pers.hjy.service.impl.UserInterfaceImplService;


/**
 * 处理登陆信息
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserInterfaceService service = new UserInterfaceImplService();
	private AddrInterfaceService service1 = new AddrInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset = utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// ͨ获取参数的值
		String user_name = request.getParameter("username");
		String user_pwd = request.getParameter("password");
		String authcode = request.getParameter("authcode");
		User user = service.findUser(user_name, user_pwd);
		String authLink = (String)request.getSession().getAttribute("authLink");
		if(authLink!=null && !authcode.equals(authLink)){
			response.setCharacterEncoding("UTF-8");
			String url = "ToServlet?jspname=login&username="+user_name; 
			url = new String(url.getBytes("utf-8"), "ISO8859-1");
			request.setAttribute("erro", "验证码错误");
			request.getRequestDispatcher(url).forward(request, response);
		}
		if(user!=null){
			// 将数据存储在回话中
			request.getSession().setAttribute("user", user);
			ArrayList<Address> receive_list = service1.getReceive(user.getUserId());
			request.getSession().setAttribute("receive_list", receive_list);
			response.sendRedirect("IndexServlet");
		}else{
			response.setCharacterEncoding("UTF-8");
			String url = "ToServlet?jspname=login&username="+user_name; 
			url = new String(url.getBytes("utf-8"), "ISO8859-1");
			request.setAttribute("erro", "用户名或密码错误，请重新输入！");
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
