package com.shopsmart.controller;

import com.shopsmart.model.Producto;
import com.shopsmart.model.Inventario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TiendaServlet", urlPatterns = {"/tienda"})
public class TiendaServlet extends HttpServlet {

    // Instanciamos el inventario (En un proyecto real, esto vendría de una BD)
    private Inventario inventario = new Inventario();

    @Override
    public void init() throws ServletException {
        // Llenamos el inventario con datos de prueba al iniciar el servidor
        inventario.agregarProducto(new Producto(1, "Franela Microdurazno", 15.0, 10));
        inventario.agregarProducto(new Producto(2, "Laptop Gamer", 850.0, 5));
        inventario.agregarProducto(new Producto(3, "Audífonos Bluetooth", 25.0, 15));
    }

    // Método para MOSTRAR la tienda (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Enviamos la lista de productos a la página JSP/HTML
        request.setAttribute("productos", inventario.getListaProductos());
        
        // Redirigimos a la vista (el archivo JSP)
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    // Método para PROCESAR una compra (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("idProducto"));
        int cantidad = 1; // Por simplicidad, compramos de 1 en 1

        boolean exito = inventario.procesarVenta(id, cantidad);

        if (exito) {
            request.setAttribute("mensaje", "¡Compra realizada con éxito!");
        } else {
            request.setAttribute("error", "Lo sentimos, no hay stock suficiente.");
        }

        // Volvemos a cargar la tienda para ver el stock actualizado
        doGet(request, response);
    }
}