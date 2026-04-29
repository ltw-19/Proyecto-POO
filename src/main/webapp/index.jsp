<%@page import="com.shopsmart.model.Producto, com.shopsmart.model.Inventario, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>MacDigital | Tecnología inteligente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@include file="fragmento_chatbot.jsp" %>
    
    <header class="topbar">
        <a href="${pageContext.request.contextPath}/" class="logo-link">MacDigital</a>
        <form action="catalogo" method="get" style="flex: 1; max-width: 480px; margin: 0;">
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

    <section class="banner">
        <h1 class="banner-title">Compra inteligente con IA</h1>
        <p class="banner-desc">Encuentra exactamente lo que necesitas. Nuestro asistente de IA filtrará nuestro catálogo por ti.</p>
        <a href="catalogo" class="btn-main">Explorar productos</a>
    </section>

    <main class="main-content">
        <div class="products-header">
            <h2>Productos Destacados</h2>
            <a href="catalogo" class="see-all">Ver todos →</a>
        </div>
        <div class="products-list">
            <%
                List<Producto> destacados = (List<Producto>) request.getAttribute("destacados");
                if (destacados == null || destacados.isEmpty()) {
                    Inventario inventarioTemp = (Inventario) application.getAttribute("inventario");
                    if (inventarioTemp != null && inventarioTemp.getProductos() != null) {
                        int total = inventarioTemp.getProductos().size();
                        int limit = Math.min(4, total);
                        destacados = inventarioTemp.getProductos().subList(0, limit);
                    }
                }
                if (destacados != null && !destacados.isEmpty()) {
                    for (Producto p : destacados) {
            %>
            <div class="product-card">
                <img src="img/productos/<%= p.getImagen() %>" alt="<%= p.getNombre() %>">
                <a href="detalle?id=<%= p.getId() %>" class="prod-name-link">
                    <h3 class="prod-name"><%= p.getNombre() %></h3>
                </a>
                <div class="prod-price">
                    $<%= p.getPrecio() %>
                    <% if(p.getId() == 2 || p.getId() == 4) { %>
                        <span class="old-price">$<%= (int)(p.getPrecio() * 1.12) %></span>
                    <% } %>
                </div>
                <a href="agregar-carrito?id=<%= p.getId() %>" class="btn-product">Agregar al carrito</a>
            </div>
            <%
                    }
                } else {
            %>
            <p>No hay productos disponibles. <a href="catalogo">Ir al catálogo</a></p>
            <% } %>
        </div>
    </main>

</body>
</html>