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
import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import pers.hjy.bean.Address;
import pers.hjy.bean.User;
import pers.hjy.service.AddrInterfaceService;
import pers.hjy.service.impl.AddrInterfaceImplService;



/**
 * Servlet implementation class AjaxReceiveInfoServlet
 */
@WebServlet("/AjaxReceiveInfoServlet")
public class AjaxReceiveInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddrInterfaceService service = new AddrInterfaceImplService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReceiveInfoServlet() {
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
	    String name =request.getParameter("name");
	    String phone=request.getParameter("phone");
	    String address=request.getParameter("address");
	    Address addr = new Address();
	    addr.setAddress(address==null?"":address);
	    addr.setReceiver(name==null?"":name);
	    addr.setTell(phone==null?"":phone);
	    addr.setUserId(user_id);
	    addr.setRemark("");
	    service.insertAddr(addr);
	    ArrayList<Address> receive_list= service.getReceive(user_id);
	   request.getSession().setAttribute("receive_list", receive_list);
	   out.print(receive_list.get(receive_list.size()-1).getAddrId());
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
