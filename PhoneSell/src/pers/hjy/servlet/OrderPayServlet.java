package pers.hjy.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pers.hjy.bean.User;
import pers.hjy.service.CartInterfaceService;
import pers.hjy.service.OrderInterfaceService;
import pers.hjy.service.impl.CartInterfaceImplService;
import pers.hjy.service.impl.OrderInterfaceImplService;



/**
 * Servlet implementation class AfterPay
 */
@WebServlet("/OrderPayServlet")
public class OrderPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderInterfaceService service = new OrderInterfaceImplService();
	private CartInterfaceService service1 = new CartInterfaceImplService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) request.getSession().getAttribute("user");
		String user_id=user.getUserId();
		//收货id
		String receive_id=request.getParameter("xuanze");
		String order_tatal = request.getParameter("order_tatal");
		List<Map<String, Object>> goods_list = (List<Map<String, Object>>) session.getAttribute("list_goods_jie");
		if(goods_list==null ||goods_list.size()==0){
			request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		}else{
			//获取订单序列 
			String order_id = service.getIndexBySeqName("SEQ_ORDERS");
			//插入数据库
			service.insertNewOrderDao(order_id, user_id, order_tatal, receive_id);
			for(int i=0;i<goods_list.size();++i){
				Map map = goods_list.get(i);
				Object goods_id1 = goods_list.get(i).get("COODS_COLOR_ID");
				String goods_id = goods_id1.toString();
				String goods_amount = goods_list.get(i).get("COUNT").toString();
				String goods_price = goods_list.get(i).get("C_PRICE").toString();
				String carId = goods_list.get(i).get("CART_ID").toString();
				service.insertOrderDetailsDao(order_id, goods_id, goods_amount, goods_price);
				service1.deleteGoods(user_id, carId);
			}
		}
		List list = service1.getCarGoods(user_id);
		session.setAttribute("goods_list", list);
		session.removeAttribute("list_goods_jie");
		request.getRequestDispatcher("/WEB-INF/jsp/pageskip.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
