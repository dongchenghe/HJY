<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的购物车</title>
	<script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="js/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/shopingcar.js"></script>
	<link type="text/css" rel="stylesheet" href="css/shopingcar.css" />
</head>
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
                	<a href="IndexServlet"><img src="images/tubiao1.png" height="80px" width="200px"/></a>
                </div>
                <div class="top1-2">
                	<ul class="topul">
                    	<li class="topli"><a href="IndexServlet">首页</a></li>
                    </ul>
                </div>
            </div>
            <div class="center">      
            	<div class="center1">
            	<c:choose> 
					<c:when test="${empty list_goods||list_goods.size()==0}">			
						<div class="div1" style="border-top:1px solid #06C";">
	                    	你的购物车里没有任何物品，快去商城选取商品购买吧
	                    </div>		
					</c:when> 		
					<c:otherwise>
					<div class="catbox">
						<form id="form1" action="BalanceServlet" method="get">			
						  <table id="cartTable">
						    <thead>
						      <tr>
						        <th><label>
						            <input class="check-all check" type="checkbox" style="width:20px;height:20px;"/>&nbsp;&nbsp;全选</label></th>
						        <th>商品</th>
						        <th>价格</th>
						        <th>数量</th>
						        <th>小计</th>
						        <th>操作</th>
						      </tr>
						    </thead>
						    <tbody>
						    	<c:forEach items="${list_goods}" var="goods_and_count" varStatus="i">
						    		 <tr id="goods${goods_and_count.CART_ID}">
								        <td class="checkbox"><input name="choose" value="${goods_and_count.CART_ID}" class="check-one check" type="checkbox" style="width:20px;height:20px;"/></td>
								        <td class="goods">
								        	<a href="GoodsShow?goodsId=${goods_and_count.GOODS_ID}">
								        	<img src="${goods_and_count.IMG_SRC}/${goods_and_count.IMG}" alt=""/><span>${goods_and_count.NAME}/${goods_and_count.COLOR}</span></td>
								        	</a>
								        <td class="price">${goods_and_count.C_PRICE}</td>
								        <td class="count"><span class="reduce"></span>
								          <input class="count-input" type="text" value="${goods_and_count.COUNT}"/>
								          <span class="add">+</span></td>
								        <td class="subtotal" >${goods_and_count.C_PRICE*goods_and_count.COUNT}</td>
								        <td class="operation"><a href="javascript:;" class="delete">删除</a></td>
						     		</tr>
						    	</c:forEach>
						    </tbody>
						  </table>
						  <div class="foot" id="foot">
						    <label class="fl select-all"><input type="checkbox" class="check-all check" style="width:20px;height:20px;"/>&nbsp;&nbsp;全选</label>
						    <a class="fl delete" id="deleteAll" href="javascript:;">删除</a>
						    <div class="fr closing" onclick="fomti()">结 算</div>
						    <input type="hidden" id="cartTotalPrice"/>
						    <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
						    <div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件</div>
						  </div>
					  </form>  
					</div>
					</c:otherwise>
				</c:choose>                        
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
</html>