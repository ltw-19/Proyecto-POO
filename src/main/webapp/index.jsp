<%@page import="com.shopsmart.model.Producto, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MacDigital | Tecnología inteligente</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@include file="fragmento_chatbot.jsp" %>
    <header class="topbar">
        <span class="logo">MacDigital</span>
        <input type="text" class="searchbar" placeholder="Buscar productos...">
        <div class="icon-group">
            <img src="img/iconos/perfil_usuario.png" alt="Perfil" class="icon">
            <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon">
        </div>
    </header>

    <section class="banner">
        <h1 class="banner-title">Compra inteligente con IA</h1>
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
                if (destacados != null) {
                    for (Producto p : destacados) {
            %>
            <div class="product-card">
                <img src="img/productos/<%= p.getImagen() %>" alt="<%= p.getNombre() %>">
                <h3 class="prod-name"><%= p.getNombre() %></h3>
                <div class="prod-price">$<%= p.getPrecio() %></div>
                <a href="detalle?id=<%= p.getId() %>" class="btn-product">Ver detalle</a>
            </div>
            <%
                    }
                }
            %>
        </div>
    </main>
</body>
</html>