<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="header.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="prdDao" class="com.shopping.dal.ProductDAO"></jsp:useBean>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Show All Products</h3>

<table class="table">
<thead></thead><tr><th>PrdId</th> 
<th>Prd Name</th>
<th>Prd Price</th>
<th>Prd </th>
</tr>
</thead>
<tbody>
<c:forEach var="prd" items="${prdDao.getAllPrds() }">
<tr>
<td>${prd.getId() }</td>
<td>${prd.getName() }</td>
<td>${prd.getPrice() }</td>
<td>${prd.getQty() }</td>
</tr>
</c:forEach>
</tbody>


</table>
</body>
</html>