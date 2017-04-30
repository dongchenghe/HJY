function fun(){
	var msgdiv=document.getElementById("msgdiv");	
	var skipform=document.getElementById("skipform");
	var span1=document.getElementById("span1");	
	var span2=document.getElementById("span2");	
	var span3=document.getElementById("span3");	
	span1.innerHTML="下单成功,";
	span3.innerHTML="秒后跳转主页";
	span2.style.color="red";
	f();
}
var s=5;
function f(){
		if(s<0){
			s=5;
		}
		if(s==0){
			skipform.submit();
	
		}
		span2.innerHTML=""+s;
		s--;
		}
	setInterval("f()",1000);