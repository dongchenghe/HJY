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
<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
	<center>
	<h2>${show_list[0].SHOW_NAME }的商品信息</h2>
	<form action="UpdateTypeServlet" method = "post">
		<table class = "table">
			<tr>
				<th>展示区域ID</th>
				<th>区域名字</th>
				<th>商品名</th>
				<th>价格</th>
				<th>展示商品ID</th>
				<th>顺序</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${show_list}" var="dd" varStatus="i" >
				<tr>
					<td><input class="form-control" disabled name="goods_show_id" value="${dd.GOODS_SHOW_ID }"/></td>
					<td><input class="form-control" disabled name="show_name" value="${dd.SHOW_NAME }"/></td>
					<td><input class="form-control" disabled name="name" value="${dd.NAME }"/></td>
					<td><input class="form-control" disabled name="price" value="${dd.PRICE }"/></td>
					<td><input id="goods_id${dd.GOODS_SHOW_ID }" name="goods_id" value="${dd.GOODS_ID }"/></td>
					<td><input id="sequen${dd.GOODS_SHOW_ID }" name="sequen" value="${dd.SEQUEN }"/></td>
					<td><input class = "btn" type = "button" value ="保存" onclick="baocunshunxu('${dd.GOODS_SHOW_ID }')"/></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	</center>
</body>
<script type="text/javascript">
function baocunshunxu(goods_show_id){
	var sequen = document.getElementById("sequen"+goods_show_id).value;
	var goods_id = document.getElementById("goods_id"+goods_show_id).value;
	layer.confirm('是否确认修改', {
	  btn: ['是','否'] //按钮
	}, function(){
			$.ajax({
		    type: 'post',
		    url: 'ManagerAjaxShowTypeSet?goods_id='+goods_id+"&sequen="+sequen+"&goods_show_id="+goods_show_id,
		    success: function(data) {
		       layer.alert("修改成功");
		    }
		});
	});
}

</script>
</html>