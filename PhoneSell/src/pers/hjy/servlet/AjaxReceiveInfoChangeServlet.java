package pers.hjy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pers.hjy.bean.User;
import pers.hjy.service.AddrInterfaceService;
import pers.hjy.service.impl.AddrInterfaceImplService;


/**
 * Servlet implementation class AjaxReceiveInfoChangeServlet
 */
@WebServlet("/AjaxReceiveInfoChangeServlet")
public class AjaxReceiveInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddrInterfaceService service = new AddrInterfaceImplService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReceiveInfoChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user"); 
		String user_id=user.getUserId();
	    String addr_id =request.getParameter("id");
	    service.deletaddr(addr_id,user_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
