package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.service.AdminInterfaceService;
import pers.hjy.service.impl.AdminInterfaceImplService;
import pers.hjy.util.Constant;
import pers.hjy.util.Pager;



/**
 * 管理所有的主页展示的servlet
 */
@WebServlet("/ManagerTypeServlet")
public class ManagerTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		// 获取标识参数
		String show_id =request.getParameter("show_id");
		List list = service.queryTypeList(show_id);
		request.getSession().setAttribute("show_list", list);
		response.sendRedirect("dba/typeGoodInfo.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
