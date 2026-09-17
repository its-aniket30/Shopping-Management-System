<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.shopping.dal.*,com.shopping.model.*" %>

<%
String idStr = request.getParameter("id");

if(idStr != null){

    int id = Integer.parseInt(idStr);
    String name = request.getParameter("name");
    double price = Double.parseDouble(request.getParameter("price"));
    int qty = Integer.parseInt(request.getParameter("qty"));

    Product p = new Product();
    p.setId(id);
    p.setName(name);
    p.setPrice(price);
    p.setQty(qty);

    ProductDAO dao = new ProductDAO();
    dao.updatePrd(p);

    response.sendRedirect("showall.jsp");

} else {
    out.println("ID is missing!");
}
%>