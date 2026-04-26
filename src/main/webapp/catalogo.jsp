<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Catálogo | ShopSmart AI</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <nav class="main-nav">... (misma nav que index.jsp) ...</nav>
  <nav class="categories-nav">... (misma nav que index.jsp) ...</nav>
  
  <main class="catalog-container">
    <aside class="filters">
      <div class="filter-title">Filtros</div>
      <div class="filter-section">
        <div class="filter-label">CATEGORÍA</div>
        <label><input type="checkbox"/> Audio Pro</label>
        <label><input type="checkbox"/> Laptops</label>
        <label><input type="checkbox"/> Smart Home</label>
        <label><input type="checkbox"/> Smartphones</label>
        <label><input type="checkbox"/> Wearable</label>
      </div>
      <div class="filter-section">
        <div class="filter-label">MARCAS DESTACADAS</div>
        <button>Apple</button>
        <button>Samsung</button>
      </div>
      <div class="filter-section">
        <div class="filter-label">RANGO DE PRECIO</div>
        <!-- Slider JS pendiente aquí -->
        <input type="range" min="50" max="1500"/>
      </div>
      <div class="ai-filter">
        <span>🧠 Filtro Inteligente</span>
        <div>Dile al asistente la mejor opción para ti</div>
        <button>Activar Modo Asistente</button>
      </div>
    </aside>
    <section class="product-list">
      <div class="results-header">
        Resultados <span class="results-tab selected">productos</span>
        <select>
          <option>Relevancia IA</option>
          <option>Precio: menor a mayor</option>
        </select>
      </div>
      <div class="products">
        <%-- Tarjeta de producto --%>
        <!-- Producto 1: Galaxy S24 -->
        <div class="product-card">
          <img src="img/productos/prod_galaxy_s24.jpg" alt="Galaxy S24 Ultra"/>
          <div class="prod-info">
            <div class="prod-badges">
              <span class="badge green">¡RECOMENDADO IA!</span>
              <span class="badge">1 Año Garantía</span>
            </div>
            <h3>Galaxy S24 Ultra</h3>
            <div class="price">$1,299.00</div>
            <div class="specs">5G / 512GB / 200MP</div>
            <button class="btn-principal">Agregar</button>
          </div>
        </div>

        <!-- Producto 2: Predator Helios 300 -->
        <div class="product-card">
          <img src="img/productos/prod_laptop_predator300.jpg" alt="Predator Helios 300"/>
          <div class="prod-info">
            <div class="prod-badges">
              <span class="badge flash">OFERTA</span>
              <span class="badge green">⭐ 4.8</span>
            </div>
            <h3>Predator Helios 300</h3>
            <div class="price">$1,499.00</div>
            <div class="specs">RTX 4070 / 1TB SSD / 16GB RAM</div>
            <button class="btn-principal">Agregar</button>
          </div>
        </div>

        <!-- Producto 3: SportX Pro Earbuds -->
        <div class="product-card">
          <img src="img/productos/prod_sportk_earbuds.jpg" alt="SportX Pro Earbuds"/>
          <div class="prod-info">
            <div class="prod-badges">
              <span class="badge new">Nuevo</span>
              <span class="badge">1 Año Garantía</span>
            </div>
            <h3>SportX Pro Earbuds</h3>
            <div class="price">$59.99</div>
            <div class="specs">ANC / Sweatproof</div>
            <button class="btn-principal">Agregar</button>
          </div>
        </div>

        <!-- Producto 4: Connect Watch Series 7 -->
        <div class="product-card">
          <img src="img/productos/prod_connect_watch_series7.jpg" alt="Connect Watch Series 7"/>
          <div class="prod-info">
            <div class="prod-badges">
              <span class="badge new">Nuevo Lanzamiento</span>
            </div>
            <h3>Connect Watch Series 7</h3>
            <div class="price">$199.00</div>
            <div class="specs">ECG / Smart Health / 1.8”</div>
            <button class="btn-principal">Agregar</button>
          </div>
        </div>

        <!-- Producto 5: Echo Studio Speaker -->
        <div class="product-card">
          <img src="img/productos/prod_smart_speaker.jpg" alt="Echo Studio Speaker"/>
          <div class="prod-info">
            <div class="prod-badges">
              <span class="badge ai">IA RECOMIENDA</span>
            </div>
            <h3>Echo Studio - High-Fidelity Smart Speaker</h3>
            <div class="price">$199.99</div>
            <div class="specs">HiFi / Smart Home</div>
            <button class="btn-principal">Agregar</button>
          </div>
        </div>

        <!-- Producto 6: Noise Cancel Max -->
        <div class="product-card">
          <img src="img/productos/prod_noise_cancel_max.jpg" alt="NoiseCancel Max"/>
          <div class="prod-info">
            <div class="prod-badges">
              <span class="badge green">⭐ 4.6</span>
            </div>
            <h3>NoiseCancel Max</h3>
            <div class="price">$319.00</div>
            <div class="specs">ANC / Bluetooth / Premium</div>
            <button class="btn-principal">Agregar</button>
          </div>
        </div>
      </div>
    </section>

    <!-- Chatbot -->
    <div class="chatbot-widget">
      <div class="chatbot-header orange-gradient">
        <span>🤖 Asistente AI</span>
        <span>EN LÍNEA</span>
      </div>
      <div class="chatbot-body">
        <div class="bot-message">¿En qué puedo ayudarte hoy?</div>
        <div class="suggestions">
          <button>Muéstrame Laptops</button>
          <button>Ver Ofertas</button>
        </div>
        <!-- Área de mensajes del chat simulados aquí -->
      </div>
      <div class="chatbot-input-row">
        <input type="text" placeholder="Escribe tu consulta tecnológica..."/>
        <button>Enviar</button>
      </div>
    </div>
  </main>
  <script src="js/main.js"></script>
</body>
</html>