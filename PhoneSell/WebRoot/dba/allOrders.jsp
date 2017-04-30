<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.6013.com/show" prefix="show"%>
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
<script type="text/javascript">
// 当前第几页数据
var currentPage = "${orders.currentPage}";

// 总页数
var totalPage = "${orders.totalPage}";

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
		submitForm("ManagerAjaxOrdersServlet?pageNum=1");
		return true;
	}
}

// 下一页
function nextPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxOrdersServlet?pageNum=" + (currentPage+1));
		return true;
	}
}

// 上一页
function previousPage(){
	if(currentPage == 1){
		layer.alert("已经是第一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxOrdersServlet?pageNum=" + (currentPage-1));
		return true;
	}
}

// 尾页
function lastPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxOrdersServlet?pageNum=${orders.totalPage}");
		return true;
	}
}
function query1(){
	var user_id = document.getElementById("user_id").value;
	var order_id = document.getElementById("order_id").value;
	var create_date1 = document.getElementById("create_date1").value;
	var create_date2 = document.getElementById("create_date2").value;
	var order_state = document.getElementById("order_state").value;
	var kddh = document.getElementById("kddh").value;
	var actionUrl = "ManagerAjaxOrdersServlet?user_id="+user_id+"&order_id="+order_id+"&create_date1="+create_date1+"&create_date2="+create_date2+"&order_state="+order_state+"&kddh="+kddh
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
<body style="font-family: 微软雅黑" bgcolor="#F7F8F9">
<center>
	<h2>订单信息</h2>
	<table class="table">
		<tr>
			<td>用户ID</td>
			<td><input id="user_id" name="user_id" value="${user_id}"></td>
			<td>订单号</td>
			<td><input id="order_id" name="order_id" value="${order_id}"></td>
		</tr>
		<tr>
			<td>下单日期</td>
			<td><input id="create_date1" name="create_date1" value="${create_date1}"></td>
			<td>至</td>
			<td><input id="create_date2" name="create_date2" value="${create_date2}"></td>
		</tr>
		<tr>
			<td>订单状态</td>
			<td><input id="order_state" name="order_state" value="${order_state}"></td>
			<td>快递单号</td>
			<td><input id="kddh" name="kddh" value="${kddh}"></td>
		</tr>
		<tr>
			<td  colspan="4" style="text-align: center;"><input class="button" type="button" value="查询" onclick="query1()"></td>
		</tr>
	</table>
	<table class="table">
		<tr>
		<th>订单编号</th>
		<th>用户id</th>
		<th>下单日期</th>
		<th>订单信息</th>
		<th>订单总价</th>
		<th>支付日期</th>
		<th>收货人姓名</th>
		<th>收货人电话</th>
		<th>收货人地址</th>
		<th>快递单号</th>
		<th>订单状态</th>
		<th>操作</th>
		<th>详细信息</th>
		</tr>
		<c:forEach items="${orders.dataList}" var="dd" varStatus="i" >
			<c:choose>
			<c:when test="${dd.ORDER_STATE=='1'}">
				<tr style="background: #FF6700">
			</c:when>
			<c:otherwise>
				<tr>
			</c:otherwise>
			</c:choose>
				<td>${dd.ORDER_ID}</td>
				<td>${dd.USER_ID}</td>
				<td>${dd.CREATE_DATE}</td>
				<td><show:orderteil order_id="${dd.ORDER_ID }"/></td>
				<td>${dd.ORDER_TATAL}</td>
				<td>${dd.PAY_DATE}</td>
				<td>${dd.RECEIVER}</td>
				<td>${dd.TELL}</td>
				<td>${dd.ADDR}</td>
				<td>${dd.KDDH}</td>
				<c:choose>
					<c:when test="${dd.ORDER_STATE=='0'}">
						<td>已下单</td>
						<td></td>
					</c:when>
					<c:when test="${dd.ORDER_STATE=='1'}">
						<td>已付款</td>
						<td><input type = "button" value = "确认" onclick = "javascript:setorder('${dd.ORDER_ID}','2')"/></td>
					</c:when>
					<c:when test="${dd.ORDER_STATE=='2'}">
						<td>已确定</td>
						<td><input type = "button" value = "发货" onclick = "javascript:setorder('${dd.ORDER_ID}','3')"/></td>
					</c:when>
					<c:when test="${dd.ORDER_STATE=='3'}">
						<td>已发货</td>
						<td></td>
					</c:when>
					<c:when test="${dd.ORDER_STATE=='4'}">
						<td>已收货</td>
						<td></td>
					</c:when>
					<c:when test="${dd.ORDER_STATE=='5'}">
						<td>用户已取消</td>
						<td></td>
					</c:when>
					<c:when test="${dd.ORDER_STATE=='6'}">
						<td>卖家已取消</td>
						<td></td>
					</c:when>
					<c:otherwise>
						<td>错误状态</td>
						<td></td>
					</c:otherwise>
				</c:choose>
				<td>
					<input type = "button" value = "查看"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br> 共${orders.totalRecord }条记录共${orders.totalPage }页&nbsp;&nbsp;当前第${orders.currentPage }页&nbsp;&nbsp;
	<a style="cursor: pointer;" onclick="firstPage();">首页</a>&nbsp;&nbsp; 
	<a style="cursor: pointer;" onclick="previousPage();">上一页</a>&nbsp;&nbsp;
	<a style="cursor: pointer;" onclick="nextPage();">下一页</a>&nbsp;&nbsp; 
	<a style="cursor: pointer;" onblur="lastPage();">尾页</a>
	</center>
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
function setorder(order,setname1){
	var order_id = order;
	var sertname = setname1;
	xmlHttp.open("POST", "ManagerAjaxOrderSet?order_id="+order_id+"&setname="+sertname, true);
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
</html>