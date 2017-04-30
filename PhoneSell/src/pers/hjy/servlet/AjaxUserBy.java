package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.bean.User;
import pers.hjy.service.CartInterfaceService;
import pers.hjy.service.impl.CartInterfaceImplService;
import pers.hjy.util.CarUtil;


/**
 * Servlet implementation class UserBy
 */
@WebServlet("/AjaxUserBy")
public class AjaxUserBy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartInterfaceService service = new CartInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String goods_id = request.getParameter("goods_id");
		String goods_count = request.getParameter("goods_count");
		String color_id = request.getParameter("color_id");
		PrintWriter out = response.getWriter();
		User user= (User)(request.getSession().getAttribute("user"));
		if(goods_id!=null&&goods_count!=null&&color_id!=null){
			if(user==null){
				out.print(1);
			}else{//将商品加入到数据库
				int result = service.addPhone(user.getUserId(), goods_id, color_id, goods_count);
				if(result>0){
					out.print(0);
				}else{
					out.print(2);
				}
			}
		}else{
			//异常处理
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
