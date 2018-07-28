<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<title>我的购物车</title>
<style>
* {
	margin: 0px;
	pidding: 0px;
}

body {
	
}

#logo {
	width: 960px;
	margin: 0px auto;
	text-align: center;
	line-height: 80px;
}

#right {
	text-align: center;
	margin: 10px;
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
}

#nav_menu ul {
	text-align: center;
	background-color: red;
	width: 960px;
	list-style-type: none;
	list-style: none
}

#nav_menu ul li {
	float: left;
}

#nav_menu ul li a {
	text-align: center;
	display: block;
	width: 150px;
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

#details {
	width: 960px;
	margin: 0px auto;
	text-align: center;
}

.box,#flower {
	margin-top: 20px;
	float: left;
	left: 50px;
	margin-left: 80px;
}

#guanggao {
	width: 960px;
	margin: 0px auto;
	height: 150px;
	margin-top: 5px;
}

table {
	width: 400px;
	height: 280px;
}

tr {
	border-bottom: 1px solid green;
}

tr:nth-childs(1) {
	width: 20px;
}

.split2 {
	width: 900px;
	margin: 0px auto;
	margin-top: 10px;
	border-bottom: 2px solid #bfbfbf;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	border-bottom-color: rgb(191, 191, 191);
}

#footer {
	width: 960px;
	margin: 0px auto;
}

.container {
	width: 960px;
	margin: 0px auto;
	text-align: center;
}

.container h1 {
	text-align: center;
}

table {
	text-align: center;
}

th {
	text-align: center;
}

#footer {
	width: 960px;
	margin: 0px auto;
}

#user {
	height: 6px;
	float: right;
	margin-right: 80px;
}
#msg{
 height:300px;
 }
    
</style>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function removeFromCart(flowerid){
	if(confirm("您确认狠心要丢弃我吗?")){
		location.href="${pageContext.request.contextPath}/CartServlet?action=remove&flowerid="+flowerid;
	}
}
</script>
</head>

<body>
	<div id="logo">
		<nav role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<img src="<c:url value='images/flower_logo.jpg'/>" title="my logo">
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
		</nav>
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
			<li><a href="HistoryServlet?action=browseCollection">我的收藏</a></li>
		</ul>
		</nav>
	</div>
	<div id="guanggao">
		<img src="img/05442136963364804.gif" width="900px"
			style="margin-left: 40px; margin-top: 5px;" />
	</div>
	<div class="container">
		<c:if test="${empty cart.map}">
		    <div id="msg">
			<h1 align="center">购物车空空如也~~赶紧逛逛去!!</h1>
			</div>
		</c:if>
		<c:if test="${not empty cart.map}">
			<div class="row">

				<div style="margin: 0 auto; margin-top: 10px; width: 920px;">
					<strong style="font-size: 16px; margin: 5px 0;">我的购物车</strong>
					<table class="table table-bordered" align="center">
						<tbody>
							<tr class="warning" align="center" height="30px">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${cart.itmes}" var="item">
								<tr class="active" height="50px">
									<td width="60" width="40%"><input type="hidden" name="id"
										value="22"> <img
										src="${pageContext.request.contextPath}/${item.flower.flowerImage}"
										width="70" height="60"></td>
									<td width="30%"><a target="_blank">${item.flower.flowerMaterial}</a>
									</td>
									<td width="20%">￥${item.flower.shop_price }</td>
									<td width="10%"><input type="text" name="quantity"
										value="${item.count}" maxlength="4" size="10"
										readonly="readonly"></td>
									<td width="15%"><span class="subtotal">￥${item.subtotal }</span>
									</td>
									<td><a href="javascript:void(0);" class="delete"
										onclick="removeFromCart('${item.flower.flowerId}')">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>

			<div style="margin-right: 130px;">
				<div style="text-align: right;">
					<em style="color: #ff6600;"> 登录后确认是否享有优惠&nbsp;&nbsp; </em> 赠送积分: <em
						style="color: #ff6600;">596</em>&nbsp; 商品金额: <strong
						style="color: #ff6600;">￥${cart.total }元</strong>
				</div>
				<div
					style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
					<a
						href="${pageContext.request.contextPath }/CartServlet?action=clear"
						id="clear" class="clear">清空购物车</a> <a
						href="${pageContext.request.contextPath }/OrderServlet?action=add">
						<input type="submit" width="100" value="提交订单" name="submit"
						border="0" style="height: 35px; width: 100px; color: white;">
					</a>
				</div>
			</div>
		</c:if>
	</div>

	<div id="footer">
		<%@include file="footer.jsp"%>
	</div>


</body>
</html>