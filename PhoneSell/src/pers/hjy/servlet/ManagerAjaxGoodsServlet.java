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
@WebServlet("/ManagerAjaxGoodsServlet")
public class ManagerAjaxGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService(); 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		// 获取标识参数
		Map map = new HashMap<String, Object>();
		String goods_name = request.getParameter("goods_name");
		String goods_color = request.getParameter("goods_color");
		String kc1 = request.getParameter("kc1");
		String kc2 = request.getParameter("kc2");
		String sell_count1 = request.getParameter("sell_count1");
		String sell_count2 = request.getParameter("sell_count2");
		if(goods_name!=null){
			map.put("goods_name", goods_name);
			request.getSession().setAttribute("goods_name", goods_name);
		}else{
			String test = (String) request.getSession().getAttribute("goods_name");
			if(test!=null && !test.trim().equals("")){
				map.put("goods_name", test);
			}
		}
		if(goods_color!=null){
			map.put("goods_color", goods_color);
			request.getSession().setAttribute("goods_color", goods_color);
		}else{
			String test = (String) request.getSession().getAttribute("goods_color");
			if(test!=null && !test.trim().equals("")){
				map.put("goods_color", test);
			}
		}
		if(kc1!=null){
			map.put("kc1", kc1);
			request.getSession().setAttribute("kc1", kc1);
		}else{
			String test = (String) request.getSession().getAttribute("kc1");
			if(test!=null && !test.trim().equals("")){
				map.put("kc1", test);
			}
		}
		if(kc2!=null){
			map.put("kc2", kc2);
			request.getSession().setAttribute("kc2", kc2);
		}else{
			String test = (String) request.getSession().getAttribute("kc2");
			if(test!=null && !test.trim().equals("")){
				map.put("kc2", test);
			}
		}
		if(sell_count1!=null){
			map.put("sell_count1", sell_count1);
			request.getSession().setAttribute("sell_count1", sell_count1);
		}else{
			String test = (String) request.getSession().getAttribute("sell_count1");
			if(test!=null && !test.trim().equals("")){
				map.put("sell_count1", test);
			}
		}
		if(sell_count2!=null){
			map.put("sell_count2", sell_count2);
			request.getSession().setAttribute("sell_count2", sell_count2);
		}else{
			String test = (String) request.getSession().getAttribute("sell_count2");
			if(test!=null && !test.trim().equals("")){
				map.put("sell_count2", test);
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
		Pager<Map<String, Object>> goods = service.queryGooodsList(map, pageNum, pageSize);
		// 获取查询到的订单数据
		request.getSession().setAttribute("goods", goods);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
