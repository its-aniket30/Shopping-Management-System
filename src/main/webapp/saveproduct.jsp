<%@ page import="com.shopping.dal.*,com.shopping.model.*" %>

<%
String name = request.getParameter("name");
double price = Double.parseDouble(request.getParameter("price"));
int qty = Integer.parseInt(request.getParameter("qty"));

Product p = new Product();
p.setName(name);
p.setPrice(price);
p.setQty(qty);

ProductDAO dao = new ProductDAO();
dao.addNewPrd(p);

// redirect to show page
response.sendRedirect("showall.jsp");
%>