package pers.hjy.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import pers.hjy.service.AddrInterfaceService;
import pers.hjy.service.OrderInterfaceService;
import pers.hjy.service.impl.AddrInterfaceImplService;
import pers.hjy.service.impl.OrderInterfaceImplService;

public class OrderMasetDeilTag extends TagSupport {
	private String order_id;
	private OrderInterfaceService service = new OrderInterfaceImplService();

	@Override
	public int doStartTag() throws JspException {
				JspWriter out =this.pageContext.getOut();
				StringBuffer html=new StringBuffer();
				List<Map<String, Object>> orderlist = service.getUserOrderDeteil(order_id);
				if(orderlist!=null || orderlist.size()>0){
					for(int i=0;i<orderlist.size();i++){
						//html.append("<img alt='商品' src='"+orderlist.get(i).get("IMG_SRC")+"//"+orderlist.get(i).get("IMG")+"' width='30px' height='30px'>");
						html.append(orderlist.get(i).get("NAME")+"-"+orderlist.get(i).get("COLOR"));
						html.append("x"+orderlist.get(i).get("COUNT"));
						html.append("   ");
					}
				}
				try {
					out.write(html.toString());
					//out是获取的，不是自己创建的 不能关闭
					//out.close();
				} catch (IOException e) {
					
					throw new RuntimeException(e);
				}		
		return super.doStartTag();
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

}
