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
            <img src="img/iconos/carrito_compras.png" alt="Carrito" class="icon">
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
                    <button class="btn-product" onclick="mostrarMensaje()">Agregar al carrito</button>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </section>
    </main>

    <script src="js/main.js"></script>
    <script>
        function mostrarMensaje() {
            alert("Funcionalidad en desarrollo. Pronto podrás comprar.");
        }
    </script>
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