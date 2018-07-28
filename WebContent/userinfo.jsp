<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<style>
#main {

	height: 500px;
}

#msg {
	width: 300px;
}
*{
   transition:all 2s;
}
#userinfo {
		width: 960px;
	margin: 0px auto;
}

#userinfo ul {
	list-style-type: none;
	text-align: center;
}

#userinfo ul li {
	padding-top: 20px;
}

#left2{
	margin-left:50px;
	float: left;
	width: 300px;
	border-right-color: blue;
	border-right-style: solid;
	height:500px;
	background-color: silver;
	color:white;
}
#right2{
    float: right;
    width: 500px;
    overflow: hidden;
    height:500px;
    
    }
  #editUser{
     float: left;
  }
    #editUser input{
     width:200px;
     height:35px;
     margin-top: 10px;
     }
#update input{
     width:200px;
     height:35px;
     margin-top: 10px;
     }
     #send input{
     width:200px;
     height:35px;
     margin-top: 10px;
     margin-left: 10px;
     }
     #editUser input{type=submit}{
      text-align:center;
      width:100px;
     }
       #footer{
                  width:960px;
                  margin:0px auto;
                  }
                  #msg{
                   width:960px;
                  margin:0px auto;
                  height:300px;
                  }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<script>
      $(function(){
    	  $("#li1").click(function(){
    		  //alert("1111");
    	        $("#send")[0].style.display="none";
     		 $("#update")[0].style.display="none";
     		 $("#editUser")[0].style.display="block";
    		   window.location.href="UserServlet?action=getMyInfo&username=${user.username}";
    	  });
    	  $("#li2").click(function(){
    		//alert("2222");
    		// $("#editUser").css("display","none");
    	// $("#update").css("diaplay","block");
               $("#send")[0].style.display="none"
    		 $("#update")[0].style.display="block";
    		 $("#editUser")[0].style.display="none";
    	  });
    	  $("#li3").click(function(){
    		  $("#editUser")[0].style.display="none"
     		 $("#update")[0].style.display="none";
     		 $("#send")[0].style.display="block";
    	  });
    	  
    	  
    	  
      });


</script>
<body>
	<%@ include file="header.jsp"%>
	<c:if test="${not empty user }">
		<div id="userinfo">
			<div id="left2">
				<ul>
				    <li><a href="javascript:void(0)>"></a></li>
					<li><a href="javascript:void(0)>" id="li1">个人信息</a></li>
					<li><a href="javascript:void(0)>" id="li2">修改密码</a></li>
					<li><a href="javascript:void(0)>" id="li3">发货信息</a></li>
				</ul>
			</div>
			<div id="right2">
					<div id="editUser">
					    <h2>个人信息</h2>
						<form action="UserServlet">
						   <input type="hidden" value="editUser" name="action"/>
						     <input type="hidden" value="${userinfo.userId }" name="userid"/>
							<label> 姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 名:</label> <input type="text" value="${userinfo.realname}"  name="realname" ><span></span><br>							
							<label> 昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 称:</label> <input type="text" value="${userinfo.username}"  name="username" /><span></span><br>
							<label> 注册时间:</label> <input type="text" name="regtime" value="${userinfo.regtime}"><span></span><br>
							<label> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>  <input type="text" name="email"  value="${userinfo.email }"/><span></span> <br>
							<p>${error1}</p>
							<input type="submit" value="保存">
						</form>
					</div>

					<div id="update" style="display: none">
					<h2>修改密码</h2>
						<form action="UserServlet" method="post">
						<input type="hidden" value="updatePwdByUserId" name="action"/>
							<label>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 号:</label>  <input type="text" value="${user.username }" name="username"><br>
						   <label>新&nbsp;密&nbsp;码:</label>  <input type="password" name="password" /><span></span><br>
						     <label>确认密码: </label>  <input type="password" name="confirm"><span></span><br>
						     <p>${error2}</p>
							  <input type="submit" value="保存">
						</form>
					</div>
					<div id="send" style="display: none">
					        <h2>发货详情</h2>
							<form action="AddressServlet">
								<label>国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 家: </label><input
									type="text" value="${address.country }" name="country"><br>
								<label>省&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 份: </label><input
									type="text" value="${address.province }" name="province"><br>
								<label>城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 市:</label><input
									type="text" value="${address.city }" name="city"><br>
								<label>详细地址:</label><input type="text" value="${address.address}" name="address"><br>
								<label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 话:</label><input type="text" value="${address.telephone}" name="telephone"><br>
								<label>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 机:</label><input type="text" value="${address.phone}" name="phone"><br>
								<p><label>请正确填写,否则货物送不到哦</label></p>
								<input type="submit" value="保存">
							</form>
						</div>
		</div>
	</div>
	</c:if>
	
	<c:if test="${empty user }">
	<div id="msg">
	    <h1>这属于个人影视，为了您的信息安全，请登录以后流浪，如果给凝带来不便，请谅解...</h1>
	    </div>
	</c:if>
		<div id="footer">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>