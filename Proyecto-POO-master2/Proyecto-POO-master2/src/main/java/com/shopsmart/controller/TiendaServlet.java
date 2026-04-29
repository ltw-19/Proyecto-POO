package com.shopsmart.controller;

import com.shopsmart.model.Producto;
import com.shopsmart.model.Inventario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "TiendaServlet", urlPatterns = {"/tienda"})
public class TiendaServlet extends HttpServlet {

    // Instanciamos el inventario (En un proyecto real, esto vendría de una BD)
    private Inventario inventario = new Inventario();
    
    @Override
    public void init() throws ServletException {
        inventario.agregarProducto(new Producto(1, "Celular Samsung Galaxy S24", "celular", 999.0, 7));
        inventario.agregarProducto(new Producto(2, "Apple iPhone 15", "iphone", 1099.0, 3));
        inventario.agregarProducto(new Producto(3, "Audífonos Bluetooth JBL Tune 510BT", "audífonos", 49.0, 15));
        inventario.agregarProducto(new Producto(4, "Laptop Asus VivoBook 15", "laptop", 460.0, 5));
        inventario.agregarProducto(new Producto(5, "Tablet Lenovo Tab M10", "tablet", 189.0, 8));
        inventario.agregarProducto(new Producto(6, "Smartwatch Xiaomi Mi Band 7", "reloj", 64.0, 20));
        inventario.agregarProducto(new Producto(7, "Parlante Portátil Logitech", "cornetas/parlantes", 59.0, 10));
        inventario.agregarProducto(new Producto(8, "Cargador Rápido 20W USB-C", "cargador", 19.0, 30));
        inventario.agregarProducto(new Producto(9, "Disco SSD Kingston 1TB", "Disco SSD", 75.0, 12));
        inventario.agregarProducto(new Producto(10, "Mouse Inalámbrico Logitech M280", "Mouse", 28.0, 22));
    }

    // Método para MOSTRAR la tienda (GET)
    @Override
    /*protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Enviamos la lista de productos a la página JSP/HTML
        request.setAttribute("productos", inventario.getListaProductos());
        
        // Redirigimos a la vista (el archivo JSP)
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }*/
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filtro = request.getParameter("q");
        List<Producto> productosFiltrados = inventario.buscarProductos(filtro);

        request.setAttribute("productos", productosFiltrados);
        request.setAttribute("busqueda", filtro != null ? filtro : "");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("idProducto"));
        int cantidad = 1;

        boolean exito = inventario.procesarVenta(id, cantidad);

        if (exito) {
            request.setAttribute("mensaje", "¡Compra realizada con éxito!");
        } else {
            request.setAttribute("error", "Lo sentimos, no hay stock suficiente.");
        }

        // Volvemos a mostrar los productos (con filtro si había)
        doGet(request, response);
    }
}