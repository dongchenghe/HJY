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
@WebServlet("/ManagerAjaxUserSet")
public class ManagerAjaxUserSet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String setusername = request.getParameter("setusername");
		String user_id = request.getParameter("user_id");
		if(setusername!=null&&!setusername.equals("")){
			if(setusername.equals("password")){
				service.updatePwd("123456", user_id);
			}else if(setusername.equals("is_valid")){
				String is_valid = request.getParameter("is_valid");
				service.updateUser("IS_VALID", is_valid, user_id);
			}
		}
		Map map = new HashMap<String, Object>();
		String user_name = request.getParameter("user_name");
		String sex = request.getParameter("sex");
		String is_valid = request.getParameter("is_valid");
		String createdate1 = request.getParameter("createdate1");
		String createdate2 = request.getParameter("createdate2");
		if(user_id!=null){
			map.put("user_id", user_id);
			request.getSession().setAttribute("user_id", user_id);
		}else{
			String test = (String) request.getSession().getAttribute("user_id");
			if(test!=null && !test.trim().equals("")){
				map.put("user_id", test);
			}
		}
		if(user_name!=null){
			map.put("user_name", user_name);
			request.getSession().setAttribute("user_name", user_name);
		}else{
			String test = (String) request.getSession().getAttribute("user_name");
			if(test!=null && !test.trim().equals("")){
				map.put("user_name", test);
			}
		}
		if(sex!=null){
			map.put("sex", sex);
			request.getSession().setAttribute("sex", sex);
		}else{
			String test = (String) request.getSession().getAttribute("sex");
			if(test!=null && !test.trim().equals("")){
				map.put("sex", test);
			}
		}
		if(is_valid!=null){
			map.put("is_valid", is_valid);
			request.getSession().setAttribute("is_valid", is_valid);
		}else{
			String test = (String) request.getSession().getAttribute("is_valid");
			if(test!=null && !test.trim().equals("")){
				map.put("is_valid", test);
			}
		}
		if(createdate1!=null){
			map.put("createdate1", createdate1);
			request.getSession().setAttribute("createdate1", createdate1);
		}else{
			String test = (String) request.getSession().getAttribute("createdate1");
			if(test!=null && !test.trim().equals("")){
				map.put("createdate1", test);
			}
		}
		if(createdate2!=null){
			map.put("sell_count2", createdate2);
			request.getSession().setAttribute("createdate2", createdate2);
		}else{
			String test = (String) request.getSession().getAttribute("createdate2");
			if(test!=null && !test.trim().equals("")){
				map.put("createdate2", test);
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
		Pager<Map<String, Object>> users = service.queryUserList(map, pageNum, pageSize);
		// 获取查询到的订单数据
		request.getSession().setAttribute("users", users);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
