<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page errorPage="serverErrorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>鲜花网注册页面</title>
	<link type="text/css" rel="stylesheet" href="css/zhuce.css" />
<script type="text/javascript">
	var xmlHttp;
	var flag_name=false,flag_repwd=false,flag_pwd=false,flag_phone=false,flag_email=false,flag_check=false;
	function createXMLHttpRequest(){           // 创建XMLHttpRequest对象
		if(window.ActiveXObject){             // 判断是否是IE内核的浏览器
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  // 创建适用于IE内核的XMLRequest的对象
		}else if(window.XMLHttpRequest){     // 判断是否是FireFox内核的浏览器
			xmlHttp = new XMLHttpRequest();    // 创建适用于IE内核的XMLRequest的对象
		}
	}
	createXMLHttpRequest(); 
	// 测试用户名是否存在
	function testName(name){
		xmlHttp.open("POST", "AjaxIsNameServlet?username="+name, true);
		xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
		// 服务器返回消息
		xmlHttp.onreadystatechange = fun1;  // 回调函数
		xmlHttp.send();
	}
	function fun1(){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				document.getElementById("spanname").innerHTML = xmlHttp.responseText;
				if(xmlHttp.responseText==""){
					flag_name = true;
				}else{
					flag_name = false;
				}
			}
		}
	}
	// 判断是否满足条件
	function writeFlag(){
		if(document.getElementById("ck").checked){
			flag_check = true;
		}else{
			flag_check=false;
		}
		return flag_name&&flag_pwd&&flag_repwd&&flag_phone&&flag_email&&flag_check;
	}
	// 判断密码的形式是否有误
	function checkpwd(pwd){
		var reg = /^[a-zA-Z|\d]{3,18}$/;
		if(pwd==""){
			document.getElementById("spanpwd").innerHTML = "密码不能为空";
			flag_pwd = false;
		}else{
			if(reg.test(pwd)){
				document.getElementById("spanpwd").innerHTML = "";
				flag_pwd = true;
			}else{
				document.getElementById("spanpwd").innerHTML = "密码格式不合适";
				flag_pwd = false;
			}
		}
	}
	// 判断密码是否一致
	function checkrepwd(repwd){
		// 获取密码
		var pwd = document.getElementById("pwd").value;
		 if(pwd==repwd){
			document.getElementById("spanrepwd").innerHTML ="";
			flag_repwd = true;
		}else{
			document.getElementById("spanrepwd").innerHTML ="密码不一致";
			flag_repwd = false;
		}
	}
	// 验证电话号码
	function checkphone(phone){
		 var reg =/^1[3|4|5|7|8]\d{9}$/;
		 if(phone==""){
			 document.getElementById("spanphone").innerHTML = "联系方式不能为空";
			 flag_phone = false;
		 }else{
		 if(!reg.test(phone)){
			 document.getElementById("spanphone").innerHTML = "电话号码格式错误";
			 flag_phone = false;
		 }else{
			 document.getElementById("spanphone").innerHTML = "";
			 flag_phone = true;
		 } 
		 }
	}
	// 判断邮箱是否正确
	function checkemail(email){
		 var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		 if(email==""){
			 document.getElementById("spanemail").innerHTML="";
		 }
		 if(!reg.test(email)){
			 document.getElementById("spanemail").innerHTML ="邮箱格式有误";
			 flag_email = false;
		 }else{
			 document.getElementById("spanemail").innerHTML ="";
			 flag_email = true;
			// alert(flag_name&&flag_pwd&&flag_repwd&&flag_phone&&flag_email);
		 }
	}
</script>
</head>
<body style="font-family: '微软雅黑';">
		<div style="background:#CCFFCC; width:100%">
			<div style="width:100%; background:#F2F2F2">
				<div class="top">
					<div class="top-left">
						<a name="top">欢迎来到手机商城</a>
						<span>|</span>
						<c:choose>
						<c:when test="${empty sessionScope.user}">
							<a class="top-lefta" href="ToServlet?jspname=login">登录</a>
	   					 <span>|</span>
	   						<a class="top-lefta" href = "ToServlet?jspname=register">快速注册</a>
						</c:when>
						<c:otherwise>
							<a class="top-lefta" href = #">${sessionScope.user.name}</a>
						<span>|</span>
							<a class="top-lefta" href = "ResetServlet">注销</a>
						</c:otherwise>
						</c:choose>
						<span>|</span>
					</div>
					<div class="top-right">
						<a href="#">服务保证</a>
						<span>|</span>
						<a href="ToServlet?jspname=personal" class="top-lefta">个人中心</a>
						<span>|</span>
						<a href="ToServlet?jspname=shopingCar" class="top-lefta">我的购物车</a>
					</div>
				</div>
			</div>
        <div id="mian">
            <div class="center">
            	<div class="left">
                <a href="IndexServlet"><img src="images/tubiao1.png" style="float:left; margin-top:10px;" /></a>
                	<img src="images/zhuceleft.png" width="590" height="260" style=" margin-top:40px;" />
                </div>
                <div class="right">
                	<div class="right1">
                    	<ul style="list-style:none;padding-left: 10px;padding-top: -30px;">	
                        	<li>
                        	<div class="right1title" style="text-align:right">
                        	如果你是会员请<a href="ToServlet?jspname=login">登录</a></div></li>
                        	<form action="RegisterServlet" method = "post" onsubmit="return writeFlag();">
                            <li>
                            	<div class="right1div">
                                	用户名&emsp;：<input class="input" id = "name" type = "text" name = "username" onblur="testName(this.value)"/>
                                <span id = "spanname" style ="font-size: 1px;color: red">*(不含非法字符)</span>
                                </div>
               					
                            </li>
                            <li>
                            	<div class="right1div">
                              	 密&emsp;&emsp;码： <input class="input" id = "pwd" type = "password" name = "userpwd" onblur="checkpwd(this.value)"/>
                                <span id = "spanpwd" style ="font-size: 1px;color: red">*(3-18位)</span>
                                </div>
                                  
                            </li>
                            <li>
                           		<div class="right1div">
                                	确认密码：<input class="input" id ="repwd" type = "password" name = "repassword" onblur="checkrepwd(this.value)"/>
                                 <span id = "spanrepwd" style ="font-size: 1px;color: red"></span>
                                </div>
                            </li>
                             <li>
                           		<div class="right1div" style="height: 20px">
                                                                                   性&emsp;&emsp;别：<input type = "radio" name = "user_sex" value = "0" checked="checked">男
			   						<input type = "radio" name = "user_sex" value = "1">女
                                </div>
                            </li>
                             <li>
                           		<div class="right1div">
                                	电话号码：<input class="input" id ="phone" type ="text" name = "user_phone" onblur="checkphone(this.value)"/>
                                 <span id = "spanphone" style ="font-size: 1px;color: red">*(中国号码)</span>
                                </div>
                            </li>
                              <li>
                           		<div class="right1div">
                                	电子邮箱：<input class="input" id = "email" type = "text" name = "user_email" onblur="checkemail(this.value)"/>
                                 <span id = "spanemail" style ="font-size: 1px;color: red">&nbsp;</span>
                                </div>
                            </li>
                            <li>
                            	<div class="right1div" style="height: 30px">
                                	<label><input id="ck" type="checkbox"/> 我已阅读并接受<a href="#" style="color:#C60">中国鲜花网服务条款</a>。</label> 
                                </div>
                            </li>
                            <li>
                           		<div class="right1div">
                                	<input class="divbutton" type="submit" name="jijiao" value="注册" />
                                </div>
                            </li>
                        
                            </form>
                        </ul>
                    </div>
                </div>
            </div>
          
            <!--底部-->
            <div class="dip">
            	<table bgcolor="#FFFFFF" height="100px" width="1200px" cellspacing="0" class="o">
                    <tr style="font-weight:bolder;">
                        <td><a href="#">新手指南</a></td>
                        <td><a href="#">贺卡服务</a></td>
                        <td><a href="#">全国配送服务</a></td>
                        <td><a href="#">支付与查询</a></td>
                        <td><a href="#">售后保障</a></td>
                        <td rowspan="3" width="150px">您有任何疑问，请拨打全国统一热线(免长途费)或联系 网页客服 </td>
                    </tr>
                    <tr>
                        <td><a href="#">玫瑰支数详细寓意</a></td>
                        <td><a href="#">星座、巧克力、爱情</a></td>
                        <td><a href="#">配送服务说明</a></td>
                        <td><a href="#">发票及支付方式</a></td>
                        <td><a href="#">鲜花绿植先行赔付</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">送花技巧</a></td>
                        <td><a href="#">送花祝福语大全</a></td>
                        <td><a href="#">全国城郊配送查询</a></td>
                        <td><a href="#">如何查询订单</a></td>
                        <td><a href="#">订购必读</a></td>
                    </tr>
                </table>
            </div>
        </div>
   </div>
</body>
</html>