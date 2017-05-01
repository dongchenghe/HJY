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
@WebServlet("/ManagerAjaxShowTypeSet")
public class ManagerAjaxShowTypeSet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminInterfaceService service = new AdminInterfaceImplService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String goods_show_id = request.getParameter("goods_show_id");
		String show_name = request.getParameter("show_name");
		String goods_id = request.getParameter("goods_id");
		String sequen = request.getParameter("sequen");
		service.updatTypeById(goods_id, sequen, goods_show_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
