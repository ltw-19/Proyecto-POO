<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8"/>
   <title>Catálogo de Productos | MacDigital</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   <link rel="stylesheet" href="css/styles.css">
</head>
<%@include file="fragmento_chatbot.jsp" %>
<body>
    <header class="topbar">
        <span class="logo">MacDigital</span>
        <input type="text" class="searchbar" placeholder="Buscar productos..."/>
        <div class="icon-group">
            <img src="img/icon_user.png" alt="Perfil" class="icon"/>
            <img src="img/icon_cart.png" alt="Carrito" class="icon"/>
        </div>
    </header>
    <main class="catalogo-main">
        <aside class="filtros">
            <h3>Filtros</h3>
            <label><input type="checkbox"> Laptops</label>
            <label><input type="checkbox"> Smartphones</label>
            <label><input type="checkbox"> Accesorios</label>
            <label><input type="checkbox"> Audio</label>
            <label><input type="checkbox"> Wearables</label>
            <div>Precio</div>
            <input type="range" min="50" max="2000" value="1000" />
        </aside>
        <section class="main-content">
            <h2>Catálogo de Productos</h2>
            <div class="products-list">
                <!-- Repite para tus productos -->
                <div class="product-card">
                    <img src="img/productos/prod_laptop_predator300.png" alt="Laptop Pro 15''">
                    <h3 class="prod-name">Laptop Pro 15"</h3>
                    <div class="prod-price">$1299</div>
                    <a href="detalle.jsp" class="btn-product">Agregar al carrito</a>
                </div>
                <!-- Añade más productos aquí -->
                <div class="product-card">
                    <img src="img/productos/prod_galaxy_s24.png" alt="Smartphone X">
                    <h3 class="prod-name">Smartphone X</h3>
                    <div class="prod-price">$899 <span class="old-price">$999</span></div>
                    <a href="detalle.jsp" class="btn-product">Agregar al carrito</a>
                </div>
                <div class="product-card">
                    <img src="img/productos/prod_smart_speaker.png" alt="Auriculares Wireless">
                    <h3 class="prod-name">Auriculares Wireless</h3>
                    <div class="prod-price">$249</div>
                    <a href="detalle.jsp" class="btn-product">Agregar al carrito</a>
                </div>
                <div class="product-card">
                    <img src="img/productos/prod_connect_watch_series7.png" alt="Smartwatch Series 5">
                    <h3 class="prod-name">Smartwatch Series 5</h3>
                    <div class="prod-price">$399 <span class="old-price">$450</span></div>
                    <a href="detalle.jsp" class="btn-product">Agregar al carrito</a>
                </div>
                <div class="product-card">
                    <img src="img/productos/prod_noise_cancel_max.png" alt="Auriculares Deportivos">
                    <h3 class="prod-name">Auriculares Deportivos</h3>
                    <div class="prod-price">$149</div>
                    <a href="detalle.jsp" class="btn-product">Agregar al carrito</a>
                </div>
                <div class="product-card">
                    <img src="img/productos/prod_sportk_earbuds.png" alt="Earbuds Mini">
                    <h3 class="prod-name">Earbuds Mini</h3>
                    <div class="prod-price">$89</div>
                    <a href="detalle.jsp" class="btn-product">Agregar al carrito</a>
                </div>
            </div>
        </section>
    </main>
    <%@include file="fragmento_chatbot.jsp" %>
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