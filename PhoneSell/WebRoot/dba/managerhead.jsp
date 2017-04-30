<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<style>
.managerhead div {
	display: inline-block;
}

a {
	text-decoration: none
}

.managerhead {
	background-image: url(images/top-right.gif);
	background-repeat: repeat-x;
	height: 60px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family: 微软雅黑">
	<div class="managerhead">
		<div style="font-size: 30px; color: #ffffff; padding-left: 5%; margin: 0px;">手机内部管理网</div>
		<div style="font-size: 15px; padding-left: 60%; color: #ffffff;">
			欢迎管理员 <font style="color: red;">${sessionScope.manager.dbaName}</font>登陆&nbsp;
			<form action="ManagerResetServlet" target="_top" style="float:right">
				<input type="submit" value="安全退出" style="border: 1px solid #3D6089; background: #2F5275;color: #B8D3EB">
			</form>
		</div>
	</div>
</body>
</html>