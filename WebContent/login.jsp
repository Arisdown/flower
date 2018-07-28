<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
             *{
                   margin:0px auto;
                   padding:0
                
             }
             *{
   transition:all 2s;
}
             
             #header{
                    width:960px;
                    height:100px;
                    background-color:white;
                    text-align:center;
                  
             }
              #logo{
              float:left;
              height:85px;
              }
             #right{
                    float:right;
                    margin-top:30px;
                    color:block;
                    text-align: center;
             }
             #main{
                  width:960px;
                  margin:0px auto;
           
                  height:500px;
                  background-image:url('img/main1.png');
              }
              #left{
                  text-align:center;
                  float:left;
                  margin:50px 100px auto 50px;
                  width:350px;
                  height:420px;
                  opacity:100%;
              
              }
              ul{
                 list-style-type:none;
              }
              li{
                 display:inline;
                 float:left;
                 padding:0 0.5em;
              }
              #login{
                  text-align:center;
                  float:right;
                  margin-top:50px;
                  margin-botton:50px;
                  margin-right:50px;
                  width:350px;
                  height:420px;
                  background-color:white;
              }
              a{
                  text-decoration:none;
                  display:block;
              }
              a:visited{
                  color:red;
              }
              a:hover{
                 color:red;
                 font-size:125%;
              }
              input{
                  height:35px;
                  width:200px;
                  margin-top:20px;
              }
              #imageCode{
                   width:100px;
                   left:50px;
                 }
              h2{
                  padding-top:20px;
              }
               input[type="submit"]{
                   width:80px;
                   background-color:blue;
              }
              input[type="reset"]{
                   width:80px;
                   background-color:blue;
              }      
                input[type="checkbox"]{
                   width:20px
                }
              #updatePassword{
                  right:100px;'
              }
              #check{
                  right:100px;
              }
              
</style>
<script type="text/javascript">
	function loadimage(){
		document.getElementById("randImage").src="images/image.jsp?"+Math.random();
	}
</script>
</head>
<body>
        <div id="header">
              <div id="logo"><img alt="" src="images/flower_logo.jpg" id="logo"></div>
              <div id="right">
                       <ul>
                       <li> <a href="">登录</a></li><li><a href="${pageContext.request.contextPath}/rigist.jsp">注册</a></li>
                        </ul>
               </div>
         </div>
        <div id="main">
             <div id="left">
                               <img src="" alt=""/>
             </div>
            <div id="login">
                               <h2 align="center">用户登录</h2>
                              <form action="UserServlet?action=login" method="post" name="form1" id="form1">
                                   <label for="name">用户名:</label>
                                   <input type="text" name="username"/><br>
                                   <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
                                     <input type="password" name="password"/><br>
                                   <label for="check" id="check">验证码:</label>
                                   <input type="text" value="${imageCode}" name="imagecode"  class="txtCode" id="imageCode"  onkeydown= "if(event.keyCode==13)form1.submit()"/>&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="images/image.jsp" width="95" height="35" border="1" align="absmiddle"/> 
                                   <br> 
                                   <p>${msg}</p>
                                   <input type="submit" value="登录"> <input type="reset" value="重置">
                              </form>
 
</div>
        
        </div>
        <div style="text-align: center;margin-top: 5px;margin-bottom:20px;background-color: gray;height:80px;line-height: 100px;width:960px">
					Copyright &copy; 2017-2018 JAVA1704--邸斌斌
		</div>
</body>
</html>