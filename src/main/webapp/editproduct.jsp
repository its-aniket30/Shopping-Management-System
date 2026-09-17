<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.shopping.dal.*,com.shopping.model.*" %>

<%
String idStr = request.getParameter("id");

Product p = null;

if(idStr != null){
    int id = Integer.parseInt(idStr);

    ProductDAO dao = new ProductDAO();
    p = dao.searchById(id);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
</head>
<body>

<h2>Edit Product</h2>

<% if(p != null){ %>

<form action="updateproduct.jsp" method="post">

<input type="hidden" name="id" value="<%= p.getId() %>">

Name: <input type="text" name="name" value="<%= p.getName() %>"><br><br>

Price: <input type="text" name="price" value="<%= p.getPrice() %>"><br><br>

Qty: <input type="text" name="qty" value="<%= p.getQty() %>"><br><br>

<input type="submit" value="Update">

</form>

<% } else { %>

<h3 style="color:red;">Invalid Product ID</h3>

<% } %>

</body>
</html>