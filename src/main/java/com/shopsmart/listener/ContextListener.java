package com.shopsmart.listener;

import com.shopsmart.model.Inventario;
import com.shopsmart.model.Producto;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Inventario inv = new Inventario();
        // Usando las imágenes que tienes en img/productos/
        inv.agregarProducto(new Producto(1, "Laptop Pro 15\"", 1299.0, 10, "prod_laptop_predator300.png"));
        inv.agregarProducto(new Producto(2, "Smartphone X", 899.0, 15, "prod_galaxy_s24.png"));
        inv.agregarProducto(new Producto(3, "Auriculares Wireless", 249.0, 20, "prod_smart_speaker.png"));
        inv.agregarProducto(new Producto(4, "Smartwatch Series 5", 399.0, 8, "prod_connect_watch_series7.png"));
        inv.agregarProducto(new Producto(5, "Auriculares Deportivos", 149.0, 25, "prod_noise_cancel_max.png"));
        inv.agregarProducto(new Producto(6, "Earbuds Mini", 89.0, 30, "prod_sportk_earbuds.png"));
        // puedes agregar más si quieres
        sce.getServletContext().setAttribute("inventario", inv);
    }
}