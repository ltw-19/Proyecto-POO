package com.shopsmart.controller;

import com.shopsmart.model.Inventario;
import com.shopsmart.model.Producto;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
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
        String busqueda = req.getParameter("buscar");
        
        // Obtener todos los productos
        List<Producto> todos = inv.getProductos();
        
        // Filtrar por búsqueda si existe
        if (busqueda != null && !busqueda.trim().isEmpty()) {
            String termino = busqueda.trim().toLowerCase();
            todos = todos.stream()
                         .filter(p -> p.getNombre().toLowerCase().contains(termino))
                         .collect(Collectors.toList());
            req.setAttribute("terminoBusqueda", busqueda); // para mostrar en la vista
        }
        
        if ("/catalogo".equals(path)) {
            req.setAttribute("productos", todos);
            req.getRequestDispatcher("/catalogo.jsp").forward(req, resp);
        } else if ("/inicio".equals(path)) {
            int total = inv.getProductos().size();
            int limit = Math.min(6, total);
            req.setAttribute("destacados", inv.getProductos().subList(0, limit));
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}