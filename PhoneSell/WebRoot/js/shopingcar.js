function createXMLHttpRequest(){           // 创建XMLHttpRequest对象
	if(window.ActiveXObject){             // 判断是否是IE内核的浏览器
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  // 创建适用于IE内核的XMLRequest的对象
	}else if(window.XMLHttpRequest){     // 判断是否是FireFox内核的浏览器
		xmlHttp = new XMLHttpRequest();    // 创建适用于IE内核的XMLRequest的对象
	}
}
createXMLHttpRequest(); 
function deleteGoods(car_id){
	var car = car_id;
	xmlHttp.open("POST", "AjaxCarGoodsDelete?car_id="+car_id, true);
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
	xmlHttp.send();
	//删除节点
	var aaa = document.getElementById("goods"+car);
	aaa.parentNode.removeChild(aaa);
	regetTotal();
}
function setGoodsCount(car_id,goods_count){
	xmlHttp.open("POST", "AjaxCarGoodsAddandSub?car_id="+car_id+"&goods_count="+goods_count, true);
	xmlHttp.setRequestHeader("Context-Type", "application/x-www-form-urlencoded");
	// 服务器返回消息
	xmlHttp.onreadystatechange = fun2;  // 回调函数
	xmlHttp.send();
}
function fun2(){
	if(xmlHttp.readyState==4){   
		if(xmlHttp.status==200){
			/*if(xmlHttp.responseText==0){
				location.reload(true);
			}else if(xmlHttp.responseText ==1){}else{
				alert("改变数量重新再试");*/
			}
		}
	}

function fomti(){
	var x = document.getElementById("form1");
	x.submit();
}
function regetTotal() {
	var seleted = 0;
	var price = 0;
	var tr = document.getElementById('cartTable').children[1].rows; //行
	for (var i = 0, len = tr.length; i < len; i++) {
		if (tr[i].getElementsByTagName('input')[0].checked) {
			tr[i].className = 'on';
			seleted += parseInt(tr[i].getElementsByTagName('input')[1].value);
			price += parseFloat(tr[i].cells[4].innerHTML);
		}
		else {
			tr[i].className = '';
		}
	}	
	selectedTotal.innerHTML = seleted;
	priceTotal.innerHTML = price.toFixed(2);
	if (seleted == 0) {
		foot.className = 'foot';
	}
}
window.onload = function () {
    if (!document.getElementsByClassName) {
        document.getElementsByClassName = function (cls) {
            var ret = [];
            var els = document.getElementsByTagName('*');
            for (var i = 0, len = els.length; i < len; i++) {
                if (els[i].className.indexOf(cls + ' ') >=0 || els[i].className.indexOf(' ' + cls + ' ') >=0 || els[i].className.indexOf(' ' + cls) >=0) {
                    ret.push(els[i]);
                }
            }
            return ret;
        }
    }
    var table = document.getElementById('cartTable'); // 购物车表格
    var selectInputs = document.getElementsByClassName('check'); // 所有勾选框
    var checkAllInputs = document.getElementsByClassName('check-all') // 全选框
    var tr = table.children[1].rows; //行
    var selectedTotal = document.getElementById('selectedTotal'); //已选商品数目容器
    var priceTotal = document.getElementById('priceTotal'); //总计
    var deleteAll = document.getElementById('deleteAll'); // 删除全部按钮
    var foot = document.getElementById('foot');

    // 更新总数和总价格，已选浮层
    function getTotal() {
		var seleted = 0;
		var price = 0;
		for (var i = 0, len = tr.length; i < len; i++) {
			if (tr[i].getElementsByTagName('input')[0].checked) {
				tr[i].className = 'on';
				seleted += parseInt(tr[i].getElementsByTagName('input')[1].value);
				price += parseFloat(tr[i].cells[4].innerHTML);
			}
			else {
				tr[i].className = '';
			}
		}	
		selectedTotal.innerHTML = seleted;
		priceTotal.innerHTML = price.toFixed(2);
		if (seleted == 0) {
			foot.className = 'foot';
		}
	}
    // 计算单行价格
    function getSubtotal(tr) {
        var cells = tr.cells;
        var price = cells[2]; //单价
        var subtotal = cells[4]; //小计td
        var countInput = tr.getElementsByTagName('input')[1]; //数目input
        var span = tr.getElementsByTagName('span')[1]; //-号
        //写入HTML
        subtotal.innerHTML = (parseInt(countInput.value) * parseFloat(price.innerHTML)).toFixed(2);
        //如果数目只有一个，把-号去掉
        if (countInput.value == 1) {
            span.innerHTML = '';
        }else{
            span.innerHTML = '-';
        }
    }
    // 点击选择框
    for(var i = 0; i < selectInputs.length; i++ ){
        selectInputs[i].onclick = function () {
            if (this.className.indexOf('check-all') >= 0) { //如果是全选，则吧所有的选择框选中
                for (var j = 0; j < selectInputs.length; j++) {
                    selectInputs[j].checked = this.checked;
                }
            }
            if (!this.checked) { //只要有一个未勾选，则取消全选框的选中状态
                for (var i = 0; i < checkAllInputs.length; i++) {
                    checkAllInputs[i].checked = false;
                }
            }
            getTotal();//选完更新总计
        }
    }
    //为每行元素添加事件
    for (var i = 0; i < tr.length; i++) {
    	getSubtotal(tr[i]);//--------
        //将点击事件绑定到tr元素
        tr[i].onclick = function (e) {
            var e = e || window.event;
            var el = e.target || e.srcElement; //通过事件对象的target属性获取触发元素
            var cls = el.className; //触发元素的class
            var countInout = this.getElementsByTagName('input')[1]; // 数目input
            var value = parseInt(countInout.value); //数目
            var car_id = this.getAttribute('id');
        	var car_id_ = car_id.substring(5);
            //通过判断触发元素的class确定用户点击了哪个元素
            switch (cls) {
                case 'add': //点击了加号
                	if(value<99){
                		countInout.value = value + 1;
                    	//ajax改变数据库
                        setGoodsCount(car_id_,countInout.value);
                        getSubtotal(this);
                	}else{
                		layer.msg("客官先买99件再买吧");
                	}
                    break;
                case 'reduce': //点击了减号
                    if (value > 1) {
                        countInout.value = value - 1;
                    	//ajax改变数据库
                        setGoodsCount(car_id_,countInout.value);
                        getSubtotal(this);
                    }
                    break;
                case 'delete':
                	layer.confirm('确定要将此物品从购物车中移除吗？', {
              		  btn: ['确定','否'] //按钮
              		}, function(){
              			 deleteGoods(car_id_);
              			 layer.closeAll('dialog');//关闭窗口
              		}, function(){});
            }
            getTotal();
        }
        // 给数目输入框绑定keyup事件
        tr[i].getElementsByTagName('input')[1].onkeyup = function () {
            var val = parseInt(this.value);
            if (isNaN(val) || val <= 0) {
                val = 1;
            }
            if(val>99){
            	val=99;
            	layer.msg("客官太豪气了~先买99件再买吧");
            }
            if (this.value != val) {
                this.value = val;
            }
            var car_id = this.parentNode.parentNode.getAttribute('id');
        	var car_id_ = car_id.substring(5);
        	//ajax改变数据库
            setGoodsCount(car_id_,this.value);
            getSubtotal(this.parentNode.parentNode); //更新小计
            getTotal(); //更新总数
        }
    }
    // 点击全部删除
    deleteAll.onclick = function (){
        if (selectedTotal.innerHTML != 0) {
            layer.confirm('确定要将这些物品从购物车中移除吗？', {
      		  btn: ['确定','否'] //按钮
      		}, function(){
      			for (var i = 0; i < tr.length; i++) {
                    // 如果被选中，就删除相应的行
                    if (tr[i].getElementsByTagName('input')[0].checked) {
                    	//从数据库删除
                    	var gid = tr[i].getAttribute('id');
                    	var car_id_delete = gid.substring(5);
                    	deleteGoods(car_id_delete);
                    	i--;
                    }
                    
                }
      			layer.closeAll('dialog');//关闭窗口
      			getTotal();
      		}, function(){
      		});
        } else {
        	layer.msg('请选择商品');
        }
        getTotal(); //更新总数
    }
    // 默认全选
    checkAllInputs[0].checked = true;
    checkAllInputs[0].onclick();
}