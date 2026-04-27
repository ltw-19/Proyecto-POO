<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>ShopSmart AI</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Barra superior -->
    <header class="topbar">
        <span class="logo">ShopSmart AI</span>
        <input type="text" class="searchbar" placeholder="Buscar productos..." />
        <div class="icon-group">
            <img src="img/icon_user.png" alt="Perfil" class="icon"/>
            <img src="img/icon_cart.png" alt="Carrito" class="icon"/>
        </div>
    </header>

    <!-- Banner principal -->
    <section class="banner">
        <h1 class="banner-title">Compra inteligente con IA</h1>
        <a href="catalogo.jsp" class="btn-main">Explorar productos</a>
    </section>

    <!-- Productos Destacados -->
    <main class="main-content">
        <div class="products-header">
            <h2>Productos Destacados</h2>
            <a href="catalogo.jsp" class="see-all">Ver todos →</a>
        </div>
        <div class="products-list">
            <div class="product-card">
                <img src="img/productos/prod_laptop_predator300.png" alt="Laptop Pro 15''">
                <h3 class="prod-name">Laptop Pro 15''</h3>
                <div class="prod-price">$1299</div>
                <a href="catalogo.jsp" class="btn-product">Ver producto</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_galaxy_s24.png" alt="Smartphone Galaxy S24">
                <h3 class="prod-name">Smartphone Galaxy S24</h3>
                <div class="prod-price">$899</div>
                <a href="catalogo.jsp" class="btn-product">Ver producto</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_noise_cancel_max.png" alt="Audífonos Noise Cancel Max">
                <h3 class="prod-name">Audífonos Noise Cancel Max</h3>
                <div class="prod-price">$249</div>
                <a href="catalogo.jsp" class="btn-product">Ver producto</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_connect_watch_series7.png" alt="Smartwatch Series 5">
                <h3 class="prod-name">Smartwatch Series 5</h3>
                <div class="prod-price">$399</div>
                <a href="catalogo.jsp" class="btn-product">Ver producto</a>
            </div>
        </div>
    </main>

    <!-- (Si tienes un botón flotante de ayuda/chat, lo puedes dejar al final) -->
</body>
</html>