<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aviso | MacDigital</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <%@include file="fragmento_chatbot.jsp" %>
    <header class="topbar">
        <a href="${pageContext.request.contextPath}/" class="logo-link">MacDigital</a>
        <div class="icon-group">
            <span class="login-link">Iniciar sesión / Registro</span>
            <a href="carrito.jsp" class="cart-link">
                <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon">
            </a>
        </div>
    </header>
    <main style="text-align:center; padding:50px;">
        <h2>${mensaje}</h2>
        <a href="catalogo" class="btn-main">Seguir comprando</a>
    </main>
</body>
</html>