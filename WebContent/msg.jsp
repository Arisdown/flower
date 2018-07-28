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
	background-color: white;
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

.message {
	width: 960px;
	margin: 0px auto;
	color: red;
	height: 300px;
}

#footer {
	width: 960px;
	margin: 0px auto;
}
  #user{
                        height:6px;
                        float: right;
                      margin-right: 80px;
                    }
</style>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
			<li><a href="HistoryServlet?action=browseCollection">我的收藏</a></li>
		</ul>
		</nav>
	</div>
	<div id="guanggao">
		<img src="img/05442136963364804.gif" width="960px"
			style="margin-top: 5px;" />
	</div>
	<div class="message">
		<h1 align="center" color="red">${msg }</h1>
	</div>

	<div id="footer">
		<%@include file="footer.jsp"%>
	</div>

</body>

</html>