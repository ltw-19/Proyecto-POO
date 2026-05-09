package com.shopsmart.controller;

import com.shopsmart.model.Cart;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/actualizar-carrito")
public class ActualizarCarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int cantidad = Integer.parseInt(req.getParameter("cantidad"));
        HttpSession session = req.getSession();
        Cart carrito = (Cart) session.getAttribute("carrito");
        if (carrito != null) {
            carrito.updateQuantity(id, cantidad);
        }
        resp.sendRedirect("carrito.jsp");
    }
}