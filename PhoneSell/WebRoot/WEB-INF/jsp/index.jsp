<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="serverErrorPage.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>手机网上商城</title>
		<link type="text/css" rel="stylesheet" href="css/css.css" />
		<link type="text/css" rel="stylesheet" href="css/style.css" />
		<link type="text/css" rel="stylesheet" href="css/luara.left.css" />
		<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.luara.0.0.1.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<script>
    function doPost(gid) {  
        var myForm = document.createElement("form");       
        myForm.method = "get";  
        myForm.action = "PhoneShow";   
        var myInput = document.createElement("input");       
        myInput.setAttribute("name", "goodsId");  // 为input对象设置name  
        myInput.setAttribute("value", gid);  // 为input对象设置value  
        myForm.appendChild(myInput);    
        document.body.appendChild(myForm);     
        myForm.submit();   
        document.body.removeChild(myForm);  // 提交后移除创建的form  
    }  
	</script>
	<body>
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
						<a href="IndexServlet"><img src="images/tubiao1.png" height="80px" width="200px" /></a>
					</div>
					<div class="top1-2">
						<ul class="topul">
							<li class="topli">
								<a href="#">鲜花</a>
							</li>
							<li class="topli">
								<a href="#">蛋糕</a>
							</li>
							<li class="topli">
								<a href="#">礼篮</a>
							</li>
							<li class="topli">
								<a href="#">巧克力</a>
							</li>
							<li class="topli">
								<a href="#">卡通花束</a>
							</li>
						</ul>
					</div>
					<div class="top1-3">
						<form>
							<input type="text" id="serch" style="height:30px; width:150px; margin:0px; padding:0px; margin-top:15px" />
							<input type="image" src="images/serch.png" style="margin-top:10px; vertical-align:top" />
							<br>热搜：
							<font color="#FF0000">巧克力，鲜花</font>
						</form>

					</div>
				</div>
				<div class="center">
					<div class="daohang">
						<!--导航栏-->
						<ul style="list-style:none; margin:0; padding:0">
							<li class="lifirst">全部分类</li>
							<li class="daoli">
								<a href="#">鲜花速递,玫瑰百合</a>
							</li>
							<li class="daoli">
								<a href="#">蛋糕，品牌生日蛋糕</a>
							</li>
							<li class="daoli">
								<a href="#">礼篮，商务礼篮</a>
							</li>
							<li class="daoli">
								<a href="#">品牌巧克力，DIY</a>
							</li>
							<li class="daoli">
								<a href="#">卡通花束</a>
							</li>
							<li class="daoli">
								<a href="#">花瓶，花瓶插花</a>
							</li>
							<li class="daoli">
								<a href="#">盒话，进品保鲜花</a>
							</li>
							<li class="daoli">
								<a href="#">绿植花卉</a>
							</li>
							<li class="daoli">
								<a href="#">生日礼物</a>
							</li>
							<li class="daoli">
								<a href="#">鲜花蛋糕</a>
							</li>
							<li class="daoli">
								<a href="#">热卖品专区</a>
							</li>
						</ul>

					</div>
					<div class="dao-right">
						<div class="example2">
							<ul>
								<li><img src="images/1.jpg" alt="1" /></li>
								<li><img src="images/2.jpg" alt="2" /></li>
								<li><img src="images/3.jpg" alt="3" /></li>
								<li><img src="images/4.jpg" alt="4" /></li>
							</ul>
							<ol>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ol>
						</div>
						<!--Luara图片切换骨架end-->
						<script>
							$(function() {
								<!--调用Luara示例-->
								$(".example2").luara({
									width: "967",
									height: "492",
									interval: 4500,
									selected: "seleted",
									deriction: "left"
								});

							});
						</script>
					</div>
				</div>
				<!--中2-->
				<div class="center2">
					<div class="center2-left">
						<ul style="list-style:none; margin-top:30px; padding:0px;background:#E1F2F2;">
							<li class="lifirst">热销排名</li>
							<li class="center2-leftli">
								<div style="float:left">
									<a href="3商品详情.html">1 鲜花/梦幻之恋</a>
								</div>
								<div style="float:right">
									<font class="mony" style="width:20px; margin:0; padding:0px;">¥95</font>
								</div>
							</li>
							<li class="center2-leftli">
								<div style="float:left">
									<a href="3商品详情.html">2 鲜花/一生的期盼</a>
								</div>
								<div style="float:right">
									<font class="mony" style="width:20px; margin:0; padding:0px;">¥151</font>
								</div>
							</li>
							<li class="center2-leftli">
								<div style="float:left">
									<a href="3商品详情.html">3 鲜花/一直很爱你</a>
								</div>
								<div style="float:right">
									<font class="mony" style="width:20px; margin:0; padding:0px;">¥299</font>
								</div>
							</li>
							<li class="center2-leftli">
								<div style="float:left">
									<a href="3商品详情.html">4 鲜花/天使的祝福</a>
								</div>
								<div style="float:right">
									<font class="mony" style="width:20px; margin:0; padding:0px;">¥178</font>
								</div>
							</li>
							<li class="center2-leftli">
								<div style="float:left">
									<a href="3商品详情.html">5 鲜花/守候爱情</a>
								</div>
								<div style="float:right">
									<font class="mony" style="width:20px; margin:0; padding:0px;">¥259</font>
								</div>
							</li>
						</ul>
					</div>
					<div class="center2-right">
						<div style="width:650px; height:300px; margin:0px; float:left">
							<p style="margin:0px; width:600px; margin:0px; font-size:20px;">精品推荐</p>
							<div class="center2-right1" style="border:1px solid #FFAC13">
								<form method="post" name = "form1" action="PhoneShow?goodsId=${jin[0].goodsId}">
								<a href="javascript:doPost(${jin[0].goodsId})">
								<%-- <a href="GoodsShow?goodsId=${jin[0].goodsId}"> --%>
									<img src=${jin[0].imgSrc}/1.png width="200px" height="220px" />
									<p class="name">${jin[0].name}</p>
								</a>
								</form>
								<p class="mony">¥${jin[0].price}</p>
							</div>
							<div class="center2-right1" style="border:1px solid #83C44E">
								<a href="javascript:doPost(${jin[1].goodsId})">
									<img src=${jin[1].imgSrc}/1.png width="200px" height="220px" />
									<p class="name">${jin[1].name}</p>
								</a>
								<p class="mony">¥${jin[1].price}</p>

							</div>
							<div class="center2-right1" style="border:1px solid #2196F3">
								<a href="javascript:doPost(${jin[2].goodsId})">
									<img src=${jin[2].imgSrc}/1.png width="200px" height="220px" />
									<p class="name">${jin[2].name}</p>
								</a>
								<p class="mony">¥${jin[2].price}</p>
							</div>
						</div>
						<div class="center2-right2">
							<ul class="whyul">
								<li class="whyli" style="background:#9C9">为什么选择我们</li>
								<li class="whyli" style="list-style-image:url(images/why1.png)">精选花材 100%品质保证</li>
								<li class="whyli" style="list-style-image:url(images/why2.png)">行业第一 千万用户推荐</li>
								<li class="whyli" style="list-style-image:url(images/why3.png)">实体花店 好评如潮</li>
								<li class="whyli" style="list-style-image:url(images/why4.png)">行业推荐 数千家连锁</li>
								<li class="whyli" style="list-style-image:url(images/why5.png)">全国配送 7*24小时在线订购</li>
								<li class="whyli" style="list-style-image:url(images/why6.png)">市场低价 3小时上门</li>
							</ul>
						</div>
					</div>
				</div>
				<!---中3-->
				<div class="center3">
					<div class="center3-top">
						<p class="lei">新品上市</p>
						<a href="3商品详情.html" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>

					<div class="center3-div" style="border:1px solid #FFAC13">
						<a href="javascript:doPost(${new1[0].goodsId})">
							<img src=${new1[0].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${new1[0].name}</p>
						</a>
						<p class="mony">¥${new1[0].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #83C44E">
						<a href="javascript:doPost(${new1[1].goodsId})">
							<img src=${new1[1].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${new1[1].name}</p>
						</a>
						<p class="mony">¥${new1[1].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #2196F3">
						<a href="javascript:doPost(${new1[2].goodsId})">
							<img src=${new1[2].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${new1[2].name}</p>
						</a>
						<p class="mony">¥${new1[2].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #E53935">
						<a href="javascript:doPost(${new1[3].goodsId})">
							<img src=${new1[3].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${new1[3].name}</p>
						</a>
						<p class="mony">¥${new1[3].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #00C0A5">
						<a href="javascript:doPost(${new1[4].goodsId})">
							<img src=${new1[4].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${new1[4].name}</p>
						</a>
						<p class="mony">¥${new1[4].price}</p>
					</div>
				</div>
				<!--中4 热销商品-->
				<div class="center3">
					<div class="center3-top">
						<p class="lei">热销商品</p>
						<a href="#" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>

					<div class="center3-div" style="border:1px solid #FFAC13">
						<a href="javascript:doPost(${hot[0].goodsId})">
							<img src=${hot[0].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${hot[0].name}</p>
						</a>
						<p class="mony">¥${hot[0].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #83C44E">
						<a href="javascript:doPost(${hot[1].goodsId})">
							<img src=${hot[1].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${hot[1].name}</p>
						</a>
						<p class="mony">¥${hot[1].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #2196F3">
						<a href="javascript:doPost(${hot[2].goodsId})">
							<img src=${hot[2].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${hot[2].name}</p>
						</a>
						<p class="mony">¥${hot[2].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #E53935">
						<a href="javascript:doPost(${hot[3].goodsId})">
							<img src=${hot[3].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${hot[3].name}</p>
						</a>
						<p class="mony">¥${hot[3].price}</p>
					</div>
					<div class="center3-div" style="border:1px solid #00C0A5">
						<a href="javascript:doPost(${hot[4].goodsId})">
							<img src=${hot[4].imgSrc}/1.png width="230px" height="280px" />
							<p class="name">${hot[4].name}</p>
						</a>
						<p class="mony">¥${hot[4].price}</p>
					</div>
				</div>
				<!--中5 鲜花-->
				<div class="center3">
					<div class="center3-top">
						<p class="lei">鲜花</p>
						<a href="#" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>

					<div class="center3-div" style="border:1px solid #FFAC13">
						<a href="#">
							<img src="images/4flowers/hua1.png" width="230px" height="280px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center3-div" style="border:1px solid #83C44E">
						<a href="#">
							<img src="images/4flowers/hua2.png" width="230px" height="280px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center3-div" style="border:1px solid #2196F3">
						<a href="#">
							<img src="images/4flowers/hua3.png" width="230px" height="280px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center3-div" style="border:1px solid #E53935">
						<a href="#">
							<img src="images/4flowers/hua4.png" width="230px" height="280px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center3-div" style="border:1px solid #00C0A5">
						<a href="#">
							<img src="images/4flowers/hua5.png" width="230px" height="280px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
				</div>
				<!--中6 蛋糕-->
				<div class="center4">
					<div class="center3-top">
						<p class="lei">蛋糕</p>
						<a href="#" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>
					<div class="center4-div" style="border:1px solid #FFAC13">
						<a href="#">
							<img src="images/5cake/cake1.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #83C44E">
						<a href="#">
							<img src="images/5cake/cake2.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #2196F3">
						<a href="#">
							<img src="images/5cake/cake3.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #E53935">
						<a href="#">
							<img src="images/5cake/cake4.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #00C0A5">
						<a href="#">
							<img src="images/5cake/cake5.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
				</div>
				<!--中7 巧克力-->
				<div class="center4">
					<div class="center3-top">
						<p class="lei">巧克力</p>
						<a href="#" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>
					<div class="center4-div" style="border:1px solid #FFAC13">
						<a href="#">
							<img src="images/6chocolates/chocolate1.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #83C44E">
						<a href="#">
							<img src="images/6chocolates/chocolate2.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #2196F3">
						<a href="#">
							<img src="images/6chocolates/chocolate3.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #E53935">
						<a href="#">
							<img src="images/6chocolates/chocolate4.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #00C0A5">
						<a href="#">
							<img src="images/6chocolates/chocolate5.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
				</div>
				<!--中8 玩具公仔-->
				<div class="center4">
					<div class="center3-top">
						<p class="lei">玩具公仔</p>
						<a href="#" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>
					<div class="center4-div" style="border:1px solid #FFAC13">
						<a href="#">
							<img src="images/7toys/toy1.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #83C44E">
						<a href="#">
							<img src="images/7toys/toy2.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #2196F3">
						<a href="#">
							<img src="images/7toys/toy3.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #E53935">
						<a href="#">
							<img src="images/7toys/toy4.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #00C0A5">
						<a href="#">
							<img src="images/7toys/toy5.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
				</div>
				<!--中9 卡通花束-->
				<div class="center4">
					<div class="center3-top">
						<p class="lei">卡通花束</p>
						<a href="#" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>
					<div class="center4-div" style="border:1px solid #FFAC13">
						<a href="#">
							<img src="images/8cartoon_flowers/cartoon_flower1.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #83C44E">
						<a href="#">
							<img src="images/8cartoon_flowers/cartoon_flower2.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #2196F3">
						<a href="#">
							<img src="images/8cartoon_flowers/cartoon_flower3.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #E53935">
						<a href="#">
							<img src="images/8cartoon_flowers/cartoon_flower4.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #00C0A5">
						<a href="#">
							<img src="images/8cartoon_flowers/cartoon_flower5.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
				</div>
				<!--中10 绿植花卉-->
				<div class="center4">
					<div class="center3-top">
						<p class="lei">绿植花卉</p>
						<a href="#" style="float:right; margin:10px; font-size:20px;">更多</a>
					</div>
					<div class="center4-div" style="border:1px solid #FFAC13">
						<a href="#">
							<img src="images/9plants/plant1.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #83C44E">
						<a href="#">
							<img src="images/9plants/plant2.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #2196F3">
						<a href="#">
							<img src="images/9plants/plant3.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #E53935">
						<a href="#">
							<img src="images/9plants/plant4.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
					<div class="center4-div" style="border:1px solid #00C0A5">
						<a href="#">
							<img src="images/9plants/plant5.png" width="230px" height="230px" />
							<p class="name">鲜花/一直很爱你</p>
						</a>
						<p class="mony">¥220</p>
					</div>
				</div>
				<!--结束-->
				<div style="height:300px; width:1200px;">
					<a href="#">
						<img src="images/xianhuawang.png" width="1200" height="300px" />
					</a>
				</div>
				<!--底部-->
				<div class="dip">
					<table bgcolor="#FFFFFF" height="100px" width="1200px" cellspacing="0" class="o">
						<tr style="font-weight:bolder;">
							<td>
								<a href="#">新手指南</a>
							</td>
							<td>
								<a href="#">贺卡服务</a>
							</td>
							<td>
								<a href="#">全国配送服务</a>
							</td>
							<td>
								<a href="#">支付与查询</a>
							</td>
							<td>
								<a href="#">售后保障</a>
							</td>
							<td rowspan="3" width="150px">您有任何疑问，请拨打全国统一热线(免长途费)或联系 网页客服 </td>
						</tr>
						<tr>
							<td>
								<a href="#">玫瑰支数详细寓意</a>
							</td>
							<td>
								<a href="#">星座、巧克力、爱情</a>
							</td>
							<td>
								<a href="#">配送服务说明</a>
							</td>
							<td>
								<a href="#">发票及支付方式</a>
							</td>
							<td>
								<a href="#">鲜花绿植先行赔付</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#">送花技巧</a>
							</td>
							<td>
								<a href="#">送花祝福语大全</a>
							</td>
							<td>
								<a href="#">全国城郊配送查询</a>
							</td>
							<td>
								<a href="#">如何查询订单</a>
							</td>
							<td>
								<a href="#">订购必读</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>

</html>