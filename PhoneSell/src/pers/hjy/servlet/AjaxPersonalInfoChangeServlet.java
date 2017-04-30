package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import pers.hjy.bean.User;
import pers.hjy.service.UserInterfaceService;
import pers.hjy.service.impl.UserInterfaceImplService;


/**
 * Servlet implementation class AjaxPersonalInfoChangeServlet
 */
@WebServlet("/AjaxPersonalInfoChangeServlet")
public class AjaxPersonalInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserInterfaceService service = new UserInterfaceImplService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPersonalInfoChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String act = request.getParameter("act");
		User user=(User) session.getAttribute("user");
		if(act!=null){
			if(act.equals("mima")){
				String user_id=user.getUserId();
			    String password1 =request.getParameter("password1");
			    String password2=request.getParameter("password2");
			    service.updateUser(user_id, "user_pwd", password1);
			}else if(act.equals("xingxi")){
				String user_id=user.getUserId();
			    String sex =request.getParameter("sex");
			    String phone=request.getParameter("phone");
			    String email=request.getParameter("email");
			    service.updateUser(user_id, "sex", sex);
			    service.updateUser(user_id, "PHONE_NUMBER", phone);
			    service.updateUser(user_id, "EMAIL", email);
			}else{
				request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
