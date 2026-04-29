<%@page import="com.shopsmart.model.Producto, java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catálogo | MacDigital</title>
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
            <a href="carrito.jsp" style="position:relative; display:inline-block;">
                <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon">
                <span id="cartCount" class="cart-badge">0</span>
            </a>
        </div>
    </header>

    <main class="catalogo-container">
        <aside class="filtros-sidebar">
            <h3>Filtros</h3>
            <div class="filtro-grupo">
                <h4>Categoría</h4>
                <label><input type="checkbox" value="laptop" class="filtro-categoria"> Laptops</label>
                <label><input type="checkbox" value="smartphone" class="filtro-categoria"> Smartphones</label>
                <label><input type="checkbox" value="auricular" class="filtro-categoria"> Audio</label>
                <label><input type="checkbox" value="wearable" class="filtro-categoria"> Wearables</label>
            </div>
            <div class="filtro-grupo">
                <h4>Precio</h4>
                <input type="range" id="precioMax" min="0" max="2000" step="50" value="2000">
                <div class="precio-valor">Hasta: $<span id="precioMostrar">2000</span></div>
            </div>
            <div class="filtro-grupo">
                <h4>Marca</h4>
                <label><input type="checkbox" value="Apple" class="filtro-marca"> Apple</label>
                <label><input type="checkbox" value="Samsung" class="filtro-marca"> Samsung</label>
                <label><input type="checkbox" value="Sony" class="filtro-marca"> Sony</label>
                <label><input type="checkbox" value="Xiaomi" class="filtro-marca"> Xiaomi</label>
            </div>
            <div class="filtro-grupo">
                <h4>Popularidad</h4>
                <select id="ordenar">
                    <option value="relevante">Más relevantes</option>
                    <option value="menorPrecio">Menor precio</option>
                    <option value="mayorPrecio">Mayor precio</option>
                </select>
            </div>
            <button id="aplicarFiltros" class="btn-filtrar">Aplicar filtros</button>
        </aside>

        <section class="productos-section">
            <div class="resultados-header">
                <span id="contadorProductos">0</span> productos encontrados
                <% if(request.getAttribute("terminoBusqueda") != null) { %>
                    <span style="margin-left: 15px;">🔍 Resultados para "<%= request.getAttribute("terminoBusqueda") %>"</span>
                <% } %>
            </div>
            <div class="products-list" id="listaProductos">
                <%
                    List<Producto> todos = (List<Producto>) request.getAttribute("productos");
                    if (todos == null) {
                        response.sendRedirect("catalogo");
                        return;
                    }
                    if (todos.isEmpty()) {
                %>
                    <p style="text-align: center; width: 100%;">No se encontraron productos con ese nombre. <a href="catalogo">Ver todos</a></p>
                <%
                    } else {
                        for (Producto p : todos) {
                            String categoria = "";
                            if (p.getNombre().toLowerCase().contains("laptop")) categoria = "laptop";
                            else if (p.getNombre().toLowerCase().contains("smartphone")) categoria = "smartphone";
                            else if (p.getNombre().toLowerCase().contains("auricular")) categoria = "auricular";
                            else if (p.getNombre().toLowerCase().contains("smartwatch")) categoria = "wearable";
                            
                            String marca = "Xiaomi";
                            if (p.getNombre().contains("Apple")) marca = "Apple";
                            else if (p.getNombre().contains("Samsung")) marca = "Samsung";
                            else if (p.getNombre().contains("Sony")) marca = "Sony";
                %>
                <div class="product-card" 
                     data-nombre="<%= p.getNombre().toLowerCase() %>"
                     data-precio="<%= p.getPrecio() %>"
                     data-categoria="<%= categoria %>"
                     data-marca="<%= marca %>">
                    <img src="img/productos/<%= p.getImagen() %>" alt="<%= p.getNombre() %>">
                    <a href="detalle?id=<%= p.getId() %>" class="prod-name-link">
                        <h3 class="prod-name"><%= p.getNombre() %></h3>
                    </a>
                    <div class="prod-price">
                        $<%= p.getPrecio() %>
                        <% if(p.getId() == 2 || p.getId() == 4) { %>
                            <span class="old-price">$<%= (int)(p.getPrecio() * 1.12) %></span>
                        <% } %>
                    </div>
                    <a href="agregar-carrito?id=<%= p.getId() %>" class="btn-product">Agregar al carrito</a>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </section>
    </main>

    <script src="js/main.js"></script>
</body>
</html>