<%@page pageEncoding="UTF-8"%>
<%@page import="com.shopsmart.model.Inventario"%>
<%
    Inventario inv = (Inventario) application.getAttribute("inventario");
%>
<style>
    .chatbot-btn {
        position: fixed;
        bottom: 25px;
        right: 25px;
        width: 55px;
        height: 55px;
        background: #0071e3;  /* Cambiado de #10c198 a azul */
        border-radius: 50%;
        cursor: pointer;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        background-image: url('img/iconos/chatbot.png');
        background-size: 60%;
        background-repeat: no-repeat;
        background-position: center;
        z-index: 1000;
        transition: transform 0.2s;
    }
    .chatbot-btn:hover { transform: scale(1.05); }
    
    .chatbot-modal {
        position: fixed;
        bottom: 90px;
        right: 25px;
        width: 320px;
        background: white;
        border-radius: 18px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        z-index: 1001;
        display: none;
        flex-direction: column;
        font-family: 'Inter', sans-serif;
    }
    
    .chatbot-header {
        background: #0071e3;  /* Cambiado de #10c198 a azul */
        color: white;
        padding: 12px 16px;
        border-radius: 18px 18px 0 0;
        display: flex;
        justify-content: space-between;
        font-weight: 600;
        font-size: 1rem;
    }
    
    .chatbot-close {
        cursor: pointer;
        font-size: 1.3rem;
        line-height: 1;
    }
    
    .chatbot-body {
        height: 280px;
        overflow-y: auto;
        padding: 12px;
        background: #f8fafc;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    
    .bot-msg, .user-msg {
        max-width: 85%;
        padding: 8px 12px;
        border-radius: 18px;
        font-size: 0.9rem;
        line-height: 1.4;
    }
    
    .bot-msg {
        background: #e6f0ff;  /* Cambiado de #e6f7f0 a azul claro */
        color: #003d80;        /* Cambiado de #1e4620 a azul oscuro */
        align-self: flex-start;
        border-bottom-left-radius: 4px;
    }
    
    .user-msg {
        background: #d9e8ff;  /* Este ya estaba en azul, se mantiene */
        color: #004080;        /* Este ya estaba en azul, se mantiene */
        align-self: flex-end;
        border-bottom-right-radius: 4px;
    }
    
    .chatbot-footer {
        display: flex;
        border-top: 1px solid #e2e8f0;
        background: white;
        border-radius: 0 0 18px 18px;
        overflow: hidden;
    }
    
    .chatbot-footer input {
        flex: 1;
        padding: 12px;
        border: none;
        outline: none;
        font-size: 0.9rem;
    }
    
    .chatbot-footer button {
        background: #0071e3;  /* Cambiado de #10c198 a azul */
        border: none;
        color: white;
        padding: 0 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s;
    }
    
    .chatbot-footer button:hover { 
        background: #005bb5;  /* Cambiado de #0da881 a azul más oscuro */
    }
</style>

<div class="chatbot-btn" onclick="toggleChat()"></div>
<div id="chatbotModal" class="chatbot-modal">
    <div class="chatbot-header">
        <span>🤖 Asistente MacDigital</span>
        <span class="chatbot-close" onclick="toggleChat()">&times;</span>
    </div>
    <div id="chatbotBody" class="chatbot-body">
        <div class="bot-msg">¡Hola! Soy el asistente de MacDigital. ¿En qué puedo ayudarte?</div>
        <div class="bot-msg">Puedes preguntarme por: <strong>productos, ofertas, precios, tasa💰, contacto📞, horario🕒, envios🚚, garantia🔧</strong>.</div>
    </div>
    <div class="chatbot-footer">
        <input type="text" id="chatInput" placeholder="Escribe tu duda...">
        <button onclick="sendMessage()">Enviar</button>
    </div>
</div>

<script>
    function toggleChat() {
        var modal = document.getElementById('chatbotModal');
        if (modal.style.display === 'none' || modal.style.display === '') {
            modal.style.display = 'flex';
        } else {
            modal.style.display = 'none';
        }
    }

    function addMessage(text, isUser) {
        var body = document.getElementById('chatbotBody');
        var msgDiv = document.createElement('div');
        msgDiv.className = isUser ? 'user-msg' : 'bot-msg';
        msgDiv.innerHTML = text;
        body.appendChild(msgDiv);
        body.scrollTop = body.scrollHeight;
    }

    function sendMessage() {
        var input = document.getElementById('chatInput');
        var msg = input.value.trim();
        if (msg === "") return;
        addMessage(msg, true);
        input.value = "";

        setTimeout(function() {
            var lowerMsg = msg.toLowerCase();
            var respuesta = "";

            var listaProductos = "📦 <strong>Productos disponibles:</strong><br>" +
                "✅ Laptop Pro 15\": $1299<br>" +
                "✅ Smartphone X: $899<br>" +
                "✅ Auriculares Wireless: $249<br>" +
                "✅ Smartwatch Series 5: $399<br>" +
                "✅ Auriculares Deportivos: $149<br>" +
                "✅ Earbuds Mini: $89<br>" +
                "✅ Nintendo Switch 2: $499<br>" +
                "✅ PS5: $699<br>" +
                "👉 Visita el <a href='catalogo.jsp' style='color:#0071e3;'>catálogo</a> para más detalles.";

            var tasa = "💰 <strong>Tasa de cambio actual:</strong> 1 USD = 500 Bs (tasa de referencia).";

            // Nuevo horario según especificación
            var horario = "🕒 <strong>Horario de atención:</strong><br>Lunes a Sábados: 9:00 AM - 8:00 PM<br>Domingo: 10:00 AM - 7:00 PM";

            // Nuevo contacto con Instagram, teléfonos y dirección
            var contacto = "📞 <strong>Contacto MacDigital:</strong><br>" +
                "📱 Teléfonos:\n0412-829-11-70 / 0212-761-18-04<br>" +
                "📷 Instagram: <a href='https://www.instagram.com/macdigital.ve' target='_blank'>@macdigital.ve</a><br>" +
                "📍 Dirección: Centro Comercial CityMarket, Piso 3, Local 329.<br>" +
                "✉️ Correo: soporte@macdigital.com";

            var metodosPago = "💳 <strong>Métodos de pago:</strong> Visa, Mastercard, PayPal, Pago móvil, Transferencia bancaria.";
            var envio = "🚚 <strong>Envíos:</strong> A todo el país. Costo calculado al momento. Envío gratis en compras > $50.";
            var garantia = "🔧 <strong>Garantía:</strong> 1 año contra defectos de fábrica en todos los productos.";
            var ofertas = "🔥 <strong>Ofertas vigentes:</strong><br>🎧 Auriculares Deportivos: $149 (antes $199)<br>⌚ Smartwatch Series 5: $399 (antes $450)<br>💻 Laptop Pro 15\" con 10% off.<br>¡Aprovecha!";

            // Detección de productos (Nintendo Switch 2, PS5, etc.)
            if (lowerMsg.includes("nintendo switch 2") || lowerMsg.includes("nintendo switch")) {
                respuesta = "🎮 <strong>Nintendo Switch 2</strong><br>Pantalla mejorada, juegos exclusivos, modo portátil.<br>💰 Precio: $499.";
            }
            else if (lowerMsg.includes("ps5") || lowerMsg.includes("playstation 5")) {
                respuesta = "🎮 <strong>PS5</strong><br>Gráficos nueva generación, SSD ultrarrápido.<br>💰 Precio: $699.";
            }
            else if (lowerMsg.includes("productos") || lowerMsg.includes("lista") || lowerMsg.includes("disponibles")) {
                respuesta = listaProductos;
            }
            else if (lowerMsg.includes("tasa") || lowerMsg.includes("cambio") || lowerMsg.includes("bs") || lowerMsg.includes("dolar")) {
                respuesta = tasa;
            }
            else if (lowerMsg.includes("horario") || lowerMsg.includes("atencion")) {
                respuesta = horario;
            }
            else if (lowerMsg.includes("contacto") || lowerMsg.includes("telefono") || lowerMsg.includes("correo") || lowerMsg.includes("email")) {
                respuesta = contacto;
            }
            else if (lowerMsg.includes("instagram")) {
                respuesta = "📷 Instagram de MacDigital: <a href='https://www.instagram.com/macdigital.ve' target='_blank'>@macdigital.ve</a>";
            }
            else if (lowerMsg.includes("pago") || lowerMsg.includes("metodos")) {
                respuesta = metodosPago;
            }
            else if (lowerMsg.includes("envio") || lowerMsg.includes("entrega")) {
                respuesta = envio;
            }
            else if (lowerMsg.includes("garantia") || lowerMsg.includes("garantía")) {
                respuesta = garantia;
            }
            else if (lowerMsg.includes("ofertas") || lowerMsg.includes("promociones")) {
                respuesta = ofertas;
            }
            else if (lowerMsg.includes("precio") || lowerMsg.includes("costo") || lowerMsg.includes("cuanto cuesta")) {
                if (lowerMsg.includes("laptop")) respuesta = "💻 Laptop Pro 15 cuesta $1299.";
                else if (lowerMsg.includes("smartphone") || lowerMsg.includes("celular")) respuesta = "📱 Smartphone X cuesta $899.";
                else if (lowerMsg.includes("auriculares wireless")) respuesta = "🎧 Auriculares Wireless cuestan $249.";
                else if (lowerMsg.includes("auriculares deportivos")) respuesta = "🏃 Auriculares Deportivos cuestan $149.";
                else if (lowerMsg.includes("smartwatch")) respuesta = "⌚ Smartwatch Series 5 cuesta $399.";
                else if (lowerMsg.includes("nintendo") || lowerMsg.includes("switch")) respuesta = "🎮 Nintendo Switch 2 cuesta $499.";
                else if (lowerMsg.includes("ps5") || lowerMsg.includes("playstation")) respuesta = "🎮 PS5 cuesta $699.";
                else respuesta = "Coloca 'precio de' seguido del producto (laptop, smartphone, auriculares (wireless o deportivos), smartwatch, nintendo, ps5) y te diré su precio.";
            }
            else if (lowerMsg.includes("hola") || lowerMsg.includes("buenas")) {
                respuesta = "¡Hola! 😊 Pregúntame sobre productos, precios, tasa💰, horario🕒, ofertas🔥 o escribe 'catálogo'.";
            }
            else if (lowerMsg.includes("catalogo") || lowerMsg.includes("catálogo")) {
                respuesta = "👉 Puedes ver todos los productos en el <a href='catalogo.jsp' style='color:#0071e3;'>catálogo</a>.";
            }
            else if (lowerMsg.includes("gracias")) {
                respuesta = "¡De nada! 😊 Estamos para ayudarte. ¿Algo más?";
            }
            else {
                respuesta = "❓ No te he entendido. Prueba con:<br>• 'productos' (lista completa)<br>• 'precio laptop'<br>• 'tasa'<br>• 'horario'<br>• 'ofertas'<br>• 'contacto'<br>• 'instagram'<br>• 'catálogo'";
            }
            addMessage(respuesta, false);
        }, 500);
    }

    document.getElementById('chatInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') sendMessage();
    });
</script>

<script>
function updateCartBadge() {
    fetch('cart-count')
        .then(response => response.json())
        .then(data => {
            const badge = document.getElementById('cartCount');
            if (badge) badge.innerText = data.count;
        });
}
document.addEventListener('DOMContentLoaded', updateCartBadge);
</script>