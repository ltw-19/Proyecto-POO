<%@page import="com.shopsmart.model.Inventario, com.shopsmart.model.Producto"%>
<%
    // Cargamos inventario para que el chatbot pueda recomendar productos
    Inventario inv = (Inventario) application.getAttribute("inventario");
%>
<style>
    .chatbot-btn {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: #10c198;
        width: 55px;
        height: 55px;
        border-radius: 50%;
        cursor: pointer;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        background-image: url('img/iconos/chatbot.png');
        background-size: 60%;
        background-repeat: no-repeat;
        background-position: center;
        z-index: 1000;
    }
    .chatbot-modal {
        position: fixed;
        bottom: 80px;
        right: 20px;
        width: 300px;
        background: white;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        z-index: 1001;
        display: none;
        flex-direction: column;
    }
    .chatbot-header {
        background: #10c198;
        color: white;
        padding: 10px;
        border-radius: 15px 15px 0 0;
        display: flex;
        justify-content: space-between;
    }
    .chatbot-body {
        height: 250px;
        overflow-y: auto;
        padding: 10px;
        background: #f9f9f9;
        font-size: 14px;
    }
    .chatbot-footer {
        display: flex;
        border-top: 1px solid #ddd;
    }
    .chatbot-footer input {
        flex: 1;
        padding: 8px;
        border: none;
        outline: none;
    }
    .chatbot-footer button {
        background: #10c198;
        border: none;
        color: white;
        padding: 8px 12px;
        cursor: pointer;
    }
    .bot-msg, .user-msg {
        margin: 5px 0;
        padding: 6px 10px;
        border-radius: 10px;
        max-width: 85%;
    }
    .bot-msg {
        background: #e0f2fe;
        align-self: flex-start;
    }
    .user-msg {
        background: #c7e9fb;
        align-self: flex-end;
        text-align: right;
        margin-left: auto;
    }
</style>

<div class="chatbot-btn" onclick="toggleChat()"></div>
<div id="chatbotModal" class="chatbot-modal">
    <div class="chatbot-header">
        <span>? Asistente MacDigital</span>
        <span style="cursor:pointer" onclick="toggleChat()">?</span>
    </div>
    <div id="chatbotBody" class="chatbot-body">
        <div class="bot-msg">¡Hola! Soy el asistente de MacDigital. ¿En qué puedo ayudarte?</div>
        <div class="bot-msg">Puedes preguntarme por: <strong>ofertas, productos, o escribir "catálogo"</strong>.</div>
    </div>
    <div class="chatbot-footer">
        <input type="text" id="chatInput" placeholder="Escribe tu mensaje...">
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

        // Respuestas automáticas simulando productos reales
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
                respuesta = "? Tenemos Auriculares Wireless ($249) y Auriculares Deportivos ($149). Ambos con gran calidad de sonido. ¿Cuál te interesa?";
            }
            else if (lowerMsg.includes("smartphone") || lowerMsg.includes("celular")) {
                respuesta = "? El Smartphone X tiene excelente cámara y batería. Precio: $899. ¿Necesitas más información?";
            }
            else if (lowerMsg.includes("catálogo") || lowerMsg.includes("todos")) {
                respuesta = "Puedes ver todos nuestros productos en el catálogo: <a href='catalogo'>haz clic aquí</a>.";
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

    // Permitir enviar con Enter
    document.getElementById('chatInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') sendMessage();
    });
</script>