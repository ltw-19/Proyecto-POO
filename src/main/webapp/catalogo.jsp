<%@page import="com.shopsmart.model.Producto, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catálogo | MacDigital</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <%@include file="fragmento_chatbot.jsp" %>
    <header class="topbar">...</header> <!-- mismo que index -->
    <main class="main-content">
        <div class="products-header">
            <h2>Todos los productos</h2>
        </div>
        <div class="products-list">
            <%
                List<Producto> productos = (List<Producto>) request.getAttribute("productos");
                if (productos != null) {
                    for (Producto p : productos) {
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

        <!--<div class="products-list">
            <div class="product-card">
                <img src="img/productos/prod_laptop_predator300.jpg" alt="Laptop Pro 15''">
                <h3 class="prod-name">Laptop Pro 15"</h3>
                <div class="prod-price">$1299</div>
                <a href="detalle.jsp?prod=1" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_galaxy_s24.jpg" alt="Smartphone X">
                <h3 class="prod-name">Smartphone X</h3>
                <div class="prod-price">$899 <span class="old-price">$999</span></div>
                <a href="detalle.jsp?prod=2" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_smart_speaker.jpg" alt="Auriculares Wireless">
                <h3 class="prod-name">Auriculares Wireless</h3>
                <div class="prod-price">$249</div>
                <a href="detalle.jsp?prod=3" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_connect_watch_series7.jpg" alt="Smartwatch Series 5">
                <h3 class="prod-name">Smartwatch Series 5</h3>
                <div class="prod-price">$399 <span class="old-price">$450</span></div>
                <a href="detalle.jsp?prod=4" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_noise_cancel_max.jpg" alt="Auriculares Deportivos">
                <h3 class="prod-name">Auriculares Deportivos</h3>
                <div class="prod-price">$149</div>
                <a href="detalle.jsp?prod=5" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_sportk_earbuds.jpg" alt="Earbuds Mini">
                <h3 class="prod-name">Earbuds Mini</h3>
                <div class="prod-price">$89</div>
                <a href="detalle.jsp?prod=6" class="btn-product">Agregar al carrito</a>
            </div>
        </div>-->