package com.shopsmart.controller;

import com.shopsmart.model.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/agregar-carrito")
public class AgregarCarritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int cantidad = 1;
        Inventario inv = (Inventario) getServletContext().getAttribute("inventario");
        Producto p = inv.buscarPorId(id);
        if (p != null) {
            HttpSession session = req.getSession();
            Cart carrito = (Cart) session.getAttribute("carrito");
            if (carrito == null) {
                carrito = new Cart();
                session.setAttribute("carrito", carrito);
            }
            carrito.addItem(p, cantidad);
        }
        String referer = req.getHeader("referer");
        resp.sendRedirect(referer != null ? referer : "catalogo");
    }
}