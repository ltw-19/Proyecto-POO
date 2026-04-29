<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopsmart.model.Producto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
</head>
<body>
    <h2>Buscar productos</h2>
    <form action="buscarProducto" method="get">
      <input type="text" name="q" value="<%= request.getAttribute("busqueda") != null ? request.getAttribute("busqueda") : "" %>" placeholder="Buscar productos...">
      <button type="submit">Buscar</button>
    </form>

    <h2>Resultados</h2>
    <ul>
    <%
      List<Producto> productos = (List<Producto>) request.getAttribute("productos");
      if (productos != null && !productos.isEmpty()) {
        for (Producto producto : productos) {
    %>
      <li>
        <b><%= producto.getNombre() %></b><br>
        <span><%= producto.getDescripcion() %></span><br>
        <span>Precio: $<%= producto.getPrecio() %></span>
      </li>
    <%
        }
      } else {
    %>
      <li>No se encontraron productos.</li>
    <% } %>
    </ul>
</body>
</html>