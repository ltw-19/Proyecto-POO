// Ejemplo: abrir una ventana modal para el chat en vez de alert
document.addEventListener("DOMContentLoaded", () => {
    const chatBtn = document.querySelector(".chat-button");
    if (chatBtn) {
        chatBtn.onclick = () => {
            // Aquí puedes codificar tu ventana real de chatbot
            alert("Aquí abrirás tu ventana de chat inteligente");
        };
    }
});