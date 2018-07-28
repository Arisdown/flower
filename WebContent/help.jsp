<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
*{
   transition:all 2s;
}
  #main{
      width:960px;
      margin:0px auto;
      transition:all 2s;
      }
     #main img{
          border-radius:20px;
           transition:all 2s;
           width:900px;
           margin-left: 40px;
           margin-top: -20px;
      }
      #footer {
	width: 960px;
	margin: 0px auto;
}

</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="main">
 <img src="img/help.png"/>
</div>
<div id="footer">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>