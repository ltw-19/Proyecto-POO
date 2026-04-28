<!-- Archivo no necesario para fase 1-->
<!--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8"/>
   <title>Finalizar Compra | MacDigital</title>
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
    <main class="checkout-main">
        <a href="catalogo.jsp" class="back-link">&lt; Volver al catálogo</a>
        <h2>Finalizar Compra</h2>
        <div class="checkout-flex">
            <section class="checkout-card shipping">
                <h3>Datos de Envío</h3>
                <input type="text" placeholder="Ej. Juan Pérez"/>
                <input type="text" placeholder="Ej. 55 1234 5678"/>
                <input type="text" placeholder="Calle, Número, Colonia" style="width: 100%;"/>
            </section>
            <section class="checkout-card order-summary">
                <h3>Resumen de Compra</h3>
                <div class="order-row">
                    <img src="img/productos/prod_noise_cancel_max.png" width="52" alt="Auriculares Deportivos"/>
                    <div>
                        <div class="prod-name">Auriculares Deportivos</div>
                        <div>$149.00</div>
                    </div>
                </div>
                <div class="os-totals">
                    <div>Subtotal: <span>$149.00</span></div>
                    <div>Envío: <span class="green">Gratis</span></div>
                    <div class="total">Total: <span>$149.00</span></div>
                </div>
                <button class="btn-product big">Pagar y confirmar</button>
                <div class="safe-pay">✔ Pago seguro</div>
            </section>
        </div>
        <section class="checkout-card payment">
            <h3>🪪 Método de Pago</h3>
            <input type="text" placeholder="0000 0000 0000 0000" maxlength="19"/>
            <input type="text" placeholder="MM/AA" maxlength="5"/>
            <input type="text" placeholder="123" maxlength="3"/>
        </section>
    </main>
    <%@include file="fragmento_chatbot.jsp" %>
</body>
</html>