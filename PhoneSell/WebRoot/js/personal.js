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
	alert("dsfsdf");
	xmlHttp.open("POST", "AjaxUserOrder?user_order_clik="+user_order_clik, true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState==4){   
			if(xmlHttp.status==200){
				if(xmlHttp.responseText==0){
					location.reload(true);
				}else if(xmlHttp.responseText ==1){
					
				}else{
					alert("删除失败重新再试");
				}
			}
		}
	}
}