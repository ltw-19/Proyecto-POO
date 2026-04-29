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
    }
    .chatbot-header span:first-child::before {
        content: "? ";
        font-size: 1.1rem;
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
        <span class="chatbot-close" onclick="toggleChat()">X</span>
    </div>
    <div id="chatbotBody" class="chatbot-body">
        <div class="bot-msg">¡Hola! Soy el asistente de MacDigital. ¿En qué puedo ayudarte?</div>
        <div class="bot-msg">Puedes preguntarme por: <strong>ofertas, productos, o escribir "catálogo"</strong>.</div>
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

            if (lowerMsg.includes("hola") || lowerMsg.includes("buenas")) {
                respuesta = "¡Hola! ¿Buscas algún producto en especial? Te puedo recomendar laptops, smartphones o audífonos.";
            } 
            else if (lowerMsg.includes("ofertas") || lowerMsg.includes("promociones")) {
                respuesta = "? Oferta especial: Auriculares Deportivos a solo $149 (antes $199). ¡Aprovecha! También tenemos Smartwatch con 10% off.";
            }
            else if (lowerMsg.includes("laptop") || lowerMsg.includes("computadora")) {
                respuesta = "? Nuestra laptop más vendida es la Laptop Pro 15\" por $1299. ¿Te gustaría ver más detalles?";
            }
            else if (lowerMsg.includes("audífono") || lowerMsg.includes("auricular")) {
                respuesta = "? Tenemos Auriculares Wireless ($249) y Auriculares Deportivos ($149). Ambos con gran calidad de sonido.";
            }
            else if (lowerMsg.includes("smartphone") || lowerMsg.includes("celular")) {
                respuesta = "? El Smartphone X tiene excelente cámara y batería. Precio: $899.";
            }
            else if (lowerMsg.includes("catálogo") || lowerMsg.includes("todos")) {
                respuesta = "Puedes ver todos nuestros productos en el catálogo: <a href='catalogo' style='color:#10c198;'>haz clic aquí</a>.";
            }
            else if (lowerMsg.includes("gracias")) {
                respuesta = "¡De nada! Estamos para servirte. ?";
            }
            else {
                respuesta = "Lo siento, no entendí. Puedes preguntar por: ofertas, laptops, audífonos, smartphones o escribir 'catálogo'.";
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