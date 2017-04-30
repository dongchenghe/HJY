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



/**
 * 管理所有的商品的servlet
 */
@WebServlet("/ManagerGoodsServlet")
public class ManagerGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		// 设置标识
		String checked = request.getParameter("checked");
		String content = request.getParameter("content");
		Map map = new HashMap<String, Object>();
		List<Map<String, Object>> allGoods = null;
		/*if(checked.equals("all")){
			
			allGoods= service.QueryGoodsList(map);
		}else if(checked.equals("less")){
			
			allGoods= service.QueryGoodsList(map);
		}else if(checked.equals("search")){
			
			allGoods= service.QueryGoodsList(map);
		}*/
		request.getSession().setAttribute("allGoods", allGoods);
		response.sendRedirect("dba/goodInfo.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
