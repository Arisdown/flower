<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px auto;
	padding: 0
}

#header1 {
	width: 960px;
	height: 100px;
	background-color: white;
	text-align: center;
}
*{
   transition:all 2s;
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

input {
	height: 35px;
	width: 200px;
	margin-top: 20px;
}

#imageCode {
	width: 100px;
	left: 50px;
}

h2 {
	padding-top: 20px;
}

input[type=submit] {
	width: 80px;
	background-color: blue;
	color: white;
}

input[type=reset] {
	width: 80px;
	background-color: blue;
	color: white;
}

#updatePassword {
	right: 100px;
	'
}

#check {
	right: 100px;
}

#user {
	height: 6px;
	float: right;
	margin-right: 80px;
}
</style>
<script type="text/javascript">
	function loadimage(){
		document.getElementById("randImage").src="images/image.jsp?"+Math.random();
	}
</script>
</head>
<body>
	<div id="header1">
		<div id="logo">
			<img alt="" src="images/flower_logo.jpg" id="logo">
		</div>
		<div id="right">
			<ul>
				<li><a href="login.jsp">登录</a></li>
				<li><a href="${pageContext.request.contextPath}/rigist.jsp">注册</a></li>
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
	<div id="main">
		<div id="left">
			<img src="" alt="" />
		</div>
		<div id="login">
			<h2 align="center">用户注册</h2>
			<form action="UserServlet?action=addUserInfo" method="post"
				name="form1" id="form1">
				<label for="name">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</label> <input
					type="text" name="realname" /><br> <label for="name">昵&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
				<input type="text" name="username" /><br> <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
				<input type="password" name="password" /><br> <label
					for="check" id="check">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</label> <input
					type="text" name="email" /><br> <br>
				<p>${error}</p>
				<input type="submit" value="注册"> <input type="reset"
					value="重置">
			</form>
		</div>

	</div>
	<div
		style="text-align: center; margin-top: 5px; margin-bottom: 20px; background-color: gray; height: 80px; line-height: 100px; width: 960px">
		Copyright &copy; 2017-2018 JAVA1704--邸斌斌</div>
</body>
</html>