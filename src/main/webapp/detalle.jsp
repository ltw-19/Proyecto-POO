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
        <form action="catalogo.jsp" method="get" style="flex: 1; max-width: 480px; margin: 0;">
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

    <main class="detalle-moderno">
        <a href="catalogo.jsp" class="back-link">&lt; Volver al catálogo</a>
        <%
            Producto p = (Producto) request.getAttribute("producto");
            if (p != null) {
                int id = p.getId();
                String descripcion = "";
                String rating = "★★★★☆";
                int ratingNumber = 4;
                int reseñasCount = 128;
                String reseña1Usuario = "Juan P.";
                String reseña1Estrellas = "★★★★★";
                String reseña1Texto = "Excelente calidad. Producto muy recomendado.";
                String reseña2Usuario = "María G.";
                String reseña2Estrellas = "★★★★☆";
                String reseña2Texto = "Muy bueno, cumple con lo esperado.";
                
                // Personalizar según el producto
                switch(id) {
                    case 1: // Laptop Pro 15"
                        descripcion = "Laptop de alto rendimiento con procesador Intel Core i7, 16GB RAM, 512GB SSD y pantalla 15.6 pulgadas Full HD. Ideal para trabajo y gaming ligero.";
                        rating = "★★★★★";
                        ratingNumber = 5;
                        reseñasCount = 256;
                        reseña1Usuario = "Carlos M.";
                        reseña1Estrellas = "★★★★★";
                        reseña1Texto = "La mejor laptop que he tenido. Rápida, ligera y la batería dura todo el día.";
                        reseña2Usuario = "Ana L.";
                        reseña2Estrellas = "★★★★☆";
                        reseña2Texto = "Muy buena, solo el ventilador se escucha un poco cuando juegas.";
                        break;
                    case 2: // Smartphone X
                        descripcion = "Smartphone con pantalla AMOLED de 6.5 pulgadas, cámara de 108MP, batería de 5000mAh y 5G. El mejor rendimiento del mercado.";
                        rating = "★★★★★";
                        ratingNumber = 5;
                        reseñasCount = 320;
                        reseña1Usuario = "Roberto G.";
                        reseña1Estrellas = "★★★★★";
                        reseña1Texto = "Cámara espectacular y la batería me dura dos días. Muy contento.";
                        reseña2Usuario = "Lucía F.";
                        reseña2Estrellas = "★★★★☆";
                        reseña2Texto = "Excelente teléfono, solo un poco pesado. Por lo demás perfecto.";
                        break;
                    case 3: // Auriculares Wireless
                        descripcion = "Auriculares inalámbricos con cancelación de ruido activa, batería de 30 horas y sonido de alta fidelidad. Perfectos para trabajo o viaje.";
                        rating = "★★★★☆";
                        ratingNumber = 4;
                        reseñasCount = 189;
                        reseña1Usuario = "Sofía R.";
                        reseña1Estrellas = "★★★★★";
                        reseña1Texto = "La cancelación de ruido es increíble. Los uso en la oficina y no escucho nada.";
                        reseña2Usuario = "Diego P.";
                        reseña2Estrellas = "★★★★☆";
                        reseña2Texto = "Muy buenos, pero las almohadillas son un poco pequeñas para orejas grandes.";
                        break;
                    case 4: // Smartwatch Series 5
                        descripcion = "Smartwatch con monitor de ritmo cardíaco, GPS, resistencia al agua y batería de 5 días. Ideal para deportistas.";
                        rating = "★★★★☆";
                        ratingNumber = 4;
                        reseñasCount = 102;
                        reseña1Usuario = "Marta S.";
                        reseña1Estrellas = "★★★★★";
                        reseña1Texto = "Muy preciso el monitoreo de actividad. La batería dura lo prometido.";
                        reseña2Usuario = "Javier L.";
                        reseña2Estrellas = "★★★★☆";
                        reseña2Texto = "Buen reloj, pero la correa se siente un poco rígida al principio.";
                        break;
                    case 5: // Auriculares Deportivos
                        descripcion = "Auriculares resistentes al sudor, con gancho para oreja y sonido potente. Ideales para rutinas intensas de ejercicio.";
                        rating = "★★★★☆";
                        ratingNumber = 4;
                        reseñasCount = 98;
                        reseña1Usuario = "Andrés M.";
                        reseña1Estrellas = "★★★★★";
                        reseña1Texto = "No se caen al correr, el sonido es muy bueno y la batería dura horas.";
                        reseña2Usuario = "Valentina G.";
                        reseña2Estrellas = "★★★★☆";
                        reseña2Texto = "Cómodos, pero el volumen máximo no es tan alto como esperaba.";
                        break;
                    case 6: // Earbuds Mini
                        descripcion = "Earbuds pequeños y ligeros, ideales para uso diario. Sonido equilibrado y estuche de carga compacto.";
                        rating = "★★★☆☆";
                        ratingNumber = 3;
                        reseñasCount = 45;
                        reseña1Usuario = "Camila R.";
                        reseña1Estrellas = "★★★☆☆";
                        reseña1Texto = "Buenos por el precio, pero el bajo es limitado. Sirven para llamadas.";
                        reseña2Usuario = "Tomás B.";
                        reseña2Estrellas = "★★★★☆";
                        reseña2Texto = "Muy prácticos y pequeños. La batería del estuche dura bastante.";
                        break;
                    case 7: // Nintendo Switch 2
                        descripcion = "Nintendo Switch 2 con pantalla mejorada, juegos exclusivos y modo portátil y de sobremesa. Diversión para toda la familia.";
                        rating = "★★★★★";
                        ratingNumber = 5;
                        reseñasCount = 203;
                        reseña1Usuario = "Luis F.";
                        reseña1Estrellas = "★★★★★";
                        reseña1Texto = "La nueva pantalla es impresionante. Los juegos corren muy fluidos. Ideal para viajes.";
                        reseña2Usuario = "Elena C.";
                        reseña2Estrellas = "★★★★☆";
                        reseña2Texto = "Muy divertida, solo la batería podría durar un poco más. Por lo demás excelente.";
                        break;
                    case 8: // PS5
                        descripcion = "PlayStation 5 con gráficos de nueva generación, SSD ultrarrápido y mando DualSense con respuesta háptica. La mejor experiencia de juego.";
                        rating = "★★★★★";
                        ratingNumber = 5;
                        reseñasCount = 450;
                        reseña1Usuario = "David G.";
                        reseña1Estrellas = "★★★★★";
                        reseña1Texto = "El mejor salto generacional. Los tiempos de carga son casi cero y el mando es revolucionario.";
                        reseña2Usuario = "Patricia M.";
                        reseña2Estrellas = "★★★★★";
                        reseña2Texto = "Impresionante. El diseño es grande pero se ve genial. Los exclusivos son increíbles.";
                        break;
                    default:
                        descripcion = "Producto de alta calidad. Consulta disponibilidad.";
                        break;
                }
        %>
        <div class="detalle-grid">
            <div class="detalle-imagen">
                <img src="img/productos/<%= p.getImagen() %>" alt="<%= p.getNombre() %>">
            </div>
            <div class="detalle-info">
                <h1><%= p.getNombre() %></h1>
                <div class="detalle-precio">$<%= String.format("%.2f", p.getPrecio()) %></div>
                <div class="detalle-rating">
                    <%= rating %> <span>(<%= reseñasCount %> reseñas)</span>
                </div>
                <div class="detalle-descripcion">
                    <%= descripcion %>
                </div>
                <div class="detalle-disponibilidad">
                    ✅ Disponible en inventario
                </div>
                <a href="agregar-carrito?id=<%= p.getId() %>" class="btn-comprar-ahora">Agregar al carrito</a>
            </div>
        </div>

        <div class="detalle-resenas">
            <h3>Opiniones de clientes</h3>
            <div class="resena">
                <div class="resena-usuario"><%= reseña1Usuario %> <span class="resena-fecha">Hace 2 días</span></div>
                <div class="resena-estrellas"><%= reseña1Estrellas %></div>
                <div class="resena-texto"><%= reseña1Texto %></div>
            </div>
            <div class="resena">
                <div class="resena-usuario"><%= reseña2Usuario %> <span class="resena-fecha">Hace 1 semana</span></div>
                <div class="resena-estrellas"><%= reseña2Estrellas %></div>
                <div class="resena-texto"><%= reseña2Texto %></div>
            </div>
        </div>
        <% } else { %>
            <p>Producto no encontrado.</p>
        <% } %>
    </main>
</body>
</html>