
package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import pers.hjy.service.UserInterfaceService;
import pers.hjy.service.impl.UserInterfaceImplService;
/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/AjaxIsNameServlet")
public class AjaxIsNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserInterfaceService servce = new UserInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	String username = request.getParameter("username");
	if(username.equals("")){
		out.write("用户名不能为空");
	}
	if(servce.isExistUsername(username)){
		out.println("用户已存在");
	}
	out.flush();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
