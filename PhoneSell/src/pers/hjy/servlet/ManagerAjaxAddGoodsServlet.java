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
import pers.hjy.service.OrderInterfaceService;
import pers.hjy.service.impl.AdminInterfaceImplService;
import pers.hjy.service.impl.OrderInterfaceImplService;

/**
 * Servlet implementation class UpdateGoodsServlet
 */
@WebServlet("/ManagerAjaxAddGoodsServlet")
public class ManagerAjaxAddGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	private OrderInterfaceService service1 = new OrderInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String color = request.getParameter("color");
		String img_src = request.getParameter("img_src");
		String count = request.getParameter("count");
		String is_ground = request.getParameter("is_ground");
		String detaile = request.getParameter("detaile");
		String count_name = request.getParameter("count_name");
		String img = request.getParameter("img");
		String goods_id = service1.getIndexBySeqName("SEQ_Goods");
		String addname = request.getParameter("addname");
		String goods_id1 = request.getParameter("goods_id1");
		// 要求商品的名称及价格不能为空
		Map map = new HashMap<String, Object>();
		map.put("goods_id", goods_id);
		if(name!=null&&!name.equals("")){
			map.put("name", name);
		}
		if(price!=null&&!price.equals("")){
			map.put("price", price);
		}
		if(color!=null&&!color.equals("")){
			map.put("color", color);
		}
		if(img_src!=null&&!img_src.equals("")){
			map.put("img_src", img_src);
		}
		if(count!=null&&!count.equals("")){
			map.put("count", count);
		}
		if(is_ground!=null&&!is_ground.equals("")){
			map.put("is_ground", is_ground);
		}
		if(detaile!=null&&!detaile.equals("")){
			map.put("detaile", detaile);
		}
		if(count_name!=null&&!count_name.equals("")){
			map.put("count_name", count_name);
		}
		if(img!=null&&!img.equals("")){
			map.put("img", img);
		}
		if(addname!=null&&addname.trim().equals("color")&&goods_id1!=null&&!goods_id1.trim().equals("")){
			service.insertGoodsColor(goods_id1, color, count_name, price, img);
		}else{
			service.insertGoodsAndColor(map);
			out.write("保存成功");
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
