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

</body>
</html>