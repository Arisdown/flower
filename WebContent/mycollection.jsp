<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
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
	height: 85px;
	background-color: white;
	text-align: center;
}

#logo {
	float: left;
	height: 85px;
}

#right {
	float: right;
	margin-top: 20px;
	text-align: center;
}

#header {
	width: 960px;
	margin: 0px auto;
	top: -70px;
	background-color: red;
}

#nav_menu {
	background-color: red;
	text-align: center;
	left:120px;
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
	padding: 0 5em;
}

#login {
	text-align: center;
	float: right;
	margin-top: 50px;
	margin-botton: 50px;
	margin-right: 50px;
	width: 350px;
	height: 420px;
}

a {
	text-decoration: none;
	display: block;
}

a:link {
	color: black;
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
#container{
     width:960px;
     margin:0px auto;
     border: solid 1px gray;
     height:300px;
     margin-top: 55px;
     background-image: url('img/qw.JPG');
     border-radius:20px;
     }
     #container1{
              width:960px;
              margin:0px auto;
              border: solid 1px gray;
              border-radius:20px;
     }
     #title {
        width:960px;
        margin:0px auto;
        height:35px;
        background-color:pink;
        color:black;
        margin-top:10px;
        text-align:center;
        border-radius:10px ;
        line-height:35px;
        }
        .table  {
            margin:0px auto;
        }
        .table td /*设置表格文字左右和上下居中对齐*/ 
      {  
        vertical-align: middle;
        text-align: center;  
        line-height:35px;
    
     }
     #clear{
        width:960px;
        border-radius:10px ;
        text-align: center;
     }
     #clear img{
        border-radius:10px ;
        margin-bottom: 10px;
     }
     #clear table td{
       margin-left: 20px;
       padding-left: 20px;
     }
    
    
     #footer {
	width: 960px;
	margin: 0px auto;
}
   
</style>

</head>
<body>
	<div id="header1">
		<div id="logo">
			<img alt="" src="images/flower_logo.jpg" id="logo">
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
				   	     <li> <span class="glyphicon glyphicon-user"></span>${user.username}您好，欢迎登陆香花购物网</li>
						<li><a href="UserServlet/action=logout"><span
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
			<li><a href="HistoryServlet?action=browseCollection">加入收藏</a></li>
		</ul>
		</nav>
	</div>
	<div id="container">
	
	</div>
	<div id="container1">
	      <div width="960px" id="title"><center>我的收藏</center></div>
	      <div id="collection">
	           <table cellspacing="20%" cellpadding="50"  class="table" >
	                 <tr class="success"><td width="70">图片</<td><td>鲜花类别</td><td>鲜花名称</td><td>鲜花买点</td><td>原价</td><td>现价</td><td>材料</td></tr>
	                 <c:if test="${not empty list }">
	                <c:forEach items="${list}" var="flower">
	                 <tr><td><img
										src="${pageContext.request.contextPath}/${flower.flowerImage}"
										width="70" height="60"></<td><td>${flower.flowerType }</td><td>${flower.flowerName }</td><td>${fn:substring(flower.sellPoint,0,15) }.....</td><td><span color="red">￥${flower.market_price}</span></td><td>${flower.shop_price }</td><td>${fn:substring(flower.flowerMaterial,0,15) }....</td></tr>
	                </c:forEach>
	                </c:if>
	                <c:if test="${empty list}">
	                 <tr colspan="7"><td>您还没有收藏您喜爱的商品信息，请点击下面按钮返回首页添加<td></tr>
	                </c:if>
	           </table>
	      </div>
	      <div   id="clear">
	      <table  cellspacing="50%" cellpadding="50"><tr>
	         <td><a href='FlowerServlet?action=findByPage'><img src="img/hui.png"></a></td><td><a href="HistoryServlet?action=clear"><img src="img/clear.png"></a></td></tr>
	         </table>
	      </div>
	</div>
	<div id="footer">
		<%@include file="footer.jsp"%>
	</div>
	</body>
</html>