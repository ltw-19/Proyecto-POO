<%@page import="com.shopsmart.model.Cart, com.shopsmart.model.CartItem, com.shopsmart.model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrito | MacDigital</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@include file="fragmento_chatbot.jsp" %>
    <header class="topbar">
        <a href="${pageContext.request.contextPath}/" class="logo-link">MacDigital</a>
        <form action="catalogo" method="get" style="flex:1; max-width:480px; margin:0;">
            <input type="text" name="buscar" class="searchbar" placeholder="Buscar productos..." value="${param.buscar}">
        </form>
        <div class="icon-group">
            <span class="login-link">Iniciar sesión / Registro</span>
            <a href="carrito.jsp" style="position:relative; display:inline-block;">
                <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon">
                <span id="cartCount" class="cart-badge">0</span>
            </a>
        </div>
    </header>

    <main class="carrito-main">
        <h2>Carrito de Compras</h2>
        <%
            Cart carrito = (Cart) session.getAttribute("carrito");
            if (carrito == null || carrito.getItems().isEmpty()) {
        %>
            <p>Tu carrito está vacío. <a href="catalogo">Seguir comprando</a></p>
        <%
            } else {
        %>
        <table class="carrito-tabla">
            <thead>
                <tr><th>Producto</th><th>Cantidad</th><th>Precio</th><th>Acción</th></tr>
            </thead>
            <tbody>
            <%
                double subtotal = 0;
                for (CartItem item : carrito.getItems()) {
                    Producto p = item.getProducto();
                    double itemSubtotal = item.getSubtotal();
                    subtotal += itemSubtotal;
            %>
                <tr>
                    <td><%= p.getNombre() %></td>
                    <td>
                        <form action="actualizar-carrito" method="post" style="display:flex; gap:5px;">
                            <input type="hidden" name="id" value="<%= p.getId() %>">
                            <input type="number" name="cantidad" value="<%= item.getCantidad() %>" min="1" max="<%= p.getStock() %>" style="width:70px;">
                            <button type="submit" class="btn-small">Actualizar</button>
                        </form>
                    </td>
                    <td>$<%= String.format("%.2f", itemSubtotal) %></td>
                    <td><a href="eliminar-carrito?id=<%= p.getId() %>" class="btn-eliminar">Eliminar</a></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <div class="carrito-resumen">
            <div>Subtotal: $<%= String.format("%.2f", subtotal) %></div>
            <div>Envío: Calculado en pago</div>
            <div class="total">Total: $<%= String.format("%.2f", subtotal) %></div>
            <a href="checkout" class="btn-product big">Proceder al pago</a>
        </div>
        <%
            }
        %>
    </main>

    <script>
        function updateCartBadge() {
            fetch('cart-count')
                .then(response => response.json())
                .then(data => {
                    const badge = document.getElementById('cartCount');
                    if (badge) badge.innerText = data.count;
                });
        }
        document.addEventListener('DOMContentLoaded', updateCartBadge);
    </script>
</body>
</html>