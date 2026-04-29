package com.shopsmart.controller;

import com.shopsmart.model.Cart;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/eliminar-carrito")
public class EliminarCarritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        Cart carrito = (Cart) session.getAttribute("carrito");
        if (carrito != null) {
            carrito.removeItem(id);
        }
        resp.sendRedirect("carrito.jsp");   // antes era "carrito"
    }
}