<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page errorPage="serverErrorPage.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/pageskip.js"></script>
<style type="text/css">
	a{
		text-decoration:none;
		color:#ff9955;
	}
</style>
<title>操作成功，跳转</title>
</head>
<body onload="fun()">
<div id="main">
	<div id="top">
	</div>
	<div id="middle">
			<form  action="ToServlet" id="skipform">
				<input name="jspname" value="personal" type="hidden"/>
			</form>
			<div id="msgdiv" style="margin:0px auto; width:80%; font-size:28px; font-weight:bold;text-align:center;">
					<span id="span1"></span>
					<span id="span2"></span>
					<span id="span3"></span>
					<span id="span4">
						<a href="ToServlet?jspname=personal">&nbsp;|&nbsp;点击直接跳转</a>
					</span><br>
					<span>
						<img src="images/skip.png" />
					</span>
								
			</div>
	</div>
	<div id="bottom">
	</div>
</div>
</body>
</html>