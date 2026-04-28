<%@page import="com.shopsmart.model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle | MacDigital</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <%@include file="fragmento_chatbot.jsp" %>
    <header class="topbar">...</header>
    <main class="detalle-producto">
        <a href="catalogo" class="back-link">&lt; Volver al catálogo</a>
        <%
            Producto p = (Producto) request.getAttribute("producto");
            if (p != null) {
        %>
        <div class="detalle-flex">
            <img src="img/productos/<%= p.getImagen() %>" alt="<%= p.getNombre() %>" class="detalle-img">
            <section class="detalle-info">
                <h1><%= p.getNombre() %></h1>
                <div class="prod-price-detalle">$<%= p.getPrecio() %></div>
                <div class="detalle-descrip">
                    Producto de alta calidad, ideal para tu día a día. Consulta disponibilidad.
                </div>
                <button class="btn-product big" onclick="alert('Funcionalidad en desarrollo. Pronto podrás comprar.')">Comprar ahora</button>
            </section>
        </div>
        <div class="detalle-resenas">
            <h3>Opiniones y Reseñas</h3>
            <div class="resena"><b>Alejandro M.</b> ⭐⭐⭐⭐⭐<br/>"Excelente producto, muy recomendado."</div>
            <div class="resena"><b>Sofía R.</b> ⭐⭐⭐⭐⭐<br/>"La calidad es increíble."</div>
        </div>
        <% } else { %>
            <p>Producto no encontrado.</p>
        <% } %>
    </main>
</body>
</html>