<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>ShopSmart AI - Tecnología de Mañana</title>
  <link rel="stylesheet" href="css/styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
  <nav class="main-nav">
      <div class="logo"><img src="img/logo.png" alt="ShopSmart Logo"/> ShopSmart <span>AI</span></div>
      <input class="search" type="text" placeholder="Busca smartphones, laptops, accesorios, y más...">
      <button class="btn-principal">Buscar</button>
      <div class="nav-icons">
        <a href="perfil.jsp"><img src="img/user.svg" alt="Perfil"></a>
        <a href="checkout.jsp"><img src="img/cart.svg" alt="Carrito"></a>
      </div>
  </nav>
  <nav class="categories-nav">
      <a class="all-cats" href="#">Todas las Categorías</a>
      <a href="#">Smartphones</a>
      <a href="#">Laptops y PC</a>
      <a href="#">Audio Pro</a>
      <a href="#">Smartwatches</a>
      <a href="#">Smart Home</a>
      <a href="#" class="right-link">Ofertas</a>
      <a href="#" class="right-link green">Soporte Técnico</a>
  </nav>

  <!-- Banner principal -->
    <section class="hero">
      <div class="hero-text">
        <div class="tag-fase">GRAN APERTURA · FASE 1</div>
        <h1>La tecnología de mañana, <span class="text-green">hoy.</span></h1>
        <p>Explora el nuevo estándar en compras electrónicas. Descubre ofertas exclusivas y encuentra el dispositivo perfecto con nuestra Inteligencia Artificial.</p>
        <div class="hero-btns">
          <a class="btn-principal" href="catalogo.jsp">Comprar Ahora</a>
          <a class="btn-ai-chat" href="#">Probar Asistente AI</a>
        </div>
      </div>
      <img class="hero-img" src="img/banner/banner_laptop.png" alt="Banner Laptop"/>
    </section>

  <!-- Badges confianza -->
  <section class="trust-badges">
    <div>🚚 Envío Gratis</div>
    <div>🛡️ Garantía Extendida</div>
    <div>💬 Soporte 24/7 AI</div>
  </section>
  
  <!-- Ofertas relámpago -->
  <section class="deals-section">
    <div class="deals-header">
      <span class="deal-lightning">⚡</span> Ofertas Relámpago
      <span class="timer">Termina en: <span id="timer">01:12:48</span></span> 
      <a class="see-all" href="catalogo.jsp">Ver Catálogo Completo →</a>
    </div>
    <div class="deals-list">
      <%-- Ejemplo de producto en oferta --%>
      <div class="deal-card">
        <img src="img/prod-galaxy23.png" alt="Galaxy S24 Ultra"/>
        <div class="deal-info">
          <span class="badge offer">🔥 En descuento</span>
          <h3>Galaxy S24 Ultra</h3>
          <div class="price">$1,299.00</div>
        </div>
      </div>
      <!-- ...repite para más productos en oferta -->
    </div>
  </section>
  <script src="js/main.js"></script>
</body>
</html>