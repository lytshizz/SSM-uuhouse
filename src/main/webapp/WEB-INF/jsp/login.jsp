<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>登录</title>
		
		<link href="./css/common.css" rel="stylesheet" type="text/css"/>
		<link href="./css/login.css" rel="stylesheet" type="text/css"/>
		
		<script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="./js/head.js"></script>
		<script type="text/javascript" src="./js/login.js"></script>
	</head>
	<body>
	<!-- *********************顶部********************** -->	
		<%@ include file="top.jsp" %>
		
	<!-- ********************中间内容********************* -->
	<div class="container login">
		<div class="span12">
			<div class="ad">
				<img src="./images/login.jpg" width="500" height="330" alt="房源样式" title="房源样式"></img>
			</div>
		</div>
		
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN 
					</div>
					<form id="loginForm">
						<table>
							<tbody>
								<tr>
									<th>
										用户名/E-mail:
									</th>
									<td>
										<input type="text" id="username" name="username" class="text" maxlength="20"/>
									</td>
								</tr>
								<tr>
									<th>
										密&nbsp;&nbsp;码:
									</th>
									<td>
										<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off"/>
										<br/>
										<span id="errorTip"></span>
									</td>
								</tr>
								<tr>
									<th>&nbsp;
									</th>
									<td>
										<label>
											<input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="true"/>记住用户名
										</label>
										<label>
											&nbsp;&nbsp;<a >找回密码</a>
										</label>
									</td>
								</tr>
								<tr>
									<th>&nbsp;
									</th>
									<td>
										<input id="submit" type="button" class="submit" value="登 录"/>
									</td>
								</tr>
								<tr class="register">
									<th>&nbsp;
									</th>
									<td>
										<dl>
											<dt>还没有注册账号？</dt>
											<dd>
												立即注册即可体验在线买房！
												<a href="./user_regist">立即注册</a>
											</dd>
										</dl>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
		
	<!-- *********************底部********************** -->       
		<%@ include file="bottom.jsp" %>
	</body>
</html>