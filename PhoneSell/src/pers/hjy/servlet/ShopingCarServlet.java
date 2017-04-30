package pers.hjy.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.User;
import pers.hjy.service.CartInterfaceService;
import pers.hjy.service.impl.CartInterfaceImplService;


/**
 * Servlet implementation class ShopingCar
 */
@WebServlet("/ShopingCarServlet")
public class ShopingCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartInterfaceService service = new CartInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user= (User)(request.getSession().getAttribute("user"));
		if(user!=null){
			List<Map<String, Object>> list = service.getCarGoods(user.getUserId());
			request.getSession().setAttribute("list_goods", list);
			request.getRequestDispatcher("/WEB-INF/jsp/shopingCar.jsp").forward(request, response);
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
