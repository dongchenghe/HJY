$(function(){
	var msgarea=$("#msgarea");
	var msg1span=$("#msg1span");
	var msg2span=$("#msg2span");
	var msg3span=$("#msg3span");
	var msg4span=$("#msg4span");
	var msg5span=$("#msg5span");
	var premsgarea=$("#premsgarea");
	var onediv=$("#onediv");
	var twodiv=$("#twodiv");
	var threediv=$("#threediv");
	var fourdiv=$("#fourdiv");
	var fivediv=$("#fivediv");
	var sixdiv=$("#sixdiv");
	var sevendiv=$("#sevendiv");
	var eightdiv=$("#eightdiv");
	var ninediv=$("#ninediv");
	var tendiv=$("#tendiv");
	
	onediv.click(function(){	
		msgarea.val(onediv.text());	
	});
	twodiv.click(function(){
		msgarea.val(twodiv.text());	
	});
	threediv.click(function(){
		msgarea.val(threediv.text());	
	});
	fourdiv.click(function(){
		msgarea.val(fourdiv.text());	
	});
	fivediv.click(function(){
		msgarea.val(fivediv.text());	
	});
	sixdiv.click(function(){
		msgarea.val(sixdiv.text());	
	});
	sevendiv.click(function(){
		msgarea.val(sevendiv.text());	
	});
	eightdiv.click(function(){
		msgarea.val(eightdiv.text());	
	});
	ninediv.click(function(){
		msgarea.val(ninediv.text());	
	});
	tendiv.click(function(){
		msgarea.val(tendiv.text());	
	});
	var payonline=$("#payonline");
	var paybycard=$("#paybycard");
	payonline.click(function(){
		payonline.css("background-color","#f56600");
		paybycard.css("background-color","#c0c0c0");
	});
	paybycard.click(function(){
		payonline.css("background-color","#c0c0c0");
		paybycard.css("background-color","#f56600");
		
	});
	
	var submitbtn=document.getElementById("submitbtn");
	
	submitbtn.onclick=function (){
		var subform=document.getElementById("subform");
		
		subform.submit();
	};
	
	
	
	var yearselect=$("#yearselect");	
	var monthselect=$("#monthselect");
	var dayselect=$("#dayselect");
	var hourselect=$("#hourselect");
	var yearsBetn=yearsBetween();
	for(var i=0;i<yearsBetn;++i){
		var option=$("<option/>");
		option.html(current_year+i);
		option.attr("value",current_year+i);
		yearselect.append(option);
	}
	

	yearselect.blur(function(){
		monthselect[0].options.length=0;
		var months=monthsDiffToyearEnd(current_year,current_month,current_day,pre_days);
		if(yearselect.val()==current_year){
			for(var i=0;i<months;++i){
			var option=$("<option/>");
			option.html(current_month+i);
			option.attr("value",current_month+i);
			monthselect.append(option);
			}
		}else{
			var restMonth=RestMonthsNextYear(current_year,current_month,current_day,pre_days);
			for(var i=1;i<=restMonth;++i){
			var option=$("<option/>");
			option.html(i);
			option.attr("value",i);
			monthselect.append(option);
			}
		}
	});
	monthselect.blur(function(){
		dayselect[0].length=0;
		var yearChoose=yearselect.val();
		var monthChoose=monthselect.val();
		var yearsLength=yearselect[0].length;
		var monthsLength=monthselect[0].length;
		if(yearChoose==current_year&&monthChoose==current_month){
			var totalDays=getTotalDaysPerMonth(yearChoose,monthChoose);
			if((totalDays-current_day)<pre_days){
				for(var i=current_day;i<=totalDays;++i){
				var option=$("<option/>");
				option.html(i);
				option.attr("value",i);
				dayselect.append(option);
				}
			}else{
				for(var i=current_day;i<=(current_day+pre_days);++i){
				var option=$("<option/>");
				option.html(i);
				option.attr("value",i);
				dayselect.append(option);
				}
			}
		}else{
			if(yearChoose==yearselect[0][yearsLength-1].value&&monthChoose==monthselect[0][monthsLength-1].value){
			
			var restDays=restDaysLastMonth(current_year,current_month,current_day,pre_days);
			for(var i=1;i<=restDays;++i){
				var option=$("<option/>");
				option.html(i);
				option.attr("value",i);
				dayselect.append(option);
				}
			
			
			}else{
				var totalDays=getTotalDaysPerMonth(yearChoose,monthChoose);
				for(var i=1;i<=totalDays;++i){
				var option=$("<option/>");
				option.html(i);
				option.attr("value",i);
				dayselect.append(option);
				}
			}
		}
		
		//if(yearsLength=){
		
		//}
		//alert(monthselect[0][2].value);
		//alert(monthselect[0][monthsLength-1].value);
	});
	dayselect.blur(function(){
		hourselect[0].length=0;
		var yearChoose=yearselect.val();
		var monthChoose=monthselect.val();
		var dayChoose=dayselect.val();
		if(yearChoose==current_year&&monthChoose==current_month&&dayChoose==current_day){
			for(var i=(current_hour+1);i<=24;++i){
			var option=$("<option/>");
			option.html(i);
			option.attr("value",i);
			hourselect.append(option);
			}
		}else{
			for(var i=1;i<=24;++i){
			var option=$("<option/>");
			option.html(i);
			option.attr("value",i);
			hourselect.append(option);
			}
		}
		
		
	});
	
	
	
	
});


var count =0;
function addAddress(){
		if(count%2==0){	
		var newAddress =$("#newaddress");
		var span1=$("<span/>");
		span1.html("&nbsp;&nbsp;收货人姓名：");
		newAddress.append(span1);
		var name=$("<input/>");
		name.attr("type","text");
		name.attr("id","name");
		name.attr("placeholder","收货人姓名");
		newAddress.append(name);
		var span2=$("<span/>");
		span2.html("&nbsp;&nbsp;收货人手机号：");
		newAddress.append(span2);
		var phone=$("<input/>");
		phone.attr("type","text");
		phone.attr("id","phone");
		phone.attr("placeholder","收货人手机号");
		newAddress.append(phone);
		var br=$("<br/>");
		newAddress.append(br);
		var span3=$("<span/>");
		span3.html("&nbsp;&nbsp;收货人地址：");
		newAddress.append(span3);
		var address=$("<input/>");
		address.attr("type","text");
		address.attr("id","address");
		address.attr("placeholder","收货人地址");
		newAddress.append(address);
		var br2=$("<br/>");
		newAddress.append(br2);
		newAddress.append("&nbsp;&nbsp;");
		var confirmbtn=$("<input/>");
		confirmbtn.attr("type","button");
		confirmbtn.attr("id","confirmbtn");
		confirmbtn.attr("value","确认");
		confirmbtn.bind("click",function(){
			newAddress.empty();
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
					xmlHttp.open("POST","AjaxReceiveInfoServlet?name="+name.prop("value")+"&phone="+phone.prop("value")+"&address="+address.prop("value"),true);
					//设置post方式的请求头
					xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
					//服务器返回消息，要执行的方法   这种方式方法后面不要括号
					xmlHttp.onreadystatechange=fun1;
					xmlHttp.send();
				
				//回调方法
				function fun1(){
					if(xmlHttp.readyState==4){
						if(xmlHttp.status==200){
							var table1=$("#table1");
							var newtr=$("<tr/>");
							var newtd1=$("<td/>");
							var newtd2=$("<td/>");
							var newtd3=$("<td/>");
							var newtd4=$("<td/>");
							var newinput=$("<input/>");
							newinput.attr("type","radio");
							newinput.attr("name","xuanze");
							newtd2.text(name.prop("value"));
							newtd3.text(phone.prop("value"));
							newtd4.text(address.prop("value"));
							newtd1.append(newinput);
							newtr.append(newtd1);
							newtr.append(newtd2);
							newtr.append(newtd3);
							newtr.append(newtd4);
							table1.append(newtr);
							//var message=xmlHttp.responseXML.getElementsByTagName("message")[0].innerHTML;
							//var receive_id=xmlHttp.responseXML.getElementsByTagName("message")[0].firstChild.data;
							//alert(xmlHttp.resonpseText);	
							newinput.attr("value",xmlHttp.responseText);
							
						}
					}
				}
	
		});
		newAddress.append(confirmbtn);	
		}
		
		if(count%2!=0){
			var newAddress =$("#newaddress");
			newAddress.empty();
		}
		count++;
		
		
		
}

