$(function() {
	$('#submit').click(function(){
			$.ajax({
				type:'post',       //方法类型
				url:'./user_checkLogin',  //url地址
				data: $('#loginForm').serialize(),
				datatype:'json',   //指定服务器返回类型
				success:function(returnMsg){
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
})