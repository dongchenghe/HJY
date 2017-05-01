package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.service.AdminInterfaceService;
import pers.hjy.service.GoodsInterfaceService;
import pers.hjy.service.impl.AdminInterfaceImplService;
import pers.hjy.service.impl.GoodsInterfaceImplService;



/**
 * 通过商品id获取对应的商品的servlet
 */
@WebServlet("/ManagerGetGoodsById")
public class ManagerGetGoodsById extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		// 通过传参的值
		String goods_color_id = request.getParameter("goods_color_id");
		List<Map<String, Object>>  list = service.queryGoodsById(goods_color_id);
		if(list!=null&&list.size()>0){
			// 将查询到的商品放入session回话中
			Map<String, Object> byIdGoods = list.get(0);
			request.getSession().setAttribute("byIdGoods", byIdGoods);
		}
		response.sendRedirect("dba/updateGoods.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
