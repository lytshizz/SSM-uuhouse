<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="./uuhouse">
				<img src="./images/logo.jpg" alt="优优二手房"/>
			</a>
		</div>
	</div>
	<div class="span9">
	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<c:choose> 
				<c:when test="${empty sessionScope.user}">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="./user_login">登录</a>|
					</li> 
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="./user_toregist">注册</a>|
					</li>
				</c:when>
				<c:otherwise>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<c:out value='${sessionScope.user.nickname}'/>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
						<a href="./user_quit">退出</a>|
					</li>
				</c:otherwise>
				</c:choose> 
				<li>
					<a href="./user_center">个人中心</a>
					|
				</li>
				<li>
					<a >买房指南</a>
					|
				</li>
				<li>
					<a>关于我们</a>
				</li>
			</ul>
		</div>
		<div class="cart">
			<a href="./collection_myCollections">我的收藏</a>
		</div>
		<div class="phone">
			客服热线:<strong>96008/5327776</strong>
		</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
			<li>
				<a href="./uu_index">首页</a>
				|
			</li>
			
			<li>
				<a >房源</a>
				|
			</li>
			<li>
				<a >小区</a>
				|
			</li>
			<li>
				<a>地图找房</a>
				|
			</li>
			<li>
				<a >主题找房</a>
				|
			</li>
			<li>
				<a>闪电卖房</a>
				|
			</li>
			<li>
				<a>优秀经纪人</a>
				|
			</li>
		</ul>
	</div>
</div>	