package pers.hjy.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.Goods;
import pers.hjy.service.GoodsInterfaceService;
import pers.hjy.service.impl.GoodsInterfaceImplService;

/**
 * Servlet implementation class GoodsShow
 */
@WebServlet("/PhoneShow")
public class PhoneShow extends HttpServlet {
	private GoodsInterfaceService service = new GoodsInterfaceImplService();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("goodsId");
		Goods goods = service.getGoods(id);
		List<Map<String, Object>> list = service.getGoodsColor(id);
		System.out.println(list.size());
		request.setAttribute("colors", list);
		request.setAttribute("goods", goods);
		request.getRequestDispatcher("/WEB-INF/jsp/goodsShow.jsp").forward(request, response);
		//request.getRequestDispatcher("ToServlet?jspname=phoneShow").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
