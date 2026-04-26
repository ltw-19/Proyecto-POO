<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Checkout | ShopSmart AI</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <nav class="main-nav">... (igual a index.jsp) ...</nav>
  <nav class="categories-nav">... (igual a index.jsp) ...</nav>
  
  <main class="checkout-main">
    <div class="checkout-progress">
      <div class="progress-step active">Carrito</div>
      <div class="progress-bar"></div>
      <div class="progress-step active">Envío</div>
      <div class="progress-bar"></div>
      <div class="progress-step active">Pago</div>
    </div>
    <div class="checkout-content">
      <!-- Izquierda: Datos de Envío y Pago -->
      <div class="checkout-left">
        <section class="checkout-section">
          <h2>Datos de Envío</h2>
          <div>
            Alejandro M. (Proyecto POO)<br>
            Av. Universidad 123, Edificio Tecnológico<br>
            Ciudad de México, CP 04510<br>
            <span class="envio-label">Envío Estándar (3-4 días)</span>
          </div>
          <a href="#" class="checkout-btn-edit">Editar</a>
        </section>
        <section class="checkout-section">
          <h2>Método de Pago</h2>
          <div class="payment-card">
            <div>NOMBRE DE TARJETA</div>
            <input type="text" placeholder="Ej: Alejandro Martínez" />
            <div>NÚMERO DE TARJETA</div>
            <input type="text" placeholder="0000 0000 0000 0000" maxlength="19"/>
            <div>VENCIMIENTO</div>
            <input type="text" placeholder="MM/YY" maxlength="5" style="width:80px" />
            <div>CVC</div>
            <input type="text" placeholder="123" maxlength="3" style="width:55px" />
          </div>
        </section>
      </div>
      <!-- Derecha: Resumen -->
      <div class="checkout-right">
        <section class="order-summary">
          <h2>Resumen de Orden</h2>
          <div class="orden-items">
            <div class="order-item">
              <img src="img/prod-earbuds.png" width="52"/> SportX Pro Earbuds ANC<br>
              <span>$59.99</span>
            </div>
            <div class="order-item">
              <img src="img/prod-predator.png" width="52"/> Predator Helios 300 Gaming Laptop<br>
              <span>$1,499.00</span>
            </div>
          </div>
          <div class="resumen-totales">
            <div>Subtotal: <span>$1558.99</span></div>
            <div>Envío estimado: <span>$15.00</span></div>
            <div>Impuestos (16% IVA): <span>$243.44</span></div>
            <div class="resumen-descuento">Descuento <b>PROYECTOPOO</b>: <span class="green">-$50.00</span></div>
            <div class="resumen-total"><b>TOTAL:</b> <span>$1763.44</span></div>
          </div>
          <button class="btn-principal green-bg">Confirmar Compra (Simulación)</button>
          <div class="compra-badge">
            <img src="img/secure.svg" width="20"/>
            Transacción encriptada AES 256-bit
          </div>
        </section>
      </div>
    </div>
  </main>
  <script src="js/main.js"></script>
</body>
</html>