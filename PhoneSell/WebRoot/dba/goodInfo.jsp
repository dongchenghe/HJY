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
<script type="text/javascript">
// 当前第几页数据
var currentPage = "${goods.currentPage}";

// 总页数
var totalPage = "${goods.totalPage}";

function submitForm(actionUrl){
	xmlHttp.open("POST", actionUrl, true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = function (){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				location.reload(true);
			}
		}
	}
	xmlHttp.send();
}

// 第一页
function firstPage(){
	if(currentPage == 1){
		layer.alert("已经是第一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxGoodsServlet?pageNum=1");
		return true;
	}
}

// 下一页
function nextPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxGoodsServlet?pageNum=" + (parseInt(currentPage)+1));
		return true;
	}
}

// 上一页
function previousPage(){
	if(currentPage == 1){
		layer.alert("已经是第一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxGoodsServlet?pageNum=" + (parseInt(currentPage)-1));
		return true;
	}
}

// 尾页
function lastPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxGoodsServlet?pageNum=${goods.totalPage}");
		return true;
	}
}
function query1(){
	var goods_name = document.getElementById("goods_name").value;
	var goods_color = document.getElementById("goods_color").value;
	var kc1 = document.getElementById("kc1").value;
	var kc2 = document.getElementById("kc2").value;
	var sell_count1 = document.getElementById("sell_count1").value;
	var sell_count2 = document.getElementById("sell_count2").value;
	var actionUrl = "ManagerAjaxGoodsServlet?goods_name="+goods_name+"&goods_color="+goods_color+"&kc1="+kc1+"&kc2="+kc2+"&sell_count1="+sell_count1+"&sell_count2="+sell_count2
	xmlHttp.open("POST", actionUrl, true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = function (){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				location.reload(true);
			}
		}
	}
	xmlHttp.send();
}
</script>
</head>
<body style="font-family: 微软雅黑" bgcolor="#F7F8F9">
<div style = "text-align: center">
	<h2>商品信息</h2>
	<table class="table">
		<tr>
			<td>商品名字</td>
			<td><input id="goods_name" name="goods_name" value="${goods_name}"></td>
			<td>商品颜色</td>
			<td><input id="goods_color" name="goods_color" value="${goods_color}"></td>
		</tr>
		<tr>
			<td>库存</td>
			<td><input id="kc1" name="kc1" value="${kc1}"></td>
			<td>至</td>
			<td><input id="kc2" name="kc2" value="${kc2}"></td>
		</tr>
		<tr>
			<td>销量</td>
			<td><input id="sell_count1" name="sell_count1" value="${sell_count1}"></td>
			<td>至</td>
			<td><input id="sell_count2" name="sell_count2" value="${sell_count2}"></td>
		</tr>
		<tr>
			<td  colspan="4" style="text-align: center;"><input class="button" type="button" value="查询" onclick="query1()"></td>
		</tr>
	</table>
	<table class="table">
	<tr>
		<th style="text-align: center;">商品id</th>
		<th style="text-align: center;">商品名称</th>
		<th style="text-align: center;">商品介绍</th>
		<th style="text-align: center;">颜色ID</th>
		<th style="text-align: center;">商品颜色</th>
		<th style="text-align: center;">价格</th>
		<th style="text-align: center;">商品库存</th>
		<th style="text-align: center;">销量</th>
		<th style="text-align: center;">是否上架</th>
		<th style="text-align: center;">信息修改</th>
	</tr>
		<c:forEach items="${goods.dataList}" var="dd" varStatus="i" >
			<c:choose>
			<c:when test="${dd.COUNT<='5'}">
				<tr style="background: #FF6700">
			</c:when>
			<c:otherwise>
				<tr>
			</c:otherwise>
			</c:choose>
				<td>${dd.GOODS_ID}</td>
				<td>${dd.NAME}</td>
				<td>${dd.DETAILE}</td>
				<td>${dd.PHONE_COLOR_ID }</td>
				<td>${dd.COLOR}</td>
				<td>${dd.C_PRICE}</td>
				<td>${dd.COUNT}</td>
				<td>${dd.SELL_COUNT}</td>
				<c:choose>
					<c:when test="${dd.IS_GROUND=='0'}">
						<td>已上架</td>
					</c:when>
					<c:otherwise>
						<td>已下架</td>
					</c:otherwise>
				</c:choose>
				<td>
					<input type = "button" value = "修改" onclick="xiugai('${dd.PHONE_COLOR_ID}')"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br> 共${goods.totalRecord }条记录共${goods.totalPage }页&nbsp;&nbsp;当前第${goods.currentPage }页&nbsp;&nbsp;
	<a style="cursor: pointer;" onclick="firstPage();">首页</a>&nbsp;&nbsp; 
	<a style="cursor: pointer;" onclick="previousPage();">上一页</a>&nbsp;&nbsp;
	<a style="cursor: pointer;" onclick="nextPage();">下一页</a>&nbsp;&nbsp; 
	<a style="cursor: pointer;" onblur="lastPage();">尾页</a>
</div>
</body>
<script type="text/javascript">
function createXMLHttpRequest(){           // 创建XMLHttpRequest对象
	if(window.ActiveXObject){             // 判断是否是IE内核的浏览器
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  // 创建适用于IE内核的XMLRequest的对象
	}else if(window.XMLHttpRequest){     // 判断是否是FireFox内核的浏览器
		xmlHttp = new XMLHttpRequest();    // 创建适用于IE内核的XMLRequest的对象
	}
}
createXMLHttpRequest(); 
function xiugai(goods_color_id){
	var url = "ManagerGetGoodsById?goods_color_id="+goods_color_id;
	window.location.href = url;
}
</script>
</html>