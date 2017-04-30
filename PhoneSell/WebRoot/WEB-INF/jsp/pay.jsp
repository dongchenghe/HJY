<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="serverErrorPage.jsp"%>
<%@ taglib uri="http://www.6013.com/show" prefix="show"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<link type="text/css" rel="stylesheet" href="css/xiadan.css" />
<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="js/xiadan.js"></script>
</head>
<body>
	<div style="background: #CCFFCC; width: 100%">
		<div style="width: 100%; background: #F2F2F2">
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
				<form action="OrderPayServlet" method="post" id="subform">
					<div class="orderdiv1">&nbsp;填写订单信息</div>
					<div class="addressdiv1">
						&nbsp;&nbsp;收货人信息
						<div id="add_address"
							style="float: right; width: 20%; text-align: right;"
							onclick="addAddress()">新增收货人+&nbsp;&nbsp;</div>
						<div style="clear: right;"></div>
						<div id="old_address">
							<c:if test="${receive_list!=null}">
								<table class="receivetable" cellspacing="0px" id="table1">
									<tr>
										<td></td>
										<td>收货人姓名</td>
										<td>收货人电话</td>
										<td>收货人地址</td>
									</tr>
									<c:forEach items="${receive_list}" var="u" varStatus="status">
										<c:choose>
											<c:when test="${status.index==0}">
												<tr>
													<td><input type="radio" name="xuanze" checked="checked" value="${u.addrId}"></td>
													<td>${u.receiver}</td>
													<td>${u.tell}</td>
													<td>${u.address}</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td><input type="radio" name="xuanze" value="${u.addrId}"></td>
													<td>${u.receiver}</td>
													<td>${u.tell}</td>
													<td>${u.address}</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</c:if>
						</div>
						<div id="newaddress"></div>
					</div>
					<hr width="84%"
						style="height: 1px; border: none; border-top: 1px dashed #B9B9B9; margin: 0px auto;" />
					<div style="clear: both;"></div>
					<hr width="84%"
						style="height: 1px; border: none; border-top: 1px dashed #B9B9B9; margin: 0px auto;" />
					<hr width="84%"
						style="height: 1px; border: none; border-top: 1px dashed #B9B9B9; margin: 0px auto;" />
					<div class="orderdiv1">&nbsp;核对购物清单</div>
					<div class="center1">
						<show:goodsList />
					</div>
				</form>
			</div>
			<!--底部-->
			<div class="dip">

				<table bgcolor="#FFFFFF" height="100px" width="1200px"
					cellspacing="0" class="o">
					<tr style="font-weight: bolder;">
						<td><a href="#">新手指南</a></td>
						<td><a href="#">贺卡服务</a></td>
						<td><a href="#">全国配送服务</a></td>
						<td><a href="#">支付与查询</a></td>
						<td><a href="#">售后保障</a></td>
						<td rowspan="3" width="150px">您有任何疑问，请拨打全国统一热线(免长途费)或联系 网页客服
						</td>
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
