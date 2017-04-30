package pers.hjy.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class GoodsListTag extends TagSupport {

	@Override
	public int doStartTag() throws JspException {
				JspWriter out =this.pageContext.getOut();
				HttpSession session=pageContext.getSession();
				//ArrayList<GoodsBy> goods_list=(ArrayList) session.getAttribute("list_goods_jie");
				ArrayList<Map<String, Object>> goods_list=(ArrayList) session.getAttribute("list_goods_jie");
				StringBuffer html=new StringBuffer();
				if (goods_list!=null) {	
					float money=0.0f;
					float price=0.0f;
					int count=0;
					html.append("<table id='table2' class='ul1' cellspacing='0px'>");
					html.append("<tr>");
					html.append("<td class='product'>商品图片</td>");
					html.append("<td class='product'>商品详情</td>");
					html.append("<td class='market-price'>价格</td>");
            		html.append("<td class='market-price'>数量</td>");
            		html.append("<td class='operate'>小计</td>");
            		html.append("</tr>");		
				for(int i=0;i<goods_list.size();++i){
					count=Integer.parseInt(goods_list.get(i).get("COUNT").toString());
					price=Float.parseFloat(goods_list.get(i).get("C_PRICE").toString());
					money+=count*price;
					html.append("<tr>");
					html.append("<td>");
					html.append("<a href='PhoneShow?goodsId="+goods_list.get(i).get("GOODS_ID")+"'><img src='"+goods_list.get(i).get("IMG_SRC")+"/"+goods_list.get(i).get("IMG")+"' width='70' height='70'/></a>");
					html.append("</td>");
					html.append("<td>");
					html.append("<a href='PhoneShow?goodsId="+goods_list.get(i).get("GOODS_ID")+"' style='margin-top:30px; font-size:14px; height:70px;line-height:70px;'><span>["+goods_list.get(i).get("NAME")+"]"+goods_list.get(i).get("COLOR")+"</span></a>");
					html.append("</td>");
					html.append("<td>");
					html.append("<span>¥"+goods_list.get(i).get("C_PRICE")+"</span>");
					html.append("</td>");
					html.append("<td>");
					html.append(count+"件");
					html.append("</td>");
					html.append("<td>");
					html.append((count*price)+"元");
					html.append("</td>");
					html.append("</tr>");			
				}	
				html.append("<tr>");
				html.append("<td colspan='5' style='text-align:right;border:0px;'><input name='order_tatal' type='hidden' value='"+money+"'/><font color='#FF6600'>应付金额：¥"+money+"</font></td>");
				html.append("<td style='text-align:right;border:0px;'>");
				html.append("<form>");
				html.append("<input type='button' id='submitbtn' style='background-image:url(images/pay.png);width:84px;height:50px;margin-right:60%;'/>");
				html.append("</form>");
				html.append("</td>");
				html.append("</tr>");
				html.append("</table>");		
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

}
