<%@page import="com.shopsmart.model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle | MacDigital</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
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
            <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon">
        </div>
    </header>

    <main class="detalle-moderno">
        <a href="catalogo" class="back-link">&lt; Volver al catálogo</a>
        <%
            Producto p = (Producto) request.getAttribute("producto");
            if (p != null) {
        %>
        <div class="detalle-grid">
            <div class="detalle-imagen">
                <img src="img/productos/<%= p.getImagen() %>" alt="<%= p.getNombre() %>">
            </div>
            <div class="detalle-info">
                <h1><%= p.getNombre() %></h1>
                <div class="detalle-precio">$<%= String.format("%.2f", p.getPrecio()) %></div>
                <div class="detalle-rating">
                    ★★★★☆ <span>(128 reseñas)</span>
                </div>
                <div class="detalle-descripcion">
                    Auriculares inalámbricos con cancelación de ruido activa, batería de 30 horas de duración y sonido de alta fidelidad. Perfectos para el trabajo, viajes o el gimnasio. Diseño ergonómico y ligero.
                </div>
                <div class="detalle-disponibilidad">
                    ✅ Disponible en inventario
                </div>
                <button class="btn-comprar-ahora" onclick="mostrarMensaje()">Agregar al carrito</button>
            </div>
        </div>

        <div class="detalle-resenas">
            <h3>Opiniones de clientes</h3>
            <div class="resena">
                <div class="resena-usuario">Juan P. <span class="resena-fecha">Hace 2 días</span></div>
                <div class="resena-estrellas">★★★★★</div>
                <div class="resena-texto">Excelente calidad de sonido. El sonido es increíble y la batería me dura toda la semana en la oficina. Muy recomendados.</div>
            </div>
            <div class="resena">
                <div class="resena-usuario">María G. <span class="resena-fecha">Hace 1 semana</span></div>
                <div class="resena-estrellas">★★★★☆</div>
                <div class="resena-texto">Muy buenos, pero ajustados. Cancelan el ruido perfectamente, aunque al principio aprietan un poco. En general una gran compra.</div>
            </div>
        </div>
        <% } else { %>
            <p>Producto no encontrado.</p>
        <% } %>
    </main>

    <script>
        function mostrarMensaje() {
            alert("Funcionalidad en desarrollo. Pronto podrás comprar.");
        }
    </script>
</body>
</html>