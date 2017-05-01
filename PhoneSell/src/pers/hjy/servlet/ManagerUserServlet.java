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
 * 管理所有的用户的servlet
 */
@WebServlet("/ManagerUserServlet")
public class ManagerUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		// 获取标识参数
		Map map = new HashMap<String, Object>();
		int pageNum = Constant.DEFAULT_PAGE_NUM;
		String pageNumStr = request.getParameter("pageNum");
		if(pageNumStr!=null&&!pageNumStr.equals("")){
			pageNum = Integer.parseInt(pageNumStr);//显示第几页
		}
		int pageSize = Constant.DEFAULT_PAGE_SIZE;
		String pageSizeStr = request.getParameter("pageSize");
		if(pageSizeStr!=null&&!pageSizeStr.equals("")){
			pageSize = Integer.parseInt(pageSizeStr);//显示页面显示多少条数据
		}
		Pager<Map<String, Object>> users = service.queryUserList(map, pageNum, pageSize);
		// 获取查询到的订单数据
		request.getSession().setAttribute("users", users);
		String setname = request.getParameter("setname");
		if(setname!=null){
			if(setname.equals("password")){
				response.sendRedirect("dba/setUserPassword.jsp");
				return;
			}else if(setname.equals("is_valid")){
				response.sendRedirect("dba/setUserValid.jsp");
				return;
			}
			response.sendRedirect("dba/checkAllUser.jsp");
		}else{
			response.sendRedirect("dba/checkAllUser.jsp");
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
