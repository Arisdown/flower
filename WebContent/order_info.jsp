<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
* {
	margin: 0px auto;
	padding: 0
}
*{
   transition:all 2s;
}
#header1 {
	width: 960px;
	height: 100px;

	text-align: center;
}

#logo {
	float: left;
	height: 85px;
}

#right {
	float: right;
	margin-top: 30px;
	color: block;
	text-align: center;
}

#header {
	width: 960px;
	margin: 0px auto;
	top: -80px;
	background-color: red;
}

#nav_menu {
	background-color: red;
	text-align: center;
	left: 20px;
}

#nav_menu ul {
	text-align: center;
	background-color: red;
	width: 960px;
	list-style-type: none;
	list-style: none;
	left: 20px;
}

#nav_menu ul li {
	float: left;
}

#nav_menu ul li a {
	text-align: center;
	display: block;
	width: 158px;
	padding: 1em 0;
	text-decoration: none;
	font-weight: bold;
	background-color: red;
	color: white;
	border-right: 2px solid white;
}

#nav_menu ul li a.lastitem {
	border-right: none;
}

#nav_menu ul li a.current {
	color: yellow;
}

#main {
	width: 960px;
	margin: 0px auto;
	margin-top: 60px;
	height: 500px;
	background-image: url('img/main1.png');
	border-radius: 20px;
}

#left {
	text-align: center;
	float: left;
	margin: 50px 100px auto 50px;
	width: 350px;
	height: 420px;
	opacity: 100%;
}

#right ul {
	list-style-type: none;
}

#right  li {
	display: inline;
	float: left;
	padding: 0 0.5em;
}

#login {
	text-align: center;
	float: right;
	margin-top: 50px;
	margin-botton: 50px;
	margin-right: 50px;
	width: 350px;
	height: 420px;
	background-color: white;
}

a {
	text-decoration: none;
	display: block;
}

a:link {
	color: white;
}

a:visited {
	color: red;
}

a:hover {
	color: red;
}

#guanggao {
	width: 960px;
	margin: 0px auto;
	height: 150px;
	margin-top: 5px;
}

.container {
	width: 960px;
	margin: 0px auto;
}

h2 {
	text-align: center;
}

#user {
	height: 6px;
	float: right;
	margin-right: 80px;
}

#footer {
	width: 960px;
	margin: 0px auto;
}
#nav_menu {
	left: 100px;
}

</style>
</head>
<body>
	<div id="header1">
		<div id="logo">
			<img alt="" src="images/flower_logo.jpg" id="logo">
		</div>
		<div id="user">
   <c:if test="${not empty user }">
    <span class="glyphicon glyphicon-user"></span>${user.username}您好，欢迎登陆香花购物网
    </c:if>
    </div>
		<div id="right">
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${empty user}">
					<li><a href="rigist.jsp"><span
							class="glyphicon glyphicon-user"></span> 注册</a></li>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> 登录</a></li>
				</c:if>
				<c:if test="${not empty user }">
					<li><a href="UserServlet?action=logout"><span
							class="glyphicon glyphicon-log-in"></span> 退出</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<div id="header">
		<nav id="nav_menu">
		<ul>
			<li><a href="FlowerServlet?action=findByPage">首页</a></li>
			<li><a href="UserServlet?action=getMyInfo&username=${user.username }">我的账户</a></li>
			<li><a
				href="${pageContext.request.contextPath }/OrderServlet?action=findAllByPage&currentPage=0">账单查询</a></li>
			<li><a href="cart.jsp">购物车</a></li>
			<li><a href="help.jsp">帮助中心</a></li>
			<li><a href="HistoryServlet?action=browseCollection"">我的收藏</a></li>
		</ul>
		</nav>
	</div>
	<div id="guanggao">
		<img src="img/05442136963364804.gif" width="960px"
			style="margin-top: 5px;" />
	</div>
	<div class="container">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<h2>
					<strong>订单详情</strong>
				</h2>
				<table class="table table-bordered">
					<tbody>
						<tr class="warning">
							<th colspan="5">订单编号:${bean.oid }</th>
						</tr>
						<tr class="warning">
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<c:forEach items="${bean.items }" var="oi">
							<tr class="active">
								<td width="60" width="40%"><input type="hidden" name="id"
									value="22"> <img
									src="${pageContext.request.contextPath}/${oi.flower.flowerImage}"
									width="70" height="60"></td>
								<td width="30%"><a target="_blank">${oi.flower.flowerName}</a>
								</td>
								<td width="20%">￥${oi.flower.shop_price }</td>
								<td width="10%">${oi.count }</td>
								<td width="15%"><span class="subtotal">￥${oi.subtotal }</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="text-align: right; margin-right: 120px;">
				商品金额: <strong style="color: #ff6600;">￥${bean.total }元</strong>
			</div>
		</div>
	</div>

</body>
</html>