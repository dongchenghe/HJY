<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.icss.csetc.modal.Goods"%>
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
.list div{display: inline-block;}
</style>
<body>
	<div class = "dateUpdate" style = "text-align: center;">
	<h2>商品的详细信息</h2>
	<!-- target 可以设置为_top或者要挑砖框架的id值 -->
	<form action = "/FlowersOnlineMall/UpdateGoodsServlet" method = "post" target="_top">
	<div class = "list">
		<div>商品名称：</div>
		<div><input type = "text" name = "goods_name" value = "${byIdGoods.name}"/></div>
	</div>
	<div class = "list">
		<div>商品类别：</div>
		<div>
		<select id = "type" name = "goods_type">
			<option value = "蛋糕">蛋糕</option>
			<option value = "卡通花束">卡通花束</option>
			<option value = "礼篮">礼篮</option>
			<option value = "其他">其他</option>
			<option value ="巧克力">巧克力</option>
			<option value ="鲜花">鲜花</option>
		</select>
		</div>
	</div>
	<div class = "list">
		<div>商品描述：</div>
		<div>
		<textarea rows="10" cols="30" name ="goods_details">${byIdGoods.details}</textarea>
		</div>
	</div>
	<div class ="list">
		<div>商品价格：</div>
		<div>
		<input type = "text" name = "goods_price" value="${byIdGoods.price}"/>
		</div>
	</div>
	<div class = "list">
	<div>商品原价：</div>
	<div>
	<input type = "text" name = "goods_old_price" value ="${byIdGoods.goods_old_price}"/>
	</div>
	</div>
	<div class = "list">
	<div>商品库存：</div>
	<div>
	<input type = "text" name = "goods_store_amount" value ="${byIdGoods.store_amount}"/>
	</div>
	</div>
	<div class = "list">
	<div>上下架状态：</div>
	<div>
	<input type ="radio" name = "goods_state" value ="未上架">未上架
	<input type = "radio" name = "goods_state" value = "上架">上架
	<input type = "radio" name = "goods_state" value = "下架">下架
	</div>
	</div>
	<%-- <div class = "list">
	<div>导入图片的路径：</div>
	<div>
	<input type = "file" name = "img1_src" value ="<%=goods.get(0).get("img1_src")%>"/><br/>
	<input type = "file" name = "img2_src" value = "<%=goods.get(0).get("img2_src") %>"/><br/>
	<input type = "file" name = "img3_src" value = "<%=goods.get(0).get("img3_src") %>"/><br/>
	<input type = "file" name = "img4_src" value = "<%=goods.get(0).get("img4_src") %>"/>
	</div>
	</div> --%>
	<div class = "list">
	<div>
	<input type = "submit" value = "保存"/>
	</div>
	<div>
	<input type = "button" value = "取消" onclick="top.location.href='managerindex.jsp'"/>
	</div>
	</div>
	</form>
	</div>
</body>
<script type="text/javascript">
// 设置下拉框的默认值为数据库中的数据
<% Goods goods = (Goods)session.getAttribute("byIdGoods");%>
document.getElementById("type").value = "<%=goods.getType()%>";
// 设置单选框的默认值为数据库中的数据
var list = document.getElementsByName("goods_state");

for(var i = 0;i < list.length;i++){
	if(list[i].value=="<%= goods.getState()%>"){
		list[i].checked=true;
		break;
	}
}
</script>
</html>