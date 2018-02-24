$('#submit').click(function(){
			$.ajax({
				type:'post',       //方法类型
				url:'./user_checkLogin',  //url地址
				data: $('#loginForm').serialize(),
				datatype:'json',   //指定服务器返回类型
				success:function(returnMsg){
					debugger;
					console.log(returnMsg);
					if(returnMsg[1].length != 0) {
						window.location = "./uu_index?uid=" + returnMsg[1];
					}
					else {
						if("notRegist" == returnMsg[0]) {
							$("#errorTip").html('<font color="red">您还没有注册，请前去注册！</font>');
						}
						else if("notActive"== returnMsg[0]) {
							$("#errorTip").html('<font color="red">用户未激活，请去邮箱激活！</font>');
						}
						else {
							$("#errorTip").html('<font color="red">用户名或密码错误，登录失败！</font>');
						}
					}
						
				}
			})
		})

function showTime(){
	var myDate = new Date();
	var year=myDate.getFullYear();
	var month=myDate.getMonth()+1;
	var date=myDate.getDate();
	var day=myDate.getDay();
	var d="";
	switch(day){
		case 1:
			d+="一";
			break;
		case 2:
			d+="二";
			break;
		case 3:
			d+="三";
			break;
		case 4:
			d+="四";
			break;
		case 5:
			d+="五";
			break;
		case 6:
			d+="六";
			break;
		case 7:
			d+="日";
			break;
	}
	var show="系统时间： "+year+"年"+month+"月"+date+"日 "+"星期"+d;

	var node=document.createElement("p");
	var textnode=document.createTextNode(show);
	node.appendChild(textnode);
	context=document.getElementById("date");
	context.appendChild(node);
}