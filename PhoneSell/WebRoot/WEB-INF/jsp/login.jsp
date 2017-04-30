<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--     <%@ page errorPage="serverErrorPage.jsp" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="<%=basePath%>">
    <title>登录页面</title>
	<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
	<link type="text/css" rel="stylesheet" href="css/denglu.css" />
</head>
<script type="text/javascript">
	function refresh(){
	var img = document.getElementById("img");
	img.src = "getAuthCodeServlet?"+new Date().getTime();
	}
	function isName(){
		var name = $("input[name='username']");
		if(name.prop("value")==""){
			return false;
		}
		return true;
	}
	function isPwd(){
		var password = $("input[name='password']");
		if(password.prop("value")==""){
			return false;
		}
		return true;
	}
	function isYan(){
		var authcode = $("input[name='authcode']");
		if(authcode.prop("value")==""){
			return false;
		}
		return true;
	}
	function testName(name){
		 if(name==""){
			 document.getElementById("spanname").innerHTML = "用户名不能为空";
		 }else{
			 document.getElementById("spanname").innerHTML = "";
		 }
	}
	function testPwd(pwd){
		 if(pwd==""){
			 document.getElementById("spanpwd").innerHTML = "密码不能为空";
		 }else{
			 document.getElementById("spanpwd").innerHTML = "";
		 }
	}
	function testYan(yan){
		 if(yan==""){
			 document.getElementById("yant").innerHTML="验证码不能为空";
		 }else{
			 document.getElementById("yant").innerHTML="&nbsp;";
		 }
	}
	function writeFlag(){
		if(!isName()){
			document.getElementById("spanname").innerHTML = "用户名不能为空";
			return false;
		}
		if(!isPwd()){
			document.getElementById("spanpwd").innerHTML = "密码不能为空";
			return false;
		}
		if(!isYan()){
			document.getElementById("yant").innerHTML="验证码不能为空";
			return false;
		}
		return true;
	}
</script>
<body  style="font-family: '微软雅黑';">
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
        	<div class="top1">
            	<div class="top1-1">
                	<a href="IndexServlet"><img src="images/tubiao1.png" height="80px" width="200px"/></a>
                </div>
                <div class="top1-2">
                	<ul class="topul">
                    	<li class="topli"><a href="IndexServlet">首页</a></li>
                    </ul>
                </div>
            </div>
            <div class="center">
            	<div class="left">
                	<img src="images/zhuceleft.png" width="590" height="260" style=" margin-top:40px;" />
                </div>
                <div class="right">
                	<div class="right1">
                	  <ul style="list-style:none;padding-left: 10px;">
                      <li><div><font color="#660099" size="+1">会员登录</div></li>
                      <form action = "LoginServlet" method = "post" onsubmit="return writeFlag();">
                          <li>
                           	  <div class="right1div">
                               	  用户名:&nbsp;<input class="input" type = "text" name = "username" onblur="testName(this.value)" value="${param.username}" />
                               	  <span id = "spanname" style ="font-size: 1px;color: red"></span>
                              </div>
                          </li>
                          <li>
                           	  <div class="right1div">
                               	  密&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="input" type = "password" name = "password" onblur="testPwd(this.value)"/>
                              	<span id = "spanpwd" style ="font-size: 1px;color: red"></span>
                              </div>
                          </li>
                            <li>
                           	  <div class="right1div">
                               	  验证码:&nbsp;<input id = "yan"class = "input" type = "text" name = "authcode" onblur="testYan(this.value)"/>
                              	<img style="margin-top: 0px" id = "img" alt="验证码" src="getAuthCodeServlet" onclick = "javascript:refresh()">
                              </div>
                          </li>
                          <span id="yant" style ="font-size: 1px;color: red">&nbsp;${erro}</span>
                          <li>
                       		 <div class="right1div1">
                               	  <input class="divbutton" type="submit" name="jijiao" value="登录" />
                               	  <input class = "divbutton" type = "button" value = "注册" onclick="location.href='ToServlet?jspname=register'"/>
                             </div>
                          </li>
                          </form>
                        </ul>
                    </div>
                </div>
                <a style="float: right;margin-top: 50px;margin-right: 5px;" href="dba/managerLogin.jsp">管理员入口</a>
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