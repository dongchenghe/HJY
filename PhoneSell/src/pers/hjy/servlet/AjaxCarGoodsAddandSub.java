package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.User;
import pers.hjy.service.CartInterfaceService;
import pers.hjy.service.impl.CartInterfaceImplService;

/**
 * Servlet implementation class AjaxCarGoodsAddandSub
 */
@WebServlet("/AjaxCarGoodsAddandSub")
public class AjaxCarGoodsAddandSub extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartInterfaceService service = new CartInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String car_id = request.getParameter("car_id");
		String goods_count = request.getParameter("goods_count");
		User user =(User)(request.getSession().getAttribute("user"));
		String user_id = user.getUserId();
		/*//会话中改变商品
		ArrayList<GoodsBy> list_goods = (ArrayList<GoodsBy>)request.getSession().getAttribute("list_goods");
		for(int i=0;i<list_goods.size();i++){
			if(list_goods.get(i).getCar_id().equals(car_id)){
				list_goods.get(i).setCount(goods_count);
			}
		}*/
		service.setGoodsCount(car_id, goods_count);
		List list_goods = service.getCarGoods(user_id);
		request.getSession().setAttribute("list_goods", list_goods);
		//PrintWriter out = response.getWriter();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
