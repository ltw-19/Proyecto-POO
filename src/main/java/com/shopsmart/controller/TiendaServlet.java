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
        req.setAttribute("productos", inv.getProductos());
        
        String path = req.getServletPath();
        if ("/catalogo".equals(path)) {
            req.getRequestDispatcher("/catalogo.jsp").forward(req, resp);
        } else {
            // Para la página de inicio, solo mostramos algunos destacados (primeros 4)
            req.setAttribute("destacados", inv.getProductos().subList(0, Math.min(4, inv.getProductos().size())));
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}