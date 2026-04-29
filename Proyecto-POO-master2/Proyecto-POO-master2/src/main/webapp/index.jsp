<%@ page import="java.util.List" %>
<%@ page import="com.shopsmart.model.Producto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>MacDigital</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
</head>
<%@include file="fragmento_chatbot.jsp" %>
<body>
    <!-- Barra superior -->
    <header class="topbar">
        <span class="logo">MacDigital</span>
        <form action="tienda" method="get" style="display:inline;">
            <input 
                type="text" 
                class="searchbar" 
                name="q" 
                placeholder="Buscar productos..." 
                value="${busqueda}"/>
        </form>
        <div class="icon-group">
            <img src="img/iconos/perfil_usuario.png" alt="Perfil" class="icon"/>
            <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon"/>
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
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <c:choose>
                <c:when test="${not empty productos}">
                    <c:forEach var="producto" items="${productos}">
                        <div class="product-card">
                            <img src="img/productos/${producto.id}.png" alt="${producto.nombre}">
                            <h3 class="prod-name">${producto.nombre}</h3>
                            <div class="prod-price">$${producto.precio}</div>
                            <form action="tienda" method="post">
                                <input type="hidden" name="idProducto" value="${producto.id}" />
                                <button type="submit" class="btn-product">Agregar al carrito</button>
                            </form>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div>No se encontraron productos.</div>
                </c:otherwise>
            </c:choose>
        </div>
        
            <!-- 
            <div class="product-card">
                <img src="img/productos/prod_laptop_predator300.png" alt="Laptop Pro 15''">
                <h3 class="prod-name">Laptop Pro 15"</h3>
                <div class="prod-price">$1299</div>
                <a href="catalogo.jsp" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_galaxy_s24.png" alt="Smartphone X">
                <h3 class="prod-name">Smartphone X</h3>
                <div class="prod-price">$899 <span class="old-price">$999</span></div>
                <a href="catalogo.jsp" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_smart_speaker.png" alt="Auriculares Wireless">
                <h3 class="prod-name">Auriculares Wireless</h3>
                <div class="prod-price">$249</div>
                <a href="catalogo.jsp" class="btn-product">Agregar al carrito</a>
            </div>
            <div class="product-card">
                <img src="img/productos/prod_connect_watch_series7.png" alt="Smartwatch Series 5">
                <h3 class="prod-name">Smartwatch Series 5</h3>
                <div class="prod-price">$399 <span class="old-price">$450</span></div>
                <a href="catalogo.jsp" class="btn-product">Agregar al carrito</a>
            </div>
            -->
    </main>

    <!-- Botón Chatbot flotante -->
    <a href="javascript:void(0);" class="chatbot-btn" onclick="document.getElementById('chatbot-modal').style.display='block'"></a>

    <!-- Chatbot Modal Simulado -->
    <div id="chatbot-modal" class="chatbot-modal" style="display:none;">
        <div class="chatbot-window">
            <div class="chatbot-header">
                <span>Asistente MacDigital</span>
                <span class="chatbot-close" onclick="document.getElementById('chatbot-modal').style.display='none'">&times;</span>
            </div>
            <div class="chatbot-body">
                <div class="chatbot-msg chatbot-msg-bot">¡Hola! ¿En qué puedo ayudarte hoy?</div>
                <div class="chatbot-msg chatbot-msg-user">Busco unos auriculares para hacer ejercicio</div>
                <div class="chatbot-msg chatbot-msg-bot">
                    ¡Tengo excelentes opciones resistentes al sudor y con gran sujeción!<br/><br/>
                    <b>Auriculares Deportivos</b> - $149<br/>
                    <b>Earbuds Mini</b> - $89<br/>
                </div>
            </div>
            <div class="chatbot-footer">
                <input type="text" placeholder="Escribe tu mensaje..." />
                <button>Enviar</button>
            </div>
        </div>
    </div>

        <%-- lista de productos --%>
    <c:forEach var="producto" items="${productos}">
    <div>
        <b>${producto.nombre}</b> - $${producto.precio}
    </div>
    </c:forEach>
</body>
</html>