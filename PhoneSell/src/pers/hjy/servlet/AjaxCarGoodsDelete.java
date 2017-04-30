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
import pers.hjy.service.GoodsInterfaceService;
import pers.hjy.service.impl.CartInterfaceImplService;
import pers.hjy.service.impl.GoodsInterfaceImplService;


/**
 * Servlet implementation class AjaxCarGoodsDelete
 */
@WebServlet("/AjaxCarGoodsDelete")
public class AjaxCarGoodsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartInterfaceService service = new CartInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String car_id = request.getParameter("car_id");
		User user =(User)(request.getSession().getAttribute("user"));
/*		//会话中删除商品
		ArrayList<GoodsBy> list_goods = (ArrayList<GoodsBy>)request.getSession().getAttribute("list_goods");
		int delete_carid=999;
		for(int i=0;i<list_goods.size();i++){
			if(list_goods.get(i).getCar_id().equals(car_id)){
				delete_carid=i;
			}
		}
		list_goods.remove(delete_carid);
		request.getSession().setAttribute("list_goods", list_goods);*/
		//数据库中删除商品
		String user_id = user.getUserId();
		PrintWriter out = response.getWriter();
		int n = service.deleteGoods(user_id, car_id);
		List list_goods = service.getCarGoods(user_id);
		request.getSession().setAttribute("list_goods", list_goods);
		if(n==1){
			out.print(1);
		}
		if(n==0){
			out.print(0);
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
