<!-- Archivo no necesario para fase 1-->
<!--
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8"/>
   <title>Mi Perfil | MacDigital</title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header class="topbar">
        <span class="logo">MacDigital</span>
        <input type="text" class="searchbar" placeholder="Buscar productos..."/>
        <div class="icon-group">
            <img src="img/icon_user.png" alt="Perfil" class="icon"/>
            <img src="img/icon_cart.png" alt="Carrito" class="icon"/>
        </div>
    </header>
    <main class="profile-main">
        <aside class="profile-side">
            <div class="profile-card">
                <img class="profile-avatar" src="img/icon_user.png" width="80" alt="Usuario"/>
                <div class="user-name">Alejandro M.</div>
                <div class="user-email">alex.m@correo.com</div>
                <button class="btn-side">Editar Datos</button>
            </div>
            <nav class="profile-nav">
                <a class="active">Mis Pedidos</a>
                <a>Configuración</a>
                <a class="logout">Cerrar sesión</a>
            </nav>
        </aside>
        <section class="orders-main">
            <h2>Historial de Pedidos</h2>
            <div class="order-list">
                <div class="order-item">
                    <img src="img/productos/prod_laptop_predator300.png" width="60" alt="Laptop Pro 15"/>
                    <div class="order-data">
                        <div><b>ORD-9824</b> <span class="date">12 Mar 2026</span></div>
                        <div>Laptop Pro 15"</div>
                        <div>Cantidad: 1</div>
                    </div>
                    <div class="order-state delivered">Entregado</div>
                    <div class="order-price">$1499.00</div>
                    <a class="order-link" href="#">Ver Detalle</a>
                </div>
                <div class="order-item">
                    <img src="img/productos/prod_smart_speaker.png" width="60" alt="Auriculares Wireless"/>
                    <div class="order-data">
                        <div><b>ORD-8712</b> <span class="date">05 Feb 2026</span></div>
                        <div>Auriculares Wireless</div>
                        <div>Cantidad: 1</div>
                    </div>
                    <div class="order-state shipping">En camino</div>
                    <div class="order-price">$249.00</div>
                    <a class="order-link" href="#">Ver Detalle</a>
                </div>
            </div>
        </section>
    </main>
    <%@include file="fragmento_chatbot.jsp" %>
</body>
</html>