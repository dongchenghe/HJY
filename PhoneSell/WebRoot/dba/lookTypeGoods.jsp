<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
.table{font-size: 15px;border-width: 1px;border-collapse: collapse;}
.table th{border-width:1px;border-style: solid;background-color:LightGray;height:30px;}
.table tr{background-color:AliceBlue;}
.table td{border-width: 1px;border-style:solid;height:20px;}
</style>
<body style="font-family: 微软雅黑" bgcolor="#F7F8F9">
	<center>
			<h2>你查看的信息如下</h2>
		<table class = "table">
			<tr>
			<th>商品名称</th>
			<th>商品类型</th>
			<th>商品价格</th>
			<th>商品库存</th>
			<th>商品售量</th>
			<th>推销种类</th>
			</tr>
			<%
				List<Map<String,Object>> typeGoods = (List)session.getAttribute("typeGoods");
			
				for(int i = 0;i < typeGoods.size();i++){
			%>
			<tr>
				<td><%=typeGoods.get(i).get("goods_name") %></td>
				<td><%=typeGoods.get(i).get("goods_type") %></td>
				<td><%=typeGoods.get(i).get("goods_price")%></td>
				<td><%=typeGoods.get(i).get("goods_store_amount")%></td>
				<td><%=typeGoods.get(i).get("goods_sales") %></td>
				<td>
				<c:if test='<%=typeGoods.get(i).get("position_name").equals("Boutique_recommend") %>'>
					精品推荐
				</c:if>
				<c:if test='<%=typeGoods.get(i).get("position_name").equals("New_arrival") %>'>
					新品上市
				</c:if>
				<c:if test='<%=typeGoods.get(i).get("position_name").equals("Hot_sale") %>'>
					热销商品
				</c:if>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</center>
</body>
</html>