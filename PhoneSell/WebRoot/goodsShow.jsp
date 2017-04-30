<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page errorPage="serverErrorPage.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${goods.name}商品详情</title>
	<script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="js/layer/layer.js" type="text/javascript"></script>
	<SCRIPT src="js/jquery-1.2.6.pack.js" type="text/javascript"></SCRIPT>
	<SCRIPT src="js/bigeye.js" type="text/javascript"></SCRIPT>
	<link type="text/css" rel="stylesheet" href="css/xiangqing.css" />
<!-- 	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<script src="js/bootstrap.min.js" type="text/javascript"></script> -->
</head>
<script>
	function createXMLHttpRequest(){           // 创建XMLHttpRequest对象
		if(window.ActiveXObject){             // 判断是否是IE内核的浏览器
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  // 创建适用于IE内核的XMLRequest的对象
		}else if(window.XMLHttpRequest){     // 判断是否是FireFox内核的浏览器
			xmlHttp = new XMLHttpRequest();    // 创建适用于IE内核的XMLRequest的对象
		}
	}
	createXMLHttpRequest(); 
	function addGoods(goods_id){
		var goods_count = document.getElementById("count");
		var color_id = document.getElementById("color_id").innerHTML;
		xmlHttp.open("POST", "AjaxUserBy?goods_id="+goods_id+"&goods_count="+goods_count.value+"&color_id="+color_id, true);
		xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
		// 服务器返回消息
		xmlHttp.onreadystatechange = fun1;  // 回调函数
		xmlHttp.send();
	}
	function fun1(){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				if(xmlHttp.responseText==0){
					layer.msg('成功加入到购物车', {icon: 6}); 
				}else{
					if(xmlHttp.responseText==1){
						layer.msg('成功加入到零时购物车', {icon: 6}); 
					}else{
						layer.msg('加入购物车失败', {icon: 6}); 
					}
				}
			}
		}
	}
    function changcout(cont){
    	var c = document.getElementById("count");
    	var count = c.value;
    	if(cont){
    		if(count>1){
    			c.setAttribute("value", count-1);
    		}
    	}else{
    		c.setAttribute("value", parseInt(count)+1);
    	}
    }
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
						<a href="personal.jsp" class="top-lefta">个人中心</a>
						<span>|</span>
						<a href="ShopingCarServlet" class="top-lefta">我的购物车</a>
					</div>
				</div>
			</div>
        <div id="mian">
            <div class="top1">
            	<div class="top1-1">
                	<a href="IndexServlet"><img src="images/tubiao.png" height="80px" width="200px"/></a>
                </div>
                <div class="top1-2">
                	<ul class="topul">
                    	<li class="topli"><a href="#">鲜花</a></li>
                        <li class="topli"><a href="#">蛋糕</a></li>
                        <li class="topli"><a href="#">礼篮</a></li>
                        <li class="topli"><a href="#">巧克力</a></li>
                        <li class="topli"><a href="#">卡通花束</a></li>
                    </ul>
                </div>
                <div class="top1-3">
                	<form>
                    	<input type="text" id="serch" style="height:30px; width:150px; margin:0px; padding:0px; margin-top:15px"/>
                        <input type="image" src="images/serch.png" style="margin-top:10px; vertical-align:top"/>
                        <br>热搜：<font color="#FF0000">巧克力，鲜花</font>
                   </form>
                </div>
            </div>
            <div class="product-wrapper">
			<div class="product-l">
			<!--动态的图片放大镜-->
				<div id=preview>
					<div class=jqzoom id=spec-n1 >
						<IMG height=350 src="${goods.imgSrc}/1.png" jqimg="${goods.imgSrc}/1.png" width=350>
					</div>
					<div id=spec-n5>
						<div class=control id=spec-left>
							<img src="images/left.gif" />
						</div>
						<div id=spec-list>
							<ul class=list-h>
								<li><img src="${goods.imgSrc}/2.png"> </li>
								<li><img src="${goods.imgSrc}/3.png"> </li>
								<li><img src="${goods.imgSrc}/4.png"> </li>
								<li><img src="${goods.imgSrc}/5.png"> </li>
								<li><img src="${goods.imgSrc}/1.png"> </li>
								<li><img src="${goods.imgSrc}/2.png"> </li>
								<li><img src="${goods.imgSrc}/3.png"> </li>
								<li><img src="${goods.imgSrc}/4.png"> </li>
								<li><img src="${goods.imgSrc}/5.png"> </li>
								<li><img src="${goods.imgSrc}/1.png"> </li>
							</ul>
						</div>
						<div class=control id=spec-right>
							<img src="images/right.gif" />
						</div>
				   </div>			
				</div>
			</div>
			<div class="product-r">
				<div class="title">
					<h3 class="product-title">${goods.name}</h3>
					<p class="product-subtitle">${goods.detaile}</p>
				</div>
				<div class="attribute">
					<font>详细：</font>${goods.detaile}<br> <br>
					<font>说明：</font>畅销款，特价<br><br>
					<font id="color_id" style="display: none;"></font>
					<font>选择颜色：</font>
					 	<c:forEach items="${colors }" var="co" varStatus="s">
		                    <span name="color1" style=" padding:0px; display:inline-block;height:44px; border:1px solid #DDDDDD; line-height:44px;">
	                			<img style="height:42px; border:1px solid #DDDDDD; line-height:42px;float:left;" src="${goods.imgSrc}/${co.IMG}.png">
	                			<font>${co.COLOR}</font>
			                </span>
		              	</c:forEach>
				</div>
				<div class="price" id="ajax_pricebox" style="border:none;">
                	<div>
                		售价：<font id="price" size="5" color="#FF6A00">${goods.price}</font>
                	</div>
                </div>
				<div class="btn-buy">		
					<div style="float: left;"> 
						<a href="javascript:changcout(true)" class="J_minus"><i class="iconfont"> -</i></a> 
						<input id="count" value="1"  style=" width:40px"/>
						<a href="javascript:changcout(false)" class="J_minus"><i class="iconfont">+</i></a>  
					</div>
					<a><img src="images/buy.png" onclick="addGoods(${goods.goodsId})" /></a>
					<span id="spanbuy" style="color: green;"></span><br><br>
					库存：<font id="kc" size="3">${colors[0].COUNT}</font>
				</div>
			</div>
            </div>
            <div id="mystyle" align="center" class="divend">
     			<div style="height:50px;width:990px;background-color:#F3F3F3; border-bottom:2px solid #E4393C; margin-bottom:30px">
                	<a name="detail">商品详情</a>
                    <a name="detail">规格与包装</a>
                </div>
                <div id="di1">
                <c:forEach var="i" begin="1" end="6" varStatus="s"> 
                      <img src="${goods.imgSrc}/d${s.index+1}.jpg">
                </c:forEach> 
            	</div>
                <div id="di2">
                <c:forEach var="i" begin="1" end="2" varStatus="s"> 
                      <img src="${goods.imgSrc}/g${s.index+1}.png">
                </c:forEach> 
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
      <SCRIPT type=text/javascript>
      //---------------------评论/详情/包装切换------------------------------
		var  detail=document.getElementsByName("detail");
		var  divs1=document.getElementById("di1");
		var  divs2=document.getElementById("di2");
		divs2.style.display="none";
		function f(i){
			detail[i].onclick=function(){
				
				for(var j=0;j<detail.length;++j){
					if(j==i){
						detail[j].style.Color="#FFF";
						detail[j].style.backgroundColor="#E4393C";
					}else{
						detail[j].style.backgroundColor="#FFF";
					}
				}
				if(i==0){
					divs1.style.display="block";
					divs2.style.display="none";
				}else if(i==1){
					divs2.style.display="block";
					divs1.style.display="none";
				}
			}
		}
		for(var i=0;i<detail.length;++i){
			f(i);
		}
	$(function(){	
	   $(".jqzoom").jqueryzoom({
			xzoom:400,
			yzoom:400,
			offset:60,
			position:"right",
			preload:1,
			lens:1
		});
		$("#spec-list").jdMarquee({
			deriction:"left",
			width:350,
			height:56,
			step:2,//一次性走几个
			speed:4,
			delay:10,//调节速度
			control:true,
			_front:"#spec-right",
			_back:"#spec-left"
		});
		$("#spec-list img").bind("mouseover",function(){
			var src=$(this).attr("src");
			$("#spec-n1 img").eq(0).attr({
				src:src.replace("\/n5\/","\/n1\/"),
				jqimg:src.replace("\/n5\/","\/n0\/")
			});
			$(this).css({
				"border":"2px solid #ff6600",
				"padding":"1px"
			});
		}).bind("mouseout",function(){
			$(this).css({
				"border":"1px solid #ccc",
				"padding":"2px"
			});
		});				
	});
	//------------------------------颜色--------------------------------------
			var img0=document.getElementsByName("color1")
			for(var i=0;i<img0.length;++i){
				run1(i);
			}
			function run1(i){
				var price=document.getElementById("price");
				var kc=document.getElementById("kc");
				var color_id=document.getElementById("color_id");
				img0[i].onclick =function(){
					this.style.border="1px solid red";
					for(var j=0;j<img0.length;j++){
						if(j!=i){
							img0[j].style.border="1px solid #DDDDDD";
						}
					}
					if(i==0){
						price.innerHTML="<c:out value="${colors[0].PRICE}"></c:out>";
						kc.innerHTML="<c:out value="${colors[0].COUNT}"></c:out>";
						color_id.innerHTML="<c:out value="${colors[0].PHONE_COLOR_ID}"></c:out>";	
					}
					if(i==1){
						price.innerHTML="<c:out value="${colors[1].PRICE}"></c:out>";
						kc.innerHTML="<c:out value="${colors[1].COUNT}"></c:out>";
						color_id.innerHTML="<c:out value="${colors[1].PHONE_COLOR_ID}"></c:out>";
					}
					if(i==2){
						price.innerHTML="<c:out value="${colors[2].PRICE}"></c:out>";
						kc.innerHTML="<c:out value="${colors[2].COUNT}"></c:out>";
						color_id.innerHTML="<c:out value="${colors[2].PHONE_COLOR_ID}"></c:out>";
					}
					if(i==3){
						price.innerHTML="<c:out value="${colors[3].PRICE}"></c:out>";
						kc.innerHTML="<c:out value="${colors[3].COUNT}"></c:out>";
						color_id.innerHTML="<c:out value="${colors[3].PHONE_COLOR_ID}"></c:out>";
					}
					if(i==4){
						price.innerHTML="<c:out value="${colors[4].PRICE}"></c:out>";
						kc.innerHTML="<c:out value="${colors[4].COUNT}"></c:out>";
						color_id.innerHTML="<c:out value="${colors[4].PHONE_COLOR_ID}"></c:out>";
					}
				}
			}
			
	</SCRIPT>
<SCRIPT src="js/lib.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/97zzw.js" type=text/javascript></SCRIPT>
</body>
</html>