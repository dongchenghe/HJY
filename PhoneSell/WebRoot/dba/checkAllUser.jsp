<%@page import="java.util.ArrayList"%>
<%@page import = "com.icss.csetc.modal.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.table{font-size: 15px;font-style: italic;border-width: 1px;border-collapse: collapse;}
.table th{border-width:1px;border-style: solid;background-color:LightGray;height:30px;}
.table td{border-width: 1px;border-style:solid;background-color:AliceBlue;height:20px;}
</style>
<body>
	<center>
		<h2>用户信息</h2>
	<table class = "table">
		<tr>
			<th>用户id</th>
			<th>用户名</th>
			<th>密码</th>
			<th>用户性别</th>
			<th>用户联系方式</th>
			<th>用户email</th>
			<th>用户地址</th>
			<c:if test="${pwd=='123456'}">
				<th>密码修改</th>
			</c:if>
		</tr>
		<%
			ArrayList<User> allUsers = (ArrayList)session.getAttribute("allUsers");
			for(int i = 0;i < allUsers.size();i++){
		%>
		<tr>
			<td><%=allUsers.get(i).getUser_id() %></td>
			<td><%=allUsers.get(i).getUser_name() %></td>
			<td><%=allUsers.get(i).getUser_pwd() %></td>
			<td><%=allUsers.get(i).getUser_sex()%></td>
			<td><%=allUsers.get(i).getUser_phone() %></td>
			<td><%=allUsers.get(i).getUser_email()%></td>
			<td><%=allUsers.get(i).getUser_addr()%></td>
			<c:if test="${pwd=='123456'}">
			<td>
			<input type = "button" value = "密码重置" onclick="javascript:reset(<%=allUsers.get(i).getUser_id()%>)">
			</td>
			</c:if>
		</tr>
		<%
			}
		%>
	</table>
	</center>
</body>
<script type="text/javascript">
function reset(user_id){
	var url = "/FlowersOnlineMall/UpdatePwdServlet?pwd=123456&user_id="+user_id;
	window.location.href = url;
}
</script>
</html>