function checkUserName(){
	// 获得文件框值:
	var username = $.trim($("#username").val());
	$.ajax({
		type:'post',       //方法类型
		url:'./user_checkUserName',  //url地址
		data:  {"username":username},
		datatype:'json',   //指定服务器返回类型
		success:function(data){
			console.log(data);
			if(data) {
				$("#usernameError").show().html('<font color="red">用户名已经存在，请重新命名！</font>');
			}
			else {
				$("#usernameError").hide();
			}
		}
	})
	}

function change(){
	$("#checkImg").attr("src", "./checkImg?" + new Date().getTime());
	}

function checkForm(){
		// 校验用户名:
		// 获得用户名文本框的值:
		var username = $("#username").val();
		if(username == null || username == ''){
			alert("用户名不能为空!");
			return false;
		}
		// 校验密码:
		// 获得密码框的值:
		var password = $("#password").val();
		if(password == null || password == ''){
			alert("密码不能为空!");
			return false;
		}
		// 校验确认密码:
		var repassword = $("#repassword").val();
		if(repassword != password){
			alert("两次密码输入不一致!");
			return false;
		}
	}

