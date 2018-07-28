<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>flower</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<style>
* {
	margin: 0px;
	pidding: 0px;
}
*{
   transition:all 2s;
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
}

#nav_menu {
	left: 100px;
}

#nav_menu ul {
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

#main_course {
	margin: 0px auto;
	margin-top: 80px;
	width: 960px;
	height: 320px;
}

#myCarousel {
	margin-top: 80px;
	width: 762px;
	height: 250px;
	left: 100px;
}

#product_list {
	top: -2px;
	margin: 0px auto;
	width: 900px;
	text-align: center;
	margin-top: -60px;
}

#product {
	margin-top:15px;
	float: left;
	width: 220px;
	height: 300px;
	border: solid 1px white;
	margin-left:3px;
	 overflow: hidden;
	 transition:all 2s;
	
}
#product:hover{
   border: solid 1px red;
   height:300px;
   background-color:silver;
   overflow: hidden;
   transition:all 2s;
   }

#guanggao {
	width: 900px;
	margin: 0px auto;
	height: 150px;
	margin-top:-30px;
}

#footer {
	margin: 0px auto;
}

#page {
	margin-top: 10px;
	padding-top: 10px;
}

#user {
	height: 6px;
	float: right;
	margin-right: 80px;
}
#title{
    line-height:35px;
    height:35px;
    background-color: gray;
    width: 900px;
}
#title span{
    margin-left:20px;
    color: white;
    }
</style>
<script type="text/javascript">
$(document).ready(function(){ 
	 $('#myCarousel').carousel({interval:1000});//每隔5秒自动轮播 
 }); 
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
	<div id="main_course">
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
				<li data-target="#myCarousel" data-slide-to="6"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="img/chocolate01_20170825.jpg" alt="First slide"
						height="350px" />
				</div>
				<div class="item">
					<img src="img/xianhua01_20170825.jpg" alt="Second slide"
						height="350px" />
				</div>
				<div class="item">
					<img src="img/banner-main.png" alt="Third slide" height="350px" />
				</div>
				<div class="item">
					<img src="img/xianhua01_20170731.jpg" alt="four slide"
						height="350px" />
				</div>
				<div class="item">
					<img src="img/xianhua01_20170825.jpg" alt="five slide"
						height="350px" />
				</div>
				<div class="item">
					<img src="img/xianhua02_20170825.jpg" alt="seven slide"
						height="350px" />
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left center" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right center" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div id="guanggao">
		<img src="img/05442136963364804.gif" width="900px"/>
	</div>
	<div id="product_list">
	   <div id="title"><span>热卖商品</span></div>
		<c:forEach items="${pb.datas}" var="flower">
			<div id="product">
				<a
					href="${pageContext.request.contextPath}/FlowerServlet?action=getFlowerById&flowerid=${flower.flowerId}">
					<img src="${pageContext.request.contextPath}/${flower.flowerImage}"
					style="display: inline-block;">
				</a>
				<p>
					<font color="#FF0000">商城价：&yen;${flower.shop_price }</font>
				</p>
				<p>
					<a
						href="${pageContext.request.contextPath}/FlowerServlet?action=getFlowerById&flowerid=${flower.flowerId}"
						style='color: green'>${fn:substring(flower.sellPoint,0,15) }...</a>
				</p>
			</div>
		</c:forEach>
	</div>
	<br />
	<div id="page">
		<table align="center">
			<tr>
				<td><%@include file="page.jsp"%></td>
			</tr>
		</table>
	</div>

	<div id="footer">



		<%@include file="footer.jsp"%>
	</div>
</body>
</html>