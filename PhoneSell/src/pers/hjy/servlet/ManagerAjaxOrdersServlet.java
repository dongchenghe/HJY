package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.service.AdminInterfaceService;
import pers.hjy.service.impl.AdminInterfaceImplService;
import pers.hjy.util.Constant;
import pers.hjy.util.Pager;


/**
 * 后台订单的servlet
 */
@WebServlet("/ManagerAjaxOrdersServlet")
public class ManagerAjaxOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService(); 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		// 获取标识参数
		Map map = new HashMap<String, Object>();
		String order_state = request.getParameter("order_state");
		String user_id = request.getParameter("user_id");
		String order_id = request.getParameter("order_id");
		String create_date1 = request.getParameter("create_date1");
		String create_date2 = request.getParameter("create_date2");
		String kddh = request.getParameter("kddh");
		if(order_state!=null&&!order_state.trim().equals("")){
			map.put("order_state", order_state);
			request.getSession().setAttribute("order_state", order_state);
		}else{
			String test = (String) request.getSession().getAttribute("order_state");
			if(test!=null && !test.trim().equals("")){
				map.put("order_state", test);
			}
		}
		if(user_id!=null&&!user_id.trim().equals("")){
			map.put("user_id", user_id);
			request.getSession().setAttribute("user_id", user_id);
		}else{
			String test = (String) request.getSession().getAttribute("user_id");
			if(test!=null && !test.trim().equals("")){
				map.put("user_id", test);
			}
		}
		if(order_id!=null&&!order_id.trim().equals("")){
			map.put("order_id", order_id);
			request.getSession().setAttribute("order_id", order_id);
		}else{
			String test = (String) request.getSession().getAttribute("order_id");
			if(test!=null && !test.trim().equals("")){
				map.put("order_id", test);
			}
		}
		if(create_date1!=null&&!create_date1.trim().equals("")){
			map.put("create_date1", create_date1);
			request.getSession().setAttribute("create_date1", create_date1);
		}else{
			String test = (String) request.getSession().getAttribute("create_date1");
			if(test!=null && !test.trim().equals("")){
				map.put("create_date1", test);
			}
		}
		if(create_date2!=null&&!create_date2.trim().equals("")){
			map.put("create_date2", create_date2);
			request.getSession().setAttribute("create_date2", create_date2);
		}else{
			String test = (String) request.getSession().getAttribute("create_date2");
			if(test!=null && !test.trim().equals("")){
				map.put("create_date2", test);
			}
		}
		if(kddh!=null&&!kddh.trim().equals("")){
			map.put("kddh", kddh);
			request.getSession().setAttribute("kddh", kddh);
		}else{
			String test = (String) request.getSession().getAttribute("kddh");
			if(test!=null && !test.trim().equals("")){
				map.put("kddh", test);
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
