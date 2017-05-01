package pers.hjy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.hjy.service.GoodsInterfaceService;
import pers.hjy.service.impl.GoodsInterfaceImplService;



/**
 * Servlet implementation class Index
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsInterfaceService service = new GoodsInterfaceImplService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("jin", service.getGoodsByShow(2));
		request.setAttribute("new1", service.getGoodsByShow(0));
		request.setAttribute("hot", service.getGoodsByShow(1));
		request.setAttribute("hot", service.getGoodsByShow(1));
		request.setAttribute("hot", service.getGoodsByShow(1));
		request.setAttribute("hot", service.getGoodsByShow(1));
		request.setAttribute("hot", service.getGoodsByShow(1));
		request.setAttribute("hot", service.getGoodsByShow(1));
		request.setAttribute("hot", service.getGoodsByShow(1));
		request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
