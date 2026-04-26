<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Mi Perfil | ShopSmart AI</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <nav class="main-nav">... (igual a index.jsp) ...</nav>
  <nav class="categories-nav">... (igual a index.jsp) ...</nav>
  
  <main class="profile-main">
    <aside class="profile-sidebar">
      <div class="profile-summary">
        <img class="profile-avatar" src="img/avatar.png" width="90"/>
        <div>
          <h3>Alejandro M.</h3>
          <span>alejandro.m@proyecto-poo.edu</span>
        </div>
      </div>
      <div class="vip-card">
        <b>ShopSmart VIP</b>
        <div class="vip-points">4,250 pts</div>
        <div class="vip-status">Ya eres nivel Platino</div>
      </div>
      <ul class="profile-menu">
        <li class="active">Mis Pedidos</li>
        <li>Dispositivos Registrados</li>
        <li>Lista de Deseos</li>
        <li>Configuración AI</li>
        <li class="logout">Cerrar sesión</li>
      </ul>
    </aside>
    <section class="profile-content">
      <h2>Mis Dispositivos Activos</h2>
      <div class="devices-list">
        <div class="device-card">
          <b>Galaxy S24 Ultra</b> <span class="garantia-label">Garantía activa (320 días)</span>
        </div>
        <div class="device-card device-empty">
          <span>+ Conecta otro dispositivo</span>
        </div>
      </div>
      <h2>Historial de Compras</h2>
      <div class="orders-list">
        <div class="order-row">
          <div>ORD-9824</div>
          <div>12 Mar 2026</div>
          <div>Predator Helios 300 Gaming Laptop</div>
          <div>🟢 ENTREGADO</div>
          <div>$1,499.00</div>
        </div>
        <div class="order-row">
          <div>ORD-8712</div>
          <div>05 Feb 2026</div>
          <div>Connect Watch Series 7</div>
          <div>🟡 EN CAMINO</div>
          <div>$199.00</div>
        </div>
      </div>
      <button class="btn-principal" style="margin-top:18px">Cargar pedidos anteriores</button>
    </section>
  </main>
  <script src="js/main.js"></script>
</body>
</html>