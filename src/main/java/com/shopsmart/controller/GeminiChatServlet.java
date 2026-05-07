/*
package com.shopsmart.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gemini-chat")
public class GeminiChatServlet extends HttpServlet {

    // Configuración de reintentos
    private static final int MAX_RETRIES = 3;          // Número máximo de reintentos
    private static final int INITIAL_BACKOFF_MS = 3000; // Espera inicial: 3 segundos

    //private static final String API_KEY = System.getenv("GEMINI_API_KEY");
    // Si la variable de entorno no funciona, descomenta la línea siguiente y pega tu clave:
    private static final String API_KEY = "";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {

        String userMessage = req.getParameter("userMessage");
        if (userMessage == null || userMessage.trim().isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Escribe un mensaje.");
            return;
        }

        // Verificar API key
        if (API_KEY == null || API_KEY.isEmpty()) {
            resp.getWriter().write("Error: Clave API no configurada.");
            return;
        }

        String urlString = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=" + API_KEY;

        // Construir el prompt con contexto
        String prompt = "Eres un asistente de ventas de MacDigital. " +
            "IDs de productos: 1=Laptop Pro 15\", 2=Smartphone X, 3=Auriculares Wireless, " +
            "4=Smartwatch Series 5, 5=Auriculares Deportivos, 6=Earbuds Mini, " +
            "7=Nintendo Switch 2, 8=PS5. " +
            "Si el usuario pide explícitamente ver un producto (ej. 'muéstrame la PS5', 'quiero ver Nintendo Switch'), " +
            "responde EXACTAMENTE con 'REDIRIGIR:X' donde X es el ID del producto. " +
            "Ejemplo: 'REDIRIGIR:8' para PS5. " +
            "En cualquier otro caso, responde natural como un vendedor. " +
            "Pregunta del usuario: " + userMessage;

        String jsonInput = "{\"contents\":[{\"parts\":[{\"text\":\"" + escapeJson(prompt) + "\"}]}]}";

        int retries = 0;
        int backoffMs = INITIAL_BACKOFF_MS;
        boolean success = false;
        String respuestaTexto = "";
        int productoId = -1;

        while (!success && retries <= MAX_RETRIES) {
            HttpURLConnection conn = null;
            try {
                URL url = new URL(urlString);
                conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/json");
                conn.setDoOutput(true);
                conn.setConnectTimeout(10000);
                conn.setReadTimeout(15000);

                // Enviar la petición
                try (OutputStream os = conn.getOutputStream()) {
                    os.write(jsonInput.getBytes(StandardCharsets.UTF_8));
                    os.flush();
                }

                int responseCode = conn.getResponseCode();
                if (responseCode == 200) {
                    // Leer respuesta exitosa
                    StringBuilder response = new StringBuilder();
                    try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                        String line;
                        while ((line = br.readLine()) != null) {
                            response.append(line);
                        }
                    }
                    String jsonResponse = response.toString();
                    String texto = extractTextFromJson(jsonResponse);

                    // Verificar si es redirección
                    Pattern pattern = Pattern.compile("REDIRIGIR:(\\d+)");
                    Matcher matcher = pattern.matcher(texto);
                    if (matcher.find()) {
                        productoId = Integer.parseInt(matcher.group(1));
                        resp.sendRedirect("detalle.jsp?id=" + productoId);
                    } else {
                        resp.setContentType("text/plain;charset=UTF-8");
                        resp.getWriter().write(texto);
                    }
                    success = true; // Termina el bucle

                } else if (responseCode == 429) {
                    // Rate limit: esperar y reintentar
                    System.err.println("⚠️ HTTP 429 - Límite de tasa excedido. Reintento " + (retries + 1) + " de " + MAX_RETRIES +
                                       " en " + backoffMs + " ms.");
                    Thread.sleep(backoffMs);
                    backoffMs *= 2; // Backoff exponencial
                    retries++;
                } else {
                    // Otro error (400, 500, etc.) No reintentar
                    String errorMsg = "Error en API Gemini: " + responseCode;
                    try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8))) {
                        String line;
                        StringBuilder err = new StringBuilder();
                        while ((line = br.readLine()) != null) {
                            err.append(line);
                        }
                        errorMsg += " - " + err.toString();
                    } catch (Exception ignored) {}
                    resp.getWriter().write("Error en Gemini: " + responseCode);
                    success = true; // Terminar sin éxito pero sin más reintentos
                }

            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                resp.getWriter().write("La solicitud fue interrumpida.");
                success = true;
            } catch (Exception e) {
                e.printStackTrace();
                if (retries == MAX_RETRIES) {
                    resp.getWriter().write("Error interno tras varios intentos: " + e.getMessage());
                    success = true;
                } else {
                    // Error de red, reintentar
                    System.err.println("⚠️ Excepción: " + e.getMessage() + ". Reintentando...");
                    try { Thread.sleep(backoffMs); } catch (InterruptedException ignored) {}
                    backoffMs *= 2;
                    retries++;
                }
            } finally {
                if (conn != null) conn.disconnect();
            }
        }
    }

    private String extractTextFromJson(String json) {
        Pattern p = Pattern.compile("\"text\"\\s*:\\s*\"(.*?)\"");
        Matcher m = p.matcher(json);
        if (m.find()) {
            return m.group(1).replace("\\\"", "\"").replace("\\n", "\n");
        }
        return "No entendí la respuesta.";
    }

    private String escapeJson(String s) {
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r");
    }
}
*/