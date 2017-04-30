<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.table{font-size: 15px;border-width: 1px;border-collapse: collapse;}
.table th{border-width:1px;border-style: solid;background-color:LightGray;height:30px;}
.table tr{background-color:AliceBlue;}
.table td{border-width: 1px;border-style:solid;height:20px;}
</style>
<title>Insert title here</title>
</head>
<body style="font-family: 微软雅黑" bgcolor="#F7F8F9">
<div style = "text-align: center">
	<h2>鲜花的商品信息如下</h2>
	<table class="table">
	<tr>
		<th>商品名称</th>
		<th>商品类型</th>
		<th>商品介绍</th>
		<th>商品原价</th>
		<th>订购价</th>
		<th>商品库存</th>
		<th>状态</th>
		<th>信息修改</th>
	</tr>
		<c:forEach items="${allGoods}" var="goodss" varStatus="i">
			<tr>
				<td>${goodss.name}</td>
				<td>${goodss.type}</td>
				<td width="500px">${goodss.details}</td>
				<td>${goodss.goods_old_price}</td>
				<td>${goodss.price}</td>
				<td>${goodss.store_amount}</td>
				<td>${goodss.state}</td>
				<td><input type = "button" value = "修改" name = "input" onclick="javascript:test(${goodss.goods_id})"></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
<script type="text/javascript">
function test(goods_id){
	var url = "/FlowersOnlineMall/GetGoodsById?goods_id="+goods_id;
	window.location.href = url;
}
</script>
</html>