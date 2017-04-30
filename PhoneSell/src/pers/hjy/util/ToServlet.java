package pers.hjy.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.User;
import pers.hjy.service.CartInterfaceService;
import pers.hjy.service.OrderInterfaceService;
import pers.hjy.service.impl.CartInterfaceImplService;
import pers.hjy.service.impl.OrderInterfaceImplService;

/**
 * Servlet implementation class ToServlet
 */
@WebServlet("/ToServlet")
public class ToServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderInterfaceService service = new OrderInterfaceImplService();
	private CartInterfaceService service1 = new CartInterfaceImplService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jspname = request.getParameter("jspname").trim();
		if(jspname.equals("")){
			request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			return ;
		}else if(jspname.equals("shopingCar")||jspname.equals("pay")||jspname.equals("personal")){
			User u = (User)(request.getSession().getAttribute("user"));
			if(u==null){
				request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
				return;
			}else if(jspname.equals("personal")){
				/*int pageNum = Constant.DEFAULT_PAGE_NUM;
				String pageNumStr = request.getParameter("pageNum");
				if(pageNumStr!=null&&!pageNumStr.equals("")){
					pageNum = Integer.parseInt(pageNumStr);//显示第几页
				}
				int pageSize = Constant.DEFAULT_PAGE_SIZE;
				String pageSizeStr = request.getParameter("pageSize");
				if(pageSizeStr!=null&&!pageSizeStr.equals("")){
					pageSize = Integer.parseInt(pageSizeStr);//显示页面显示多少条数据
				}
				Map map = new HashMap<String, Object>();
				map.put("user_id", u.getUserId());
				if(request.getSession().getAttribute("zhuangtai")!=null){
					map.put("order_state", request.getSession().getAttribute("zhuangtai"));
				}
				Pager<Map<String, Object>> page = service.findrOrderListt(map, pageNum, pageSize);
				//返回结果到页面
				//request.getSession().setAttribute("orderdisplay", service.getUserOrderList(user_id, map));
				request.getSession().setAttribute("orderdisplay", page);*/
			}else if(jspname.equals("shopingCar")){
				List<Map<String, Object>> list = service1.getCarGoods(u.getUserId());
				request.getSession().setAttribute("list_goods", list);
			}
			request.getRequestDispatcher("/WEB-INF/jsp/"+jspname+".jsp").forward(request, response);
			return ;
		}
		request.getRequestDispatcher("/WEB-INF/jsp/"+jspname+".jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
