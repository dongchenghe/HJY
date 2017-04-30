package pers.hjy.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import pers.hjy.bean.User;


public class PersonalInfoChangeTag extends TagSupport {

	@Override
	public int doStartTag() throws JspException {
				JspWriter out =this.pageContext.getOut();
				HttpSession session=pageContext.getSession();
				User user= (User) session.getAttribute("user");
				StringBuffer html=new StringBuffer();
				if (user!=null) {	

					html.append("<table id='personalTable'>");
					html.append("<tr>");
					html.append("<td>昵称</td>");
					html.append("<td>性别</td>");
					html.append("<td>电话</td>");
					html.append("<td>邮件</td>");
            		html.append("</tr>");
            		String sex="";
            		if(user.getSex()!=null){
            			if(user.getSex().equals("0")){
            				sex="男";
            			}if(user.getSex().equals("1")){
            				sex="女";
            			}
            		}
					html.append("<tr>");
					html.append("<td  id='name'>"+(user.getName()==null?"":user.getName())+"</td>");	
					html.append("<td  id='sex'>"+sex+"</td>");	
					html.append("<td  id='phone'>"+(user.getPhoneNumber()==null?"":user.getPhoneNumber())+"</td>");
					html.append("<td  id='email'>"+(user.getEmail()==null?"":user.getEmail())+"</td>");
					html.append("</tr>");
					
					html.append("<tr style='display:none;' id='hidetr' >");
					html.append("<td id='name'>"+(user.getName().equals("null")?"":user.getName())+"</td>");	
					html.append("<td id='sex'><input type='radio' name='sexinput' checked='checked' value='0'>男<input type='radio' name='sexinput' value='1'>女</td>");	
					html.append("<td id='phone'><input type='text' name='phoneinput' id='phoneinput'/></td>");
					html.append("<td id='email'><input type='text' name='emailinput' id='emailinput'/></td>");
					html.append(" </tr>");
					
					html.append("<tr id='trbtn'>");
					html.append("<td colspan='6'>");
					html.append("<input type='button' value='修改信息' id='changeInfoBtn' onclick='changeInfoFun()'/>");
					html.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					html.append("<input type='button' value='确认修改' id='confirmChangeInfoBtn' onclick='confirmChangeInfoFun()' style='display:none;'/>");
					
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
