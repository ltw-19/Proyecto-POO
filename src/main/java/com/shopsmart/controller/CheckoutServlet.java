package com.shopsmart.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("mensaje", "Funcionalidad en desarrollo. Pronto podrás finalizar tu compra.");
        req.getRequestDispatcher("/mensaje.jsp").forward(req, resp);
    }
}