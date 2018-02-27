<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册结果页面</title>
</head>
<body>
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
					<table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
						    <td style="width:98">
						    	<img src="./images/success.jpg" width="128" height="128" />
						    </td>
						    <td style="padding-top:30px">
						    	<font style="font-weight:bold; color:#FF0000">
							    	<c:out value='${sessionScope.registMsg}'></c:out>
							    </font>
							    <br/>
							    <br/>
							    <a href="./uu_index">首页</a>
							    <a href="./user_toregist">注册</a>
							    <a href="./user_login">登录</a>
						    </td>
				 		</tr>
					</table>
				    <h1>&nbsp;</h1>
			    </td>
		    </tr>
		</table>
	</div>
</body>
</html>