package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.User;
import pers.hjy.service.UserInterfaceService;
import pers.hjy.service.impl.UserInterfaceImplService;


/**
 *用户注册
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserInterfaceService service = new UserInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("userpwd");
		String user_sex = request.getParameter("user_sex");
		String telephone = request.getParameter("user_phone");
		String email = request.getParameter("user_email");	
		boolean isPassword = Pattern.compile("[a-zA-Z|\\d]{3,18}").matcher(password).matches();
		boolean isTelephone = Pattern.compile("1[3|4|5|7|8]\\d{9}").matcher(telephone).matches();
		boolean isEmail = Pattern.compile("([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})").matcher(email).matches();
		if(isEmail&&isTelephone&&isPassword){
			User user = new User();
			user.setName(username);
			user.setPassWord(password);
			user.setSex(user_sex);
			user.setPhoneNumber(telephone);
			user.setEmail(email);
			int result = service.save(user);
			if(result!=0){
				response.setHeader("Refresh", "2;URL=/PhoneSell/ToServlet?jspname=login");
				out.write("注册成功，2秒后跳入登录页面");
			}else{
				response.setHeader("Refresh", "2;URL=/PhoneSell/ToServlet?jspname=register");
				out.write("注册失败，稍后再试");
			}
			
		}else{
			request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
