package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import pers.hjy.service.AdminInterfaceService;
import pers.hjy.service.impl.AdminInterfaceImplService;

/**
 * Servlet implementation class UpdateGoodsServlet
 */
@WebServlet("/ManagerUpdateGoodsServlet")
public class ManagerUpdateGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		// 获取session中的id
		String goods_id = request.getParameter("goods_id");
		String name = request.getParameter("name");
		String phone_color_id = request.getParameter("phone_color_id");
		String price = request.getParameter("price");
		String color = request.getParameter("color");
		String img_src = request.getParameter("img_src");
		String count = request.getParameter("count");
		String is_ground = request.getParameter("is_ground");
		String detaile = request.getParameter("detaile");
		// 要求商品的名称及价格不能为空
		if(name!=null&&!name.equals("")){
			service.updateGoods("goods", "name", name, "goods_id", goods_id);
		}
		if(img_src!=null&&!img_src.equals("")){
			service.updateGoods("goods", "img_src", img_src, "goods_id", goods_id);
		}
		if(is_ground!=null&&!is_ground.equals("")){
			service.updateGoods("goods", "is_ground", is_ground, "goods_id", goods_id);
		}
		if(detaile!=null&&!detaile.equals("")){
			service.updateGoods("goods", "detaile", detaile, "goods_id", goods_id);
		}
		if(price!=null&&!price.equals("")){
			service.updateGoods("phone_color", "price", price, "phone_color_id", phone_color_id);
		}
		if(color!=null&&!color.equals("")){
			service.updateGoods("phone_color", "color", color, "phone_color_id", phone_color_id);
		}
		if(count!=null&&!count.equals("")){
			service.updateGoods("phone_color", "count", count, "phone_color_id", phone_color_id);
		}
		List<Map<String, Object>>  list = service.queryGoodsById(phone_color_id);
		if(list!=null&&list.size()>0){
			// 将查询到的商品放入session回话中
			Map<String, Object> byIdGoods = list.get(0);
			request.getSession().setAttribute("byIdGoods", byIdGoods);
		}
		out.write("保存成功");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
