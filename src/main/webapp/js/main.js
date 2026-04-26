// Temporizador de oferta relámpago (simulado)
document.addEventListener("DOMContentLoaded", () => {
  const timerEl = document.getElementById("timer");
  if (timerEl) {
    let h = 1, m = 12, s = 48;
    setInterval(() => {
      s--;
      if (s < 0) { s = 59; m--; }
      if (m < 0) { m = 59; h--; }
      timerEl.textContent =
        (h < 10 ? "0" : "") + h + ":" +
        (m < 10 ? "0" : "") + m + ":" +
        (s < 10 ? "0" : "") + s;
    }, 1000);
  }
  // Chatbot input simulado
  const chatInput = document.querySelector('.chatbot-input-row input');
  const chatbotBody = document.querySelector('.chatbot-body');
  if (chatInput && chatbotBody) {
    document.querySelector('.chatbot-input-row button').onclick = () => {
      const msg = chatInput.value.trim();
      if(msg){
        chatbotBody.innerHTML += `<div class="user-msg">${msg}</div>`;
        chatInput.value = "";
        setTimeout(()=>{
         chatbotBody.innerHTML += `<div class="bot-message">¡Gracias por tu mensaje! Pronto tendremos respuesta AI real 🚀</div>`;
         chatbotBody.scrollTop = chatbotBody.scrollHeight;
       }, 800);
      }
    };
  }
});