<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>

<h2>Add New Product</h2>

<form action="saveproduct.jsp" method="post">

<table>
<tr>
<td>Product Name:</td>
<td><input type="text" name="name" required></td>
</tr>

<tr>
<td>Price:</td>
<td><input type="text" name="price" required></td>
</tr>

<tr>
<td>Quantity:</td>
<td><input type="text" name="qty" required></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="Add Product"></td>
</tr>

</table>

</form>

</body>
</html>