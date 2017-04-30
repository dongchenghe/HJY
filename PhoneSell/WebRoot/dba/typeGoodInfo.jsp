<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2>主页的商品种类信息</h2>
	<form action="/FlowersOnlineMall/UpdateTypeServlet" method = "post">
		<table class = "table">
			<tr>
			<th class = "goodsname">商品名称</th>
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
				<td class = "goodsname"><%=typeGoods.get(i).get("goods_name") %></td>
				<td><%=typeGoods.get(i).get("goods_type")%></td>
				<td><%=typeGoods.get(i).get("goods_price")%></td>
				<td><%=typeGoods.get(i).get("goods_store_amount")%></td>
				<td><%=typeGoods.get(i).get("goods_sales") %></td>
				<td>
				<select id = "position_name<%=i%>" name = "position_name<%=i%>">
					<option value = "general">无</option>
					<option value= "Boutique_recommend">精品推荐</option>
					<option value = "New_arrival">新品上市</option>
					<option value = "Hot_sale">热销商品</option>
				</select>
				<script type="text/javascript">
					document.getElementById("position_name<%=i%>").value = "<%=typeGoods.get(i).get("position_name")%>";
				</script>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input class = "btn" type = "submit" value ="保存"/>
		</form>
	</center>
</body>
</html>