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
var currentPage = "${users.currentPage}";

// 总页数
var totalPage = "${users.totalPage}";

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
		submitForm("ManagerAjaxUserServlet?pageNum=1");
		return true;
	}
}

// 下一页
function nextPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxUserServlet?pageNum=" + (parseInt(currentPage)+1));
		return true;
	}
}

// 上一页
function previousPage(){
	if(currentPage == 1){
		layer.alert("已经是第一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxUserServlet?pageNum=" + (parseInt(currentPage)-1));
		return true;
	}
}

// 尾页
function lastPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("ManagerAjaxUserServlet?pageNum=${users.totalPage}");
		return true;
	}
}
function query1(){
	var user_name = document.getElementById("user_name").value;
	var user_id = document.getElementById("user_id").value;
	var sex = document.getElementById("sex").value;
	var is_valid = document.getElementById("is_valid").value;
	var createdate1 = document.getElementById("createdate1").value;
	var createdate2 = document.getElementById("createdate2").value;
	var actionUrl = "ManagerAjaxUserServlet?user_name="+user_name+"&user_id="+user_id+"&sex="+sex+"&is_valid="+is_valid+"&createdate2="+createdate2+"&createdate1="+createdate1
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
	<h2>用户信息</h2>
	<table class="table">
		<tr>
			<td>用户id</td>
			<td><input id="user_id" name="user_id" value="${user_id}"></td>
			<td>用户名</td>
			<td><input id="user_name" name="user_name" value="${user_name}"></td>
		</tr>
		<tr>
			<td>性别</td>
			<td><input id="sex" name="sex" value="${sex}"></td>
			<td>是否有效</td>
			<td><input id="is_valid" name="is_valid" value="${is_valid}"></td>
		</tr>
		<tr>
			<td>注册时间</td>
			<td><input id="createdate1" name="createdate1" value="${createdate1}"></td>
			<td>至</td>
			<td><input id="createdate2" name="createdate2" value="${createdate2}"></td>
		</tr>
		<tr>
			<td  colspan="4" style="text-align: center;"><input class="button" type="button" value="查询" onclick="query1()"></td>
		</tr>
	</table>
	<table class="table">
	<tr>
		<th style="text-align: center;">用户id</th>
		<th style="text-align: center;">用户名</th>
		<th style="text-align: center;">性别</th>
		<th style="text-align: center;">电话</th>
		<th style="text-align: center;">注册时间</th>
		<th style="text-align: center;">是否有效</th>
		<th style="text-align: center;">邮箱</th>
		<th style="text-align: center;">备注</th>
		<th style="text-align: center;">操作</th>
	</tr>
		<c:forEach items="${users.dataList}" var="dd" varStatus="i" >
			<tr>
				<td>${dd.USER_ID}</td>
				<td>${dd.USER_NAME}</td>
				<c:choose>
					<c:when test="${dd.SEX==0}">
						<td>男</td>
					</c:when>
					<c:otherwise>
						<td>女</td>
					</c:otherwise>
				</c:choose>
				<td>${dd.PHONE_NUMBER }</td>
				<td>${dd.CREATE_DATE}</td>
				<c:choose>
					<c:when test="${dd.IS_VALID==0}">
						<td>有效</td>
					</c:when>
					<c:otherwise>
						<td>无效</td>
					</c:otherwise>
				</c:choose>
				<td>${dd.EMAIL}</td>
				<td>${dd.REMARK}</td>
				<td>
					<input type = "button" value = "修改" onclick="xiugai('${dd.USER_ID}')"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br> 共${users.totalRecord }条记录共${users.totalPage }页&nbsp;&nbsp;当前第${users.currentPage }页&nbsp;&nbsp;
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
function xiugai(user_id){
	var url = "ManagerGetusersById?user_id="+user_id;
	window.location.href = url;
}
</script>
</html>