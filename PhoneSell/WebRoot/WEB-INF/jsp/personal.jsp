<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.6013.com/show" prefix="show"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ page errorPage="serverErrorPage.jsp" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
	<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/layer/layer.js" type="text/javascript"></script>
	<link type="text/css" rel="stylesheet" href="css/personal.css" />
</head>
<script type="text/javascript">
function createXMLHttpRequest(){           // 创建XMLHttpRequest对象
	if(window.ActiveXObject){             // 判断是否是IE内核的浏览器
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  // 创建适用于IE内核的XMLRequest的对象
	}else if(window.XMLHttpRequest){     // 判断是否是FireFox内核的浏览器
		xmlHttp = new XMLHttpRequest();    // 创建适用于IE内核的XMLRequest的对象
	}
}
createXMLHttpRequest(); 
function userorder(user_cliked){
	var user_order_clik = user_cliked;
	xmlHttp.open("POST", "AjaxUserOrderServlet?user_order_clik="+user_order_clik, true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = fun1;
	xmlHttp.send();
}
function fun1(){
	if(xmlHttp.readyState==4){   
		if(xmlHttp.status==200){
			location.reload(true);
		}
	}
}
//付款操作
function fukuan(order){
	var user_order = order;
	xmlHttp.open("POST", "AjaxUserOrderSet?user_order="+user_order+"&cao=fukuan", true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = function (){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				layer.alert("付款成功");
				userorder(10);
			}
		}
	}
	xmlHttp.send();
}
//取消订单
function quxiao(order){
	var user_order = order;
	xmlHttp.open("POST", "AjaxUserOrderSet?user_order="+user_order+"&cao=quxiao", true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = function (){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				layer.alert("取消订单成功");
				userorder(10);
			}
		}
	}
	xmlHttp.send();
}
//确认收货
function shouhuo(order){
	var user_order = order;
	xmlHttp.open("POST", "AjaxUserOrderSet?user_order="+user_order+"&cao=shouhuo", true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = function (){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				layer.alert("确认收货成功");
				userorder(10);
			}
		}
	}
	xmlHttp.send();
}
function xiangqing(ind){
	var a = ind;
}
</script>
<script type="text/javascript">
// 当前第几页数据
var currentPage = "${orderdisplay.currentPage}";

// 总页数
var totalPage = "${orderdisplay.totalPage}";

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
		submitForm("AjaxUserOrderServlet?pageNum=1");
		return true;
	}
}

// 下一页
function nextPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("AjaxUserOrderServlet?pageNum=" + (parseInt(currentPage)+1));
		return true;
	}
}

// 上一页
function previousPage(){
	if(currentPage == 1){
		layer.alert("已经是第一页数据");
		return false;
	}else{
		submitForm("AjaxUserOrderServlet?pageNum=" + (parseInt(currentPage)-1));
		return true;
	}
}

// 尾页
function lastPage(){
	if(currentPage == totalPage){
		layer.alert("已经是最后一页数据");
		return false;
	}else{
		submitForm("AjaxUserOrderServlet?pageNum=${orderdisplay.totalPage}");
		return true;
	}
}
/* function initPage(){
	var genderVal = 0;
	var genderElement = document.getElementById("gender");
	if(genderRequest != ""){
		genderVal = parseInt(genderRequest);
	}
	
	var options = genderElement.options;
	var i = 0;
	for(i = 0; i < options.length; i++){
		if(options[i].value == genderVal){
			options[i].selected=true;
			break;
		}
	}
	
} */
</script>


<body style="font-family: '微软雅黑';">
	<div style="background:#CCFFCC; width:100%">
		<div style="width:100%; background:#F2F2F2">
			<div class="top">
				<div class="top-left">
						<a name="top">欢迎来到手机商城</a>
						<span>|</span>
						<c:choose>
						<c:when test="${empty sessionScope.user}">
							<a class="top-lefta" href="ToServlet?jspname=login">登录</a>
	   					 <span>|</span>
	   						<a class="top-lefta" href = "ToServlet?jspname=register">快速注册</a>
						</c:when>
						<c:otherwise>
							<a class="top-lefta" href = #">${sessionScope.user.name}</a>
						<span>|</span>
							<a class="top-lefta" href = "ResetServlet">注销</a>
						</c:otherwise>
						</c:choose>
						<span>|</span>
					</div>
					<div class="top-right">
						<a href="#">服务保证</a>
						<span>|</span>
						<a href="ToServlet?jspname=personal" class="top-lefta">个人中心</a>
						<span>|</span>
						<a href="ToServlet?jspname=shopingCar" class="top-lefta">我的购物车</a>
					</div>
				</div>
			</div>
		<div id="mian">
        	<div class="top1">
            	<div class="top1-1">
                	<a href="IndexServlet"><img src="images/tubiao1.png" height="80px" width="200px"/></a>
                </div>
                <div class="top1-2">
                	<ul class="topul">
                    	<li class="topli"><a href="IndexServlet">首页</a></li>
                    </ul>
                </div>
            </div>
             <div class="center">
	        	<div class="left">
	        		<ul class="leftul">
	        			<dl>订单中心</dl>
	        			<li onclick="userorder(10)" id = "allorder">我的全部订单</li>
	        			<li onclick="userorder(0)">待支付订单</li>
	        			<li onclick="userorder(1)">待发货订单</li>
	        			<li onclick="userorder(3)">待收货订单</li>
	        			<li onclick="userorder(4)">已收货订单</li>
	        			<li onclick="userorder(5)">取消的订单</li>
	        		</ul>
	        		<ul class="leftul">
	        			<dl>个人中心</dl>
	        			<li id="personalInfoChange" style="	cursor:pointer;	">个人信息修改</li>
	        			<li id="pwdChange" style="	cursor:pointer;	">密码修改</li>
	        			<li id="receiveAddrManager" style="	cursor:pointer;	">收货地址管理</li>
	        		</ul>
	        	</div>
	        	<div class="right">
		        	<div id ="order">
<%-- 		        	<c:choose>
			        	<c:when test="${empty orderdisplay.dataList}">
							<span>订单不存在</span>
						</c:when>
						<c:otherwise> --%>
							<table width="100%" class="ordertable" cellspacing="0px">
								<thead>
									<tr>
				        				<th width="10%">订单号</th>
				        				<th width="20%">订单日期</th>
				        				<th width="40%">订单详细</th>
				        				<th width="15%">订单总价</th>
				        				<th width="10%">订单状态</th>
				        			</tr>
								</thead>
									<c:forEach items="${orderdisplay.dataList }" var="ord" varStatus="i">
			        				<tr>
				        				<td>${ord.ORDER_ID}</td>
				        				<td>${ord.CREATE_DATE}</td>
				        				<td style="cursor:pointer;" onclick="xiangqing(${i.index})">
										<show:orderteil order_id="${ord.ORDER_ID }"/>
				        				</td>
				        				<td style="color: red">${ord.ORDER_TATAL}元</td>
				        				<td>
					        				<c:choose>
					        					<c:when test="${ord.ORDER_STATE=='0'}">
					        						<input type="button" value="立即付款" onclick="fukuan(${ord.ORDER_ID})">
					        						<input type="button" value="取消订单" onclick="quxiao(${ord.ORDER_ID})">
					        					</c:when>
					        					<c:when test="${ord.ORDER_STATE=='5'}">
					        						已取消订单
					        					</c:when>
					        					<c:when test="${ord.ORDER_STATE=='6'}">
					        						卖家取消订单
					        					</c:when>
					        					<c:when test="${ord.ORDER_STATE=='4'}">
					        						已完成
					        					</c:when>
					        					<c:when test="${ord.ORDER_STATE=='3'}">
					        						<input type="button" value="确认收货" onclick="shouhuo(${ord.ORDER_ID})">
					        					</c:when>
					        					<c:otherwise>
					        						等待卖家发货
					        					</c:otherwise>
					        				</c:choose>
				        				</td>
			        				</tr>
			        			</c:forEach>
							</table>
							<br> 共${orderdisplay.totalRecord }条记录共${orderdisplay.totalPage }页&nbsp;&nbsp;当前第${orderdisplay.currentPage }页&nbsp;&nbsp;
							<a style="cursor: pointer;" onclick="firstPage();">首页</a>&nbsp;&nbsp; 
							<a style="cursor: pointer;" onclick="previousPage();">上一页</a>&nbsp;&nbsp;
							<a style="cursor: pointer;" onclick="nextPage();">下一页</a>&nbsp;&nbsp; 
							<a style="cursor: pointer;" onblur="lastPage();">尾页</a>	
	        		</div>
	        		<div id="personalInfoDiv" style="display:none;">
	        		</div>
	        		<div id="pwdChangeDiv" style="display:none;">
	        			<table class="personalTable1">
	        				<tr>
	        					<td>用户名</td>
	        					<td>密码</td>
	        				</tr>
	        				<tr>
	        					<td>${user.name}</td>
	        					<td><input type="password" id="pwdinput" value="${user.passWord}"/></td>
	        				</tr>
	        				<tr style="display:none;" id="hidepwdtr">
	        					<td >
	        					请输入原密码<input type="password" id="oldpassword" name="oldpassword"/>
	        					新密码<input type="password" id="password1" name="password1"/>
	        					</td>
	        					<td>
	        					再次输入密码<input type="password"  id="password2" name="password2" />
	        					</td>		
	        				</tr>
	        				<tr>
	        					<td colspan="2">
	        					<input type="button" value="修改密码" id="pwdChangeBtn" onclick="pwdChangeFun()"/>
	        					<input type="button" value="确认修改" id="confirmPwdChangeBtn" style="display:none;" onclick="confirmPwdChangeFun()"/>
	        					<span id="hintspan" style="color:red;"></span>
	        					</td>		
	        				</tr>
	        			</table>
	        		</div>
	        		<div id="receiveAddrManagerDiv" style="display:none;">
	        			<table class="personalTable1">
	        				<tr>
	        					<td>收货地址</td>
	        					<td>收货人电话</td>
	        					<td>收货人姓名</td>
	        					<td></td>
	        				</tr>
	        				<c:forEach items="${receive_list}" var="item">
	        				<tr id="receiveInfoTr" name="${item.addrId}">
	        					<td>${item.address }</td>
	        					<td>${item.tell }</td>
	        					<td>${item.receiver }</td>
	        					<td>
	        						<input type="button" value="删除" id="delbtn" name="${item.addrId}" onclick="delFun(this)"/>
	        					</td>
	        				</tr>
	        				</c:forEach>
	        			</table>
	        		</div>
	        		<div id="msgmanagerDiv" style="display:none;">
	        		</div>
	        	</div>
	        </div>  
            <!--底部-->
            <div class="dip">
            	<table bgcolor="#FFFFFF" height="100px" width="1200px" cellspacing="0" class="o">
                    <tr style="font-weight:bolder;">
                        <td><a href="#">新手指南</a></td>
                        <td><a href="#">贺卡服务</a></td>
                        <td><a href="#">全国配送服务</a></td>
                        <td><a href="#">支付与查询</a></td>
                        <td><a href="#">售后保障</a></td>
                        <td rowspan="3" width="150px">您有任何疑问，请拨打全国统一热线(免长途费)或联系 网页客服 </td>
                    </tr>
                    <tr>
                        <td><a href="#">玫瑰支数详细寓意</a></td>
                        <td><a href="#">星座、巧克力、爱情</a></td>
                        <td><a href="#">配送服务说明</a></td>
                        <td><a href="#">发票及支付方式</a></td>
                        <td><a href="#">鲜花绿植先行赔付</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">送花技巧</a></td>
                        <td><a href="#">送花祝福语大全</a></td>
                        <td><a href="#">全国城郊配送查询</a></td>
                        <td><a href="#">如何查询订单</a></td>
                        <td><a href="#">订购必读</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
$(function(){
	var personalInfoChange=$("#personalInfoChange");
	var pwdChange=$("#pwdChange");
	var receiveAddrManager=$("#receiveAddrManager");
	var msgmanager=$("#msgmanager");
	var personalInfoDiv=$("#personalInfoDiv");
	var pwdChangeDiv=$("#pwdChangeDiv");
	var receiveAddrManagerDiv=$("#receiveAddrManagerDiv");
	var msgmanagerDiv=$("#msgmanagerDiv");
	var orderDiv=$("#order");
	personalInfoChange.click(function(){
		setDisplayNone();
		personalInfoDiv[0].style.display="block";
		personalInfoDiv.html("<show:personalInfo/>");
	});
	pwdChange.click(function(){
		setDisplayNone();
		pwdChangeDiv[0].style.display="block";	
	});
	receiveAddrManager.click(function(){
		setDisplayNone();	
		receiveAddrManagerDiv[0].style.display="block";	
	});
	msgmanager.click(function(){
		setDisplayNone();
		msgmanagerDiv[0].style.display="block";	
	});

	function setDisplayNone(){
		personalInfoDiv[0].style.display="none";
		pwdChangeDiv[0].style.display="none";
		receiveAddrManagerDiv[0].style.display="none";
		msgmanagerDiv[0].style.display="none";	
		orderDiv[0].style.display="none";
	}
});

//隐藏div
function changeInfoFun(){
	var hidetr=$("#hidetr");
	hidetr[0].style.display="table-row";
	var confirmChangeInfoBtn=$("#confirmChangeInfoBtn");
	confirmChangeInfoBtn[0].style.display="inline";
}
function confirmChangeInfoFun(){
	var sexinput=$("#sexinput");
	var radio = document.getElementsByName("sexinput");
	var sex;
    for (i=0; i<radio.length; i++) {  
        if (radio[i].checked) {  
            sex=radio[i].value;  
        }  
    }  
	var phoneinput=$("#phoneinput");
	var emailinput=$("#emailinput");
	
	//创建异步调用对象
	var xmlHttp;
		function createXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
		createXMLHttpRequest();
			xmlHttp.open("POST","AjaxPersonalInfoChangeServlet?act=xingxi&sex="+sex+"&phone="+phoneinput.prop("value")+"&email="+emailinput.prop("value"),true);
			//设置post方式的请求头
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//服务器返回消息，要执行的方法   这种方式方法后面不要括号
			xmlHttp.onreadystatechange=fun1;
			xmlHttp.send();
		
		//回调方法
		function fun1(){
			if(xmlHttp.readyState==4){
				if(xmlHttp.status==200){
					var hidetr=$("#hidetr");
					hidetr[0].style.display="none";
					var confirmChangeInfoBtn=$("#confirmChangeInfoBtn");
					confirmChangeInfoBtn[0].style.display="none";
					var sex=$("#sex");
					var phone=$("#phone");
					var email=$("#email");
					sex.html(sexinput.val());
					phone.html(phoneinput.val());
					email.html(emailinput.val());
					
					//var message=xmlHttp.responseXML.getElementsByTagName("message")[0].innerHTML;
					//var receive_id=xmlHttp.responseXML.getElementsByTagName("message")[0].firstChild.data;
					//alert(xmlHttp.resonpseText);	
					//newinput.attr("value",xmlHttp.responseText);
				}
			}
		}
}

function pwdChangeFun(){
	var hidepwdtd=$("#hidepwdtr");
	var confirmPwdChangeBtn=$("#confirmPwdChangeBtn");
	hidepwdtd[0].style.display="table-row";
	confirmPwdChangeBtn[0].style.display="inline";
}		
function confirmPwdChangeFun(){
	var user_pwd="${user.passWord}";
	
	var oldpassword=$("#oldpassword");
	var password1=$("#password1");
	var password2=$("#password2");
	var oldpasswordValue=jsTrim(oldpassword.prop("value")); 
    var pwd1Value=jsTrim(password1.prop("value")); 
	var pwd2Value=jsTrim(password2.prop("value"));	
	var hintspan=$("#hintspan");
	
	if(user_pwd!=oldpasswordValue){
		hintspan.text("您输入的密码有误，请重新输入！");
		return;
	}
	if(pwd1Value!=pwd2Value){
		hintspan.text("您两次输入的密码不一致，请重新输入！");
		return;
	}
	hintspan.text("");
	//创建异步调用对象
	var xmlHttp;
		function createXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
		createXMLHttpRequest();
			xmlHttp.open("POST","AjaxPersonalInfoChangeServlet?act=mima&password1="+password1.prop("value")+"&password2="+password2.prop("value"),true);
			//设置post方式的请求头
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//服务器返回消息，要执行的方法   这种方式方法后面不要括号
			xmlHttp.onreadystatechange=fun2;
			xmlHttp.send();
		
		//回调方法
		function fun2(){
			if(xmlHttp.readyState==4){
				if(xmlHttp.status==200){
					var hidepwdtr=$("#hidepwdtr");
					hidepwdtr[0].style.display="none";
					var confirmPwdChangeBtn=$("#confirmPwdChangeBtn");
					confirmPwdChangeBtn[0].style.display="none";
					
					
					//var message=xmlHttp.responseXML.getElementsByTagName("message")[0].innerHTML;
					//var receive_id=xmlHttp.responseXML.getElementsByTagName("message")[0].firstChild.data;
					//alert(xmlHttp.resonpseText);	
					//newinput.attr("value",xmlHttp.responseText);
				}
			}
		}
}	

//类似于Java里的trim方法 去掉开头和结尾空格
function jsTrim(str){
	var regTrim=/(^\s*)|(\s*$)/g;
	return str.replace(regTrim,"");
}
//把元素dom对象作为参数传进来
function delFun(t){
	
	var delbtn=$("#delbtn");
	
	var id=delbtn.prop("name");
	var receiveInfoTr=$("#receiveInfoTr[name='"+id+"']");
	
	//创建异步调用对象
	var xmlHttp;
		function createXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
		createXMLHttpRequest();
			xmlHttp.open("POST","AjaxReceiveInfoChangeServlet?id="+id,true);
			//设置post方式的请求头
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			//服务器返回消息，要执行的方法   这种方式方法后面不要括号
			xmlHttp.onreadystatechange=fun3;
			xmlHttp.send();
		
		//回调方法
		function fun3(){
			if(xmlHttp.readyState==4){
				if(xmlHttp.status==200){
					//var papa=t.parentNode.parentNode;
				//	var papapa=t.parentNode.parentNode.parentNode;
					//papapa.removeChild(papa);
					receiveInfoTr.empty();
				
				}
			}
		}
}
</script>
</html>