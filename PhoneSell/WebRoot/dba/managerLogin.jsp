<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>管理员登录</title>
</head>
<script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="css/mainlogin.css" />
<script type="text/javascript">
	var xmlHttp;
	function createXMLHttpRequest() { // 创建XMLHttpRequest对象
		if (window.ActiveXObject) { // 判断是否是IE内核的浏览器
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); // 创建适用于IE内核的XMLRequest的对象
		} else if (window.XMLHttpRequest) { // 判断是否是FireFox内核的浏览器
			xmlHttp = new XMLHttpRequest(); // 创建适用于IE内核的XMLRequest的对象
		}
	}
	createXMLHttpRequest();
	function testManager() {
		var name = document.getElementById("name").value;
		var pwd = document.getElementById("pwd").value;
		if(name==null||name==""){
			layer.msg("用户名不能为空");
			return false ;
		}
		if(pwd==null||pwd==""){
			layer.msg("密码不能为空");
			return false ;
		}
		xmlHttp.open("POST", "ManagerLoginServlet?dba_name="
				+ name + "&dba_pwd=" + pwd, true);
		xmlHttp.setRequestHeader("Context-Type",
				"application/x-www-form-urlencoded");
		// 服务器返回消息
		xmlHttp.onreadystatechange = fun2; // 回调函数
		xmlHttp.send();
	}
	function fun2() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				if (xmlHttp.responseText == "用户名或密码错误") {
					//layer.alert("用户名或密码错误");
					layer.msg("用户名密码错误");
				}else{
					var tijiao = document.getElementById("tijiao");
					tijiao.submit();
				}
			}
		}
	}
</script>
<body oncontextmenu="return false">
	<div style="margin: 120px auto 0 auto;">
		<h1>手机管理内部网</h1>
		<form id="tijiao" action="dba/managerindex.jsp" method="post">
			<div>
				<input id = "name" type="text" name="username" class="username"
					placeholder="员工名" autocomplete="off" />
			</div>
			<div>
				<input id = "pwd" type="password" name="password" class="password"
					placeholder="密码" oncontextmenu="return false"
					onpaste="return false" />
			</div>
			<button id="sub" type="button" onclick="testManager()">登录</button>
		</form>
	</div>
</body>
</html>