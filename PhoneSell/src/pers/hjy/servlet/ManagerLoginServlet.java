package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.Manager;
import pers.hjy.dao.AdminInterfaceDao;
import pers.hjy.service.AdminInterfaceService;
import pers.hjy.service.impl.AdminInterfaceImplService;

/**
 * 管理员登陆的ajax
 */
@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 获取用户输入的参数
		String dba_name = request.getParameter("dba_name");
		String dba_pwd = request.getParameter("dba_pwd");
		Manager manager = service.managerLogin(dba_name);
		if(manager==null){
			out.write("用户名或密码错误");
		}
		else{
			if(!manager.getPassWord().equals(dba_pwd)){
				out.write("用户名或密码错误");
			}else{
				request.getSession().setAttribute("manager", manager);
			}
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
