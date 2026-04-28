package com.shopsmart.controller;

import com.shopsmart.model.Inventario;
import com.shopsmart.model.Producto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/detalle")
public class DetalleProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Inventario inv = (Inventario) getServletContext().getAttribute("inventario");
        Producto p = inv.buscarPorId(id);
        if (p != null) {
            req.setAttribute("producto", p);
            req.getRequestDispatcher("/detalle.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("catalogo");
        }
    }
}