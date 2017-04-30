package pers.hjy.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.User;
import pers.hjy.service.OrderInterfaceService;
import pers.hjy.service.impl.OrderInterfaceImplService;
import pers.hjy.util.Constant;
import pers.hjy.util.Pager;


/**
 * Servlet implementation class AjaxUserOrderServlet
 */
@WebServlet("/AjaxUserOrderServlet")
public class AjaxUserOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderInterfaceService service = new OrderInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_order_clik = request.getParameter("user_order_clik");
		User u = (User)(request.getSession().getAttribute("user"));
		String user_id  = u.getUserId();
		Map map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		if(user_order_clik!=null){
			if(!user_order_clik.equals("10")){
				map.put("order_state", user_order_clik);
			}
			request.getSession().setAttribute("zhuangtai", user_order_clik);
		}else{
			if(request.getSession().getAttribute("zhuangtai")!=null){
				if(!request.getSession().getAttribute("zhuangtai").equals("10")){
					map.put("order_state", request.getSession().getAttribute("zhuangtai"));
				}
			}
		}
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
		Pager<Map<String, Object>> page = service.findrOrderListt(map, pageNum, pageSize);
		//返回结果到页面
		//request.getSession().setAttribute("orderdisplay", service.getUserOrderList(user_id, map));
		request.getSession().setAttribute("orderdisplay", page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
