<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'product_details.jsp' starting page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <style>
    
        *{
             margin:0px;
             pidding:0px;
          }
          body{
             
          }
        
        #logo{
               width:960px;
              margin:0px  auto;
              text-align: center;
              line-height: 80px;
           }
           #right{
                text-align: center;
                margin:10px;
                
             }
             #header{
                    width:960px;
                     margin:0px  auto;
                     top:-80px;
                    background-color:red;
              }
               #nav_menu{
                   background-color:red;
                     text-align: center;
               }
                 #nav_menu ul{
                 text-align:center;
                 background-color:red;
                 width:960px;
                 list-style-type: none;
                 list-style: none}
                 #nav_menu ul li{ float: left;}
                 #nav_menu ul li a{
                     
                    text-align: center;
                    display: block;
                    width:150px;
                    padding:1em 0;
                    text-decoration: none;
                    font-weight: bold;
                    background-color:red;
                    color:white;
                    border-right:2px solid white;
                 }
                 #nav_menu ul li a.lastitem{border-right: none;}
                 #nav_menu ul li a.current{color:yellow;}
                 #details{
                       width:960px;
                       margin:0px  auto;
                       text-align: center;
                 }
                 .box,#flower{
                    margin-top:20px;
                    float:left;
                    left:50px;
                    margin-left: 80px;
                  }
                  
                     #guanggao{
                         width:960px;
                         margin:0px auto;
                          height:150px;  
                          margin-top:5px; 
                        }
                  table {
	                      width:500px;
	                      height:300px;    
	                     
	              }
	              tr{border-bottom: 1px solid green;}
	              tr:nth-childs(1){
	                  width:40px;
	                
	                  }
	              .split2 {
	                width:900px;
	                margin:0px auto;
	                margin-top:10px;
                    border-bottom: 2px solid #bfbfbf;
                    border-bottom-width: 2px;
                    border-bottom-style: solid;
                    border-bottom-color: rgb(191, 191, 191);
                  }
                  #footer{
                  width:960px;
                  margin:0px auto;
                  }
                  .box {
            width: 350px;
            height: 350px;
            margin-left:20px;
            border: 1px solid #ccc;
            position: relative;
        }
        .big {
            width: 400px;
            height: 400px;
              position: absolute;
            top: 0;
            left: 360px;
            border: 1px solid #ccc;
            overflow: hidden;
            display: none;
        }
        .mask {
            width: 175px;
            height: 175px;
            background: rgba(255, 255, 0, 0.4);
            position: absolute;
            top: 0;
            left: 0;
            cursor: move;
            display: none;
        }
        .small {
            position: relative;
        }
       .big img, .small img {
            vertical-align: top;
        }
        #caption{
            font-size: 80%;
            }
              #user{
                        height:6px;
                        float: right;
                      margin-right: 80px;
                    }
    </style>
<script src="img/animate.js"></script>
    <script>
        window.onload = function () {
            //需求：鼠标放到小盒子上，让大盒子里面的图片和我们同步等比例移动。
            //技术点：onmouseenter==onmouseover 第一个不冒泡
            //技术点：onmouseleave==onmouseout  第一个不冒泡
            //步骤：
            //1.鼠标放上去显示盒子，移开隐藏盒子。
            //2.老三步和新五步（黄盒子跟随移动）
            //3.右侧的大图片，等比例移动。

            //0.获取相关元素
            var box = document.getElementsByClassName("box")[0];
            var small = box.firstElementChild || box.firstChild;
            var big = box.children[1];
            var mask = small.children[1];
            var bigImg = big.children[0];

            //1.鼠标放上去显示盒子，移开隐藏盒子。(为小盒子绑定事件)
            small.onmouseenter = function () {
                //封装好方法调用：显示元素
                show(mask);
                show(big);
            }
            small.onmouseleave = function () {
                //封装好方法调用：隐藏元素
                hide(mask);
                hide(big);
            }

            //2.老三步和新五步（黄盒子跟随移动）
            //绑定的事件是onmousemove，而事件源是small(只要在小盒子上移动1像素，黄盒子也要跟随)
            small.onmousemove = function (event) {
                //想移动黄盒子，必须知道鼠标在small中的位置。x作为mask的left值，y作mask的top值。
                //新五步
                event = event || window.event;
                var pagex = event.pageX || scroll().left + event.clientX;
                var pagey = event.pageY || scroll().top + event.clientY;
                //让鼠标在黄盒子最中间，减去黄盒子宽高的一半
                var x = pagex - box.offsetLeft - mask.offsetWidth/2;
                var y = pagey - box.offsetTop - mask.offsetHeight/2;
                //限制换盒子的范围
                //left取值为大于0，小盒子的宽-mask的宽。
                if(x<0){
                    x = 0;
                }
                if(x>small.offsetWidth-mask.offsetWidth){
                    x = small.offsetWidth-mask.offsetWidth;
                }
                //top同理。
                if(y<0){
                    y = 0;
                }
                if(y>small.offsetHeight-mask.offsetHeight){
                    y = small.offsetHeight-mask.offsetHeight;
                }
                //移动黄盒子
                console.log(small.offsetHeight);
                mask.style.left = x + "px";
                mask.style.top = y + "px";

                //3.右侧的大图片，等比例移动。
                //如何移动大图片？等比例移动。
                //    大图片/大盒子 = 小图片/mask盒子
                //    大图片走的距离/mask走的距离 = （大图片-大盒子）/（小图片-黄盒子）
//                var bili = (bigImg.offsetWidth-big.offsetWidth)/(small.offsetWidth-mask.offsetWidth);

                //大图片走的距离/mask盒子都的距离 = 大图片/小图片
                var bili = bigImg.offsetWidth/small.offsetWidth;

                var xx = bili*x;
                var yy = bili*y;


                bigImg.style.marginTop = -yy+"px";
                bigImg.style.marginLeft = -xx+"px";
            }
            
          
        }
		
    </script>

  </head>
  
  <body>
  <div id="logo">
<nav  role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
         <img src="<c:url value='images/flower_logo.jpg'/>" title="my logo">
    </div>
   <div id="user">
   <c:if test="${not empty user }">
    <span class="glyphicon glyphicon-user"></span>${user.username}您好，欢迎登陆香花购物网
    </c:if>
    </div>
    
    
    <div  id="right">
      <ul class="nav navbar-nav navbar-right" > 
             <c:if test="${empty user}">
            <li><a href="rigist.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
            </c:if>
            <c:if test="${not empty user }">
                      <li><a href="UserServlet?action=logout"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li> 
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
<div id="guanggao"><img src="img/05442136963364804.gif" width="900px" style="margin-left:40px;margin-top: 5px;"/></div>
<div id="details">
     <div class="split2"></div>
     
      <div class="box">
        <div class="small">
             <img src="${flower.flowerImage}"    width="350px" height="350px">   
            <div class="mask"></div>
        </div>
        <div class="big">
             <img src="${flower.flowerImage}" alt="" width="800px;" height="800px"/>
        </div>
          <div style="margin-top:20px;"><p> <a href=""><img src="images/zoom.gif"></a> <a href=""><img src="images/tuijian.gif"></a></p></div>
          <a href="HistoryServlet?action=addcollection&flowerid=${flower.flowerId}"><img src="img/col.png" height="40"></a>
    </div>
  
</div>
       
       
      
     
       
       <div id="flower">
       <form id="formId" name="form1" >
         <input type="hidden" name="action" value="add2Cart">
         <input type="hidden" name="flowerid" value="${flower.flowerId}">
       <table width="600px">
       <caption  id="caption"><font size="80%" color="green">商品详情</font></caption>
       <tr><td width="35px">编号:&nbsp;</td><td>&nbsp;${flower.flowerId}</td></tr>
       <tr><td>花名:&nbsp;</td><td>&nbsp;${flower.flowerName }</td></tr>
       <tr><td>类别:&nbsp;</td><td>&nbsp;${flower.flowerType }</td></tr>
       <tr><td>材料:&nbsp;</td><td>&nbsp;${flower.flowerMaterial}</td></tr>
        <tr><td>卖点:&nbsp;</td><td>&nbsp;${flower.sellPoint}</td></tr>
        <tr><td>价格:&nbsp;</td><td><span>&nbsp;市场价：${flower.market_price}</span>&nbsp;&nbsp;&nbsp;<span><font color="red">现价：${flower.shop_price}</font></span></td></tr>
         <tr><td>数量:&nbsp;</td><td><input id="quantity" name="count" value="1" maxlength="4" size="10" type="text"></td></tr>
      </table>
       <div style="margin-top:20px;"><p> <img src="img/cart.JPG" onclick="addCart()">
       <a href="javascript:void(0)" onclick="buy()"><img src="img/cart1.JPG"></a></p></div>
       </form>
       </div>
</div>

<div id="footer">
	<%@include file="footer.jsp" %>
</div>
  </body>
  <script>

function addCart(){
	//将表单提交
	document.form1.action="CartServlet?action=add2Cart";
	document.getElementById("formId").submit();
}
function buy(){
	//将表单提交
	document.form1.action="OrderServlet?action=add";
	document.getElementById("formId").submit();
}

</script>

  
</html>
