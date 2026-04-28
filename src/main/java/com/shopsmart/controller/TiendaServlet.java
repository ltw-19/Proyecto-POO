package com.shopsmart.controller;

import com.shopsmart.model.Inventario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/inicio", "/catalogo"})
public class TiendaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Inventario inv = (Inventario) getServletContext().getAttribute("inventario");
        if (inv == null) {
            resp.sendError(500, "Inventario no cargado");
            return;
        }
        
        String path = req.getServletPath();
        if ("/catalogo".equals(path)) {
            req.setAttribute("productos", inv.getProductos());
            req.getRequestDispatcher("/catalogo.jsp").forward(req, resp);
        } else {
            // Para la raíz y /inicio
            int total = inv.getProductos().size();
            int limit = Math.min(4, total);
            req.setAttribute("destacados", inv.getProductos().subList(0, limit));
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}