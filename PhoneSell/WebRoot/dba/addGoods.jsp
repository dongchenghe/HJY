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
<title>Insert title here</title>
<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<style>
.list div{display: inline-block;}
</style>
<body>
	<div class = "dateUpdate" style = "text-align: center;">
	<h2>增加商品</h2>
	<!-- target 可以设置为_top或者要挑砖框架的id值 -->
	<form id="form" action = "ManagerAjaxAddGoodsServlet" method = "post" target="_top">
	<table class="table">
			<tr>
				<td>商品名</td>
				<td><input style="width: 100%" name="name" /></td>
				<td>商品价格</td>
				<td><input style="width: 100%" name="price" /></td>
			</tr>
			<tr>
				<td>颜色名字</td>
				<td><input style="width: 100%" name="color" /></td>
				<td>图片文件夹</td>
				<td><input style="width: 100%" name="img_src" /></td>
			</tr>
			<tr>
				<td>计量名</td>
				<td><input style="width: 100%" name="count_name"/></td>
				<td>颜色图片名</td>
				<td><input style="width: 100%" name="img" /></td>
			</tr>
			<tr>
				<td>库存</td>
				<td><input style="width: 100%" name="count"/></td>
				<td>是否上架</td>
				<td><input type="radio" name="is_ground" value="0"/>上架 <input type="radio" name="is_ground" value="1"/>下架</td>
			</tr>
			<tr>
			<td>详细介绍</td><td colspan="3"><input style="width: 100%" name="detaile"/></td>
			</tr>
			<tr>
				<td colspan="2"> <input type = "button" value = "保存" onclick="baocun()"/> </td>
				<td colspan="2"><input type = "button" value = "取消" onclick="top.location.href='dba/managerindex.jsp'"/></td>
			</tr>
	</table>
	</form>
	</div>
</body>
<script type="text/javascript">
// 设置单选框的默认值为数据库中的数据

function baocun(){
	layer.confirm('是否确认添加此商品', {
	  btn: ['是','否'] //按钮
	}, function(){
			$.ajax({
		    type: 'post',
		    url: 'ManagerAjaxAddGoodsServlet',
		    data: $("form").serialize(),
		    success: function(data) {
		       layer.alert("添加成功");
		    }
		});
	});
}
</script>
</html>