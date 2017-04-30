package pers.hjy.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.Manager;
import pers.hjy.bean.User;
import pers.hjy.service.AdminInterfaceService;
import pers.hjy.service.OrderInterfaceService;
import pers.hjy.service.impl.AdminInterfaceImplService;
import pers.hjy.service.impl.OrderInterfaceImplService;
import pers.hjy.util.Constant;
import pers.hjy.util.Pager;

/**
 * Servlet implementation class AjaxUserOrderSet
 */
@WebServlet("/ManagerAjaxOrderSet")
public class ManagerAjaxOrderSet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String setname = request.getParameter("setname");
		String order_id = request.getParameter("order_id");
		Manager manager = (Manager) request.getSession().getAttribute("manager");
		if(manager!=null&&order_id!=null){
			String admin_id = manager.getDbaId();
			service.updateOderState(order_id, setname, admin_id);
		}
		
		Map map = new HashMap<String, Object>();
		String order_state = request.getParameter("order_state");
		if(order_state!=null&&!order_state.trim().equals("")){
			map.put("order_state", order_state);
			request.getSession().setAttribute("order_state", order_state);
		}else{
			String test = (String) request.getSession().getAttribute("order_state");
			if(test!=null && !test.trim().equals("")){
				map.put("order_state", test);
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
		Pager<Map<String, Object>> orders = service.queryOrderList(map, pageNum, pageSize);
		// 获取查询到的订单数据
		request.getSession().setAttribute("orders", orders);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
