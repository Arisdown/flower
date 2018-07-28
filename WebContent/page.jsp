<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

    #page{
        width:960px;
        margin-top:5px;
        margin: 0px auto;
    }

</style>
</head>
<body>
<div id="page">
  <center>
第${pb.currentPage }页/共${pb.totalPage}页
<a href="FlowerServlet?action=findByPage&pc=0">首页</a>
<c:if test="${pb.currentPage> 1 }">
<a href="FlowerServlet?action=findByPage&pc=${pb.currentPage-1}">上一页</a>
</c:if>
<%-- 计算begin、end --%>
<c:choose>
	<%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
	<c:when test="${pb.totalPage <= 10 }">
		<c:set var="begin" value="1" />
		<c:set var="end" value="${pb.totalPage }" />
	</c:when>
	<c:otherwise>
		<%-- 当总页数>10时，通过公式计算出begin和end --%>
		<c:set var="begin" value="${pb.currentPage-5 }" />
		<c:set var="end" value="${pb.currentPage+4 }" />	
		<%-- 头溢出 --%>
		<c:if test="${begin < 1 }">
			<c:set var="begin" value="1" />
			<c:set var="end" value="10" />
		</c:if>	
		<%-- 尾溢出 --%>
		<c:if test="${end > pb.totalPage }">
			<c:set var="begin" value="${pb.totalPage - 9 }" />
			<c:set var="end" value="${pb.totalPage }" />
		</c:if>	
	</c:otherwise>
</c:choose>
<%-- 循环遍历页码列表 --%>
<c:forEach var="i" begin="${begin }" end="${end }">
	<c:choose>
		<c:when test="${i eq pb.currentPage }">
			[${i }]
		</c:when>
		<c:otherwise>
			<a href="FlowerServlet?action=findByPage&pc=${i}">[${i }]</a>	
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pb.currentPage < pb.totalPage}">
<a href="FlowerServlet?action=findByPage&pc=${pb.currentPage+1}">下一页</a>
</c:if>
<a href="FlowerServlet?action=findByPage&pc=${pb.totalPage}">尾页</a>
</center>
</div>
</body>
</html>