/*购物车点击结算的sevlet*/
package pers.hjy.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.Address;
import pers.hjy.bean.User;
import pers.hjy.service.AddrInterfaceService;
import pers.hjy.service.CartInterfaceService;
import pers.hjy.service.impl.AddrInterfaceImplService;
import pers.hjy.service.impl.CartInterfaceImplService;



/**
 * Servlet implementation class Balance
 */
@WebServlet("/BalanceServlet")
public class BalanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartInterfaceService service = new CartInterfaceImplService();
	private AddrInterfaceService service1 = new AddrInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] car=request.getParameterValues("choose");
		User user= (User)(request.getSession().getAttribute("user"));
		//从数据库获取购物车商品
		List<Map<String, Object>> list_goods = service.getCarGoods(user.getUserId());
		if(list_goods==null || list_goods.size()==0){
			request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		}else{
			List<Map<String, Object>> list_goods_jie = new ArrayList<Map<String, Object>>();
			for(int n=0;n<car.length;n++){
				for(int i=0;i<list_goods.size();i++){
					String goods_id = list_goods.get(i).get("CART_ID").toString();
					if(goods_id.equals(car[n])){
						list_goods_jie.add(list_goods.get(i));
						break;
					}
				}
			}
			ArrayList<Address> receive_list = service1.getReceive(user.getUserId());
			request.getSession().setAttribute("list_goods_jie", list_goods_jie);
			request.getSession().setAttribute("receive_list", receive_list);
			request.getSession().setAttribute("user_addrid", user.getDefaultAddr());
			request.getRequestDispatcher("/WEB-INF/jsp/pay.jsp").forward(request, response);
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
