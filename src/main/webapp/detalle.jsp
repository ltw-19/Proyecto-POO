<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <title>Detalle de Producto | MacDigital</title>
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
    <main class="detalle-producto">
        <a href="catalogo.jsp" class="back-link">&lt; Volver al catálogo</a>
        <div class="detalle-flex">
            <img src="img/productos/prod_noise_cancel_max.png" alt="Auriculares Deportivos" class="detalle-img"/>
            <section class="detalle-info">
                <h1>Auriculares Deportivos</h1>
                <div class="prod-price-detalle">$149.00</div>
                <div class="detalle-descrip">
                    Auriculares resistentes al sudor y con gran sujeción. Ideales para rutinas intensas.
                </div>
                <button class="btn-product big" onclick="window.location='checkout.jsp'">Comprar ahora</button>
            </section>
        </div>
        <div class="detalle-resenas">
            <h3>Opiniones y Reseñas</h3>
            <div class="resena">
                <b>Alejandro M.</b> ⭐⭐⭐⭐⭐<br/>
                "Excelente producto, no se cae haciendo ejercicio."
            </div>
            <div class="resena">
                <b>Sofía R.</b> ⭐⭐⭐⭐⭐<br/>
                "La batería dura días y el sonido es increíble."
            </div>
        </div>
    </main>
    <!-- Chatbot flotante -->
    <%@include file="fragmento_chatbot.jsp" %>
</body>
</html>