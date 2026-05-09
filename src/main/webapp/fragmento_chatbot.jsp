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
        background: #10c198;
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
        background: #10c198;
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
        background: #e6f7f0;
        color: #1e4620;
        align-self: flex-start;
        border-bottom-left-radius: 4px;
    }
    .user-msg {
        background: #d9e8ff;
        color: #004080;
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
        background: #10c198;
        border: none;
        color: white;
        padding: 0 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s;
    }
    .chatbot-footer button:hover { background: #0da881; }
</style>

<div class="chatbot-btn" onclick="toggleChat()"></div>
<div id="chatbotModal" class="chatbot-modal">
    <div class="chatbot-header">
        <span>Asistente MacDigital</span>
        <span class="chatbot-close" onclick="toggleChat()">&times;</span>
    </div>
    <div id="chatbotBody" class="chatbot-body">
        <div class="bot-msg">Hola! Soy el asistente de MacDigital. ¿En que puedo ayudarte?</div>
        <div class="bot-msg">Puedes preguntarme por: productos, ofertas, precios, tasa, contacto, horario, envios, garantia.</div>
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

            var listaProductos = "[Productos disponibles] \n" +
                "- Laptop Pro 15: $1299\n" +
                "- Smartphone X: $899\n" +
                "- Auriculares Wireless: $249\n" +
                "- Smartwatch Series 5: $399\n" +
                "- Auriculares Deportivos: $149\n" +
                "- Earbuds Mini: $89\n" +
                "- Nintendo Switch 2: $499\n" +
                "- PS5: $699\n" +
                "Visita el catalogo para mas detalles.";

            var tasa = "[Tasa de cambio actual] 1 USD = 500 Bs (tasa de referencia).";

            var horario = "[Horario de atencion] \nLunes a Viernes: 9:00 AM - 7:00 PM\nSabados: 10:00 AM - 3:00 PM\nDomingos: Cerrado.";

            var contacto = "[Contacto] \nTelefono: +58 212-555-1234\nCorreo: soporte@macdigital.com\nDireccion: Av. Principal, Caracas, Venezuela.";

            var metodosPago = "[Metodos de pago] Visa, Mastercard, PayPal, Pago movil, Transferencia bancaria.";

            var envio = "[Envios] Envios a todo el pais. Costo calculado al momento de la compra. Envio gratis en compras mayores a $50.";

            var garantia = "[Garantia] 1 ano contra defectos de fabrica en todos los productos.";

            var ofertas = "[Ofertas vigentes] \n- Auriculares Deportivos: $149 (antes $199)\n- Smartwatch Series 5: $399 (antes $450)\n- Laptop Pro 15 con 10% off. Aprovecha!";

            if (lowerMsg.includes("tasa") || lowerMsg.includes("cambio") || lowerMsg.includes("bs") || lowerMsg.includes("dolar")) {
                respuesta = tasa;
            } 
            else if (lowerMsg.includes("productos") || lowerMsg.includes("lista") || lowerMsg.includes("disponibles")) {
                respuesta = listaProductos;
            }
            else if (lowerMsg.includes("horario") || lowerMsg.includes("atencion")) {
                respuesta = horario;
            }
            else if (lowerMsg.includes("contacto") || lowerMsg.includes("telefono") || lowerMsg.includes("correo")) {
                respuesta = contacto;
            }
            else if (lowerMsg.includes("pago") || lowerMsg.includes("metodos")) {
                respuesta = metodosPago;
            }
            else if (lowerMsg.includes("envio") || lowerMsg.includes("entrega")) {
                respuesta = envio;
            }
            else if (lowerMsg.includes("garantia")) {
                respuesta = garantia;
            }
            else if (lowerMsg.includes("ofertas") || lowerMsg.includes("promociones")) {
                respuesta = ofertas;
            }
            else if (lowerMsg.includes("precio") || lowerMsg.includes("costo") || lowerMsg.includes("cuanto cuesta")) {
                if (lowerMsg.includes("laptop")) respuesta = "La Laptop Pro 15 cuesta $1299.";
                else if (lowerMsg.includes("smartphone") || lowerMsg.includes("celular")) respuesta = "Smartphone X cuesta $899.";
                else if (lowerMsg.includes("auriculares") && lowerMsg.includes("wireless")) respuesta = "Auriculares Wireless cuestan $249.";
                else if (lowerMsg.includes("auriculares") && lowerMsg.includes("deportivos")) respuesta = "Auriculares Deportivos cuestan $149.";
                else if (lowerMsg.includes("smartwatch") || lowerMsg.includes("reloj")) respuesta = "Smartwatch Series 5 cuesta $399.";
                else if (lowerMsg.includes("nintendo") || lowerMsg.includes("switch")) respuesta = "Nintendo Switch 2 cuesta $499.";
                else if (lowerMsg.includes("ps5") || lowerMsg.includes("playstation")) respuesta = "PS5 cuesta $699.";
                else respuesta = "Indicame el producto (laptop, smartphone, auriculares, smartwatch, nintendo, ps5) y te dire su precio.";
            }
            else if (lowerMsg.includes("hola") || lowerMsg.includes("buenas")) {
                respuesta = "Hola! En que puedo asistirte? Pregunta por productos, ofertas, precios, tasa, horario, etc.";
            } 
            else if (lowerMsg.includes("laptop") && !lowerMsg.includes("precio")) {
                respuesta = "Laptop Pro 15 tiene Intel i7, 16GB RAM, SSD 512GB y pantalla Full HD. Precio: $1299.";
            }
            else if (lowerMsg.includes("auricular") && !lowerMsg.includes("precio")) {
                respuesta = "Tenemos Auriculares Wireless (cancelacion de ruido) por $249 y Deportivos (resistentes al sudor) por $149.";
            }
            else if (lowerMsg.includes("smartphone")) {
                respuesta = "Smartphone X con camara 108MP, 6.5 AMOLED y bateria 5000mAh. Precio: $899.";
            }
            else if (lowerMsg.includes("catalogo")) {
                respuesta = "Puedes ver todos nuestros productos en el catalogo: <a href='catalogo.jsp' style='color:#10c198;'>haz clic aqui</a>.";
            }
            else if (lowerMsg.includes("gracias")) {
                respuesta = "De nada! Estamos para ayudarte.";
            }
            else {
                respuesta = "Lo siento, no te he entendido. Puedes preguntar: productos, ofertas, precio [producto], tasa, contacto, horario. Tambien escribe 'catalogo'.";
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